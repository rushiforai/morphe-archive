/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.share;

import android.app.Activity;
import android.app.Application;
import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.download.LinkResolver;
import app.morphe.extension.pinedrama.settings.L10n;
import app.morphe.extension.pinedrama.settings.Settings;

/**
 * Copy the full link for short links: once the clipboard holds a short vt.tiktok.com,
 * vm.tiktok.com or tiktok.com/t/ link PineDrama made, that link is opened in the background, the
 * way a browser opening it would, and the full video link it points to takes its place on the
 * clipboard.
 *
 * <p>A link PineDrama makes short after the rewrite, which it does to every link that still has its
 * query, never passes through here as a short one, so for those the wait is for any short PineDrama
 * link to land on the clipboard ({@link #watchShortened}).
 *
 * <p>Nothing is opened before the link is copied. PineDrama makes its share link once for every
 * channel as the sheet opens, so each link made only starts a wait of {@link #WATCH_MS} for Copy
 * link, one per link, and a link sent straight to another app goes out as PineDrama made it,
 * unopened. Every wait ends as soon as one of PineDrama's screens leaves the front: Android holds
 * back the news of a clip copied in another app, Android's own share sheet included, and hands it
 * to PineDrama once it's back in front, and reading that clip shows Android's "pasted from your
 * clipboard" notice. A short link is opened once at a time, and one that couldn't be opened is
 * left for {@link #RETRY_AFTER_MS}. The link is opened through the media transport, with its checks on
 * every redirect, and the page it lands on is never read; only a landing on a video or photo
 * page on PineDrama's own site over HTTPS is taken.
 */
public final class ShortLinkExpander {
    private static final List<String> SHORT_HOSTS = Arrays.asList("vm.tiktok.com", "vt.tiktok.com");
    private static final List<String> TIKTOK_HOSTS = Arrays.asList("tiktok.com", "www.tiktok.com", "m.tiktok.com");
    /** A post's own page, /@name/video/123 or /@name/photo/123, with anything after it. */
    private static final Pattern POST_PATH = Pattern.compile("/@[^/?#]+/(video|photo)/\\d+([/?#].*)?");
    /**
     * The short link on PineDrama's own site, tiktok.com/t/ZT8abc/, with anything after it. PineDrama
     * hands this form out as well as the vt.tiktok.com one, and it leads to the video the same way.
     */
    private static final Pattern SITE_SHORT_PATH = Pattern.compile("/t/[A-Za-z0-9]{4,20}/?([?#].*)?");
    /** A short link inside copied text, in either form. {@link #isShort} has the last word. */
    private static final Pattern SHORT_IN_TEXT = Pattern.compile(
            "https://(?:(?:vm|vt)\\.tiktok\\.com/[A-Za-z0-9]+|(?:www\\.|m\\.)?tiktok\\.com/t/[A-Za-z0-9]{4,20})/?");
    /** The wait for a link PineDrama makes short after the rewrite, which has no text to wait for. */
    private static final String SHORTENED_LATER = "\u0000shortened later";
    /** How long after the link is made a Copy link still gets the full one. */
    static final long WATCH_MS = 60_000;
    /** How long a short link that couldn't be opened is left before it's tried again. */
    static final long RETRY_AFTER_MS = 10 * 60_000;
    static final String FULL_LINK_COPIED = "Full link copied";

    /** Where a link ends up after its redirects. */
    interface Resolver {
        String finalUrl(String url) throws IOException;
    }

    /** What's done with the full link once it's known, on the main thread. */
    interface Then {
        void accept(String full);
    }

    static final Resolver NETWORK = LinkResolver::finalUrl;
    /** Where a short link is opened. Tests open it in place. Refuses when no thread starts. */
    static Executor opener = task -> {
        if (!Utils.runOnOwnThread("HushPine short link", task)) throw new RejectedExecutionException("no thread");
    };
    /** How many opened short links are remembered, with where they led. */
    static final int REMEMBERED = 16;

    /** Each copied text being waited for, with its listener. Main thread. */
    private static final Map<String, ClipboardManager.OnPrimaryClipChangedListener> WATCHING = new HashMap<>();
    /** The app whose screens leaving the front end the waits. Main thread. */
    private static WeakReference<Application> followed = new WeakReference<>(null);
    /** Short links being opened now. */
    private static final Set<String> OPENING = new HashSet<>();
    /** The latest short links opened, oldest first, each with where it led and when. */
    private static final Map<String, Opened> OPENED = new LinkedHashMap<String, Opened>(REMEMBERED, 0.75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Opened> eldest) {
            return size() > REMEMBERED;
        }
    };

    /** Where a short link led, null when it couldn't be opened, and when it was tried. */
    private static final class Opened {
        @Nullable final String full;
        final long at;

        Opened(@Nullable String full, long at) {
            this.full = full;
            this.at = at;
        }
    }

    private ShortLinkExpander() {
    }

    /** True for a short PineDrama link with the switch on, which is when a swap is tried. */
    static boolean wants(@Nullable String url) {
        return url != null && isShort(url) && Settings.EXPAND_SHORT_SHARE_LINKS.get();
    }

    /**
     * True for a full video or photo link that still has its query, with the switch on. PineDrama's
     * share sheet sends a link with a query to its server to be made short before it shows the
     * sheet (one without a query goes out as it is), so the short link Copy link puts on the
     * clipboard never passes the rewrite. On 47.1.4 that is every link while Clean up shared links
     * is off, and the expander never ran for them.
     */
    static boolean wantsShortened(@Nullable String url) {
        return url != null && url.startsWith("https://") && url.indexOf('?') > 0
                && TIKTOK_HOSTS.contains(host(url)) && POST_PATH.matcher(path(url)).matches()
                && Settings.EXPAND_SHORT_SHARE_LINKS.get();
    }

    static boolean isShort(String url) {
        if (!url.startsWith("https://")) return false;
        String host = host(url);
        return SHORT_HOSTS.contains(host)
                || (TIKTOK_HOSTS.contains(host) && SITE_SHORT_PATH.matcher(path(url)).matches());
    }

    /**
     * From the share link rewrite: {@code copied} is what PineDrama goes on to share or copy, and
     * {@code shortLink} the short link it was made from. Nothing is opened here.
     */
    static void later(String copied, String shortLink) {
        Context context = Utils.getContext();
        long before = clipStamp(context);
        Utils.runOnMainThreadNowOrLater(() -> watch(context, copied, shortLink, before, NETWORK));
    }

    /**
     * Waits {@link #WATCH_MS} for the clipboard to hold {@code copied}, then opens
     * {@code shortLink} and swaps the full link in for {@code copied}. {@code before} is the
     * stamp of the clip that was there when the link was made ({@link #clipStamp}). Main thread.
     */
    static void watch(@Nullable Context context, String copied, String shortLink, long before, Resolver resolver) {
        if (context == null || WATCHING.containsKey(copied)) return;
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) return;
        Then swapIn = full -> swap(clipboard, copied, full);
        // Copy link may have come before this ran. The clip that was there when the link was made
        // is never read, so Android has no reason to say PineDrama read another app's clip.
        if (changedSince(clipboard, before) && holds(clipboard, copied)) {
            open(shortLink, resolver, swapIn);
            return;
        }
        ClipboardManager.OnPrimaryClipChangedListener[] listener = new ClipboardManager.OnPrimaryClipChangedListener[1];
        listener[0] = () -> {
            if (ended(clipboard, copied, listener[0]) || !holds(clipboard, copied)) return;
            // Off before the swap, whose own change would otherwise come back here.
            stopWatching(clipboard, copied, listener[0]);
            open(shortLink, resolver, swapIn);
        };
        followPauses(context);
        WATCHING.put(copied, listener[0]);
        clipboard.addPrimaryClipChangedListener(listener[0]);
        Utils.runOnMainThreadDelayed(() -> stopWatching(clipboard, copied, listener[0]), WATCH_MS);
    }

    /**
     * From the share link rewrite, for a link PineDrama goes on to make short ({@link
     * #wantsShortened}). Nothing is opened here.
     */
    static void laterShortened() {
        Context context = Utils.getContext();
        long before = clipStamp(context);
        Logger.printDebug(() -> "Short link watch for a link PineDrama shortens, clip stamp " + before
                + " on " + Thread.currentThread().getName());
        Utils.runOnMainThreadNowOrLater(() -> watchShortened(context, before, NETWORK));
    }

    /**
     * Waits {@link #WATCH_MS} for a short PineDrama link to land on the clipboard, then opens it and
     * swaps in where it leads, as {@link #watch} does for a short link PineDrama made before the
     * rewrite. Each new sheet starts the wait again. Main thread.
     */
    static void watchShortened(@Nullable Context context, long before, Resolver resolver) {
        if (context == null) return;
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) return;
        ClipboardManager.OnPrimaryClipChangedListener earlier = WATCHING.get(SHORTENED_LATER);
        if (earlier != null) stopWatching(clipboard, SHORTENED_LATER, earlier);
        // A copy that came before this ran; the clip that was there when the link was made is
        // never read.
        if (changedSince(clipboard, before)) {
            Logger.printDebug(() -> "The clip changed before the short link watch started, reading it");
            String copiedShort = shortLinkOn(clipboard);
            if (copiedShort != null) {
                open(copiedShort, resolver, full -> swap(clipboard, copiedShort, full));
                return;
            }
        }
        ClipboardManager.OnPrimaryClipChangedListener[] listener = new ClipboardManager.OnPrimaryClipChangedListener[1];
        listener[0] = () -> {
            if (ended(clipboard, SHORTENED_LATER, listener[0])) return;
            Logger.printDebug(() -> "The clip changed during the short link watch, reading it");
            String copiedShort = shortLinkOn(clipboard);
            if (copiedShort == null) return;
            // Off before the swap, whose own change would otherwise come back here.
            stopWatching(clipboard, SHORTENED_LATER, listener[0]);
            open(copiedShort, resolver, full -> swap(clipboard, copiedShort, full));
        };
        followPauses(context);
        WATCHING.put(SHORTENED_LATER, listener[0]);
        clipboard.addPrimaryClipChangedListener(listener[0]);
        Utils.runOnMainThreadDelayed(() -> stopWatching(clipboard, SHORTENED_LATER, listener[0]), WATCH_MS);
    }

    /** The first short PineDrama link in the clip on the clipboard, or null. */
    @Nullable
    private static String shortLinkOn(ClipboardManager clipboard) {
        try {
            ClipData clip = clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) return null;
            CharSequence text = clip.getItemAt(0).getText();
            if (text == null) return null;
            java.util.regex.Matcher found = SHORT_IN_TEXT.matcher(text);
            while (found.find()) {
                if (isShort(found.group())) return found.group();
            }
            return null;
        } catch (RuntimeException failure) {
            return null;
        }
    }

    private static void stopWatching(ClipboardManager clipboard, String copied,
                                     ClipboardManager.OnPrimaryClipChangedListener listener) {
        clipboard.removePrimaryClipChangedListener(listener);
        // A later wait for the same text has its own listener, which stays.
        if (WATCHING.get(copied) == listener) WATCHING.remove(copied);
    }

    /**
     * True for a listener whose wait has ended, which is then taken off the clipboard it was put
     * on without reading the clip. Each listener does this itself because Utils' context, and the
     * clipboard manager it gives, can change between waits (a new MainActivity with HushPine's
     * language set), and a manager only takes off listeners it was given.
     */
    private static boolean ended(ClipboardManager clipboard, String copied,
                                 ClipboardManager.OnPrimaryClipChangedListener listener) {
        if (WATCHING.get(copied) == listener) return false;
        clipboard.removePrimaryClipChangedListener(listener);
        return true;
    }

    /**
     * Ends every wait when one of PineDrama's screens leaves the front, such as for Android's share
     * sheet after More (Login2, Android 13, 2026-10-20: that sheet's Copy reached the wait once
     * PineDrama was back, and Android showed its notice). PineDrama's own share sheet is a dialog, so
     * its Copy link leaves nothing. Each listener left behind goes at its next call ({@link
     * #ended}) or its time limit. Main thread.
     */
    private static void followPauses(Context context) {
        Context app = context.getApplicationContext();
        if (!(app instanceof Application) || followed.get() == app) return;
        followed = new WeakReference<>((Application) app);
        ((Application) app).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityPaused(Activity paused) {
                if (WATCHING.isEmpty()) return;
                WATCHING.clear();
                Logger.printDebug(() -> "PineDrama left the front, so the short link watch ended");
            }
            @Override public void onActivityCreated(Activity created, Bundle state) { }
            @Override public void onActivityStarted(Activity started) { }
            @Override public void onActivityResumed(Activity resumed) { }
            @Override public void onActivityStopped(Activity stopped) { }
            @Override public void onActivitySaveInstanceState(Activity saved, Bundle state) { }
            @Override public void onActivityDestroyed(Activity destroyed) { }
        });
    }

    /**
     * Hands {@code then} where {@code shortLink} leads, with the share link settings applied, on
     * the main thread. A link already being opened, or one that couldn't be opened a moment ago,
     * isn't opened again.
     */
    static void open(String shortLink, Resolver resolver, Then then) {
        String known = null;
        synchronized (ShortLinkExpander.class) {
            Opened opened = OPENED.get(shortLink);
            if (opened != null) {
                if (opened.full == null && SystemClock.elapsedRealtime() - opened.at < RETRY_AFTER_MS) return;
                known = opened.full;
            }
            if (known == null && !OPENING.add(shortLink)) return;
        }
        if (known != null) {
            String full = known;
            Utils.runOnMainThreadNowOrLater(() -> then.accept(rewrite(full)));
            return;
        }
        try {
            opener.execute(() -> {
                String landed = null;
                try {
                    landed = expand(shortLink, resolver);
                } finally {
                    synchronized (ShortLinkExpander.class) {
                        OPENING.remove(shortLink);
                        OPENED.put(shortLink, new Opened(landed, SystemClock.elapsedRealtime()));
                    }
                }
                if (landed == null) return;
                String full = landed;
                Utils.runOnMainThread(() -> then.accept(rewrite(full)));
            });
        } catch (RejectedExecutionException refused) {
            // Nothing will open it, so it mustn't stay marked as opening until PineDrama restarts.
            synchronized (ShortLinkExpander.class) {
                OPENING.remove(shortLink);
            }
            Logger.printInfo(() -> "Short link expansion couldn't start a thread, so the link stays short");
        }
    }

    private static String rewrite(String full) {
        return ShareUrlSanitizer.stripAllQueryParams(ShareUrlSanitizer.withCustomDomain(full));
    }

    /** Whether a wait for a link PineDrama makes short later is on. Main thread. */
    static boolean watchingShortenedForTests() {
        return WATCHING.containsKey(SHORTENED_LATER);
    }

    static synchronized void forgetForTests() {
        OPENED.clear();
        OPENING.clear();
        WATCHING.clear();
    }

    /**
     * Where the short link {@code url} leads, when that's a video or photo page on PineDrama's own
     * site over HTTPS. Null otherwise: a landing on the home page, a sign-in page or PineDrama's old
     * /v/ page would only lose the video the short link named.
     */
    @Nullable
    static String expand(String url, Resolver resolver) {
        if (!isShort(url)) return null;
        String landed;
        try {
            landed = resolver.finalUrl(url);
        } catch (IOException | RuntimeException failure) {
            Logger.printInfo(() -> "Could not open a short share link", failure);
            return null;
        }
        if (landed == null || !landed.startsWith("https://")) return null;
        if (!TIKTOK_HOSTS.contains(host(landed)) || !POST_PATH.matcher(path(landed)).matches()) return null;
        return landed;
    }

    /**
     * The stamp Android put on the clip that's on the clipboard now, or -1 when there's none.
     * Reading the clip's description, unlike the clip, never shows Android's notice.
     */
    static long clipStamp(@Nullable Context context) {
        if (context != null && Build.VERSION.SDK_INT >= 26) {
            try {
                ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                ClipDescription description = clipboard == null ? null : clipboard.getPrimaryClipDescription();
                return description == null ? -1 : description.getTimestamp();
            } catch (RuntimeException failure) {
                return -1;
            }
        }
        return -1;
    }

    /**
     * Whether the clip on the clipboard isn't the one stamped {@code before}. Android 7 and
     * older stamp nothing, and show no notice for reading a clip either.
     */
    private static boolean changedSince(ClipboardManager clipboard, long before) {
        if (Build.VERSION.SDK_INT >= 26) {
            try {
                ClipDescription description = clipboard.getPrimaryClipDescription();
                if (description == null) return false;
                long setAt = description.getTimestamp();
                // Zero is a clip whose time wasn't recorded.
                return setAt == 0 || setAt != before;
            } catch (RuntimeException failure) {
                return false;
            }
        }
        return true;
    }

    private static boolean holds(ClipboardManager clipboard, String copied) {
        try {
            ClipData clip = clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) return false;
            CharSequence text = clip.getItemAt(0).getText();
            return text != null && text.toString().contains(copied);
        } catch (RuntimeException failure) {
            return false;
        }
    }

    /** Puts {@code full} in place of {@code copied} when the clipboard still holds it. */
    private static void swap(ClipboardManager clipboard, String copied, String full) {
        try {
            ClipData clip = clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) return;
            CharSequence text = clip.getItemAt(0).getText();
            if (text == null || !text.toString().contains(copied)) return;
            CharSequence label = clip.getDescription() == null ? null : clip.getDescription().getLabel();
            clipboard.setPrimaryClip(ClipData.newPlainText(label, text.toString().replace(copied, full)));
            Utils.showToastShort(L10n.t(FULL_LINK_COPIED));
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Could not swap in the full share link", failure);
        }
    }

    private static String host(String url) {
        int start = url.indexOf("://");
        if (start < 0) return "";
        start += 3;
        int end = start;
        while (end < url.length() && "/?#".indexOf(url.charAt(end)) < 0) end++;
        return url.substring(start, end).toLowerCase(Locale.ROOT);
    }

    private static String path(String url) {
        int start = url.indexOf("://");
        int slash = start < 0 ? -1 : url.indexOf('/', start + 3);
        return slash < 0 ? "" : url.substring(slash);
    }
}
