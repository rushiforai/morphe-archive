package app.morphe.extension.shared.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;

import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import app.morphe.extension.shared.Logger;

/**
 * Inbuilt Phenotype Style & Flag Manager for Google Photos (Non-Root).
 * Directly connected to GMS Flags 2.0 Cloud API (https://api.polodarb.com/gmsflags/v1)
 * with instant offline fallback, local caching, and live background synchronization.
 */
public class PhenotypeFlagManager {

    private static final String PREF_NAME = "com.google.android.apps.photos.phenotype";
    private static final String MORPHE_SETTINGS_PILL_TAG = "morphe_phenotype_settings_pill";
    public static final String SEEDED_MARKER = "_morphe_flags_seeded";
    private static final String CACHED_RECIPES_KEY = "_morphe_cached_live_recipes_json";
    private static final String API_BASE_URL = "https://api.polodarb.com/gmsflags/v1";

    // Material 3 Palette (GMS Flags 2.0 Theme)
    private static final int M3_BG = 0xFFF8F9FA;
    private static final int M3_SURFACE = 0xFFFFFFFF;
    private static final int M3_CARD_BG = 0xFFEEF3F2;
    private static final int M3_PRIMARY = 0xFF006A60;
    private static final int M3_PRIMARY_CONTAINER = 0xFF70F7E5;
    private static final int M3_ON_PRIMARY = 0xFFFFFFFF;
    private static final int M3_TEXT_PRIMARY = 0xFF191C1E;
    private static final int M3_TEXT_SECONDARY = 0xFF44474E;
    private static final int M3_CHIP_INACTIVE = 0xFFE1E8E7;
    private static final int M3_BORDER = 0xFFDCE4E3;
    private static final int M3_DANGER = 0xFFBA1A1A;
    private static final int M3_DANGER_BG = 0xFFFFDAD6;

    // Filter Tab Modes
    private static final int TAB_SUGGESTIONS = 0;
    private static final int TAB_ALL = 1;

    // ─────────────────────────────────────────────────────────────────────────
    // Dynamic Feature Recipe Model
    // ─────────────────────────────────────────────────────────────────────────

    public static class FeatureRecipe {
        public final String id;
        public final String title;
        public final String description;
        public final String category;
        public final String supportStatus;
        public final String warningBlock;
        public final Map<String, Object> flags;

        public FeatureRecipe(String id, String title, String description, String category,
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

        public static FeatureRecipe fromJson(JSONObject obj) {
            try {
                String id = obj.optString("id");
                String title = obj.optString("title");
                String description = obj.isNull("description") ? null : obj.optString("description");
                String category = obj.optString("category", "General");
                String supportStatus = obj.optString("supportStatus", "Verified");
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
                return new FeatureRecipe(id, title, description, category, supportStatus, warningBlock, flags);
            } catch (Exception e) {
                return null;
            }
        }
    }

    private static final List<FeatureRecipe> CURATED_RECIPES = Collections.synchronizedList(new ArrayList<>());

    static {
        // Initial Baseline Offline Recipes (Instant Load)
        loadDefaultBaselineRecipes();
    }

    private static void loadDefaultBaselineRecipes() {
        CURATED_RECIPES.clear();

        // 1. Tap, circle or brush to select (Verified)
        Map<String, Object> tapFlags = new LinkedHashMap<>();
        tapFlags.put("45705305", true);
        CURATED_RECIPES.add(new FeatureRecipe(
                "tap_circle_select",
                "Adds \"Tap, circle or brush to select\" and edit feature",
                "Adds gesture-based subject selection (tap, circle or brush) in the photo editor.",
                "Editor",
                "Verified",
                null,
                tapFlags
        ));

        // 2. Enable \"AI Enhance\" V2 (Verified)
        Map<String, Object> aiEnhanceFlags = new LinkedHashMap<>();
        aiEnhanceFlags.put("45683689", true);
        CURATED_RECIPES.add(new FeatureRecipe(
                "ai_enhance_v2",
                "Enable \"AI Enhance\" V2",
                "Replaces the Dynamic edit preset with AI Enhance I, and adds AI Enhance II that shows multiple editing options.",
                "Editor",
                "Verified",
                null,
                aiEnhanceFlags
        ));

        // 3. Adds \"On this device\" button to top bar (Verified)
        Map<String, Object> onDeviceFlags = new LinkedHashMap<>();
        onDeviceFlags.put("45753590", true);
        CURATED_RECIPES.add(new FeatureRecipe(
                "on_this_device",
                "Adds \"On this device\" button to the top bar",
                "Adds a quick filter button on the top bar to easily view only media saved on this device.",
                "Top Bar",
                "Verified",
                null,
                onDeviceFlags
        ));

        // 4. Enable \"Ask Photo\" feature (Verified, Warning)
        Map<String, Object> askPhotoFlags = new LinkedHashMap<>();
        askPhotoFlags.put("45724258", true);
        CURATED_RECIPES.add(new FeatureRecipe(
                "ask_photo",
                "Enable \"Ask Photo\" feature",
                "Ask Photo shows you a brief AI summary and conversational query of the photo.",
                "AI Assistant",
                "Verified",
                "Available in a limited number of countries",
                askPhotoFlags
        ));

        // 5. Enable \"Moods\" feature (Partially supported)
        Map<String, Object> moodsFlags = new LinkedHashMap<>();
        moodsFlags.put("45797840", true);
        CURATED_RECIPES.add(new FeatureRecipe(
                "moods_feature",
                "Enable \"Moods\" feature",
                "Adds \"Moods\" to the Create tab - adaptive edit presets (Airy minimalist, Crisp 35mm, 2000's cinema...) that adjust to your photo, with strength slider and hold-to-compare.",
                "Create",
                "Partially supported",
                null,
                moodsFlags
        ));

        // 6. Collection tab redesign (Experimental, Warning)
        Map<String, Object> collectionFlags = new LinkedHashMap<>();
        collectionFlags.put("45802110", 2L);
        collectionFlags.put("45762698", 2L);
        CURATED_RECIPES.add(new FeatureRecipe(
                "collection_tab_redesign",
                "Collection tab redesign",
                "Modern grouped collections interface replacing the legacy Library tab.",
                "Navigation",
                "Experimental",
                "For some users this flag may cause Google Photos to crash! If this happens to you, disable this toggle and restart.",
                collectionFlags
        ));

        // 7. New \"Videos\" tab with a Reels-style feed (Experimental, Warning)
        Map<String, Object> videosFlags = new LinkedHashMap<>();
        videosFlags.put("45752831", true);
        videosFlags.put("45754546", true);
        CURATED_RECIPES.add(new FeatureRecipe(
                "videos_reels_tab",
                "New \"Videos\" tab with a Reels-style feed",
                "Adds a new \"Videos\" tab with a full-screen, vertically scrollable feed.",
                "Navigation",
                "Experimental",
                "Replaces the \"Create\" tab in the bottom bar",
                videosFlags
        ));

        // 8. Styles in Memories & Graphic Cutouts (Verified)
        Map<String, Object> memoryStylesFlags = new LinkedHashMap<>();
        memoryStylesFlags.put("45477626", true);
        memoryStylesFlags.put("45659276", true);
        memoryStylesFlags.put("3999", 120480972L);
        memoryStylesFlags.put("45662994", true);
        memoryStylesFlags.put("45785531", true);
        memoryStylesFlags.put("45741031", true);
        memoryStylesFlags.put("45737826", true);
        memoryStylesFlags.put("45764779", true);
        memoryStylesFlags.put("45659278", true);
        CURATED_RECIPES.add(new FeatureRecipe(
                "memory_styles_cutouts",
                "Styles in Memories (Graphic Cutouts & Typography)",
                "Enables Skottie GPU-rendered graphic memory templates, stylized scrapbook borders, and dynamic typography number cutouts (e.g. 7 years ago).",
                "Memories",
                "Verified",
                null,
                memoryStylesFlags
        ));
    }

    public static SharedPreferences getPrefs(Context context) {
        return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Live Cloud API Sync Engine (https://api.polodarb.com/gmsflags/v1)
    // ─────────────────────────────────────────────────────────────────────────

    public interface SyncCallback {
        void onComplete(boolean success, int count);
    }

    private static void loadCachedRecipes(Context context) {
        try {
            SharedPreferences prefs = getPrefs(context);
            String cachedJson = prefs.getString(CACHED_RECIPES_KEY, null);
            if (cachedJson != null && !cachedJson.isEmpty()) {
                JSONArray arr = new JSONArray(cachedJson);
                if (arr.length() > 0) {
                    List<FeatureRecipe> loaded = new ArrayList<>();
                    for (int i = 0; i < arr.length(); i++) {
                        FeatureRecipe r = FeatureRecipe.fromJson(arr.getJSONObject(i));
                        if (r != null) loaded.add(r);
                    }
                    if (!loaded.isEmpty()) {
                        synchronized (CURATED_RECIPES) {
                            CURATED_RECIPES.clear();
                            CURATED_RECIPES.addAll(loaded);
                        }
                    }
                }
            }
        } catch (Exception e) {
            Logger.printException(() -> "Error loading cached recipes", e);
        }
    }

    public static void syncLiveRecommendations(Context context, SyncCallback callback) {
        Executors.newSingleThreadExecutor().execute(() -> {
            try {
                String feedJson = fetchHttp(API_BASE_URL + "/apps/com.google.android.apps.photos/recommendations");
                if (feedJson == null || feedJson.isEmpty()) {
                    if (callback != null) callback.onComplete(false, 0);
                    return;
                }

                JSONArray feedArr = new JSONArray(feedJson);
                List<FeatureRecipe> freshList = new ArrayList<>();

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

                    // Categorize based on title
                    String category = "General";
                    String lTitle = title.toLowerCase();
                    if (lTitle.contains("select") || lTitle.contains("enhance") || lTitle.contains("edit")) category = "Editor";
                    else if (lTitle.contains("bar") || lTitle.contains("top")) category = "Top Bar";
                    else if (lTitle.contains("ask") || lTitle.contains("ai")) category = "AI Assistant";
                    else if (lTitle.contains("moods") || lTitle.contains("preset")) category = "Create";
                    else if (lTitle.contains("tab") || lTitle.contains("collection") || lTitle.contains("video")) category = "Navigation";

                    // Fetch details for flags
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
                        freshList.add(new FeatureRecipe(String.valueOf(id), title, description, category, status, warning, flagMap));
                    }
                }

                if (!freshList.isEmpty()) {
                    synchronized (CURATED_RECIPES) {
                        CURATED_RECIPES.clear();
                        CURATED_RECIPES.addAll(freshList);
                    }

                    // Cache locally
                    JSONArray cacheArr = new JSONArray();
                    for (FeatureRecipe r : freshList) {
                        JSONObject rObj = r.toJson();
                        if (rObj != null) cacheArr.put(rObj);
                    }
                    getPrefs(context).edit().putString(CACHED_RECIPES_KEY, cacheArr.toString()).apply();

                    if (callback != null) callback.onComplete(true, freshList.size());
                    return;
                }
            } catch (Exception e) {
                Logger.printException(() -> "Error syncing from GMS Flags API", e);
            }
            if (callback != null) callback.onComplete(false, 0);
        });
    }

    private static String fetchHttp(String urlStr) {
        try {
            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(6000);
            conn.setReadTimeout(6000);
            conn.setRequestProperty("User-Agent", "Morphe-GooglePhotos-FlagManager/2.0");
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

    // ─────────────────────────────────────────────────────────────────────────
    // Inbuilt Settings Preference Injection (Sleek Floating Bottom Pill)
    // ─────────────────────────────────────────────────────────────────────────

    public static void injectSettingsCard(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        activity.runOnUiThread(() -> {
            try {
                View decor = activity.getWindow().getDecorView();
                decor.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                    @Override
                    public void onGlobalLayout() {
                        try {
                            FrameLayout content = activity.findViewById(android.R.id.content);
                            if (content != null && content.findViewWithTag(MORPHE_SETTINGS_PILL_TAG) == null) {
                                LinearLayout pill = createFloatingPill(activity);
                                content.addView(pill);
                                Logger.printInfo(() -> "Morphe Inbuilt Style Manager pill attached to SettingsActivity");
                            }
                        } catch (Exception e) {
                            Logger.printException(() -> "Could not attach Morphe pill in SettingsActivity", e);
                        }
                    }
                });
            } catch (Exception e) {
                Logger.printException(() -> "Error registering layout listener for SettingsActivity", e);
            }
        });
    }

    private static LinearLayout createFloatingPill(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout pill = new LinearLayout(activity);
        pill.setTag(MORPHE_SETTINGS_PILL_TAG);
        pill.setOrientation(LinearLayout.HORIZONTAL);
        pill.setGravity(Gravity.CENTER_VERTICAL);
        pill.setClickable(true);
        pill.setFocusable(true);
        pill.setElevation(12f);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        params.setMargins(0, 0, 0, (int) (28 * density));
        pill.setLayoutParams(params);

        int padH = (int) (20 * density);
        int padV = (int) (12 * density);
        pill.setPadding(padH, padV, padH, padV);

        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setCornerRadius(28 * density);
        bg.setColor(M3_PRIMARY);
        pill.setBackground(bg);

        TextView icon = new TextView(activity);
        icon.setText("✨");
        icon.setTextSize(16);
        icon.setPadding(0, 0, (int) (8 * density), 0);
        pill.addView(icon);

        TextView label = new TextView(activity);
        label.setText("Photos Flags & Styles");
        label.setTextSize(14);
        label.setTextColor(0xFFFFFFFF);
        label.setTypeface(null, Typeface.BOLD);
        pill.addView(label);

        pill.setOnClickListener(v -> show(activity));
        return pill;
    }

    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        activity.runOnUiThread(() -> {
            try {
                showInbuiltManagerScreen(activity);
            } catch (Throwable t) {
                Logger.printException(() -> "Could not open PhenotypeFlagManager", t);
                Toast.makeText(activity, "Error opening Style Manager: " + t.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }

    private static void showInbuiltManagerScreen(Activity activity) {
        // First load any cached live recipes
        loadCachedRecipes(activity);

        SharedPreferences prefs = getPrefs(activity);
        float density = activity.getResources().getDisplayMetrics().density;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(activity, M3_BG, 24));
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            root.setClipToOutline(true);
        }
        root.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // 1. Top App Bar (Photos  🔍  ➕  ⋮  ✕)
        LinearLayout topBar = new LinearLayout(activity);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        int topBarPadH = (int) (18 * density);
        int topBarPadV = (int) (14 * density);
        topBar.setPadding(topBarPadH, topBarPadV, topBarPadH, topBarPadV);
        topBar.setBackgroundColor(M3_SURFACE);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Photos Flags");
        tvTitle.setTextSize(18);
        tvTitle.setTextColor(M3_TEXT_PRIMARY);
        tvTitle.setTypeface(null, Typeface.BOLD);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tvTitle.setLayoutParams(titleLp);
        topBar.addView(tvTitle);

        TextView btnSearchToggle = new TextView(activity);
        btnSearchToggle.setText("🔍");
        btnSearchToggle.setTextSize(17);
        btnSearchToggle.setPadding((int) (6 * density), 0, (int) (6 * density), 0);
        topBar.addView(btnSearchToggle);

        TextView btnAddFlag = new TextView(activity);
        btnAddFlag.setText("➕");
        btnAddFlag.setTextSize(17);
        btnAddFlag.setPadding((int) (6 * density), 0, (int) (6 * density), 0);
        topBar.addView(btnAddFlag);

        TextView btnMenu = new TextView(activity);
        btnMenu.setText("⋮");
        btnMenu.setTextSize(20);
        btnMenu.setTextColor(M3_TEXT_PRIMARY);
        btnMenu.setTypeface(null, Typeface.BOLD);
        btnMenu.setPadding((int) (6 * density), 0, (int) (6 * density), 0);
        topBar.addView(btnMenu);

        TextView btnClose = new TextView(activity);
        btnClose.setText("✕");
        btnClose.setTextSize(18);
        btnClose.setTextColor(M3_TEXT_SECONDARY);
        btnClose.setTypeface(null, Typeface.BOLD);
        btnClose.setPadding((int) (8 * density), 0, 0, 0);
        btnClose.setOnClickListener(v -> dialog.dismiss());
        topBar.addView(btnClose);

        root.addView(topBar);

        // 2. Search Bar
        LinearLayout searchBox = new LinearLayout(activity);
        searchBox.setOrientation(LinearLayout.HORIZONTAL);
        searchBox.setGravity(Gravity.CENTER_VERTICAL);
        searchBox.setPadding((int) (16 * density), (int) (8 * density), (int) (16 * density), (int) (8 * density));
        searchBox.setBackgroundColor(M3_SURFACE);
        searchBox.setVisibility(View.GONE);

        EditText etSearch = new EditText(activity);
        etSearch.setHint("Search features, flag keys or values...");
        etSearch.setTextSize(14);
        etSearch.setTextColor(M3_TEXT_PRIMARY);
        etSearch.setHintTextColor(M3_TEXT_SECONDARY);
        etSearch.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 12));
        int sPad = (int) (10 * density);
        etSearch.setPadding(sPad, sPad, sPad, sPad);
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        etSearch.setLayoutParams(sLp);
        searchBox.addView(etSearch);
        root.addView(searchBox);

        btnSearchToggle.setOnClickListener(v -> {
            if (searchBox.getVisibility() == View.VISIBLE) {
                searchBox.setVisibility(View.GONE);
                etSearch.setText("");
            } else {
                searchBox.setVisibility(View.VISIBLE);
                etSearch.requestFocus();
            }
        });

        // 3. M3 Filter Tabs (Suggestions | All)
        LinearLayout chipRow = new LinearLayout(activity);
        chipRow.setOrientation(LinearLayout.HORIZONTAL);
        chipRow.setPadding((int) (16 * density), (int) (10 * density), (int) (16 * density), (int) (8 * density));
        root.addView(chipRow);

        final int[] activeTab = new int[] { TAB_SUGGESTIONS };
        final int PAGE_SIZE = 50;
        final int[] displayedCount = new int[] { PAGE_SIZE };
        final Button[] tabButtons = new Button[2];
        final String[] tabLabels = new String[] { "Suggestions", "All" };

        for (int i = 0; i < 2; i++) {
            Button chip = new Button(activity);
            chip.setText(tabLabels[i]);
            chip.setTextSize(13);
            chip.setTypeface(null, Typeface.BOLD);
            int cPadH = (int) (16 * density);
            int cPadV = (int) (8 * density);
            chip.setPadding(cPadH, cPadV, cPadH, cPadV);
            LinearLayout.LayoutParams chipLp = new LinearLayout.LayoutParams(0, (int) (40 * density), 1f);
            if (i == 0) {
                chipLp.setMargins(0, 0, (int) (4 * density), 0);
            } else {
                chipLp.setMargins((int) (4 * density), 0, 0, 0);
            }
            chip.setLayoutParams(chipLp);
            tabButtons[i] = chip;
            chipRow.addView(chip);
        }

        // 4. Scrollable Content Area
        ScrollView contentScroll = new ScrollView(activity);
        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        contentScroll.setLayoutParams(scrollLp);

        LinearLayout listContainer = new LinearLayout(activity);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        int listPad = (int) (16 * density);
        listContainer.setPadding(listPad, (int) (4 * density), listPad, (int) (16 * density));
        contentScroll.addView(listContainer);
        root.addView(contentScroll);

        // 5. Bottom Action Dock (Clean Full-Width Apply & Restart)
        LinearLayout bottomDock = new LinearLayout(activity);
        bottomDock.setOrientation(LinearLayout.VERTICAL);
        bottomDock.setGravity(Gravity.CENTER);
        int dockPadH = (int) (16 * density);
        int dockPadV = (int) (12 * density);
        bottomDock.setPadding(dockPadH, dockPadV, dockPadH, dockPadV);
        bottomDock.setBackgroundColor(M3_SURFACE);
        bottomDock.setElevation(8f);

        Button btnApply = new Button(activity);
        btnApply.setText("⚡ Apply & Restart");
        btnApply.setTextSize(14);
        btnApply.setTypeface(null, Typeface.BOLD);
        btnApply.setTextColor(M3_ON_PRIMARY);
        btnApply.setBackground(createRoundedDrawable(activity, M3_PRIMARY, 24));
        LinearLayout.LayoutParams applyLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, (int) (48 * density));
        btnApply.setLayoutParams(applyLp);
        btnApply.setOnClickListener(v -> {
            dialog.dismiss();
            restartApp(activity);
        });
        bottomDock.addView(btnApply);
        root.addView(bottomDock);

        // UI Render Logic
        Runnable[] refreshHolder = new Runnable[1];
        Runnable refreshUi = () -> {
            listContainer.removeAllViews();
            String query = etSearch.getText().toString().toLowerCase().trim();
            Map<String, ?> all = prefs.getAll();

            for (int i = 0; i < 2; i++) {
                boolean isSelected = (i == activeTab[0]);
                tabButtons[i].setTextColor(isSelected ? M3_ON_PRIMARY : M3_TEXT_SECONDARY);
                tabButtons[i].setBackground(createRoundedDrawable(activity, isSelected ? M3_PRIMARY : M3_CHIP_INACTIVE, 18));
            }

            if (activeTab[0] == TAB_SUGGESTIONS) {
                int matched = 0;
                List<FeatureRecipe> recipesCopy;
                synchronized (CURATED_RECIPES) {
                    recipesCopy = new ArrayList<>(CURATED_RECIPES);
                }

                for (FeatureRecipe recipe : recipesCopy) {
                    if (!query.isEmpty() &&
                        !recipe.title.toLowerCase().contains(query) &&
                        (recipe.description == null || !recipe.description.toLowerCase().contains(query)) &&
                        !recipe.category.toLowerCase().contains(query) &&
                        !recipe.flags.keySet().toString().toLowerCase().contains(query)) {
                        continue;
                    }
                    matched++;

                    boolean isActive = isRecipeActive(prefs, recipe);

                    LinearLayout card = new LinearLayout(activity);
                    card.setOrientation(LinearLayout.VERTICAL);
                    int cPad = (int) (16 * density);
                    card.setPadding(cPad, cPad, cPad, cPad);
                    LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    cardLp.setMargins(0, 0, 0, (int) (12 * density));
                    card.setLayoutParams(cardLp);
                    card.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 18));

                    LinearLayout topRow = new LinearLayout(activity);
                    topRow.setOrientation(LinearLayout.HORIZONTAL);
                    topRow.setGravity(Gravity.CENTER_VERTICAL);

                    TextView catChip = new TextView(activity);
                    catChip.setText(recipe.category);
                    catChip.setTextSize(11);
                    catChip.setTextColor(M3_PRIMARY);
                    catChip.setTypeface(null, Typeface.BOLD);
                    catChip.setBackground(createRoundedDrawable(activity, 0x1F006A60, 8));
                    int chipPadH = (int) (8 * density);
                    int chipPadV = (int) (3 * density);
                    catChip.setPadding(chipPadH, chipPadV, chipPadH, chipPadV);
                    LinearLayout.LayoutParams catLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    catLp.setMargins(0, 0, (int) (6 * density), 0);
                    catChip.setLayoutParams(catLp);
                    topRow.addView(catChip);

                    TextView statusBadge = new TextView(activity);
                    int badgeTextColor;
                    int badgeBgColor;
                    String badgeLabel;
                    if ("Verified".equalsIgnoreCase(recipe.supportStatus)) {
                        badgeLabel = "✓ Verified";
                        badgeTextColor = 0xFF0D652D;
                        badgeBgColor = 0xFFCEEAD6;
                    } else if ("Partially supported".equalsIgnoreCase(recipe.supportStatus) || "PARTIAL".equalsIgnoreCase(recipe.supportStatus)) {
                        badgeLabel = "⚡ Partial";
                        badgeTextColor = 0xFF185ABC;
                        badgeBgColor = 0xFFD2E3FC;
                    } else {
                        badgeLabel = "🧪 Experimental";
                        badgeTextColor = 0xFF7627BB;
                        badgeBgColor = 0xFFF3E8FD;
                    }
                    statusBadge.setText(badgeLabel);
                    statusBadge.setTextSize(10);
                    statusBadge.setTextColor(badgeTextColor);
                    statusBadge.setTypeface(null, Typeface.BOLD);
                    statusBadge.setBackground(createRoundedDrawable(activity, badgeBgColor, 8));
                    statusBadge.setPadding(chipPadH, chipPadV, chipPadH, chipPadV);
                    LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    statusBadge.setLayoutParams(badgeLp);
                    topRow.addView(statusBadge);

                    // Spacer between badges and switch
                    View spacer = new View(activity);
                    LinearLayout.LayoutParams spacerLp = new LinearLayout.LayoutParams(0, 0, 1f);
                    spacer.setLayoutParams(spacerLp);
                    topRow.addView(spacer);

                    Switch sw = new Switch(activity);
                    sw.setChecked(isActive);
                    sw.setOnCheckedChangeListener((btn, isChecked) -> {
                        toggleRecipe(prefs, recipe, isChecked);
                        refreshHolder[0].run();
                    });
                    topRow.addView(sw);
                    card.addView(topRow);

                    TextView tvRecTitle = new TextView(activity);
                    tvRecTitle.setText(recipe.title);
                    tvRecTitle.setTextSize(15);
                    tvRecTitle.setTextColor(M3_TEXT_PRIMARY);
                    tvRecTitle.setTypeface(null, Typeface.BOLD);
                    tvRecTitle.setPadding(0, (int) (8 * density), 0, (int) (2 * density));
                    card.addView(tvRecTitle);

                    if (recipe.warningBlock != null && !recipe.warningBlock.isEmpty()) {
                        TextView tvWarning = new TextView(activity);
                        tvWarning.setText("⚠️ " + recipe.warningBlock);
                        tvWarning.setTextSize(11);
                        tvWarning.setTextColor(M3_DANGER);
                        tvWarning.setBackground(createRoundedDrawable(activity, M3_DANGER_BG, 8));
                        int wPad = (int) (8 * density);
                        tvWarning.setPadding(wPad, (int) (5 * density), wPad, (int) (5 * density));
                        LinearLayout.LayoutParams wLp = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                        wLp.setMargins(0, (int) (6 * density), 0, (int) (4 * density));
                        tvWarning.setLayoutParams(wLp);
                        card.addView(tvWarning);
                    }

                    if (recipe.description != null && !recipe.description.isEmpty()) {
                        TextView tvDesc = new TextView(activity);
                        tvDesc.setText(recipe.description);
                        tvDesc.setTextSize(12);
                        tvDesc.setTextColor(M3_TEXT_SECONDARY);
                        tvDesc.setPadding(0, (int) (4 * density), 0, 0);
                        card.addView(tvDesc);
                    }

                    listContainer.addView(card);
                }

                if (matched == 0) {
                    renderEmpty(activity, listContainer, "No recommendations matched your search.", density);
                }

            } else {
                List<String> allKeys = new ArrayList<>(all.keySet());
                Collections.sort(allKeys);
                List<String> matchedKeys = new ArrayList<>();

                for (String key : allKeys) {
                    if (SEEDED_MARKER.equals(key) || CACHED_RECIPES_KEY.equals(key)) continue;

                    Object val = all.get(key);
                    if (val == null) continue;

                    if (!query.isEmpty() &&
                        !key.toLowerCase().contains(query) &&
                        !String.valueOf(val).toLowerCase().contains(query)) {
                        continue;
                    }
                    matchedKeys.add(key);
                }

                int totalMatched = matchedKeys.size();

                if (totalMatched == 0) {
                    renderEmpty(activity, listContainer, query.isEmpty() ? "No flags found." : "No flags matched \"" + query + "\".", density);
                } else {
                    int currentLimit = Math.min(displayedCount[0], totalMatched);

                    // Counter header
                    TextView tvCountHeader = new TextView(activity);
                    tvCountHeader.setText("Showing " + currentLimit + " of " + totalMatched + " flags");
                    tvCountHeader.setTextSize(12);
                    tvCountHeader.setTextColor(M3_TEXT_SECONDARY);
                    tvCountHeader.setTypeface(null, Typeface.BOLD);
                    tvCountHeader.setPadding((int) (4 * density), 0, 0, (int) (8 * density));
                    listContainer.addView(tvCountHeader);

                    for (int k = 0; k < currentLimit; k++) {
                        String key = matchedKeys.get(k);
                        Object val = all.get(key);
                        boolean isBool = val instanceof Boolean;

                        LinearLayout card = new LinearLayout(activity);
                        card.setOrientation(LinearLayout.HORIZONTAL);
                        card.setGravity(Gravity.CENTER_VERTICAL);
                        int cPad = (int) (14 * density);
                        card.setPadding(cPad, cPad, cPad, cPad);
                        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                        cardLp.setMargins(0, 0, 0, (int) (10 * density));
                        card.setLayoutParams(cardLp);
                        card.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 16));

                        LinearLayout textCol = new LinearLayout(activity);
                        textCol.setOrientation(LinearLayout.VERTICAL);
                        LinearLayout.LayoutParams colLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                        textCol.setLayoutParams(colLp);

                        TextView tvKey = new TextView(activity);
                        tvKey.setText(key);
                        tvKey.setTextSize(14);
                        tvKey.setTextColor(M3_TEXT_PRIMARY);
                        tvKey.setTypeface(null, Typeface.BOLD);
                        textCol.addView(tvKey);

                        TextView tvVal = new TextView(activity);
                        tvVal.setText("Value: " + val);
                        tvVal.setTextSize(12);
                        tvVal.setTextColor(M3_TEXT_SECONDARY);
                        tvVal.setPadding(0, (int) (2 * density), 0, 0);
                        textCol.addView(tvVal);
                        card.addView(textCol);

                        if (isBool) {
                            Switch sw = new Switch(activity);
                            sw.setChecked((Boolean) val);
                            sw.setOnCheckedChangeListener((btn, isChecked) -> {
                                prefs.edit().putBoolean(key, isChecked).apply();
                                tvVal.setText("Value: " + isChecked);
                            });
                            card.addView(sw);
                        } else {
                            TextView btnEdit = new TextView(activity);
                            btnEdit.setText("✏️");
                            btnEdit.setTextSize(16);
                            btnEdit.setPadding((int) (8 * density), (int) (8 * density), (int) (8 * density), (int) (8 * density));
                            card.addView(btnEdit);
                            card.setOnClickListener(v -> showEditFlagDialog(activity, prefs, key, refreshHolder[0]));
                        }

                        listContainer.addView(card);
                    }

                    if (currentLimit < totalMatched) {
                        int remaining = totalMatched - currentLimit;
                        Button btnLoadMore = new Button(activity);
                        btnLoadMore.setText("Load More (+" + Math.min(PAGE_SIZE, remaining) + ") · " + remaining + " remaining");
                        btnLoadMore.setTextSize(13);
                        btnLoadMore.setTypeface(null, Typeface.BOLD);
                        btnLoadMore.setTextColor(M3_PRIMARY);
                        btnLoadMore.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 16));
                        LinearLayout.LayoutParams lmParams = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT, (int) (44 * density));
                        lmParams.setMargins(0, (int) (4 * density), 0, (int) (12 * density));
                        btnLoadMore.setLayoutParams(lmParams);
                        btnLoadMore.setOnClickListener(v -> {
                            displayedCount[0] += PAGE_SIZE;
                            refreshHolder[0].run();
                        });
                        listContainer.addView(btnLoadMore);
                    }
                }
            }
        };

        refreshHolder[0] = refreshUi;

        // Auto background sync on launch
        syncLiveRecommendations(activity, (success, count) -> {
            if (success && count > 0) {
                activity.runOnUiThread(refreshUi);
            }
        });

        for (int i = 0; i < 2; i++) {
            final int index = i;
            tabButtons[i].setOnClickListener(v -> {
                activeTab[0] = index;
                displayedCount[0] = PAGE_SIZE;
                contentScroll.scrollTo(0, 0);
                refreshUi.run();
            });
        }

        btnAddFlag.setOnClickListener(v -> showAddFlagDialog(activity, prefs, refreshUi));
        btnMenu.setOnClickListener(v -> showOptionsMenu(activity, prefs, refreshUi));

        etSearch.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                displayedCount[0] = PAGE_SIZE;
                contentScroll.scrollTo(0, 0);
                refreshUi.run();
            }
            @Override public void afterTextChanged(Editable s) {}
        });

        refreshUi.run();
        dialog.setContentView(root);
        dialog.show();

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
            int dialogWidth = Math.min((int) (screenWidth * 0.92f), (int) (520 * density));
            int dialogHeight = (int) (screenHeight * 0.82f);
            window.setLayout(dialogWidth, dialogHeight);
            window.setGravity(Gravity.CENTER);
        }
    }

    private static void renderEmpty(Activity activity, LinearLayout container, String msg, float density) {
        TextView tvEmpty = new TextView(activity);
        tvEmpty.setText(msg);
        tvEmpty.setTextSize(13);
        tvEmpty.setTextColor(M3_TEXT_SECONDARY);
        tvEmpty.setPadding(0, (int) (40 * density), 0, (int) (40 * density));
        tvEmpty.setGravity(Gravity.CENTER);
        container.addView(tvEmpty);
    }

    private static boolean isRecipeActive(SharedPreferences prefs, FeatureRecipe recipe) {
        Map<String, ?> all = prefs.getAll();
        for (Map.Entry<String, Object> entry : recipe.flags.entrySet()) {
            Object current = all.get(entry.getKey());
            if (current == null) return false;
            if (!String.valueOf(current).equalsIgnoreCase(String.valueOf(entry.getValue()))) {
                return false;
            }
        }
        return true;
    }

    private static void toggleRecipe(SharedPreferences prefs, FeatureRecipe recipe, boolean enable) {
        SharedPreferences.Editor editor = prefs.edit().putBoolean(SEEDED_MARKER, true);
        if (enable) {
            for (Map.Entry<String, Object> entry : recipe.flags.entrySet()) {
                applyEntry(editor, entry.getKey(), entry.getValue());
            }
        } else {
            for (String key : recipe.flags.keySet()) {
                editor.remove(key);
            }
        }
        editor.apply();
    }

    private static void applyEntry(SharedPreferences.Editor editor, String key, Object val) {
        if (val instanceof Boolean) {
            editor.putBoolean(key, (Boolean) val);
        } else if (val instanceof Number) {
            editor.putLong(key, ((Number) val).longValue());
        } else {
            editor.putString(key, String.valueOf(val));
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Unified Material 3 Sub-Dialog Builder & Handlers
    // ─────────────────────────────────────────────────────────────────────────

    private static Dialog createM3Dialog(Activity activity, String title, View customContent,
                                         String positiveText, Runnable onPositive,
                                         String negativeText, Runnable onNegative,
                                         String neutralText, Runnable onNeutral) {
        float density = activity.getResources().getDisplayMetrics().density;
        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(activity, M3_SURFACE, 24));
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
            root.setClipToOutline(true);
        }

        // Header (Title + Close)
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        int padH = (int) (20 * density);
        int padV = (int) (16 * density);
        header.setPadding(padH, padV, padH, (int) (12 * density));

        TextView tvTitle = new TextView(activity);
        tvTitle.setText(title);
        tvTitle.setTextSize(18);
        tvTitle.setTextColor(M3_TEXT_PRIMARY);
        tvTitle.setTypeface(null, Typeface.BOLD);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tvTitle.setLayoutParams(titleLp);
        header.addView(tvTitle);

        TextView btnClose = new TextView(activity);
        btnClose.setText("✕");
        btnClose.setTextSize(16);
        btnClose.setTextColor(M3_TEXT_SECONDARY);
        btnClose.setTypeface(null, Typeface.BOLD);
        btnClose.setPadding((int) (8 * density), 0, 0, 0);
        btnClose.setOnClickListener(v -> dialog.dismiss());
        header.addView(btnClose);
        root.addView(header);

        // Custom Content View
        if (customContent != null) {
            root.addView(customContent);
        }

        // Action Buttons Row (if any)
        if (positiveText != null || negativeText != null || neutralText != null) {
            LinearLayout actions = new LinearLayout(activity);
            actions.setOrientation(LinearLayout.HORIZONTAL);
            actions.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
            actions.setPadding(padH, (int) (8 * density), padH, (int) (16 * density));

            if (neutralText != null) {
                Button btnNeutral = new Button(activity);
                btnNeutral.setText(neutralText);
                btnNeutral.setTextSize(13);
                btnNeutral.setTypeface(null, Typeface.BOLD);
                btnNeutral.setTextColor(M3_DANGER);
                btnNeutral.setBackground(createRoundedDrawable(activity, M3_DANGER_BG, 18));
                int bPadH = (int) (14 * density);
                int bPadV = (int) (6 * density);
                btnNeutral.setPadding(bPadH, bPadV, bPadH, bPadV);
                LinearLayout.LayoutParams nLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, (int) (38 * density));
                nLp.setMargins(0, 0, (int) (8 * density), 0);
                btnNeutral.setLayoutParams(nLp);
                btnNeutral.setOnClickListener(v -> {
                    dialog.dismiss();
                    if (onNeutral != null) onNeutral.run();
                });
                actions.addView(btnNeutral);
            }

            View spacer = new View(activity);
            LinearLayout.LayoutParams spLp = new LinearLayout.LayoutParams(0, 0, 1f);
            spacer.setLayoutParams(spLp);
            actions.addView(spacer);

            if (negativeText != null) {
                Button btnNegative = new Button(activity);
                btnNegative.setText(negativeText);
                btnNegative.setTextSize(13);
                btnNegative.setTextColor(M3_TEXT_SECONDARY);
                btnNegative.setBackground(createRoundedDrawable(activity, M3_CHIP_INACTIVE, 18));
                int bPadH = (int) (14 * density);
                int bPadV = (int) (6 * density);
                btnNegative.setPadding(bPadH, bPadV, bPadH, bPadV);
                LinearLayout.LayoutParams negLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, (int) (38 * density));
                negLp.setMargins(0, 0, (int) (8 * density), 0);
                btnNegative.setLayoutParams(negLp);
                btnNegative.setOnClickListener(v -> {
                    dialog.dismiss();
                    if (onNegative != null) onNegative.run();
                });
                actions.addView(btnNegative);
            }

            if (positiveText != null) {
                Button btnPositive = new Button(activity);
                btnPositive.setText(positiveText);
                btnPositive.setTextSize(13);
                btnPositive.setTypeface(null, Typeface.BOLD);
                btnPositive.setTextColor(M3_ON_PRIMARY);
                btnPositive.setBackground(createRoundedDrawable(activity, M3_PRIMARY, 18));
                int bPadH = (int) (16 * density);
                int bPadV = (int) (6 * density);
                btnPositive.setPadding(bPadH, bPadV, bPadH, bPadV);
                LinearLayout.LayoutParams posLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, (int) (38 * density));
                btnPositive.setLayoutParams(posLp);
                btnPositive.setOnClickListener(v -> {
                    dialog.dismiss();
                    if (onPositive != null) onPositive.run();
                });
                actions.addView(btnPositive);
            }

            root.addView(actions);
        }

        dialog.setContentView(root);

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            int dialogWidth = Math.min((int) (screenWidth * 0.88f), (int) (460 * density));
            window.setLayout(dialogWidth, ViewGroup.LayoutParams.WRAP_CONTENT);
            window.setGravity(Gravity.CENTER);
        }

        return dialog;
    }

    private static void showOptionsMenu(Activity activity, SharedPreferences prefs, Runnable refreshUi) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding((int) (16 * density), (int) (4 * density), (int) (16 * density), (int) (16 * density));

        class OptionItem {
            final String icon;
            final String title;
            final String subtitle;
            final Runnable action;
            OptionItem(String icon, String title, String subtitle, Runnable action) {
                this.icon = icon;
                this.title = title;
                this.subtitle = subtitle;
                this.action = action;
            }
        }

        List<OptionItem> items = new ArrayList<>();
        items.add(new OptionItem("🔄", "Sync Live from Cloud", "Fetch latest recommendations from GMS Flags", () -> {
            Toast.makeText(activity, "Syncing from GMS Flags Cloud...", Toast.LENGTH_SHORT).show();
            syncLiveRecommendations(activity, (success, count) -> {
                activity.runOnUiThread(() -> {
                    if (success) {
                        Toast.makeText(activity, "✓ Synced " + count + " recommendations from Cloud!", Toast.LENGTH_SHORT).show();
                        refreshUi.run();
                    } else {
                        Toast.makeText(activity, "Failed to connect to GMS Flags Cloud", Toast.LENGTH_SHORT).show();
                    }
                });
            });
        }));

        items.add(new OptionItem("📥", "Import Overrides", "Load XML, JSON, or key=value presets", () -> {
            showImportDialog(activity, prefs, refreshUi);
        }));

        items.add(new OptionItem("📤", "Export Overrides", "Export active overrides to GMS-compatible XML", () -> {
            showExportDialog(activity, prefs);
        }));

        items.add(new OptionItem("⚡", "Reset Recommendations", "Restore default recipe toggles without wiping flags", () -> {
            loadDefaultBaselineRecipes();
            if (prefs.getAll().size() < 500) {
                PhenotypeSeedData.restoreOfficialFlags(activity, prefs);
            }
            SharedPreferences.Editor editor = prefs.edit();
            for (FeatureRecipe recipe : CURATED_RECIPES) {
                for (Map.Entry<String, Object> entry : recipe.flags.entrySet()) {
                    applyEntry(editor, entry.getKey(), entry.getValue());
                }
            }
            editor.putBoolean(SEEDED_MARKER, true).apply();
            Toast.makeText(activity, "Default recommendations restored (" + prefs.getAll().size() + " total flags)!", Toast.LENGTH_SHORT).show();
            refreshUi.run();
        }));

        items.add(new OptionItem("🏛️", "Restore Official Flags", "Re-seed all 2,493 flags from official snapshot", () -> {
            int count = PhenotypeSeedData.restoreOfficialFlags(activity, prefs);
            Toast.makeText(activity, "✓ Restored " + count + " official flags!", Toast.LENGTH_SHORT).show();
            refreshUi.run();
        }));

        items.add(new OptionItem("🗑️", "Revert All to Official", "Reset all flags back to official snapshot", () -> {
            int count = PhenotypeSeedData.restoreOfficialFlags(activity, prefs);
            Toast.makeText(activity, "Reverted all flags to official baseline (" + count + " flags)", Toast.LENGTH_SHORT).show();
            refreshUi.run();
        }));

        Dialog optDialog = createM3Dialog(activity, "⚙️ Options", list, null, null, null, null, null, null);

        for (OptionItem item : items) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            int rPadH = (int) (14 * density);
            int rPadV = (int) (12 * density);
            row.setPadding(rPadH, rPadV, rPadH, rPadV);
            row.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 14));
            LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            rLp.setMargins(0, 0, 0, (int) (8 * density));
            row.setLayoutParams(rLp);

            TextView tvIcon = new TextView(activity);
            tvIcon.setText(item.icon);
            tvIcon.setTextSize(20);
            tvIcon.setPadding(0, 0, (int) (12 * density), 0);
            row.addView(tvIcon);

            LinearLayout textCol = new LinearLayout(activity);
            textCol.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams colLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            textCol.setLayoutParams(colLp);

            TextView tvTitle = new TextView(activity);
            tvTitle.setText(item.title);
            tvTitle.setTextSize(14);
            tvTitle.setTextColor(M3_TEXT_PRIMARY);
            tvTitle.setTypeface(null, Typeface.BOLD);
            textCol.addView(tvTitle);

            if (item.subtitle != null) {
                TextView tvSub = new TextView(activity);
                tvSub.setText(item.subtitle);
                tvSub.setTextSize(11);
                tvSub.setTextColor(M3_TEXT_SECONDARY);
                tvSub.setPadding(0, (int) (2 * density), 0, 0);
                textCol.addView(tvSub);
            }
            row.addView(textCol);

            row.setOnClickListener(v -> {
                optDialog.dismiss();
                item.action.run();
            });

            list.addView(row);
        }

        optDialog.show();
    }

    private static void showImportDialog(Activity activity, SharedPreferences prefs, Runnable onImported) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        TextView tvHelp = new TextView(activity);
        tvHelp.setText("Paste GMS-Flags XML, JSON presets, or Key=Value pairs:");
        tvHelp.setTextSize(12);
        tvHelp.setTextColor(M3_TEXT_SECONDARY);
        tvHelp.setPadding(0, 0, 0, (int) (8 * density));
        layout.addView(tvHelp);

        EditText etInput = new EditText(activity);
        etInput.setHint("e.g.\n<package name=\"...\"><flags><flag name=\"45705305\" type=\"boolean\" value=\"true\"/></flags></package>\n\nOR\n{\"45705305\": true, \"45802110\": 2}");
        etInput.setTextSize(12);
        etInput.setTextColor(M3_TEXT_PRIMARY);
        etInput.setHintTextColor(M3_TEXT_SECONDARY);
        etInput.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 12));
        int pad = (int) (10 * density);
        etInput.setPadding(pad, pad, pad, pad);
        etInput.setMinLines(5);
        etInput.setMaxLines(10);
        etInput.setGravity(Gravity.TOP);
        layout.addView(etInput);

        Dialog dialog = createM3Dialog(activity, "📥 Import Overrides", layout, "Import", () -> {
            String input = etInput.getText().toString().trim();
            if (input.isEmpty()) return;
            int count = importFlagsUniversal(prefs, input);
            Toast.makeText(activity, "Imported " + count + " flags successfully", Toast.LENGTH_SHORT).show();
            onImported.run();
        }, "Cancel", null, null, null);

        dialog.show();
    }

    private static int importFlagsUniversal(SharedPreferences prefs, String content) {
        int count = 0;
        SharedPreferences.Editor editor = prefs.edit().putBoolean(SEEDED_MARKER, true);

        if (content.contains("<flag") || content.contains("<package")) {
            try {
                Document doc = DocumentBuilderFactory.newInstance()
                        .newDocumentBuilder()
                        .parse(new InputSource(new StringReader(content)));
                NodeList flagNodes = doc.getElementsByTagName("flag");
                for (int i = 0; i < flagNodes.getLength(); i++) {
                    Element el = (Element) flagNodes.item(i);
                    String name = el.getAttribute("name");
                    String type = el.getAttribute("type").toLowerCase();
                    String val = el.getAttribute("value");

                    if (name == null || name.isEmpty()) continue;

                    if ("boolean".equals(type) || "bool".equals(type)) {
                        editor.putBoolean(name, Boolean.parseBoolean(val));
                    } else if ("long".equals(type) || "int".equals(type) || "integer".equals(type)) {
                        editor.putLong(name, Long.parseLong(val));
                    } else if ("float".equals(type) || "double".equals(type)) {
                        editor.putFloat(name, Float.parseFloat(val));
                    } else {
                        editor.putString(name, val);
                    }
                    count++;
                }
                if (count > 0) {
                    editor.apply();
                    return count;
                }
            } catch (Exception ignored) {}
        }

        if (content.startsWith("{") && content.endsWith("}")) {
            try {
                JSONObject json = new JSONObject(content);
                Iterator<String> keys = json.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    Object v = json.get(k);
                    if (v instanceof Boolean) editor.putBoolean(k, (Boolean) v);
                    else if (v instanceof Number) editor.putLong(k, ((Number) v).longValue());
                    else editor.putString(k, String.valueOf(v));
                    count++;
                }
                if (count > 0) {
                    editor.apply();
                    return count;
                }
            } catch (Exception ignored) {}
        }

        String[] lines = content.split("\\r?\\n");
        for (String line : lines) {
            line = line.trim();
            if (line.isEmpty() || line.startsWith("#") || !line.contains("=")) continue;
            int eq = line.indexOf('=');
            String k = line.substring(0, eq).trim();
            String v = line.substring(eq + 1).trim();
            if (k.isEmpty()) continue;

            if ("true".equalsIgnoreCase(v) || "false".equalsIgnoreCase(v)) {
                editor.putBoolean(k, Boolean.parseBoolean(v));
            } else {
                try {
                    long lVal = Long.parseLong(v);
                    editor.putLong(k, lVal);
                } catch (NumberFormatException e) {
                    editor.putString(k, v);
                }
            }
            count++;
        }

        editor.apply();
        return count;
    }

    private static void showExportDialog(Activity activity, SharedPreferences prefs) {
        float density = activity.getResources().getDisplayMetrics().density;
        Map<String, ?> all = prefs.getAll();
        StringBuilder sbXml = new StringBuilder();
        sbXml.append("<package name=\"com.google.android.apps.photos.phenotype\">\n");
        sbXml.append("  <flags>\n");

        List<String> keys = new ArrayList<>(all.keySet());
        Collections.sort(keys);
        for (String k : keys) {
            if (SEEDED_MARKER.equals(k) || CACHED_RECIPES_KEY.equals(k)) continue;
            Object val = all.get(k);
            String type = (val instanceof Boolean) ? "boolean" : ((val instanceof Number) ? "long" : "string");
            sbXml.append("    <flag name=\"").append(k).append("\" type=\"").append(type)
                 .append("\" value=\"").append(val).append("\"/>\n");
        }
        sbXml.append("  </flags>\n");
        sbXml.append("</package>");

        String exportText = sbXml.toString();

        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        ScrollView sv = new ScrollView(activity);
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (220 * density));
        sv.setLayoutParams(svLp);

        TextView tvXml = new TextView(activity);
        tvXml.setText(exportText);
        tvXml.setTextSize(11);
        tvXml.setTextColor(M3_TEXT_PRIMARY);
        tvXml.setTypeface(Typeface.MONOSPACE);
        tvXml.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 12));
        int pad = (int) (10 * density);
        tvXml.setPadding(pad, pad, pad, pad);
        sv.addView(tvXml);
        layout.addView(sv);

        Dialog dialog = createM3Dialog(activity, "📤 Exported XML", layout, "Copy to Clipboard", () -> {
            ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("GMS-Flags Export", exportText));
                Toast.makeText(activity, "Copied to clipboard!", Toast.LENGTH_SHORT).show();
            }
        }, "Close", null, null, null);

        dialog.show();
    }

    private static void showAddFlagDialog(Activity activity, SharedPreferences prefs, Runnable onAdded) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        TextView tvKeyLabel = new TextView(activity);
        tvKeyLabel.setText("Flag ID / Name");
        tvKeyLabel.setTextSize(12);
        tvKeyLabel.setTextColor(M3_TEXT_SECONDARY);
        tvKeyLabel.setTypeface(null, Typeface.BOLD);
        tvKeyLabel.setPadding(0, 0, 0, (int) (4 * density));
        layout.addView(tvKeyLabel);

        EditText etKey = new EditText(activity);
        etKey.setHint("e.g. 45705305");
        etKey.setTextSize(13);
        etKey.setTextColor(M3_TEXT_PRIMARY);
        etKey.setHintTextColor(M3_TEXT_SECONDARY);
        etKey.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 12));
        int pad = (int) (10 * density);
        etKey.setPadding(pad, pad, pad, pad);
        LinearLayout.LayoutParams keyLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        keyLp.setMargins(0, 0, 0, (int) (10 * density));
        etKey.setLayoutParams(keyLp);
        layout.addView(etKey);

        TextView tvTypeLabel = new TextView(activity);
        tvTypeLabel.setText("Value Type");
        tvTypeLabel.setTextSize(12);
        tvTypeLabel.setTextColor(M3_TEXT_SECONDARY);
        tvTypeLabel.setTypeface(null, Typeface.BOLD);
        tvTypeLabel.setPadding(0, 0, 0, (int) (4 * density));
        layout.addView(tvTypeLabel);

        Spinner spType = new Spinner(activity);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity,
                android.R.layout.simple_spinner_dropdown_item,
                new String[] { "Boolean", "Long / Integer", "Float", "String" });
        spType.setAdapter(adapter);
        spType.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 12));
        spType.setPadding(pad, pad, pad, pad);
        LinearLayout.LayoutParams spLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        spLp.setMargins(0, 0, 0, (int) (10 * density));
        spType.setLayoutParams(spLp);
        layout.addView(spType);

        TextView tvValLabel = new TextView(activity);
        tvValLabel.setText("Value");
        tvValLabel.setTextSize(12);
        tvValLabel.setTextColor(M3_TEXT_SECONDARY);
        tvValLabel.setTypeface(null, Typeface.BOLD);
        tvValLabel.setPadding(0, 0, 0, (int) (4 * density));
        layout.addView(tvValLabel);

        EditText etVal = new EditText(activity);
        etVal.setHint("e.g. true, 2, etc.");
        etVal.setTextSize(13);
        etVal.setTextColor(M3_TEXT_PRIMARY);
        etVal.setHintTextColor(M3_TEXT_SECONDARY);
        etVal.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 12));
        etVal.setPadding(pad, pad, pad, pad);
        layout.addView(etVal);

        Dialog dialog = createM3Dialog(activity, "➕ Add Custom Flag", layout, "Save", () -> {
            String key = etKey.getText().toString().trim();
            String val = etVal.getText().toString().trim();
            if (key.isEmpty()) return;

            int typeIdx = spType.getSelectedItemPosition();
            SharedPreferences.Editor editor = prefs.edit().putBoolean(SEEDED_MARKER, true);
            if (typeIdx == 0) {
                editor.putBoolean(key, Boolean.parseBoolean(val));
            } else if (typeIdx == 1) {
                try {
                    editor.putLong(key, Long.parseLong(val));
                } catch (Exception e) {
                    editor.putString(key, val);
                }
            } else if (typeIdx == 2) {
                try {
                    editor.putFloat(key, Float.parseFloat(val));
                } catch (Exception e) {
                    editor.putString(key, val);
                }
            } else {
                editor.putString(key, val);
            }
            editor.apply();
            Toast.makeText(activity, "Flag saved", Toast.LENGTH_SHORT).show();
            onAdded.run();
        }, "Cancel", null, null, null);

        dialog.show();
    }

    private static void showEditFlagDialog(Activity activity, SharedPreferences prefs, String key, Runnable onUpdated) {
        Object current = prefs.getAll().get(key);
        float density = activity.getResources().getDisplayMetrics().density;

        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        TextView tvKeyLabel = new TextView(activity);
        tvKeyLabel.setText("Flag: " + key);
        tvKeyLabel.setTextSize(12);
        tvKeyLabel.setTextColor(M3_TEXT_SECONDARY);
        tvKeyLabel.setPadding(0, 0, 0, (int) (6 * density));
        layout.addView(tvKeyLabel);

        EditText etVal = new EditText(activity);
        etVal.setText(String.valueOf(current));
        etVal.setTextSize(14);
        etVal.setTextColor(M3_TEXT_PRIMARY);
        etVal.setBackground(createRoundedDrawable(activity, M3_CARD_BG, 12));
        int pad = (int) (10 * density);
        etVal.setPadding(pad, pad, pad, pad);
        layout.addView(etVal);

        Dialog dialog = createM3Dialog(activity, "✏️ Edit Flag", layout, "Save", () -> {
            String newVal = etVal.getText().toString().trim();
            SharedPreferences.Editor editor = prefs.edit();
            if (current instanceof Boolean) {
                editor.putBoolean(key, Boolean.parseBoolean(newVal));
            } else if (current instanceof Long || current instanceof Integer) {
                try {
                    editor.putLong(key, Long.parseLong(newVal));
                } catch (Exception e) {
                    editor.putString(key, newVal);
                }
            } else if (current instanceof Float) {
                try {
                    editor.putFloat(key, Float.parseFloat(newVal));
                } catch (Exception e) {
                    editor.putString(key, newVal);
                }
            } else {
                editor.putString(key, newVal);
            }
            editor.apply();
            onUpdated.run();
        }, "Cancel", null, "Delete", () -> {
            prefs.edit().remove(key).apply();
            onUpdated.run();
        });

        dialog.show();
    }

    private static GradientDrawable createRoundedDrawable(Context context, int bgColor, float radiusDp) {
        float density = context.getResources().getDisplayMetrics().density;
        GradientDrawable gd = new GradientDrawable();
        gd.setShape(GradientDrawable.RECTANGLE);
        gd.setColor(bgColor);
        gd.setCornerRadius(radiusDp * density);
        return gd;
    }

    private static void restartApp(Activity activity) {
        try {
            Context ctx = activity.getApplicationContext();
            Intent intent = ctx.getPackageManager().getLaunchIntentForPackage(ctx.getPackageName());
            if (intent != null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                ctx.startActivity(intent);
            }
            activity.finishAffinity();
            System.exit(0);
        } catch (Exception e) {
            Logger.printException(() -> "Error restarting app", e);
            activity.finish();
        }
    }
}
