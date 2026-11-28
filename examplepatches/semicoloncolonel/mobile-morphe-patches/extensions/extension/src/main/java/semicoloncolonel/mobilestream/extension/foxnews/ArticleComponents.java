package semicoloncolonel.mobilestream.extension.foxnews;

import android.util.Log;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Fox News: filters the components of an article (ScreenModel's componentModels) before the
 * app builds the article's rows from them. When anything is unexpected, the list is returned
 * as it came.
 */
@SuppressWarnings("unused")
public final class ArticleComponents {
    private static final String TAG = "MSP-FOXNEWS";
    private static final String PACKAGE = "com.foxnews.network.models.response.";

    /**
     * A paragraph that only asks the reader to download or get the Fox News app: it starts with
     * "Download", "Get", or "Click here to download/get", and names the Fox News app.
     */
    private static final Pattern APP_PROMOTION =
            Pattern.compile("(?is)^\\W*(click here to )?(download|get)\\b.*\\bfox news app\\b");

    private static final Pattern HTML_TAG = Pattern.compile("<[^>]*>");
    private static final Pattern SPACE = Pattern.compile("(?:\\s|&nbsp;|\\u00a0)+");

    /** Longer paragraphs are article text that happens to mention the app, and stay. */
    private static final int MAX_PROMOTION_LENGTH = 120;

    private ArticleComponents() {
    }

    /** "Hide comments and reactions": the comments section and the reactions bar. */
    public static List<?> withoutCommentsAndReactions(List<?> components) {
        if (components == null || components.isEmpty()) {
            return components;
        }
        try {
            ArrayList<Object> kept = new ArrayList<>(components.size());
            for (Object component : components) {
                String type = component == null ? "" : component.getClass().getName();
                if (!type.equals(PACKAGE + "CommentsComponent") && !type.equals(PACKAGE + "ReactionsComponent")) {
                    kept.add(component);
                }
            }
            return kept.size() == components.size() ? components : kept;
        } catch (Throwable t) {
            Log.w(TAG, "comments filter failed: " + t);
            return components;
        }
    }

    /** "Hide app promotions": paragraphs that link to the Fox News app download. */
    public static List<?> withoutAppPromotions(List<?> components) {
        if (components == null || components.isEmpty()) {
            return components;
        }
        try {
            ArrayList<Object> kept = new ArrayList<>(components.size());
            for (Object component : components) {
                if (!isAppPromotion(component)) {
                    kept.add(component);
                }
            }
            return kept.size() == components.size() ? components : kept;
        } catch (Throwable t) {
            Log.w(TAG, "app promotion filter failed: " + t);
            return components;
        }
    }

    private static boolean isAppPromotion(Object component) {
        if (component == null || !component.getClass().getName().equals(PACKAGE + "TextComponent")) {
            return false;
        }
        try {
            Object attributes = component.getClass().getMethod("getAttributes").invoke(component);
            if (attributes == null) {
                return false;
            }
            Object html = attributes.getClass().getMethod("getText").invoke(attributes);
            if (!(html instanceof String)) {
                return false;
            }
            String text = SPACE.matcher(HTML_TAG.matcher((String) html).replaceAll("")).replaceAll(" ").trim();
            return text.length() <= MAX_PROMOTION_LENGTH && APP_PROMOTION.matcher(text).find();
        } catch (Throwable t) {
            return false;
        }
    }
}
