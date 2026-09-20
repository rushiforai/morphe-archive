package app.morphe.extension.shared.patches;

import android.app.Activity;
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
import android.graphics.drawable.StateListDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.patches.flags.GmsFlagsApiClient;
import app.morphe.extension.shared.patches.flags.GmsFlagsApiClient.RecommendationRecipe;
import app.morphe.extension.shared.patches.flags.PhotoFlagsRegistry;
import app.morphe.extension.shared.patches.flags.PhotoFlagsRegistry.CuratedFlag;

/**
 * Modern, touch-first Material 3 Phenotype Flag Manager for Morphe Google Photos.
 * Powered by api.polodarb.com GMS Flags 2.0 API and the 26 Curated Morphe UI flags.
 */
public final class PhenotypeFlagManager {

    private static final String PREF_NAME = "com.google.android.apps.photos.phenotype";
    private static final String SETTINGS_PILL_TAG = "morphe_photos_flags_pill";
    public static final String CUSTOM_FLAGS_KEY = "_morphe_custom_flag_ids";
    public static final String SEEDED_MARKER = "_morphe_flags_seeded";

    // Material 3 Palette
    private static final int M3_BG = 0xFFF5F7F6;
    private static final int M3_SURFACE = 0xFFFFFFFF;
    private static final int M3_CARD = 0xFFFFFFFF;
    private static final int M3_CARD_ACTIVE = 0xFFE6F4F1;
    private static final int M3_PRIMARY = 0xFF006A60;
    private static final int M3_PRIMARY_CONTAINER = 0xFFCCE8E3;
    private static final int M3_ON_PRIMARY = 0xFFFFFFFF;
    private static final int M3_TEXT_PRIMARY = 0xFF191C1D;
    private static final int M3_TEXT_SECONDARY = 0xFF53605D;
    private static final int M3_OUTLINE = 0xFFD8E3E0;
    private static final int M3_WARN_BG = 0xFFFFF0D4;
    private static final int M3_WARN_TEXT = 0xFF8A5100;
    private static final int M3_DANGER_BG = 0xFFFFDAD6;
    private static final int M3_DANGER_TEXT = 0xFFBA1A1A;

    private PhenotypeFlagManager() {}

    public static SharedPreferences getPrefs(Context context) {
        return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Settings Activity Floating Pill Injection
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
                            if (content != null && content.findViewWithTag(SETTINGS_PILL_TAG) == null) {
                                LinearLayout pill = createFloatingPill(activity);
                                content.addView(pill);
                                Logger.printInfo(() -> "Photos Flags floating pill attached to SettingsActivity");
                            }
                        } catch (Throwable t) {
                            Logger.printException(() -> "Error attaching Photos Flags pill", t);
                        }
                    }
                });
            } catch (Throwable t) {
                Logger.printException(() -> "Error in injectSettingsCard", t);
            }
        });
    }

    private static LinearLayout createFloatingPill(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout pill = new LinearLayout(activity);
        pill.setTag(SETTINGS_PILL_TAG);
        pill.setOrientation(LinearLayout.HORIZONTAL);
        pill.setGravity(Gravity.CENTER);
        pill.setClickable(true);
        pill.setFocusable(true);
        pill.setElevation(14f);

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                (int) (50 * density)
        );
        lp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        lp.setMargins(0, 0, 0, (int) (24 * density));
        pill.setLayoutParams(lp);

        int padH = (int) (22 * density);
        pill.setPadding(padH, 0, padH, 0);

        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(25 * density);
        bg.setColor(M3_PRIMARY);
        pill.setBackground(bg);

        TextView icon = new TextView(activity);
        icon.setText("✨");
        icon.setTextSize(17);
        icon.setPadding(0, 0, (int) (10 * density), 0);
        pill.addView(icon);

        TextView label = new TextView(activity);
        label.setText("Photos Flags");
        label.setTextSize(15);
        label.setTextColor(0xFFFFFFFF);
        label.setTypeface(null, Typeface.BOLD);
        pill.addView(label);

        pill.setOnClickListener(v -> show(activity));
        return pill;
    }

    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        activity.runOnUiThread(() -> showManagerDialog(activity));
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Redesigned Popup-Friendly Material 3 Dialog
    // ─────────────────────────────────────────────────────────────────────────

    private static void showManagerDialog(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        SharedPreferences prefs = getPrefs(activity);

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(M3_BG, 28 * density));
        root.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // 1. Top Bar (Height: 56dp, 48dp min touch targets)
        LinearLayout topBar = new LinearLayout(activity);
        topBar.setOrientation(LinearLayout.HORIZONTAL);
        topBar.setGravity(Gravity.CENTER_VERTICAL);
        int tbPad = (int) (16 * density);
        topBar.setPadding(tbPad, (int) (8 * density), (int) (10 * density), (int) (8 * density));
        topBar.setBackgroundColor(M3_SURFACE);

        LinearLayout titleCol = new LinearLayout(activity);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        titleCol.setLayoutParams(titleLp);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText("Photos Flags");
        tvTitle.setTextSize(18);
        tvTitle.setTextColor(M3_TEXT_PRIMARY);
        tvTitle.setTypeface(null, Typeface.BOLD);
        titleCol.addView(tvTitle);

        TextView tvSub = new TextView(activity);
        tvSub.setText(PhotoFlagsRegistry.CURATED_FLAGS.size() + " Curated Flags • GMS Flags 2.0");
        tvSub.setTextSize(11);
        tvSub.setTextColor(M3_TEXT_SECONDARY);
        titleCol.addView(tvSub);
        topBar.addView(titleCol);

        // Header action icons with 48x48dp touch targets
        View btnSearch = createHeaderIconButton(activity, "🔍", (int) (48 * density));
        View btnAdd = createHeaderIconButton(activity, "➕", (int) (48 * density));
        View btnMenu = createHeaderIconButton(activity, "⋮", (int) (48 * density));
        View btnClose = createHeaderIconButton(activity, "✕", (int) (48 * density));

        topBar.addView(btnSearch);
        topBar.addView(btnAdd);
        topBar.addView(btnMenu);
        topBar.addView(btnClose);
        root.addView(topBar);

        // 2. Expandable Search Bar
        LinearLayout searchBox = new LinearLayout(activity);
        searchBox.setOrientation(LinearLayout.HORIZONTAL);
        searchBox.setGravity(Gravity.CENTER_VERTICAL);
        searchBox.setPadding(tbPad, (int) (6 * density), tbPad, (int) (10 * density));
        searchBox.setBackgroundColor(M3_SURFACE);
        searchBox.setVisibility(View.GONE);

        EditText etSearch = new EditText(activity);
        etSearch.setHint("Search curated flags, keys or values...");
        etSearch.setTextSize(14);
        etSearch.setTextColor(M3_TEXT_PRIMARY);
        etSearch.setHintTextColor(M3_TEXT_SECONDARY);
        etSearch.setBackground(createRoundedDrawable(0xFFEAEFEB, 14 * density));
        int sPad = (int) (12 * density);
        etSearch.setPadding(sPad, (int) (10 * density), sPad, (int) (10 * density));
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (46 * density));
        etSearch.setLayoutParams(sLp);
        searchBox.addView(etSearch);
        root.addView(searchBox);

        btnSearch.setOnClickListener(v -> {
            if (searchBox.getVisibility() == View.VISIBLE) {
                searchBox.setVisibility(View.GONE);
                etSearch.setText("");
            } else {
                searchBox.setVisibility(View.VISIBLE);
                etSearch.requestFocus();
            }
        });

        btnClose.setOnClickListener(v -> dialog.dismiss());

        // 3. Minimal Tabs: [ Recommendations ]  [ Curated Flags ]
        LinearLayout tabContainer = new LinearLayout(activity);
        tabContainer.setOrientation(LinearLayout.HORIZONTAL);
        tabContainer.setPadding(tbPad, (int) (12 * density), tbPad, (int) (8 * density));

        final int[] activeTab = new int[] { 0 }; // 0: Recommendations, 1: Curated Flags
        Button tabRecs = createTabButton(activity, "Recommendations", true);
        Button tabFlags = createTabButton(activity, "Curated Flags (" + PhotoFlagsRegistry.CURATED_FLAGS.size() + ")", false);

        LinearLayout.LayoutParams tLp1 = new LinearLayout.LayoutParams(0, (int) (44 * density), 1f);
        tLp1.setMargins(0, 0, (int) (6 * density), 0);
        tabRecs.setLayoutParams(tLp1);

        LinearLayout.LayoutParams tLp2 = new LinearLayout.LayoutParams(0, (int) (44 * density), 1f);
        tLp2.setMargins((int) (6 * density), 0, 0, 0);
        tabFlags.setLayoutParams(tLp2);

        tabContainer.addView(tabRecs);
        tabContainer.addView(tabFlags);
        root.addView(tabContainer);

        // 4. Scrollable List Content Area
        ScrollView scrollView = new ScrollView(activity);
        LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        scrollView.setLayoutParams(scrollLp);

        LinearLayout listContainer = new LinearLayout(activity);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        listContainer.setPadding(tbPad, (int) (4 * density), tbPad, (int) (16 * density));
        scrollView.addView(listContainer);
        root.addView(scrollView);

        // 5. Minimal Bottom Action Dock
        LinearLayout bottomDock = new LinearLayout(activity);
        bottomDock.setOrientation(LinearLayout.VERTICAL);
        bottomDock.setGravity(Gravity.CENTER);
        int dPadH = (int) (16 * density);
        int dPadV = (int) (12 * density);
        bottomDock.setPadding(dPadH, dPadV, dPadH, dPadV);
        bottomDock.setBackgroundColor(M3_SURFACE);
        bottomDock.setElevation(10f);

        Button btnApply = new Button(activity);
        btnApply.setText("⚡ Apply & Restart Photos");
        btnApply.setTextSize(15);
        btnApply.setTypeface(null, Typeface.BOLD);
        btnApply.setTextColor(M3_ON_PRIMARY);
        btnApply.setBackground(createRoundedDrawable(M3_PRIMARY, 26 * density));
        LinearLayout.LayoutParams applyLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, (int) (52 * density));
        btnApply.setLayoutParams(applyLp);
        btnApply.setOnClickListener(v -> {
            dialog.dismiss();
            restartApp(activity);
        });
        bottomDock.addView(btnApply);
        root.addView(bottomDock);

        // Refresh UI Runnable
        Runnable[] refreshHolder = new Runnable[1];
        Runnable refreshUi = () -> {
            listContainer.removeAllViews();
            String query = etSearch.getText().toString().toLowerCase().trim();
            Map<String, ?> all = prefs.getAll();

            // Update Tab buttons visual state
            updateTabButtonState(tabRecs, activeTab[0] == 0);
            updateTabButtonState(tabFlags, activeTab[0] == 1);

            if (activeTab[0] == 0) {
                // TAB 0: Recommendations (from GMS Flags api.polodarb.com)
                List<RecommendationRecipe> recipes = GmsFlagsApiClient.loadCachedRecipes(prefs);
                int count = 0;

                for (RecommendationRecipe recipe : recipes) {
                    if (!query.isEmpty() &&
                            !recipe.title.toLowerCase().contains(query) &&
                            (recipe.description == null || !recipe.description.toLowerCase().contains(query)) &&
                            !recipe.category.toLowerCase().contains(query)) {
                        continue;
                    }
                    count++;

                    boolean isActive = isRecipeActive(prefs, recipe);
                    View card = createRecipeCard(activity, prefs, recipe, isActive, refreshHolder[0]);
                    listContainer.addView(card);
                }

                if (count == 0) {
                    renderEmptyMessage(activity, listContainer, "No recommendations matched your search.", density);
                }

            } else {
                // TAB 1: Curated 26 Flags (grouped by category)
                List<String> categories = PhotoFlagsRegistry.getCategories();
                int matchedCount = 0;

                for (String cat : categories) {
                    List<CuratedFlag> flagsInCat = PhotoFlagsRegistry.getFlagsForCategory(cat);
                    List<CuratedFlag> matchingFlags = new ArrayList<>();

                    for (CuratedFlag flag : flagsInCat) {
                        Object val = all.get(flag.key);
                        String searchTarget = flag.key + " " + flag.title + " " + flag.description + " " + val;
                        if (query.isEmpty() || searchTarget.toLowerCase().contains(query)) {
                            matchingFlags.add(flag);
                        }
                    }

                    if (matchingFlags.isEmpty()) continue;
                    matchedCount += matchingFlags.size();

                    // Category Section Header
                    TextView tvCatHeader = new TextView(activity);
                    tvCatHeader.setText(cat);
                    tvCatHeader.setTextSize(13);
                    tvCatHeader.setTextColor(M3_PRIMARY);
                    tvCatHeader.setTypeface(null, Typeface.BOLD);
                    tvCatHeader.setPadding(0, (int) (12 * density), 0, (int) (6 * density));
                    listContainer.addView(tvCatHeader);

                    // Flag Rows
                    for (CuratedFlag flag : matchingFlags) {
                        View flagRow = createCuratedFlagRow(activity, prefs, flag, all, refreshHolder[0]);
                        listContainer.addView(flagRow);
                    }
                }

                // Any user-added custom flags
                Set<String> customKeys = prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet());
                if (!customKeys.isEmpty()) {
                    List<String> matchingCustom = new ArrayList<>();
                    for (String ck : customKeys) {
                        if (!PhotoFlagsRegistry.FLAG_MAP.containsKey(ck)) {
                            Object val = all.get(ck);
                            String st = ck + " " + val;
                            if (query.isEmpty() || st.toLowerCase().contains(query)) {
                                matchingCustom.add(ck);
                            }
                        }
                    }

                    if (!matchingCustom.isEmpty()) {
                        matchedCount += matchingCustom.size();
                        TextView tvCustomHeader = new TextView(activity);
                        tvCustomHeader.setText("Custom User Flags");
                        tvCustomHeader.setTextSize(13);
                        tvCustomHeader.setTextColor(M3_PRIMARY);
                        tvCustomHeader.setTypeface(null, Typeface.BOLD);
                        tvCustomHeader.setPadding(0, (int) (12 * density), 0, (int) (6 * density));
                        listContainer.addView(tvCustomHeader);

                        for (String ck : matchingCustom) {
                            View customRow = createCustomFlagRow(activity, prefs, ck, all.get(ck), refreshHolder[0]);
                            listContainer.addView(customRow);
                        }
                    }
                }

                if (matchedCount == 0) {
                    renderEmptyMessage(activity, listContainer, "No curated flags matched your search.", density);
                }
            }
        };

        refreshHolder[0] = refreshUi;

        tabRecs.setOnClickListener(v -> {
            activeTab[0] = 0;
            scrollView.scrollTo(0, 0);
            refreshUi.run();
        });

        tabFlags.setOnClickListener(v -> {
            activeTab[0] = 1;
            scrollView.scrollTo(0, 0);
            refreshUi.run();
        });

        btnAdd.setOnClickListener(v -> showAddCustomFlagDialog(activity, prefs, refreshUi));
        btnMenu.setOnClickListener(v -> showProperOptionsMenu(activity, prefs, refreshUi));

        etSearch.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                refreshUi.run();
            }
            @Override public void afterTextChanged(Editable s) {}
        });

        // Background sync on open
        GmsFlagsApiClient.syncLiveRecommendations(activity, prefs, (success, count) -> {
            if (success && count > 0) {
                activity.runOnUiThread(refreshUi);
            }
        });

        refreshUi.run();
        dialog.setContentView(root);
        dialog.show();

        // Window size - popup-friendly (94% width, 88% height)
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
            int dialogWidth = Math.min((int) (screenWidth * 0.94f), (int) (520 * density));
            int dialogHeight = (int) (screenHeight * 0.88f);
            window.setLayout(dialogWidth, dialogHeight);
            window.setGravity(Gravity.CENTER);
        }
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Touch-Friendly Card & Row Builders (Min 56-60dp touch height, Whole-Card Click)
    // ─────────────────────────────────────────────────────────────────────────

    private static View createRecipeCard(Activity activity, SharedPreferences prefs,
                                         RecommendationRecipe recipe, boolean isActive,
                                         Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        int cPad = (int) (16 * density);
        card.setPadding(cPad, cPad, cPad, cPad);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.setMargins(0, 0, 0, (int) (12 * density));
        card.setLayoutParams(cardLp);
        card.setBackground(createCardDrawable(isActive, density));

        // Header Row: Category Badge + Status Badge + Switch
        LinearLayout topRow = new LinearLayout(activity);
        topRow.setOrientation(LinearLayout.HORIZONTAL);
        topRow.setGravity(Gravity.CENTER_VERTICAL);

        TextView catBadge = new TextView(activity);
        catBadge.setText(recipe.category);
        catBadge.setTextSize(11);
        catBadge.setTextColor(M3_PRIMARY);
        catBadge.setTypeface(null, Typeface.BOLD);
        catBadge.setBackground(createRoundedDrawable(0x1F006A60, 8 * density));
        int bPadH = (int) (8 * density);
        int bPadV = (int) (4 * density);
        catBadge.setPadding(bPadH, bPadV, bPadH, bPadV);
        topRow.addView(catBadge);

        TextView statusBadge = new TextView(activity);
        String sText = "VERIFIED".equalsIgnoreCase(recipe.supportStatus) ? "✓ Verified"
                : "PARTIAL".equalsIgnoreCase(recipe.supportStatus) ? "⚡ Partial" : "🧪 Experimental";
        int sColor = "VERIFIED".equalsIgnoreCase(recipe.supportStatus) ? 0xFF0D652D : 0xFF7627BB;
        int sBg = "VERIFIED".equalsIgnoreCase(recipe.supportStatus) ? 0xFFCEEAD6 : 0xFFF3E8FD;
        statusBadge.setText(sText);
        statusBadge.setTextSize(11);
        statusBadge.setTextColor(sColor);
        statusBadge.setTypeface(null, Typeface.BOLD);
        statusBadge.setBackground(createRoundedDrawable(sBg, 8 * density));
        statusBadge.setPadding(bPadH, bPadV, bPadH, bPadV);
        LinearLayout.LayoutParams sbLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sbLp.setMargins((int) (6 * density), 0, 0, 0);
        statusBadge.setLayoutParams(sbLp);
        topRow.addView(statusBadge);

        View spacer = new View(activity);
        topRow.addView(spacer, new LinearLayout.LayoutParams(0, 0, 1f));

        Switch sw = new Switch(activity);
        sw.setChecked(isActive);
        topRow.addView(sw);
        card.addView(topRow);

        // Title
        TextView tvTitle = new TextView(activity);
        tvTitle.setText(recipe.title);
        tvTitle.setTextSize(15);
        tvTitle.setTextColor(M3_TEXT_PRIMARY);
        tvTitle.setTypeface(null, Typeface.BOLD);
        tvTitle.setPadding(0, (int) (8 * density), 0, (int) (2 * density));
        card.addView(tvTitle);

        // Warning banner if any
        if (recipe.warningBlock != null && !recipe.warningBlock.isEmpty()) {
            TextView tvWarn = new TextView(activity);
            tvWarn.setText("⚠️ " + recipe.warningBlock);
            tvWarn.setTextSize(11);
            tvWarn.setTextColor(M3_WARN_TEXT);
            tvWarn.setBackground(createRoundedDrawable(M3_WARN_BG, 8 * density));
            int wPad = (int) (8 * density);
            tvWarn.setPadding(wPad, (int) (5 * density), wPad, (int) (5 * density));
            LinearLayout.LayoutParams wLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            wLp.setMargins(0, (int) (6 * density), 0, (int) (4 * density));
            tvWarn.setLayoutParams(wLp);
            card.addView(tvWarn);
        }

        // Description
        if (recipe.description != null && !recipe.description.isEmpty()) {
            TextView tvDesc = new TextView(activity);
            tvDesc.setText(recipe.description);
            tvDesc.setTextSize(12);
            tvDesc.setTextColor(M3_TEXT_SECONDARY);
            tvDesc.setPadding(0, (int) (2 * density), 0, 0);
            card.addView(tvDesc);
        }

        // Whole-card click-to-toggle!
        card.setClickable(true);
        card.setFocusable(true);
        card.setOnClickListener(v -> {
            boolean next = !sw.isChecked();
            sw.setChecked(next);
            toggleRecipe(prefs, recipe, next);
            Toast.makeText(activity, (next ? "Enabled: " : "Disabled: ") + recipe.title + "\nTap '⚡ Apply & Restart Photos' below to apply.", Toast.LENGTH_SHORT).show();
            onRefresh.run();
        });

        sw.setOnClickListener(v -> {
            toggleRecipe(prefs, recipe, sw.isChecked());
            Toast.makeText(activity, (sw.isChecked() ? "Enabled: " : "Disabled: ") + recipe.title + "\nTap '⚡ Apply & Restart Photos' below to apply.", Toast.LENGTH_SHORT).show();
            onRefresh.run();
        });

        return card;
    }

    private static View createCuratedFlagRow(Activity activity, SharedPreferences prefs,
                                             CuratedFlag flag, Map<String, ?> all,
                                             Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int rPad = (int) (14 * density);
        row.setPadding(rPad, (int) (12 * density), rPad, (int) (12 * density));

        Object val = all.containsKey(flag.key) ? all.get(flag.key) : flag.defaultValue;
        boolean isBool = flag.isBoolean();
        boolean isActive = isBool && Boolean.TRUE.equals(val);

        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowLp.setMargins(0, 0, 0, (int) (8 * density));
        row.setLayoutParams(rowLp);
        row.setBackground(createCardDrawable(isActive, density));

        LinearLayout textCol = new LinearLayout(activity);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams colLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        textCol.setLayoutParams(colLp);

        TextView tvTitle = new TextView(activity);
        tvTitle.setText(flag.title);
        tvTitle.setTextSize(14);
        tvTitle.setTextColor(M3_TEXT_PRIMARY);
        tvTitle.setTypeface(null, Typeface.BOLD);
        textCol.addView(tvTitle);

        TextView tvDesc = new TextView(activity);
        tvDesc.setText(flag.description);
        tvDesc.setTextSize(12);
        tvDesc.setTextColor(M3_TEXT_SECONDARY);
        tvDesc.setPadding(0, (int) (2 * density), 0, (int) (2 * density));
        textCol.addView(tvDesc);

        TextView tvKey = new TextView(activity);
        tvKey.setText("ID: " + flag.key + " • Default: " + flag.defaultValue);
        tvKey.setTextSize(10);
        tvKey.setTextColor(0xFF8B9B97);
        textCol.addView(tvKey);
        row.addView(textCol);

        if (isBool) {
            Switch sw = new Switch(activity);
            sw.setChecked(isActive);
            row.addView(sw);

            // Whole-row tap toggles boolean!
            row.setClickable(true);
            row.setFocusable(true);
            row.setOnClickListener(v -> {
                boolean next = !sw.isChecked();
                sw.setChecked(next);
                prefs.edit().putBoolean(flag.key, next).commit();
                Toast.makeText(activity, "Updated: " + flag.title + "\nTap '⚡ Apply & Restart Photos' below to apply.", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            });

            sw.setOnClickListener(v -> {
                prefs.edit().putBoolean(flag.key, sw.isChecked()).commit();
                Toast.makeText(activity, "Updated: " + flag.title + "\nTap '⚡ Apply & Restart Photos' below to apply.", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            });

        } else {
            // Number / String flag with edit chip
            TextView valChip = new TextView(activity);
            valChip.setText(String.valueOf(val));
            valChip.setTextSize(13);
            valChip.setTypeface(null, Typeface.BOLD);
            valChip.setTextColor(M3_PRIMARY);
            valChip.setBackground(createRoundedDrawable(M3_PRIMARY_CONTAINER, 8 * density));
            int p = (int) (10 * density);
            valChip.setPadding(p, (int) (6 * density), p, (int) (6 * density));
            row.addView(valChip);

            row.setClickable(true);
            row.setFocusable(true);
            row.setOnClickListener(v -> showEditValueDialog(activity, prefs, flag.key, flag.title, val, onRefresh));
        }

        return row;
    }

    private static View createCustomFlagRow(Activity activity, SharedPreferences prefs,
                                            String key, Object val, Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int rPad = (int) (14 * density);
        row.setPadding(rPad, (int) (12 * density), rPad, (int) (12 * density));

        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowLp.setMargins(0, 0, 0, (int) (8 * density));
        row.setLayoutParams(rowLp);
        row.setBackground(createCardDrawable(false, density));

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
        textCol.addView(tvVal);
        row.addView(textCol);

        if (val instanceof Boolean) {
            Switch sw = new Switch(activity);
            sw.setChecked((Boolean) val);
            row.addView(sw);
            row.setClickable(true);
            row.setOnClickListener(v -> {
                boolean next = !sw.isChecked();
                sw.setChecked(next);
                prefs.edit().putBoolean(key, next).commit();
                Toast.makeText(activity, "Custom flag updated.\nTap '⚡ Apply & Restart Photos' below to apply.", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            });
            sw.setOnClickListener(v -> {
                prefs.edit().putBoolean(key, sw.isChecked()).commit();
                Toast.makeText(activity, "Custom flag updated.\nTap '⚡ Apply & Restart Photos' below to apply.", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            });
        } else {
            TextView valChip = new TextView(activity);
            valChip.setText(String.valueOf(val));
            valChip.setTextSize(13);
            valChip.setTypeface(null, Typeface.BOLD);
            valChip.setTextColor(M3_PRIMARY);
            valChip.setBackground(createRoundedDrawable(M3_PRIMARY_CONTAINER, 8 * density));
            int p = (int) (10 * density);
            valChip.setPadding(p, (int) (6 * density), p, (int) (6 * density));
            row.addView(valChip);
            row.setClickable(true);
            row.setOnClickListener(v -> showEditValueDialog(activity, prefs, key, key, val, onRefresh));
        }

        return row;
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Proper Options Menu (Modal Popup with Large 52dp Touch Rows)
    // ─────────────────────────────────────────────────────────────────────────

    private static void showProperOptionsMenu(Activity activity, SharedPreferences prefs, Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding((int) (16 * density), (int) (4 * density), (int) (16 * density), (int) (16 * density));

        class MenuItem {
            final String icon;
            final String title;
            final String subtitle;
            final Runnable action;
            MenuItem(String icon, String title, String subtitle, Runnable action) {
                this.icon = icon;
                this.title = title;
                this.subtitle = subtitle;
                this.action = action;
            }
        }

        List<MenuItem> items = new ArrayList<>();

        // 1. Sync Live Recommendations from Cloud
        items.add(new MenuItem("🔄", "Sync Live from GMS Flags", "Fetch latest recommendations from api.polodarb.com", () -> {
            Toast.makeText(activity, "Syncing from GMS Flags Cloud...", Toast.LENGTH_SHORT).show();
            GmsFlagsApiClient.syncLiveRecommendations(activity, prefs, (success, count) -> {
                activity.runOnUiThread(() -> {
                    if (success) {
                        Toast.makeText(activity, "✓ Synced " + count + " recommendations!", Toast.LENGTH_SHORT).show();
                        onRefresh.run();
                    } else {
                        Toast.makeText(activity, "Failed to connect to api.polodarb.com", Toast.LENGTH_SHORT).show();
                    }
                });
            });
        }));

        // 2. Reset / Apply Default Curated Flags
        int flagCount = PhotoFlagsRegistry.CURATED_FLAGS.size();
        items.add(new MenuItem("⚡", "Reset to Default (" + flagCount + " Flags)", "Re-apply all " + flagCount + " curated Morphe preset flags", () -> {
            PhotoFlagsRegistry.applyCuratedDefaults(prefs);
            Toast.makeText(activity, "✓ Re-applied all " + flagCount + " default curated flags", Toast.LENGTH_SHORT).show();
            onRefresh.run();
        }));

        // 3. Import Overrides
        items.add(new MenuItem("📥", "Import Overrides", "Load JSON presets, XML, or Key=Value pairs", () -> {
            showImportDialog(activity, prefs, onRefresh);
        }));

        // 4. Export Overrides
        items.add(new MenuItem("📤", "Export Overrides", "Copy current active flags to clipboard as JSON", () -> {
            showExportDialog(activity, prefs);
        }));

        // 5. Clear All Custom Overrides
        items.add(new MenuItem("🗑️", "Clear All Custom Overrides", "Wipe custom overrides and return to 26 defaults", () -> {
            prefs.edit().remove(CUSTOM_FLAGS_KEY).apply();
            PhotoFlagsRegistry.applyAll26Defaults(prefs);
            Toast.makeText(activity, "Cleared custom overrides; 26 defaults active.", Toast.LENGTH_SHORT).show();
            onRefresh.run();
        }));

        Dialog menuDialog = createM3Dialog(activity, "⚙️ Flag Options", list);

        for (MenuItem item : items) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            int rPad = (int) (14 * density);
            row.setPadding(rPad, (int) (12 * density), rPad, (int) (12 * density));
            row.setBackground(createCardDrawable(false, density));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.setMargins(0, 0, 0, (int) (8 * density));
            row.setLayoutParams(lp);

            TextView tvIcon = new TextView(activity);
            tvIcon.setText(item.icon);
            tvIcon.setTextSize(20);
            tvIcon.setPadding(0, 0, (int) (14 * density), 0);
            row.addView(tvIcon);

            LinearLayout col = new LinearLayout(activity);
            col.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            col.setLayoutParams(cLp);

            TextView tvT = new TextView(activity);
            tvT.setText(item.title);
            tvT.setTextSize(15);
            tvT.setTextColor(M3_TEXT_PRIMARY);
            tvT.setTypeface(null, Typeface.BOLD);
            col.addView(tvT);

            TextView tvS = new TextView(activity);
            tvS.setText(item.subtitle);
            tvS.setTextSize(12);
            tvS.setTextColor(M3_TEXT_SECONDARY);
            tvS.setPadding(0, (int) (2 * density), 0, 0);
            col.addView(tvS);
            row.addView(col);

            row.setClickable(true);
            row.setFocusable(true);
            row.setOnClickListener(v -> {
                menuDialog.dismiss();
                item.action.run();
            });

            list.addView(row);
        }

        menuDialog.show();
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Import, Export & Edit Sub-Dialogs
    // ─────────────────────────────────────────────────────────────────────────

    private static void showImportDialog(Activity activity, SharedPreferences prefs, Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        TextView tvHelp = new TextView(activity);
        tvHelp.setText("Paste JSON preset, GMS-Flags XML, or Key=Value pairs:");
        tvHelp.setTextSize(12);
        tvHelp.setTextColor(M3_TEXT_SECONDARY);
        tvHelp.setPadding(0, 0, 0, (int) (8 * density));
        layout.addView(tvHelp);

        EditText etInput = new EditText(activity);
        etInput.setHint("e.g. {\"45705305\": true, \"45762698\": 2}");
        etInput.setTextSize(13);
        etInput.setTextColor(M3_TEXT_PRIMARY);
        etInput.setHintTextColor(M3_TEXT_SECONDARY);
        etInput.setBackground(createRoundedDrawable(0xFFEAEFEB, 12 * density));
        int pad = (int) (12 * density);
        etInput.setPadding(pad, pad, pad, pad);
        etInput.setMinLines(5);
        etInput.setMaxLines(10);
        etInput.setGravity(Gravity.TOP);
        layout.addView(etInput);

        Dialog dialog = createM3ActionDialog(activity, "📥 Import Overrides", layout, "Import", () -> {
            String text = etInput.getText().toString().trim();
            if (!text.isEmpty()) {
                int count = importFlagsUniversal(prefs, text);
                Toast.makeText(activity, "✓ Imported " + count + " flags", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            }
        });
        dialog.show();
    }

    private static int importFlagsUniversal(SharedPreferences prefs, String content) {
        int count = 0;
        SharedPreferences.Editor editor = prefs.edit();
        Set<String> customKeys = new HashSet<>(prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet()));

        try {
            // 1. Try JSON
            if (content.startsWith("{")) {
                JSONObject json = new JSONObject(content);
                Iterator<String> keys = json.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    if (k.startsWith("_")) continue;
                    Object v = json.get(k);
                    applyEntry(editor, k, v);
                    customKeys.add(k);
                    count++;
                }
                editor.putStringSet(CUSTOM_FLAGS_KEY, customKeys).apply();
                return count;
            }

            // 2. Try XML
            if (content.contains("<flag")) {
                Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder()
                        .parse(new InputSource(new StringReader(content)));
                NodeList flags = doc.getElementsByTagName("flag");
                for (int i = 0; i < flags.getLength(); i++) {
                    Element el = (Element) flags.item(i);
                    String name = el.getAttribute("name");
                    String type = el.getAttribute("type");
                    String value = el.getAttribute("value");
                    if (name.isEmpty()) continue;

                    if ("boolean".equalsIgnoreCase(type)) {
                        editor.putBoolean(name, Boolean.parseBoolean(value));
                    } else if ("long".equalsIgnoreCase(type) || "int".equalsIgnoreCase(type)) {
                        try { editor.putLong(name, Long.parseLong(value)); }
                        catch (Exception ex) { editor.putLong(name, 1L); }
                    } else {
                        editor.putString(name, value);
                    }
                    customKeys.add(name);
                    count++;
                }
                editor.putStringSet(CUSTOM_FLAGS_KEY, customKeys).apply();
                return count;
            }

            // 3. Try Key=Value lines
            String[] lines = content.split("\n");
            for (String line : lines) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("#")) continue;
                String[] parts = line.split("=", 2);
                if (parts.length == 2) {
                    String k = parts[0].trim();
                    String v = parts[1].trim();
                    if (v.equalsIgnoreCase("true") || v.equalsIgnoreCase("false")) {
                        editor.putBoolean(k, Boolean.parseBoolean(v));
                    } else {
                        try { editor.putLong(k, Long.parseLong(v)); }
                        catch (Exception ex) { editor.putString(k, v); }
                    }
                    customKeys.add(k);
                    count++;
                }
            }
            editor.putStringSet(CUSTOM_FLAGS_KEY, customKeys).apply();
        } catch (Exception e) {
            Logger.printException(() -> "Import failed", e);
        }
        return count;
    }

    private static void showExportDialog(Activity activity, SharedPreferences prefs) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        JSONObject json = new JSONObject();
        try {
            Map<String, ?> all = prefs.getAll();
            for (CuratedFlag f : PhotoFlagsRegistry.CURATED_FLAGS) {
                if (all.containsKey(f.key)) {
                    json.put(f.key, all.get(f.key));
                }
            }
            Set<String> custom = prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet());
            for (String ck : custom) {
                if (all.containsKey(ck)) {
                    json.put(ck, all.get(ck));
                }
            }
        } catch (Exception ignored) {}

        String jsonStr = json.toString();

        EditText etPreview = new EditText(activity);
        etPreview.setText(jsonStr);
        etPreview.setTextSize(12);
        etPreview.setTextColor(M3_TEXT_PRIMARY);
        etPreview.setBackground(createRoundedDrawable(0xFFEAEFEB, 12 * density));
        int pad = (int) (12 * density);
        etPreview.setPadding(pad, pad, pad, pad);
        etPreview.setMinLines(5);
        etPreview.setMaxLines(8);
        etPreview.setFocusable(false);
        layout.addView(etPreview);

        Dialog dialog = createM3ActionDialog(activity, "📤 Export Overrides", layout, "Copy to Clipboard", () -> {
            ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("Photos Flags", jsonStr));
                Toast.makeText(activity, "✓ Copied flags to clipboard!", Toast.LENGTH_SHORT).show();
            }
        });
        dialog.show();
    }

    private static void showAddCustomFlagDialog(Activity activity, SharedPreferences prefs, Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        EditText etKey = new EditText(activity);
        etKey.setHint("Flag ID (e.g. 45705305)");
        etKey.setTextSize(14);
        etKey.setTextColor(M3_TEXT_PRIMARY);
        etKey.setBackground(createRoundedDrawable(0xFFEAEFEB, 10 * density));
        int pad = (int) (10 * density);
        etKey.setPadding(pad, pad, pad, pad);
        layout.addView(etKey);

        EditText etVal = new EditText(activity);
        etVal.setHint("Value (e.g. true, false, or 2)");
        etVal.setTextSize(14);
        etVal.setTextColor(M3_TEXT_PRIMARY);
        etVal.setBackground(createRoundedDrawable(0xFFEAEFEB, 10 * density));
        etVal.setPadding(pad, pad, pad, pad);
        LinearLayout.LayoutParams vLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        vLp.setMargins(0, (int) (8 * density), 0, 0);
        etVal.setLayoutParams(vLp);
        layout.addView(etVal);

        Dialog dialog = createM3ActionDialog(activity, "➕ Add Custom Flag", layout, "Save", () -> {
            String k = etKey.getText().toString().trim();
            String v = etVal.getText().toString().trim();
            if (!k.isEmpty() && !v.isEmpty()) {
                SharedPreferences.Editor ed = prefs.edit();
                if (v.equalsIgnoreCase("true") || v.equalsIgnoreCase("false")) {
                    ed.putBoolean(k, Boolean.parseBoolean(v));
                } else {
                    try { ed.putLong(k, Long.parseLong(v)); }
                    catch (Exception ex) { ed.putString(k, v); }
                }
                Set<String> custom = new HashSet<>(prefs.getStringSet(CUSTOM_FLAGS_KEY, Collections.emptySet()));
                custom.add(k);
                ed.putStringSet(CUSTOM_FLAGS_KEY, custom).apply();
                Toast.makeText(activity, "✓ Saved custom flag", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            }
        });
        dialog.show();
    }

    private static void showEditValueDialog(Activity activity, SharedPreferences prefs,
                                            String key, String title, Object currentVal,
                                            Runnable onRefresh) {
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (18 * density);
        layout.setPadding(p, 0, p, (int) (8 * density));

        TextView tvDesc = new TextView(activity);
        tvDesc.setText("Enter numeric or text value for:\n" + title);
        tvDesc.setTextSize(13);
        tvDesc.setTextColor(M3_TEXT_SECONDARY);
        tvDesc.setPadding(0, 0, 0, (int) (8 * density));
        layout.addView(tvDesc);

        EditText etVal = new EditText(activity);
        etVal.setText(String.valueOf(currentVal));
        etVal.setTextSize(14);
        etVal.setTextColor(M3_TEXT_PRIMARY);
        etVal.setBackground(createRoundedDrawable(0xFFEAEFEB, 10 * density));
        int pad = (int) (10 * density);
        etVal.setPadding(pad, pad, pad, pad);
        layout.addView(etVal);

        Dialog dialog = createM3ActionDialog(activity, "✏️ Edit Value", layout, "Save", () -> {
            String v = etVal.getText().toString().trim();
            if (!v.isEmpty()) {
                SharedPreferences.Editor ed = prefs.edit();
                try {
                    ed.putLong(key, Long.parseLong(v));
                } catch (Exception ex) {
                    ed.putString(key, v);
                }
                ed.commit();
                Toast.makeText(activity, "Updated " + title + "\nTap '⚡ Apply & Restart Photos' below to apply.", Toast.LENGTH_SHORT).show();
                onRefresh.run();
            }
        });
        dialog.show();
    }

    // ─────────────────────────────────────────────────────────────────────────
    // Helpers & UI Components
    // ─────────────────────────────────────────────────────────────────────────

    private static View createHeaderIconButton(Activity activity, String icon, int sizePx) {
        TextView tv = new TextView(activity);
        tv.setText(icon);
        tv.setTextSize(18);
        tv.setGravity(Gravity.CENTER);
        tv.setTextColor(M3_TEXT_PRIMARY);
        tv.setClickable(true);
        tv.setFocusable(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(sizePx, sizePx);
        tv.setLayoutParams(lp);
        return tv;
    }

    private static Button createTabButton(Activity activity, String text, boolean selected) {
        float density = activity.getResources().getDisplayMetrics().density;
        Button b = new Button(activity);
        b.setText(text);
        b.setTextSize(13);
        b.setTypeface(null, Typeface.BOLD);
        updateTabButtonState(b, selected);
        return b;
    }

    private static void updateTabButtonState(Button b, boolean selected) {
        float density = b.getResources().getDisplayMetrics().density;
        b.setTextColor(selected ? M3_ON_PRIMARY : M3_TEXT_SECONDARY);
        b.setBackground(createRoundedDrawable(selected ? M3_PRIMARY : 0xFFE1E8E6, 22 * density));
    }

    private static GradientDrawable createCardDrawable(boolean active, float density) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(16 * density);
        gd.setColor(active ? M3_CARD_ACTIVE : M3_CARD);
        gd.setStroke(active ? (int) (1.5f * density) : (int) (1 * density),
                active ? M3_PRIMARY : M3_OUTLINE);
        return gd;
    }

    private static GradientDrawable createRoundedDrawable(int color, float radiusPx) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(radiusPx);
        gd.setColor(color);
        return gd;
    }

    private static Dialog createM3Dialog(Activity activity, String title, View customView) {
        float density = activity.getResources().getDisplayMetrics().density;
        Dialog d = new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackground(createRoundedDrawable(M3_SURFACE, 24 * density));

        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        int pad = (int) (18 * density);
        header.setPadding(pad, pad, pad, (int) (8 * density));

        TextView tvT = new TextView(activity);
        tvT.setText(title);
        tvT.setTextSize(17);
        tvT.setTextColor(M3_TEXT_PRIMARY);
        tvT.setTypeface(null, Typeface.BOLD);
        header.addView(tvT, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView btnClose = new TextView(activity);
        btnClose.setText("✕");
        btnClose.setTextSize(16);
        btnClose.setTextColor(M3_TEXT_SECONDARY);
        btnClose.setTypeface(null, Typeface.BOLD);
        btnClose.setPadding((int) (8 * density), 0, 0, 0);
        btnClose.setOnClickListener(v -> d.dismiss());
        header.addView(btnClose);
        root.addView(header);

        if (customView != null) {
            root.addView(customView);
        }

        d.setContentView(root);
        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout(Math.min((int) (screenWidth * 0.90f), (int) (460 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
            w.setGravity(Gravity.CENTER);
        }
        return d;
    }

    private static Dialog createM3ActionDialog(Activity activity, String title, View customView,
                                               String actionText, Runnable onAction) {
        float density = activity.getResources().getDisplayMetrics().density;
        Dialog d = createM3Dialog(activity, title, customView);

        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.END);
        int p = (int) (16 * density);
        actions.setPadding(p, (int) (6 * density), p, p);

        Button btnCancel = new Button(activity);
        btnCancel.setText("Cancel");
        btnCancel.setTextSize(13);
        btnCancel.setTextColor(M3_TEXT_SECONDARY);
        btnCancel.setBackground(createRoundedDrawable(0xFFEAEFEB, 18 * density));
        btnCancel.setOnClickListener(v -> d.dismiss());
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, (int) (40 * density));
        cLp.setMargins(0, 0, (int) (8 * density), 0);
        actions.addView(btnCancel, cLp);

        Button btnOk = new Button(activity);
        btnOk.setText(actionText);
        btnOk.setTextSize(13);
        btnOk.setTypeface(null, Typeface.BOLD);
        btnOk.setTextColor(M3_ON_PRIMARY);
        btnOk.setBackground(createRoundedDrawable(M3_PRIMARY, 18 * density));
        btnOk.setOnClickListener(v -> {
            d.dismiss();
            if (onAction != null) onAction.run();
        });
        actions.addView(btnOk, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, (int) (40 * density)));

        ((ViewGroup) d.findViewById(android.R.id.content)).getChildAt(0);
        ((LinearLayout) ((ViewGroup) d.findViewById(android.R.id.content)).getChildAt(0)).addView(actions);
        return d;
    }

    private static void renderEmptyMessage(Activity activity, LinearLayout container, String msg, float density) {
        TextView tv = new TextView(activity);
        tv.setText(msg);
        tv.setTextSize(13);
        tv.setTextColor(M3_TEXT_SECONDARY);
        tv.setPadding(0, (int) (40 * density), 0, (int) (40 * density));
        tv.setGravity(Gravity.CENTER);
        container.addView(tv);
    }

    private static boolean isRecipeActive(SharedPreferences prefs, RecommendationRecipe recipe) {
        Map<String, ?> all = prefs.getAll();
        for (Map.Entry<String, Object> e : recipe.flags.entrySet()) {
            Object current = all.get(e.getKey());
            if (current == null) {
                CuratedFlag cf = PhotoFlagsRegistry.FLAG_MAP.get(e.getKey());
                if (cf != null) {
                    current = cf.defaultValue;
                } else {
                    return false;
                }
            }
            if (current instanceof Boolean && e.getValue() instanceof Boolean) {
                if (!((Boolean) current).equals(e.getValue())) {
                    return false;
                }
            } else if (current instanceof Number && e.getValue() instanceof Number) {
                if (((Number) current).longValue() != ((Number) e.getValue()).longValue()) {
                    return false;
                }
            } else if (!String.valueOf(current).equalsIgnoreCase(String.valueOf(e.getValue()))) {
                return false;
            }
        }
        return true;
    }

    private static void toggleRecipe(SharedPreferences prefs, RecommendationRecipe recipe, boolean enable) {
        SharedPreferences.Editor editor = prefs.edit();
        for (Map.Entry<String, Object> e : recipe.flags.entrySet()) {
            String key = e.getKey();
            Object val = e.getValue();
            if (enable) {
                applyEntry(editor, key, val);
            } else {
                if (val instanceof Boolean) {
                    editor.putBoolean(key, false);
                } else if (val instanceof Number) {
                    editor.putLong(key, 0L);
                } else {
                    editor.putString(key, "");
                }
            }
        }
        editor.commit();
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

    private static void restartApp(Activity activity) {
        try {
            Intent intent = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
            if (intent != null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                activity.startActivity(intent);
            }
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(0);
        } catch (Throwable t) {
            Logger.printException(() -> "Error restarting Photos app", t);
        }
    }
}
