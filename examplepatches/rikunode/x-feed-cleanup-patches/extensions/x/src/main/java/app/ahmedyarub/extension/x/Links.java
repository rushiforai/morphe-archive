package app.ahmedyarub.extension.x;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Links the app shares and opens.
 *
 * The placeholder methods below return what the patches write into them, so a patch that is not
 * applied leaves its feature off.
 */
@SuppressWarnings("unused")
public final class Links {

    private static final Pattern X_LINK =
            Pattern.compile("https?://(?:www\\.|mobile\\.)?(?:x|twitter)\\.com/", Pattern.CASE_INSENSITIVE);

    /** The domain shared links point at, or empty for x.com. Rewritten by Custom sharing domain. */
    private static String sharingDomain() {
        return "";
    }

    /** Hosts that open in the app, from the array Handle custom twitter links adds. */
    private static String[] customLinkHosts(Context context) {
        int id = context.getResources().getIdentifier("morphe_x_custom_link_hosts", "array", context.getPackageName());
        return id == 0 ? new String[0] : context.getResources().getStringArray(id);
    }

    /**
     * Text the app shares or copies: links to x.com point at the chosen domain instead.
     * Profile, list and trend links are rewritten as well as posts; the frontends serve all of them.
     */
    public static String transformShareText(String text) {
        if (text == null) return null;

        String domain = sharingDomain();
        if (domain.isEmpty()) return text;

        return X_LINK.matcher(text).replaceAll(Matcher.quoteReplacement("https://" + domain + "/"));
    }

    /** The URL a link in a post opens: the expanded one rather than its t.co redirect. */
    public static String pickEntityUrl(String expandedUrl, String url) {
        return expandedUrl == null || expandedUrl.isEmpty() ? url : expandedUrl;
    }

    /** Points a link to one of the custom hosts at x.com, which is all the app's router accepts. */
    public static void rewriteCustomDeepLinks(Activity activity) {
        rewriteCustomDeepLinks(activity, activity.getIntent());
    }

    /** onNewIntent: the activity is the receiver, handed in alongside the intent. */
    public static void rewriteCustomDeepLinks(Activity activity, Intent intent) {
        if (intent == null) return;

        Uri uri = intent.getData();
        if (uri == null || uri.getHost() == null) return;

        String host = uri.getHost().toLowerCase(Locale.ROOT);
        for (String custom : customLinkHosts(activity)) {
            if (host.equals(custom) || host.endsWith("." + custom)) {
                intent.setData(uri.buildUpon().scheme("https").authority("x.com").build());
                return;
            }
        }
    }
}
