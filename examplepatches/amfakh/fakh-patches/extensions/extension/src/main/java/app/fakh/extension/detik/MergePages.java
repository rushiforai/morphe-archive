package app.fakh.extension.detik;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Joins the pages of a multi-page article. The app receives every page in one response and only swaps the article body
 * when a page number is tapped, so the pages can be written one after the other into the body it renders.
 */
@SuppressWarnings("unused")
public final class MergePages {
    private MergePages() {
    }

    /**
     * Called instead of the app's body getter for a multi-page article: returns the first page followed by the others.
     * The first entry of the page list is skipped, since the app shows the article's own body as page one. A page that
     * repeats the cover image leaves it out, since the cover already sits above the article.
     */
    public static String body(Object article) throws ReflectiveOperationException {
        String description = (String) read(article, "description");
        String first = description == null || description.isEmpty() ? (String) read(article, "resume") : description;
        StringBuilder body = new StringBuilder(first == null ? "" : first);
        String cover = path((String) read(article, "imageURL"));
        List<?> pages = (List<?>) read(article, "pageItem");
        for (Object page : pages.subList(1, pages.size())) {
            String image = (String) read(page, "mStrImg");
            if (!image.isEmpty() && !path(image).equals(cover)) {
                body.append("<img src=\"").append(image).append("\" style=\"width:100%;height:auto\">");
                body.append(read(page, "mStrCaption"));
            }
            body.append(read(page, "mStrDesc"));
        }
        return body.toString();
    }

    /** Returns [url] without its query, which only sets the size the image is served in. */
    private static String path(String url) {
        int query = url.indexOf('?');
        return query < 0 ? url : url.substring(0, query);
    }

    /** Reads a public field of an app model; the models keep their field names. */
    private static Object read(Object model, String name) throws ReflectiveOperationException {
        Field field = model.getClass().getField(name);
        return field.get(model);
    }
}
