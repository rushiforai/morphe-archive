package app.morphe.extension.shared.patches.flags;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * GMS Flags API client — stripped. No remote recommendations, no baseline presets.
 */
public final class GmsFlagsApiClient {

    public static final String API_BASE_URL = "https://api.polodarb.com/gmsflags/v1";
    public static final String CACHED_RECIPES_KEY = "_morphe_cached_live_recipes_json";

    private GmsFlagsApiClient() {}

    public interface SyncCallback {
        void onComplete(boolean success, int count);
    }

    public static class RecommendationRecipe {
        public final String id;
        public final String title;
        public final String description;
        public final String category;
        public final String supportStatus;
        public final String warningBlock;
        public final Map<String, Object> flags;

        public RecommendationRecipe(String id, String title, String description, String category,
                                    String supportStatus, String warningBlock, Map<String, Object> flags) {
            this.id = id;
            this.title = title;
            this.description = description;
            this.category = category;
            this.supportStatus = supportStatus;
            this.warningBlock = warningBlock;
            this.flags = flags;
        }
    }

    /** Stripped — returns empty list, no baseline presets. */
    public static List<RecommendationRecipe> getBaselineRecipes() {
        return new ArrayList<>();
    }

    /** Stripped — returns empty list, no cache or API call. */
    public static List<RecommendationRecipe> loadCachedRecipes(SharedPreferences prefs) {
        return Collections.emptyList();
    }

    /** Stripped — no-op, does not call api.polodarb.com. */
    public static void syncLiveRecommendations(Context context, SharedPreferences prefs, SyncCallback callback) {
        if (callback != null) callback.onComplete(false, 0);
    }
}
