package app.template.extension.sofascore;

import android.net.Uri;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * Runtime hooks of "Clean shared links" (feature sofascore.clean_share_links). Both answer the stock
 * value when the switch is off or on any error.
 */
@SuppressWarnings("unused")
public final class ShareLinks {

    private static final String FEATURE = "sofascore.clean_share_links";

    private ShareLinks() { }

    /** Patched in front of the image share helper's text argument (EXTRA_TEXT). */
    public static String cleanShareText(String text) {
        try {
            if (!HevalSettings.isEnabled(FEATURE)) return text;
            return ShareLinkCleaner.clean(text);
        } catch (Throwable failure) {
            return text;
        }
    }

    /**
     * Replaces {@code Uri.Builder.appendQueryParameter} in the highlight link builder: with the
     * switch on, the utm_* parameters are not added.
     */
    public static Uri.Builder appendQueryParameter(Uri.Builder builder, String key, String value) {
        try {
            if (ShareLinkCleaner.isTrackingParameter(key) && HevalSettings.isEnabled(FEATURE)) return builder;
        } catch (Throwable failure) {
            // Fall through to the stock call.
        }
        return builder.appendQueryParameter(key, value);
    }
}
