package app.template.extension.pepper;

import android.util.Log;

@SuppressWarnings("unused")
public final class SanitizeSharingLinksPatch {

    private static final String TAG = "MorphePepper";

    /**
     * Injection point. Called when the link to share a thread is read from the API response.
     *
     * @param threadUrl     Address of the thread on the website.
     * @param shareableLink Link that redirects to the thread through the Adjust tracking service.
     * @return The thread address without tracking parameters,
     *         or the shareable link if the thread address is missing.
     */
    public static String getThreadShareUrl(String threadUrl, String shareableLink) {
        try {
            String sanitizedThreadUrl = Links.sanitizeWebLink(threadUrl);
            if (sanitizedThreadUrl != null) {
                return sanitizedThreadUrl;
            }
        } catch (Exception ex) {
            Log.e(TAG, "getThreadShareUrl failure", ex);
        }

        return shareableLink;
    }
}
