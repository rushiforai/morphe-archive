package app.czyeru.extension.tiktok.likes;

import android.view.View;

import app.czyeru.extension.shared.Logger;
import app.czyeru.extension.tiktok.search.ListSearch;
import app.czyeru.extension.tiktok.settings.Settings;

/**
 * Liked videos page (Profile > Liked) search bar.
 * <p>
 * Hooked from ProfileLikesAwemeListFragment. The grid adapter holds Aweme items, and Aweme and
 * User keep their real getter names, so the match reads them by reflection.
 */
@SuppressWarnings("unused")
public final class LikedVideosSearchPatch {
    private LikedVideosSearchPatch() {
    }

    /** End of ProfileLikesAwemeListFragment.onViewCreated, with the fragment root and its list. */
    public static void onViewCreated(View root, View recyclerView) {
        try {
            if (recyclerView == null || !Settings.LIKED_VIDEOS_SEARCH.get()) {
                return;
            }

            // TikTok finishes laying out the tab after onViewCreated. Post so this runs after it.
            // Auto-load: while a query is typed, the next pages load on their own, so every liked
            // video is searched without scrolling to the end first.
            // V2 (when included and on) also asks the server for each query.
            ListSearch.QueryListener serverSearch = LikedVideosServerSearch.isEnabled()
                    ? LikedVideosServerSearch::onQuery
                    : null;
            recyclerView.post(() -> ListSearch.installOverlay(
                    recyclerView,
                    root,
                    "Search liked videos",
                    LikedVideosSearchPatch::matches,
                    true,
                    serverSearch
            ));
        } catch (Throwable throwable) {
            Logger.printException(() -> "Liked videos search hook failed", throwable);
        }
    }

    /** Start of the profile grid adapter's onBindBasicViewHolder. */
    public static void onBind(Object adapter) {
        ListSearch.onBind(adapter);
    }

    /** Start of ProfileLikesAwemeListFragment.onResume. */
    public static void onResume(Object fragment) {
        ListSearch.onResume(fragment);
    }

    private static boolean matches(Object item, String query) {
        return ListSearch.awemeMatches(item, query);
    }
}
