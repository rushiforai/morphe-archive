package app.jofslash.extension.quora;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

@SuppressWarnings("unused")
public final class OpenLinksInBrowserPatch {

    private static final String TAG = "JoFSlashPatches";

    /**
     * Injection point: start of OpenUrlMessageSync.startCustomTab.
     *
     * @return True if the link was opened in the browser, false to fall back to the in-app tab.
     */
    public static boolean openInBrowser(Context context, String url) {
        if (context == null || url == null || !PatchSettings.on("openLinksInBrowser")) return false;
        try {
            Uri uri = Uri.parse(url);
            String host = uri.getHost();
            if (host == null) return false;
            host = host.toLowerCase();
            // Quora's own pages would be sent back to this app, so keep them in the in-app tab.
            if (host.equals("quora.com") || host.endsWith(".quora.com")) return false;

            Intent intent = new Intent(Intent.ACTION_VIEW, uri);
            intent.addCategory(Intent.CATEGORY_BROWSABLE);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return true;
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open link in browser", ex);
            return false;
        }
    }
}
