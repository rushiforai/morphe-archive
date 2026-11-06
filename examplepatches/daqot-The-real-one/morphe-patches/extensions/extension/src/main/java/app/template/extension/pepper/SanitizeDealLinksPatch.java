package app.template.extension.pepper;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.net.HttpURLConnection;
import java.net.URL;

@SuppressWarnings("unused")
public final class SanitizeDealLinksPatch {

    private static final String TAG = "MorphePepper";

    private static final String VISIT_PATH_PREFIX = "/visit/";

    /**
     * Query parameter of Pepper's affiliate redirect holding the link to the store.
     */
    private static final String STORE_LINK_PARAMETER = "url";

    private static final int TIMEOUT_MILLISECONDS = 5000;

    private static final Handler mainThreadHandler = new Handler(Looper.getMainLooper());

    /**
     * Link the extension is opening with the original method, which must not be intercepted.
     * Only accessed on the main thread.
     */
    private static String linkBeingOpened;

    /**
     * Injection point. Called on the main thread before a link is opened in a Custom Tab.
     *
     * @return If the extension opens the link instead.
     */
    public static boolean openLinkInCustomTab(Context context, String link) {
        return openStoreLink(context, link, false);
    }

    /**
     * Injection point. Called on the main thread before a link is opened in a browser.
     *
     * @return If the extension opens the link instead.
     */
    public static boolean openLinkInBrowser(Context context, String link) {
        return openStoreLink(context, link, true);
    }

    /**
     * Opens a link in a Custom Tab with the original method. Code is added during patching.
     */
    public static void openInCustomTab(Context context, String link) {
    }

    /**
     * Opens a link in a browser with the original method. Code is added during patching.
     */
    public static void openInBrowser(Context context, String link) {
    }

    private static boolean openStoreLink(Context context, String link, boolean inBrowser) {
        try {
            if (link == null || link.equals(linkBeingOpened)) {
                return false;
            }

            Uri uri = Uri.parse(link);
            String path = uri.getPath();
            if (!Links.isPepperLink(uri) || path == null || !path.startsWith(VISIT_PATH_PREFIX)) {
                return false;
            }

            // The query only identifies the user and tracks where the deal was opened from.
            String visitLink = uri.buildUpon().clearQuery().build().toString();

            new Thread(() -> {
                String storeLink = null;
                try {
                    storeLink = getStoreLink(visitLink);
                } catch (Exception ex) {
                    Log.e(TAG, "Failed to get the store link of: " + visitLink, ex);
                }

                String linkToOpen = storeLink != null ? storeLink : visitLink;
                mainThreadHandler.post(() -> open(context, linkToOpen, inBrowser));
            }).start();

            return true;
        } catch (Exception ex) {
            Log.e(TAG, "openStoreLink failure", ex);
        }

        return false;
    }

    /**
     * @return The link to the store Pepper's visit link redirects to,
     *         or null if it does not redirect to one.
     */
    private static String getStoreLink(String visitLink) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(visitLink).openConnection();
        try {
            connection.setInstanceFollowRedirects(false);
            connection.setUseCaches(false);
            connection.setConnectTimeout(TIMEOUT_MILLISECONDS);
            connection.setReadTimeout(TIMEOUT_MILLISECONDS);
            // Pepper refuses requests without a user agent.
            connection.setRequestProperty("User-Agent", System.getProperty("http.agent"));

            int responseCode = connection.getResponseCode();
            String location = connection.getHeaderField("Location");
            if (responseCode < 300 || responseCode >= 400 || location == null) {
                return null;
            }

            // Pepper redirects to its affiliate redirect, such as
            // https://path.pepper.nl/pepper/redirect?url=<store link>&product=<id>&tag=eugc,
            // which then adds the affiliate parameters to the store link.
            Uri locationUri = Uri.parse(location);
            String storeLink = Links.isPepperLink(locationUri)
                    ? locationUri.getQueryParameter(STORE_LINK_PARAMETER)
                    : location;

            return Links.sanitizeWebLink(storeLink);
        } finally {
            connection.disconnect();
        }
    }

    private static void open(Context context, String link, boolean inBrowser) {
        linkBeingOpened = link;
        try {
            if (inBrowser) {
                openInBrowser(context, link);
            } else {
                openInCustomTab(context, link);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open: " + link, ex);
        } finally {
            linkBeingOpened = null;
        }
    }
}
