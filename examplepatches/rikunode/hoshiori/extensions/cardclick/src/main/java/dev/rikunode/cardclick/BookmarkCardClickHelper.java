package dev.rikunode.cardclick;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;

/** Isolated bookmark card action. Child views retain their click handlers. */
public final class BookmarkCardClickHelper {
    private static final String WEBVIEW_ACTIVITY =
            "com.hatena.android.bookmark.presentation.activity.WebViewActivity";

    private BookmarkCardClickHelper() {}

    public static void attach(View articleCard, Uri browseUrl, Uri originalUri) {
        if (articleCard == null || !isWebUrl(browseUrl)) return;
        final Uri original = isWebUrl(originalUri) ? originalUri : null;
        articleCard.setOnClickListener(view -> {
            if (!isWebUrl(browseUrl)) return;
            try {
                Context context = view.getContext();
                Intent intent = new Intent(Intent.ACTION_VIEW);
                intent.setClassName(context, WEBVIEW_ACTIVITY);
                intent.setData(browseUrl);
                if (original != null) intent.putExtra("original_uri", original);
                context.startActivity(intent);
            } catch (RuntimeException ignored) {
                // An invalid or unavailable target must not interrupt bookmark details.
            }
        });
    }

    private static boolean isWebUrl(Uri uri) {
        if (uri == null) return false;
        String scheme = uri.getScheme();
        String host = uri.getHost();
        return ("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme))
                && host != null && !host.isEmpty()
                && !uri.toString().trim().isEmpty();
    }
}
