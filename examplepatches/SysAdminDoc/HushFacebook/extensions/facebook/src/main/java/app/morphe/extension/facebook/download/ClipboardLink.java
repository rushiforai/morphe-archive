/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Offers to download a reel or video whose facebook.com or fb.watch link you copied, when
 * Facebook comes back to the front.
 *
 * <p>Android 10 and later let only the app in front read the clipboard, and only once its window
 * has focus, so each resume waits for that focus and a pause drops the wait. Nothing here reads
 * the clipboard while the switch is off, while Download feed and Watch videos is off, while
 * Hushfacebook is paused or before the settings are ready. The clip's description is looked at
 * first, and a clip already looked at isn't read again, so Android's note that Facebook read the
 * clipboard shows at most once for each copy.
 *
 * <p>A link is offered once. Download or No thanks, it's remembered (as a hash, never the link)
 * and not offered again. Download saves the video the way Download to phone does: the player
 * Facebook built for it holds the tracks ({@link PlayerSources}). When Facebook hasn't built one
 * yet, the video opens in Facebook, and the save starts as soon as its player is recorded. A
 * share link or an fb.watch link names no video, so the address it redirects to is read first.
 * With When you tap Download set to send links, the link goes to that app instead.
 */
public final class ClipboardLink {
    private static final String SOURCE = "ClipboardLink";

    /** This feature's own Hook status line, so its counts don't mix with the menu item's. */
    static final String FAMILY = FamilyNames.VIDEO_DOWNLOAD + " (copied links)";

    /** Facebook's own handler for the links it opens, a manifest component that keeps its name. */
    static final String URI_HANDLER = "com.facebook.katana.IntentUriHandler";

    /** How long an opened video may take to build its player before the save gives up on it. */
    static final long WAIT_MS = 60_000;

    /** How many offered links are remembered. */
    static final int REMEMBERED = 50;

    /** The redirects of a short link that are followed, at most. */
    private static final int MAX_HOPS = 5;

    private static final String PREFS = "hushfacebook_copied_links";
    private static final String OFFERED = "offered";

    /** A Facebook address in copied text: facebook.com and its mobile hosts, or fb.watch. */
    private static final Pattern LINK = Pattern.compile(
            "(?<![\\w.@-])(?:https?://)?(?:(?:www|m|web|mbasic|touch)\\.)?(?:facebook\\.com|fb\\.watch)(?:/[^\\s<>\"'`]*)?",
            Pattern.CASE_INSENSITIVE);

    /** /reel/123 and /reels/123. */
    private static final Pattern REEL_PATH = Pattern.compile("^/reels?/([0-9]{1,25})(?:/.*)?$");

    /** /SomePage/videos/123, /SomePage/videos/some-title/123 and /watch/live/123. */
    private static final Pattern VIDEO_PATH = Pattern.compile("^/(?:[^/]+/videos/(?:[^/]+/)?|watch/live/)([0-9]{1,25})/?$");

    /** A share link: /share/r/ is a reel's, /share/v/ a video's. */
    private static final Pattern SHARE_PATH = Pattern.compile("^/share/([rv])/[A-Za-z0-9_-]+/?$");

    private ClipboardLink() {
    }

    /** A video link found in copied text. */
    static final class Found {
        /** The link as it was copied, trimmed of what can't end an address. */
        final String link;
        /** The video's id on Facebook, or null when the link is a short one still to be read. */
        @Nullable final String videoId;
        /** Whether it's a reel's link, which opens in the Reels viewer. */
        final boolean reel;

        Found(String link, @Nullable String videoId, boolean reel) {
            this.link = link;
            this.videoId = videoId;
            this.reel = reel;
        }

        /** Facebook's own address for the video, built from its id only. */
        @Nullable
        String canonical() {
            return reel ? SendLink.reelLink(videoId) : SendLink.videoLink(videoId);
        }

        /** What makes two copies the same link: the video, or the short link without its query. */
        String key() {
            if (videoId != null) return "video:" + videoId;
            String bare = link.toLowerCase(Locale.ROOT);
            int cut = bare.indexOf('?');
            if (cut >= 0) bare = bare.substring(0, cut);
            cut = bare.indexOf('#');
            if (cut >= 0) bare = bare.substring(0, cut);
            bare = bare.replaceFirst("^https?://", "").replaceFirst("^(?:www|m|web|mbasic|touch)\\.", "");
            while (bare.endsWith("/")) bare = bare.substring(0, bare.length() - 1);
            return "short:" + bare;
        }
    }

    /**
     * The first reel or video link in [text], or null. A post's, a profile's or any other page's
     * link isn't a video's, so it's not one.
     */
    @Nullable
    static Found find(@Nullable CharSequence text) {
        if (text == null || text.length() == 0) return null;
        // A clip is someone's text: only so much of it is looked at.
        String body = text.length() > 4096 ? text.subSequence(0, 4096).toString() : text.toString();
        Matcher matcher = LINK.matcher(body);
        while (matcher.find()) {
            String link = trimEnd(matcher.group());
            Found found = parse(link);
            if (found != null) return found;
        }
        return null;
    }

    /** The video [link] names, a short link to read, or null. */
    @Nullable
    static Found parse(String link) {
        URI uri;
        try {
            uri = new URI(link.matches("(?i)^https?://.*") ? link : "https://" + link);
        } catch (Exception malformed) {
            return null;
        }
        String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.ROOT);
        String path = uri.getRawPath() == null || uri.getRawPath().isEmpty() ? "/" : uri.getRawPath();
        if (host.endsWith("fb.watch")) {
            return path.length() > 1 ? new Found(link, null, false) : null;
        }
        Matcher reel = REEL_PATH.matcher(path);
        if (reel.matches()) return new Found(link, reel.group(1), true);
        Matcher video = VIDEO_PATH.matcher(path);
        if (video.matches()) return new Found(link, video.group(1), false);
        if (path.equals("/watch") || path.equals("/watch/") || path.equals("/video.php")) {
            String id = query(uri.getRawQuery(), "v");
            return SendLink.isVideoId(id) ? new Found(link, id, false) : null;
        }
        Matcher share = SHARE_PATH.matcher(path);
        if (share.matches()) return new Found(link, null, "r".equals(share.group(1)));
        return null;
    }

    /** The value of [name] in a raw query, or null. Ids are digits, so no decoding is needed. */
    @Nullable
    private static String query(@Nullable String raw, String name) {
        if (raw == null) return null;
        for (String pair : raw.split("&")) {
            int equals = pair.indexOf('=');
            if (equals > 0 && pair.substring(0, equals).equals(name)) return pair.substring(equals + 1);
        }
        return null;
    }

    /** Drops what a sentence puts after a link: a full stop, a comma, a closing bracket. */
    private static String trimEnd(String link) {
        int end = link.length();
        while (end > 0 && ".,;:!?)]}".indexOf(link.charAt(end - 1)) >= 0) end--;
        return link.substring(0, end);
    }

    // ---------------------------------------------------------------- reading the clipboard

    /** Whether a resume may look at the clipboard now. The readiness check comes first. */
    static boolean offering() {
        return Utils.settingsReady() && Settings.CLIPBOARD_DOWNLOAD.get() && Settings.DOWNLOAD_VIDEOS.get();
    }

    /** How many times the clipboard's contents were read. Tests hold the switch to it. */
    static final AtomicInteger READS = new AtomicInteger();

    /** The description time of the last clip looked at, so the same copy isn't read twice. */
    private static long lastClip = Long.MIN_VALUE;

    /** The wait for the resumed screen's focus, if one is set. */
    private static final AtomicReference<FocusWait> waiting = new AtomicReference<>();

    /** The dialog on the screen now, so a second resume doesn't stack another. */
    private static WeakReference<AlertDialog> showing = new WeakReference<>(null);

    /**
     * A Facebook screen came to the front. With the switch on, the clipboard is looked at once the
     * window has focus, which is when Android lets Facebook read it. Never throws.
     */
    public static void onResumed(Activity activity) {
        try {
            if (!offering()) return;
            HookStatus.invoked(FAMILY);
            if (activity.hasWindowFocus()) {
                check(activity);
                return;
            }
            Window window = activity.getWindow();
            View decor = window == null ? null : window.peekDecorView();
            if (decor == null) return;
            FocusWait wait = new FocusWait(activity, decor);
            FocusWait previous = waiting.getAndSet(wait);
            if (previous != null) previous.cancel();
            decor.getViewTreeObserver().addOnWindowFocusChangeListener(wait);
        } catch (Throwable failure) {
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not wait for the screen", failure);
        }
    }

    /** The wait a resume set for its screen's focus, or null. For tests, which hand focus over themselves. */
    @Nullable
    static FocusWait focusWait() {
        return waiting.get();
    }

    /** The offer on the screen, or null. For tests. */
    @Nullable
    static AlertDialog shownDialog() {
        AlertDialog dialog = showing.get();
        return dialog != null && dialog.isShowing() ? dialog : null;
    }

    /** Forgets the last clip looked at, so a test's next clip is read even within the same instant. */
    static synchronized void forgetClipForTests() {
        lastClip = Long.MIN_VALUE;
    }

    /** The screen left the front: a wait for its focus ends, so nothing is read while it's paused. */
    public static void onPaused(Activity activity) {
        FocusWait wait = waiting.get();
        if (wait != null && wait.activity.get() == activity && waiting.compareAndSet(wait, null)) wait.cancel();
    }

    /** Looks at the clipboard once a resumed screen gains focus. */
    static final class FocusWait implements ViewTreeObserver.OnWindowFocusChangeListener {
        final WeakReference<Activity> activity;
        private final WeakReference<View> decor;

        FocusWait(Activity activity, View decor) {
            this.activity = new WeakReference<>(activity);
            this.decor = new WeakReference<>(decor);
        }

        @Override
        public void onWindowFocusChanged(boolean hasFocus) {
            if (!hasFocus) return;
            if (!waiting.compareAndSet(this, null)) {
                cancel();
                return;
            }
            cancel();
            Activity screen = activity.get();
            if (screen == null) return;
            try {
                check(screen);
            } catch (Throwable failure) {
                Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not look at the clipboard", failure);
            }
        }

        /** Stops listening. The view tree may be gone or busy, so this is posted. */
        void cancel() {
            View view = decor.get();
            if (view == null) return;
            view.post(() -> {
                try {
                    ViewTreeObserver observer = view.getViewTreeObserver();
                    if (observer.isAlive()) observer.removeOnWindowFocusChangeListener(this);
                } catch (Throwable ignored) {
                    // A tree that's gone holds nothing to remove.
                }
            });
        }
    }

    /**
     * Reads the clipboard of a focused screen, and offers a reel or video link on it that wasn't
     * offered before.
     */
    static void check(Activity activity) {
        if (!offering() || activity.isFinishing() || activity.isDestroyed()) return;
        AlertDialog open = showing.get();
        if (open != null && open.isShowing()) return;
        ClipboardManager clipboard = activity.getSystemService(ClipboardManager.class);
        if (clipboard == null) return;
        ClipDescription description = clipboard.getPrimaryClipDescription();
        if (description == null || !description.hasMimeType("text/*")) return;
        long stamp = description.getTimestamp();
        if (!newClip(stamp)) return;
        READS.incrementAndGet();
        ClipData clip = clipboard.getPrimaryClip();
        HookStatus.counted(FAMILY, "clipboard read");
        if (clip == null || clip.getItemCount() == 0) return;
        ClipData.Item item = clip.getItemAt(0);
        CharSequence text = item.getText();
        if (text == null && item.getUri() != null) text = item.getUri().toString();
        Found found = find(text);
        if (found == null) return;
        if (!remember(activity, found.key())) return;
        HookStatus.counted(FAMILY, "link offered");
        Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> found.videoId != null ? "offered a copied video link" : "offered a copied short link");
        offer(activity, found);
    }

    /** Whether the clip described at [stamp] wasn't looked at yet. A clip with no time always is new. */
    private static synchronized boolean newClip(long stamp) {
        if (stamp != 0 && stamp == lastClip) return false;
        lastClip = stamp;
        return true;
    }

    /** Asks whether to download the video [found] names. */
    private static void offer(Activity activity, Found found) {
        Context application = activity.getApplicationContext();
        WeakReference<Activity> screen = new WeakReference<>(activity);
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(L10n.t(activity, "Download the video you copied?"))
                .setMessage(found.link)
                .setPositiveButton(SendLink.sending() ? L10n.t(activity, "Send to app") : L10n.t(activity, "Download"),
                        (shown, which) -> download(application, screen, found))
                .setNegativeButton(L10n.t(activity, "No thanks"), null)
                .create();
        showing = new WeakReference<>(dialog);
        dialog.show();
    }

    // ---------------------------------------------------------------- what was offered

    /**
     * Notes [key] as offered. False when it was already: then it isn't offered again. Only a hash
     * of each is kept, the newest {@link #REMEMBERED}.
     */
    static synchronized boolean remember(Context context, String key) {
        String hash = hash(key);
        SharedPreferences prefs = context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String saved = prefs.getString(OFFERED, "");
        List<String> hashes = new ArrayList<>(saved.isEmpty() ? new ArrayList<>() : Arrays.asList(saved.split(",")));
        if (hashes.contains(hash)) return false;
        hashes.add(hash);
        while (hashes.size() > REMEMBERED) hashes.remove(0);
        prefs.edit().putString(OFFERED, String.join(",", hashes)).apply();
        return true;
    }

    /** The first 16 hex digits of [key]'s SHA-256. */
    private static String hash(String key) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(key.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (int i = 0; i < 8; i++) hex.append(String.format(Locale.ROOT, "%02x", digest[i]));
            return hex.toString();
        } catch (Exception unavailable) {
            return Integer.toHexString(key.hashCode());
        }
    }

    // ---------------------------------------------------------------- the save

    /** A video opened so its player gets built, waiting for that player to be recorded. */
    static final class Pending {
        final String videoId;
        final long until;

        Pending(String videoId, long until) {
            this.videoId = videoId;
            this.until = until;
        }

        boolean expired() {
            return SystemClock.elapsedRealtime() > until;
        }
    }

    private static final AtomicReference<Pending> pending = new AtomicReference<>();

    /** The video an open is waiting on, or null. For tests. */
    @Nullable
    static String waitingFor() {
        Pending waiting = pending.get();
        return waiting == null ? null : waiting.videoId;
    }

    /** Reads where a short link redirects to. Tests swap it; on a phone it's {@link #httpRedirect}. */
    interface Redirects {
        @Nullable
        String next(String link) throws Exception;
    }

    static volatile Redirects redirects = ClipboardLink::httpRedirect;

    /** What Download does with [found]. Never throws. */
    static void download(Context application, WeakReference<Activity> screen, Found found) {
        try {
            if (SendLink.sending()) {
                String canonical = found.canonical();
                SendLink.send(application, canonical != null ? canonical : found.link);
                return;
            }
            if (found.videoId != null) {
                save(application, screen, found);
                return;
            }
            if (!Utils.runOnBackgroundThread(() -> {
                Found read = resolve(found);
                Utils.runOnMainThread(() -> {
                    if (read != null) {
                        save(application, screen, read);
                    } else {
                        Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                                () -> "a copied short link named no video, so it opened in Facebook");
                        open(application, screen, found.link);
                        Feedback.show(application,
                                L10n.t(application, "Couldn't find the video in that link, so it opened in Facebook instead."), true);
                    }
                });
            })) {
                Feedback.show(application, L10n.t(application, "Download failed"), true);
            }
        } catch (Throwable failure) {
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not start a copied link's save", failure);
            Feedback.show(application, L10n.t(application, "Download failed"), true);
        }
    }

    /**
     * Saves the video [found] names: now, when Facebook built its player already, or once the
     * video opens and its player is recorded.
     */
    static void save(Context application, WeakReference<Activity> screen, Found found) {
        String videoId = found.videoId;
        if (videoId == null) return;
        if (PlayerSources.byId(videoId) != null) {
            MediaDownload.saveFeedVideo(application, PostDetails.of(videoId), null, null);
            return;
        }
        pending.set(new Pending(videoId, SystemClock.elapsedRealtime() + WAIT_MS));
        Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "opening a copied video so Facebook builds its player");
        String canonical = found.canonical();
        open(application, screen, canonical != null ? canonical : found.link);
        Feedback.show(application, L10n.t(application, "Opening the video to save it"), false);
    }

    /**
     * {@link PlayerSources} recorded the player of [videoId]. When that's the video a copied link
     * opened, its save starts. Called from inside Facebook's player code: never throws.
     */
    static void recorded(String videoId) {
        try {
            Pending waiting = pending.get();
            if (waiting == null || !waiting.videoId.equals(videoId)) return;
            if (!pending.compareAndSet(waiting, null) || waiting.expired()) return;
            Context application = Utils.getContext();
            if (application == null) return;
            Utils.runOnMainThread(() -> MediaDownload.saveFeedVideo(application, PostDetails.of(videoId), null, null));
        } catch (Throwable failure) {
            try {
                HookStatus.threw(FAMILY, "copied link save", failure);
            } catch (Throwable ignored) {
                // Not even the report of one.
            }
        }
    }

    /** Opens [link] in Facebook, through Facebook's own link handler. */
    static void open(Context application, WeakReference<Activity> screen, String link) {
        Activity activity = screen.get();
        boolean fromScreen = activity != null && !activity.isFinishing() && !activity.isDestroyed();
        Context from = fromScreen ? activity : application;
        Intent view = new Intent(Intent.ACTION_VIEW, Uri.parse(link)).setClassName(from.getPackageName(), URI_HANDLER);
        if (!fromScreen) view.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            from.startActivity(view);
        } catch (Throwable failure) {
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not open a copied link", failure);
            Feedback.show(application, L10n.t(application, "Download failed"), true);
        }
    }

    /**
     * The video a short link stands for, read off the addresses it redirects to, or null. Only
     * Facebook's own https addresses are followed, at most {@link #MAX_HOPS} of them. A sign-in
     * page names the address it was asked for in its next parameter, so that's read too.
     */
    @Nullable
    static Found resolve(Found shortLink) {
        // Every hop is https, the first one too, even when the copied link said http.
        String at = "https://" + shortLink.link.replaceFirst("(?i)^https?://", "");
        try {
            for (int hop = 0; hop < MAX_HOPS; hop++) {
                String location = redirects.next(at);
                if (location == null) return null;
                String next = URI.create(at).resolve(location.trim()).toString();
                if (!facebooks(next)) return null;
                Found found = parse(next);
                if (found == null) {
                    String asked = Uri.parse(next).getQueryParameter("next");
                    if (asked != null && facebooks(asked)) found = parse(asked);
                }
                if (found != null && found.videoId != null) {
                    // A video's own page, whichever way the short link put it.
                    return new Found(shortLink.link, found.videoId, found.reel || shortLink.reel);
                }
                at = next;
            }
        } catch (Throwable failure) {
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not read a copied short link", failure);
        }
        return null;
    }

    /** Whether [link] is an https address on facebook.com or fb.watch. */
    static boolean facebooks(String link) {
        try {
            URI uri = URI.create(link);
            String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.ROOT);
            return "https".equalsIgnoreCase(uri.getScheme())
                    && (host.equals("facebook.com") || host.endsWith(".facebook.com")
                    || host.equals("fb.watch") || host.endsWith(".fb.watch"));
        } catch (Throwable malformed) {
            return false;
        }
    }

    /** One request for [link], without following it: the address it redirects to, or null. */
    @Nullable
    private static String httpRedirect(String link) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(link).openConnection();
        try {
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(10_000);
            connection.setRequestMethod("GET");
            int code = connection.getResponseCode();
            return code >= 300 && code < 400 ? connection.getHeaderField("Location") : null;
        } finally {
            connection.disconnect();
        }
    }
}
