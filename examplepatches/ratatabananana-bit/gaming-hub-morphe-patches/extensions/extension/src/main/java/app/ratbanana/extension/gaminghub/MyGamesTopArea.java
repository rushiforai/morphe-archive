package app.ratbanana.extension.gaminghub;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * Controls the top section of My games, which shows either Instant Plays history
 * or recently played games.
 */
@SuppressWarnings("unused")
public final class MyGamesTopArea {

    /**
     * One UI's collapsing app bar reserves an empty expanded title area behind the section.
     * It is taller than the Library header alone, so once the section is hidden it would
     * leave an empty strip below the header.
     */
    private static final String EXPANDED_TITLE_AREA_ID = "collapsing_appbar_title_layout_parent";

    private static final String LIBRARY_HEADER_ID = "library_header_container";
    private static final String COLLAPSING_APP_BAR_ID = "collapsing_toolbar_layout";

    /** Marks an app bar that already keeps the Library header filled. Any stable unique key works. */
    private static final int LIBRARY_HEADER_FILL_TAG_KEY = 0x7f5a_0001;

    /** How many parents up to search for the collapsing app bar. */
    private static final int MAX_ANCESTOR_DEPTH = 6;

    private MyGamesTopArea() {
    }

    /**
     * Injection point. Hides the section while it shows Instant Plays history.
     *
     * @param title Title view of the section.
     */
    public static void hide(View title) {
        setSectionVisibility(title, View.GONE);
    }

    /**
     * Injection point. Shows the section again while it shows recently played games.
     *
     * @param title Title view of the section.
     */
    public static void show(View title) {
        setSectionVisibility(title, View.VISIBLE);
    }

    private static void setSectionVisibility(View title, int visibility) {
        if (title == null) {
            return;
        }

        ViewParent section = title.getParent();
        if (!(section instanceof View)) {
            return;
        }
        ((View) section).setVisibility(visibility);

        // The expanded title area is always empty here, so it only ever adds blank space.
        View expandedTitleArea = findInAncestors((View) section, EXPANDED_TITLE_AREA_ID);
        if (expandedTitleArea != null) {
            expandedTitleArea.setVisibility(visibility == View.GONE ? View.GONE : View.VISIBLE);
        }

        if (visibility == View.GONE) {
            fillAppBarWithLibraryHeader((View) section);
        }
    }

    /**
     * The collapsing app bar keeps a minimum height that the Library header alone does not reach.
     * Stretch the header to the app bar height, so it joins the game list without an empty strip.
     */
    private static void fillAppBarWithLibraryHeader(View section) {
        View header = findInAncestors(section, LIBRARY_HEADER_ID);
        View appBar = findInAncestors(section, COLLAPSING_APP_BAR_ID);
        if (header == null || appBar == null) {
            return;
        }

        if (appBar.getTag(LIBRARY_HEADER_FILL_TAG_KEY) != null) {
            return;
        }
        appBar.setTag(LIBRARY_HEADER_FILL_TAG_KEY, Boolean.TRUE);

        // Layout settles over several passes, so keep checking; once filled, the gap is zero
        // and nothing changes anymore.
        appBar.addOnLayoutChangeListener((view, left, top, right, bottom,
                                          oldLeft, oldTop, oldRight, oldBottom) -> {
            if (header.getVisibility() != View.VISIBLE || header.getHeight() == 0) {
                return;
            }
            int gap = view.getHeight() - bottomRelativeTo(header, view);
            if (gap > 0) {
                int filledHeight = header.getHeight() + gap;
                header.post(() -> {
                    ViewGroup.LayoutParams params = header.getLayoutParams();
                    params.height = filledHeight;
                    header.setLayoutParams(params);
                });
            }
        });
        appBar.requestLayout();
    }

    private static int bottomRelativeTo(View view, View ancestor) {
        int bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while (parent instanceof View && parent != ancestor) {
            bottom += ((View) parent).getTop();
            parent = parent.getParent();
        }
        return bottom;
    }

    /** Finds a view by id name in the closest ancestor that contains it. */
    private static View findInAncestors(View start, String idName) {
        Context context = start.getContext();
        int id = context.getResources().getIdentifier(idName, "id", context.getPackageName());
        if (id == 0) {
            return null;
        }

        ViewParent parent = start.getParent();
        for (int depth = 0; depth < MAX_ANCESTOR_DEPTH && parent instanceof ViewGroup; depth++) {
            View found = ((ViewGroup) parent).findViewById(id);
            if (found != null) {
                return found;
            }
            parent = parent.getParent();
        }
        return null;
    }
}
