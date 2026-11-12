// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.openlinks;

import static app.morphe.extension.shared.StringRef.str;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Parcelable;
import android.view.View;

import androidx.annotation.Nullable;

import com.onelouder.baconreader.BrowserActivity;
import com.onelouder.baconreader.LinkProcessor;
import com.onelouder.baconreader.Preferences;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.morphe.extension.shared.Logger;
import io.github.joancomasfdz.extension.baconreader.settings.Settings;

/**
 * "Open web pages in the browser": a link to a web page opens in the user's browser, while the images, GIFs,
 * galleries and videos BaconReader shows itself keep opening in it, whether or not "Open links inside app" is on.
 * Links to Reddit are left to the app.
 */
@SuppressWarnings("unused")
public final class OpenWebPagesPatch {
    // Reddit's pages, which the app opens itself.
    private static final List<String> REDDIT_HOSTS = Arrays.asList("reddit.com", "redd.it");

    // The hosts of images, GIFs, galleries and videos BaconReader shows in its own viewer, and the files it shows or
    // plays.
    private static final List<String> MEDIA_HOSTS = Arrays.asList("i.redd.it", "preview.redd.it", "imgur.com", "redgifs.com");
    private static final Set<String> MEDIA_FILES =
            new HashSet<>(Arrays.asList("jpg", "jpeg", "png", "gif", "gifv", "webp", "mp4", "webm"));

    private enum Kind {WEB, MEDIA, REDDIT, OTHER}

    private OpenWebPagesPatch() {
    }

    /**
     * Injected at the start of LinkProcessor.getIntent. With "Open web pages in the browser" on, returns the intent
     * that opens a web page in the user's browser, or, while "Open links inside app" is off, the one that opens an
     * image, GIF or video in BaconReader's own viewer, as the app does with that setting on. Returns null to let the
     * app decide: always for a link to Reddit.
     */
    @Nullable
    public static Intent webPageIntent(Object processor) {
        try {
            if ((boolean) field(processor, "forceBrowser")) return null;
            return intent((Context) field(processor, "context"), (String) field(processor, "url"));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read the link", ex);
            return null;
        }
    }

    /**
     * Injected at the start of LinkProcessor.getBrowserIntent(Context, Link), which a post's link button opens. The
     * same rule as {@link #webPageIntent}, for a post's link. A Reddit video or gallery is left to the app, which
     * shows it itself whatever the post's address.
     */
    @Nullable
    public static Intent webLinkIntent(Context context, Object link) {
        if (link == null || showsOwnMedia(link)) return null;
        Intent intent;
        try {
            intent = intent(context, (String) field(link, "url"));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read the post's link", ex);
            return null;
        }
        // The app's viewer also takes the post, as getBrowserIntent gives it.
        if (intent != null && intent.getComponent() != null && link instanceof Parcelable) {
            intent.putExtra("link", (Parcelable) link);
        }
        return intent;
    }

    /**
     * Injected at the start of ClickableLinkSpan.onClick, the link next to a post's title, which starts
     * LinkProcessor's intent only when it opens BaconReader's browser. Opens the link by {@link #webLinkIntent} and
     * returns true; returns false to let the app open it.
     */
    public static boolean openWebLink(View view, Object link) {
        if (view == null) return false;
        Context context = view.getContext();
        Intent intent = webLinkIntent(context, link);
        if (intent == null) return false;
        try {
            context.startActivity(intent);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not open the link", ex);
        }
        return true;
    }

    /**
     * Injected where the text of posts and comments reads "Open links inside app" for a link
     * (RedditSpanner.internalBrowser), which decides whether it opens through LinkProcessor. With "Open web pages in
     * the browser" on, an image, GIF or video does, whatever that setting says, so {@link #webPageIntent} opens it in
     * the app.
     */
    public static boolean mediaOpensInApp(boolean inApp, Object element) {
        if (inApp || element == null || !Settings.OPEN_WEB_PAGES_IN_BROWSER.get()) return inApp;
        try {
            String href = (String) element.getClass().getMethod("getAttribute", String.class).invoke(element, "href");
            if (href == null) return false;
            href = href.replace("&amp;", "&");
            if (href.startsWith("//")) href = "https:" + href;
            return kindOf(Uri.parse(href)) == Kind.MEDIA;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read the link", ex);
            return inApp;
        }
    }

    /**
     * Injected before ControlbarBase.createButton returns the button of a post's bar it made, tagged with its action:
     * gives the link button (R.id.action_link) a label, which it lacks, so that screen readers, and the e2e tests, can
     * name it.
     */
    public static void labelLinkButton(View button) {
        if (button == null || !(button.getTag() instanceof Integer)) return;
        if ((Integer) button.getTag() != linkButtonId()) return;
        button.setContentDescription(str("revanced_baconreader_open_link_button"));
    }

    @Nullable
    private static Intent intent(Context context, String url) {
        if (context == null || url == null || !Settings.OPEN_WEB_PAGES_IN_BROWSER.get()) return null;
        Uri uri = Uri.parse(url);
        switch (kindOf(uri)) {
            case WEB:
                return new Intent(Intent.ACTION_VIEW, uri).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            case MEDIA:
                return Preferences.getInternalBrowser() ? null : new Intent(context, BrowserActivity.class).setData(uri);
            default:
                return null;
        }
    }

    private static Kind kindOf(Uri uri) {
        String scheme = uri.getScheme() == null ? null : uri.getScheme().toLowerCase(Locale.ROOT);
        if (!"http".equals(scheme) && !"https".equals(scheme)) return Kind.OTHER;
        if (uri.getHost() == null) return Kind.OTHER;
        String host = uri.getHost().toLowerCase(Locale.ROOT);
        String last = uri.getLastPathSegment();
        int dot = last == null ? -1 : last.lastIndexOf('.');
        String file = dot < 0 ? "" : last.substring(dot + 1).toLowerCase(Locale.ROOT);
        for (String media : MEDIA_HOSTS) {
            if (matches(host, media)) return Kind.MEDIA;
        }
        if (MEDIA_FILES.contains(file)) return Kind.MEDIA;
        for (String reddit : REDDIT_HOSTS) {
            if (matches(host, reddit)) return Kind.REDDIT;
        }
        return Kind.WEB;
    }

    private static boolean matches(String host, String domain) {
        return host.equals(domain) || host.endsWith("." + domain);
    }

    /** Whether the post is a Reddit video or gallery: Link.isRedditVideo, LinkProcessor.isValidRedditGallery. */
    private static boolean showsOwnMedia(Object link) {
        try {
            Class<?> linkClass = Class.forName("com.onelouder.baconreader.reddit.Link");
            return (boolean) linkClass.getMethod("isRedditVideo").invoke(link)
                    || (boolean) LinkProcessor.class.getMethod("isValidRedditGallery", linkClass).invoke(null, link);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not check the media of the post", ex);
            return false;
        }
    }

    // R.id.action_link, which BaconReader gives the link button of a post's bar; 0 when it isn't found.
    private static int linkButtonId = -1;

    private static int linkButtonId() {
        if (linkButtonId == -1) {
            try {
                linkButtonId = Class.forName("com.onelouder.baconreader.R$id").getField("action_link").getInt(null);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not find the link button's id", ex);
                linkButtonId = 0;
            }
        }
        return linkButtonId;
    }

    private static Object field(Object object, String name) throws ReflectiveOperationException {
        Field field = object.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(object);
    }
}
