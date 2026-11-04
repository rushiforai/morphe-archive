package app.fakh.extension.cnn;

import android.view.View;
import android.view.ViewParent;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.regex.Pattern;

/**
 * Joins the pages of a multi-page article. The app receives every page in one response and only swaps the body when a
 * page number is tapped, so the pages can be written one after the other into the first page.
 */
@SuppressWarnings("unused")
public final class MergePages {
    /** The closing teaser of a page, such as "Simak ... di halaman berikutnya..", which makes no sense once pages are joined. */
    private static final Pattern NEXT_PAGE_TEASER =
        Pattern.compile("<p[^>]*>(?:(?!</p>).)*halaman berikutnya(?:(?!</p>).)*</p>", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

    private MergePages() {
    }

    /**
     * Replaces the page list with a single page: the first page followed by every other page, each with its own image
     * or video above it. The first page's image already sits in the article header, so it is left out.
     */
    public static void merge(ArrayList<String> pages, ArrayList<?> images) throws ReflectiveOperationException {
        StringBuilder body = new StringBuilder(teaserless(pages.get(0)));
        for (int i = 1; i < pages.size() && i < images.size(); i++) {
            Object image = images.get(i);
            String video = (String) call(image, "getVideoStory");
            String story = (String) call(image, "getStory");
            if (video != null && !video.isEmpty()) {
                body.append(video);
            } else if (story != null && !story.isEmpty()) {
                body.append("<img src=\"").append(story).append("\" style=\"width:100%;height:auto\">");
                String caption = (String) call(image, "getCaption");
                if (caption != null) {
                    body.append("<p><small>").append(caption).append("</small></p>");
                }
            }
            body.append(teaserless(pages.get(i)));
        }
        pages.clear();
        pages.add(body.toString());
    }

    /** Hides the page numbers and the next-page row, and shows the byline that the app keeps for the last page. */
    public static void finish(View root) {
        View title = root.findViewById(id(root, "multipage_container_title"));
        ViewParent row = title.getParent();
        ((View) row).setVisibility(View.GONE);
        root.findViewById(id(root, "content_editor_textview")).setVisibility(View.VISIBLE);
    }

    /** Returns [page] without its next-page teaser. */
    private static String teaserless(String page) {
        return NEXT_PAGE_TEASER.matcher(page).replaceAll("");
    }

    private static int id(View root, String name) {
        return root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
    }

    /** Calls a public no-argument getter of an app model. */
    private static Object call(Object model, String name) throws ReflectiveOperationException {
        Method method = model.getClass().getMethod(name);
        return method.invoke(model);
    }
}
