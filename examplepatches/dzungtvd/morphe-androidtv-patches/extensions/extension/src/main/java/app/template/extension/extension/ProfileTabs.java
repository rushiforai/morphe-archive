package app.template.extension.extension;

import android.util.Log;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/** Adds the Posts/Reposts tab bar and a synthetic cursor for the repost grid. */
@SuppressWarnings("unused")
public final class ProfileTabs {

    private static final String TAG = "TikTokTVProfile";
    private static final String FEED_ITEM_LIST = "com.ss.android.ugc.aweme.feed.model.FeedItemList";
    private static final String LIKED = "LIKED_VIDEOS";
    private static final long PAGE_SIZE = 20L;

    private ProfileTabs() {
    }

    /**
     * The tab bar's TextView click listener was a no-op, so a CENTER press only moved focus and
     * never switched the pane.
     */
    public static void onTabClick(View clicked) {
        if (clicked == null) return;
        try {
            View parent = clicked;
            while (parent != null
                    && !"com.ss.android.ugc.aweme.tv.profilev2.ui.otherprofile.ProfileTabBarView"
                    .equals(parent.getClass().getName())) {
                if (!(parent.getParent() instanceof View)) return;
                parent = (View) parent.getParent();
            }
            if (parent == null) return;

            Field tabsField = parent.getClass().getDeclaredField("e");
            tabsField.setAccessible(true);
            Object tabs = tabsField.get(parent);
            if (!(tabs instanceof List)) return;
            int index = ((List<?>) tabs).indexOf(clicked);
            if (index < 0) return;

            Field selected = parent.getClass().getDeclaredField("c");
            selected.setAccessible(true);
            selected.setInt(parent, index);

            Method select = parent.getClass().getDeclaredMethod("b", int.class);
            select.setAccessible(true);
            select.invoke(parent, index);
            // The focus path paints the selected label black after b(index); a click has no focus
            // change, so do it here or the white indicator hides a light-coloured label.
            ((android.widget.TextView) clicked).setTextColor(android.graphics.Color.BLACK);

            Field listenerField = parent.getClass().getDeclaredField("g");
            listenerField.setAccessible(true);
            Object listener = listenerField.get(parent);
            if (listener != null) {
                listener.getClass().getMethod("a", int.class).invoke(listener, index);
            }
            Log.i(TAG, "tab click -> " + index);
        } catch (Throwable failure) {
            Log.i(TAG, "tab click -> skipped " + failure.getClass().getSimpleName());
        }
    }

    /** Called at instruction 0 of ProfileVideoGridViewModelV2.a(FeedItemList). */
    public static void fixRepostCursor(Object viewModel, Object feedItemList) {
        if (viewModel == null || feedItemList == null) return;
        try {
            Field queryField = viewModel.getClass().getDeclaredField("j");
            queryField.setAccessible(true);
            Object query = queryField.get(viewModel);
            if (query == null) return;

            Method queryType = query.getClass().getMethod("getAwemeQueryType");
            Object type = queryType.invoke(query);
            if (type == null || !LIKED.equals(type.toString())) return;

            Field cursorField = viewModel.getClass().getDeclaredField("m");
            cursorField.setAccessible(true);
            long previous = cursorField.getLong(viewModel);

            Class<?> listType = Class.forName(FEED_ITEM_LIST);
            if (listType.getField("hasMore").getInt(feedItemList) != 1) return;

            Field maxCursor = listType.getField("maxCursor");
            // The liked-videos endpoint is real and returns its own max_cursor. Only the
            // repost endpoint lacks it; never overwrite a cursor that the server supplied.
            if (maxCursor.getLong(feedItemList) != 0L) {
                Log.i(TAG, "liked cursor -> " + maxCursor.getLong(feedItemList));
                return;
            }
            maxCursor.setLong(feedItemList, previous + PAGE_SIZE);
            Log.i(TAG, "repost cursor -> " + previous + " + " + PAGE_SIZE);
        } catch (Throwable failure) {
            Log.i(TAG, "repost cursor -> skipped " + failure.getClass().getSimpleName());
        }
    }
}
