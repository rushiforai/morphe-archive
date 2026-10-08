package app.morphe.extension.reddit.profile;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ShareProfileUsername {

    private static final Pattern PROFILE_LINK =
            Pattern.compile("^https?://(www\\.|old\\.)?reddit\\.com/(?:user|u)/([^/?#]+).*", Pattern.CASE_INSENSITIVE);

    public static String shortenProfileLink(String url) {
        if (url == null || url.isEmpty()) {
            return url;
        }
        Matcher matcher = PROFILE_LINK.matcher(url.trim());
        if (matcher.matches()) {
            return matcher.group(2);
        }
        return url;
    }

    public static boolean wasShortened(String original, String shortened) {
        return shortened != null && !shortened.equals(original) && shortened.indexOf("://") < 0;
    }
}
