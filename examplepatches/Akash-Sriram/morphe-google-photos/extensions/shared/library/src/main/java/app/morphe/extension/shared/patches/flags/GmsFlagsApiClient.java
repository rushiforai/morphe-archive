package app.morphe.extension.shared.patches.flags;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;

/**
 * Robust, dedicated REST client for GMS Flags 2.0 API (api.polodarb.com).
 */
public final class GmsFlagsApiClient {

    public static final String API_BASE_URL = "https://api.polodarb.com/gmsflags/v1";
    public static final String CACHED_RECIPES_KEY = "_morphe_cached_live_recipes_json";

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

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

        public JSONObject toJson() {
            try {
                JSONObject obj = new JSONObject();
                obj.put("id", id);
                obj.put("title", title);
                obj.put("description", description);
                obj.put("category", category);
                obj.put("supportStatus", supportStatus);
                obj.put("warningBlock", warningBlock);
                JSONObject flagMap = new JSONObject();
                for (Map.Entry<String, Object> entry : flags.entrySet()) {
                    flagMap.put(entry.getKey(), entry.getValue());
                }
                obj.put("flags", flagMap);
                return obj;
            } catch (Exception e) {
                return null;
            }
        }

        public static RecommendationRecipe fromJson(JSONObject obj) {
            try {
                String id = obj.optString("id");
                String title = obj.optString("title");
                String description = obj.isNull("description") ? null : obj.optString("description");
                String category = obj.optString("category", "General");
                String supportStatus = obj.optString("supportStatus", "VERIFIED");
                String warningBlock = obj.isNull("warningBlock") ? null : obj.optString("warningBlock");
                Map<String, Object> flags = new LinkedHashMap<>();
                JSONObject flagMap = obj.optJSONObject("flags");
                if (flagMap != null) {
                    Iterator<String> it = flagMap.keys();
                    while (it.hasNext()) {
                        String k = it.next();
                        flags.put(k, flagMap.get(k));
                    }
                }
                return new RecommendationRecipe(id, title, description, category, supportStatus, warningBlock, flags);
            } catch (Exception e) {
                return null;
            }
        }
    }

    public static List<RecommendationRecipe> getBaselineRecipes() {
        List<RecommendationRecipe> list = new ArrayList<>();

        Map<String, Object> tapFlags = new LinkedHashMap<>();
        tapFlags.put("45705305", true);
        list.add(new RecommendationRecipe("18", "Adds \"Tap, circle or brush to select\" and edit feature",
                "Adds gesture-based subject selection in the photo editor.", "Photo Editor", "VERIFIED", null, tapFlags));

        Map<String, Object> aiEnhanceFlags = new LinkedHashMap<>();
        aiEnhanceFlags.put("45683689", true);
        list.add(new RecommendationRecipe("19", "Enable \"AI Enhance\" V2",
                "Replaces Dynamic edit preset with AI Enhance I & II options.", "Photo Editor", "VERIFIED", null, aiEnhanceFlags));

        Map<String, Object> onDeviceFlags = new LinkedHashMap<>();
        onDeviceFlags.put("45753590", true);
        list.add(new RecommendationRecipe("20", "Adds \"On this device\" button to top bar",
                "Adds a quick filter button on the top bar to view only media saved locally.", "Top Bar", "VERIFIED", null, onDeviceFlags));

        Map<String, Object> askPhotoFlags = new LinkedHashMap<>();
        askPhotoFlags.put("45724258", true);
        list.add(new RecommendationRecipe("26", "Enable \"Ask Photo\" feature",
                "Conversational Gemini AI summary and query in Photos.", "AI Assistant", "VERIFIED", "Available in selected countries", askPhotoFlags));

        Map<String, Object> moodsFlags = new LinkedHashMap<>();
        moodsFlags.put("45797840", true);
        list.add(new RecommendationRecipe("14", "Enable \"Moods\" feature",
                "Adaptive edit presets in Create tab with strength slider.", "Photo Editor", "PARTIAL", null, moodsFlags));

        Map<String, Object> collectionFlags = new LinkedHashMap<>();
        collectionFlags.put("45802110", 2L);
        collectionFlags.put("45762698", 2L);
        list.add(new RecommendationRecipe("10", "Collection tab redesign",
                "Modern grouped collections interface replacing legacy Library tab.", "Navigation & Tabs", "EXPERIMENTAL", "If Photos crashes on launch, toggle off", collectionFlags));

        Map<String, Object> videosFlags = new LinkedHashMap<>();
        videosFlags.put("45752831", true);
        videosFlags.put("45754546", true);
        list.add(new RecommendationRecipe("12", "New \"Videos\" tab with Reels-style feed",
                "Adds a dedicated full-screen, vertically scrollable video feed.", "Navigation & Tabs", "EXPERIMENTAL", "Replaces Create tab", videosFlags));

        return list;
    }

    public static List<RecommendationRecipe> loadCachedRecipes(SharedPreferences prefs) {
        if (prefs == null) return getBaselineRecipes();
        try {
            String jsonStr = prefs.getString(CACHED_RECIPES_KEY, null);
            if (jsonStr != null && !jsonStr.isEmpty()) {
                JSONArray arr = new JSONArray(jsonStr);
                List<RecommendationRecipe> loaded = new ArrayList<>();
                for (int i = 0; i < arr.length(); i++) {
                    RecommendationRecipe r = RecommendationRecipe.fromJson(arr.getJSONObject(i));
                    if (r != null) loaded.add(r);
                }
                if (!loaded.isEmpty()) return loaded;
            }
        } catch (Exception e) {
            Logger.printException(() -> "Error reading cached recipes", e);
        }
        return getBaselineRecipes();
    }

    public static void syncLiveRecommendations(Context context, SharedPreferences prefs, SyncCallback callback) {
        EXECUTOR.execute(() -> {
            try {
                String feedJson = fetchHttp(API_BASE_URL + "/apps/com.google.android.apps.photos/recommendations");
                if (feedJson == null || feedJson.isEmpty()) {
                    notifyCallback(callback, false, 0);
                    return;
                }

                JSONArray feedArr = new JSONArray(feedJson);
                List<RecommendationRecipe> freshList = new ArrayList<>();

                for (int i = 0; i < feedArr.length(); i++) {
                    JSONObject item = feedArr.getJSONObject(i);
                    long id = item.optLong("id");
                    String title = item.optString("title");
                    String description = item.isNull("description") ? null : item.optString("description");
                    String status = item.optString("support_status", "VERIFIED");
                    String warning = null;
                    if (!item.isNull("warning_block")) {
                        warning = item.optJSONObject("warning_block").optString("message");
                    }

                    String category = "General";
                    String lTitle = title.toLowerCase();
                    if (lTitle.contains("select") || lTitle.contains("enhance") || lTitle.contains("edit") || lTitle.contains("moods")) category = "Photo Editor";
                    else if (lTitle.contains("bar") || lTitle.contains("top")) category = "Top Bar";
                    else if (lTitle.contains("ask") || lTitle.contains("ai")) category = "AI Assistant";
                    else if (lTitle.contains("tab") || lTitle.contains("collection") || lTitle.contains("video")) category = "Navigation & Tabs";

                    // Fetch flag detail
                    String detailJson = fetchHttp(API_BASE_URL + "/recommendations/" + id);
                    Map<String, Object> flagMap = new LinkedHashMap<>();

                    if (detailJson != null && !detailJson.isEmpty()) {
                        JSONObject dObj = new JSONObject(detailJson);
                        JSONArray variants = dObj.optJSONArray("variants");
                        if (variants != null) {
                            for (int v = 0; v < variants.length(); v++) {
                                JSONArray flags = variants.getJSONObject(v).optJSONArray("flags");
                                if (flags != null) {
                                    for (int f = 0; f < flags.length(); f++) {
                                        JSONObject flag = flags.getJSONObject(f);
                                        String fName = flag.optString("flag_name");
                                        String fType = flag.optString("value_type", "BOOL").toUpperCase();
                                        String fVal = flag.optString("value", "true");

                                        if (fType.contains("BOOL")) {
                                            flagMap.put(fName, Boolean.parseBoolean(fVal));
                                        } else if (fType.contains("INT") || fType.contains("LONG")) {
                                            try { flagMap.put(fName, Long.parseLong(fVal)); }
                                            catch (Exception ex) { flagMap.put(fName, 1L); }
                                        } else if (fType.contains("FLOAT") || fType.contains("DOUBLE")) {
                                            try { flagMap.put(fName, Float.parseFloat(fVal)); }
                                            catch (Exception ex) { flagMap.put(fName, 1.0f); }
                                        } else {
                                            flagMap.put(fName, fVal);
                                        }
                                    }
                                }
                            }
                        }
                    }

                    if (!flagMap.isEmpty()) {
                        freshList.add(new RecommendationRecipe(String.valueOf(id), title, description, category, status, warning, flagMap));
                    }
                }

                if (!freshList.isEmpty()) {
                    JSONArray cacheArr = new JSONArray();
                    for (RecommendationRecipe r : freshList) {
                        JSONObject rObj = r.toJson();
                        if (rObj != null) cacheArr.put(rObj);
                    }
                    if (prefs != null) {
                        prefs.edit().putString(CACHED_RECIPES_KEY, cacheArr.toString()).apply();
                    }
                    Logger.printInfo(() -> "Synced " + freshList.size() + " live recipes from api.polodarb.com");
                    notifyCallback(callback, true, freshList.size());
                    return;
                }
            } catch (Exception e) {
                Logger.printException(() -> "Error syncing from api.polodarb.com", e);
            }
            notifyCallback(callback, false, 0);
        });
    }

    private static String fetchHttp(String urlStr) {
        try {
            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(8000);
            conn.setReadTimeout(8000);
            conn.setRequestProperty("User-Agent", "Morphe-GooglePhotos-FlagManager/2.0");
            conn.setRequestProperty("Accept", "application/json");
            if (conn.getResponseCode() == 200) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    sb.append(line).append('\n');
                }
                br.close();
                return sb.toString();
            }
        } catch (Exception e) {
            Logger.printException(() -> "HTTP fetch failed: " + urlStr, e);
        }
        return null;
    }

    private static void notifyCallback(SyncCallback callback, boolean success, int count) {
        if (callback != null) {
            MAIN_HANDLER.post(() -> callback.onComplete(success, count));
        }
    }
}
