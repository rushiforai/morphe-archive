package app.template.extension.extension;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

/**
 * Runtime support for the Reddit "Open links in external browser" patch.
 *
 * <p>Reddit routes outbound links through its own
 * {@code RedditInjectableCustomTabsActivityHelper}; the patch replaces the
 * entry point with this helper.  Returns {@code true} only when the
 * {@code ACTION_VIEW} intent was handed to the system, so the injected branch
 * can fall back to the stock Custom Tab path if the platform rejects it.
 */
public final class RedditLinkHelper {

    private RedditLinkHelper() {
        // Static injection surface only.
    }

    public static boolean openExternal(Activity activity, Uri uri) {
        if (activity == null || uri == null) {
            return false;
        }
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, uri);
            intent.addCategory(Intent.CATEGORY_BROWSABLE);
            activity.startActivity(intent);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }
}
