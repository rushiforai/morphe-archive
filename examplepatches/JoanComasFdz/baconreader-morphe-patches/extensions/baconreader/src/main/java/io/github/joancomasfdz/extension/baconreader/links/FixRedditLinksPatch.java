// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.links;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;

import com.onelouder.baconreader.BrowserActivity;
import com.onelouder.baconreader.DetailActivity;
import com.onelouder.baconreader.LinkDispatcher;
import com.onelouder.baconreader.LinkProcessor;

import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import app.morphe.extension.shared.Logger;

/**
 * Opens the Reddit links LinkProcessor doesn't recognize in the app: share links, resolved through their redirect,
 * posts without their subreddit, galleries and posts on a user's profile.
 */
@SuppressWarnings("unused")
public final class FixRedditLinksPatch {
    /** Share links resolve on www.reddit.com whatever host the link names. */
    private static final String REDDIT = "https://www.reddit.com";

    private static final String EXTRA_SHARE_LINK = "io.github.joancomasfdz.extension.baconreader.links.SHARE_LINK";

    private static final int TIMEOUT_MS = 10_000;

    private FixRedditLinksPatch() {
    }

    /**
     * Injected at the start of LinkProcessor.getIntent. Returns the intent for the Reddit links the app doesn't
     * recognize, or null to let the app decide.
     */
    public static Intent intent(Object processor) {
        String url = null;
        try {
            if ((boolean) field(processor, "forceBrowser")) return null;
            Context context = (Context) field(processor, "context");
            url = (String) field(processor, "url");
            if (context == null || url == null || !LinkProcessor.isReddit(url)) return null;
            Uri uri = Uri.parse(url);
            List<String> segments = uri.getPathSegments();
            if (segments == null || segments.isEmpty()) return null;
            String first = segments.get(0);
            boolean isUser = "u".equals(first) || "user".equals(first);
            int size = segments.size();
            // /r/<sub>/s/<code> and /u/<user>/s/<code>: Reddit's share links, which only say what they open through
            // a redirect.
            if (("r".equals(first) || isUser) && size == 4 && "s".equals(segments.get(2))) {
                return new Intent(context, LinkDispatcher.class).setData(uri).putExtra(EXTRA_SHARE_LINK, true);
            }
            // /comments/<post>[/<title>[/<comment>]]: a post without its subreddit.
            if ("comments".equals(first) && size >= 2) {
                return detail(context, uri, segments.get(1), size >= 4 ? segments.get(3) : null);
            }
            // /gallery/<post>
            if ("gallery".equals(first) && size == 2) return detail(context, uri, segments.get(1), null);
            // /user/<user>/comments/<post>[/<title>[/<comment>]]: a post on a user's profile, which the app opens
            // as the profile.
            if (isUser && size >= 4 && "comments".equals(segments.get(2))) {
                return detail(context, uri, segments.get(3), size >= 6 ? segments.get(5) : null);
            }
            return null;
        } catch (Exception ex) {
            String link = url;
            Logger.printInfo(() -> "Could not read the link " + link, ex);
            return null;
        }
    }

    private static Object field(Object processor, String name) throws ReflectiveOperationException {
        Field field = processor.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(processor);
    }

    private static Intent detail(Context context, Uri uri, String post, String comment) {
        if (post.isEmpty()) return null;
        Intent intent = new Intent(context, DetailActivity.class).putExtra(DetailActivity.EXTRA_LINKID, post);
        int parents = 0;
        try {
            String parentsParameter = uri.getQueryParameter("context");
            if (parentsParameter != null) parents = Integer.parseInt(parentsParameter);
        } catch (NumberFormatException ignored) {
        }
        intent.putExtra(DetailActivity.EXTRA_PARENTS, parents);
        if (comment != null && !comment.isEmpty()) intent.putExtra(DetailActivity.EXTRA_COMMENTID, comment);
        return intent;
    }

    /**
     * Injected at the start of ClickableLinkSpan.onClick, the link next to a post's title, which starts only the
     * intents that open the browser. Opens the links {@link #intent} knows and returns true; returns false to let the
     * span go on.
     */
    public static boolean open(View view, String url) {
        if (view == null || url == null) return false;
        Context context = view.getContext();
        if (context == null) return false;
        Intent next = intent(new LinkProcessor(context, url));
        if (next == null) return false;
        try {
            context.startActivity(next);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not open the link " + url, ex);
        }
        return true;
    }

    /**
     * Injected at the start of LinkDispatcher.processing. Opens a share link where it leads, once its redirect is
     * known, and returns true; returns false for every other intent.
     */
    public static boolean dispatch(Activity activity, Intent intent) {
        if (activity == null || intent == null || !intent.getBooleanExtra(EXTRA_SHARE_LINK, false)) return false;
        Uri link = intent.getData();
        if (link == null) return false;
        new Thread(() -> {
            String target = resolve(link);
            activity.runOnUiThread(() -> open(activity, link, target));
        }).start();
        return true;
    }

    private static void open(Activity activity, Uri link, String target) {
        try {
            Intent next = target != null ? new LinkProcessor(activity, target).getIntent() : null;
            if (next == null) next = new Intent(activity, BrowserActivity.class).setData(link);
            activity.startActivity(next);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not open the share link " + link, ex);
        }
        activity.finish();
    }

    /** The link the share link redirects to, on the share link's host, or null. */
    private static String resolve(Uri link) {
        HttpURLConnection connection = null;
        try {
            String query = link.getEncodedQuery();
            URL request = new URL(REDDIT + link.getEncodedPath() + (query != null ? "?" + query : ""));
            connection = (HttpURLConnection) request.openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            int status = connection.getResponseCode();
            String location = connection.getHeaderField("Location");
            if (status < 300 || status > 399 || location == null || location.isEmpty()) {
                Logger.printInfo(() -> "The share link " + link + " answered " + status + " without a redirect");
                return null;
            }
            // Rebuilt on the link's own host, so the app recognizes it as a Reddit link.
            Uri target = Uri.parse(new URL(request, location).toString());
            return new Uri.Builder()
                    .scheme(link.getScheme())
                    .encodedAuthority(link.getEncodedAuthority())
                    .encodedPath(target.getEncodedPath())
                    .encodedQuery(target.getEncodedQuery())
                    .build()
                    .toString();
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not resolve the share link " + link, ex);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
