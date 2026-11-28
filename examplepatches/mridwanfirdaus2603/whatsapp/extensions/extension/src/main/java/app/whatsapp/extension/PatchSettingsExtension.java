package app.whatsapp.extension;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.CompoundButton;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Runtime extension for WhatsApp Clean Experience Patches.
 *
 * Provides:
 * 1. Persistent SharedPreferences configuration for runtime toggles.
 * 2. AB-Prop overrides for Meta AI and Promotional/Ads flags.
 * 3. Presentation-layer Meta AI UI cleanup (FAB + search hint).
 * 4. Native-looking "Pengaturan Patch" entry in WhatsApp Settings and dedicated screen.
 *
 * Independent community project. Not affiliated with WhatsApp, Meta, or Morphe.
 */
@SuppressWarnings("unused")
public class PatchSettingsExtension {

    private static final String PREFS_NAME = "whatsapp_clean_experience_prefs";
    private static final String KEY_HIDE_PROMOTIONAL = "hide_promotional";
    private static final String KEY_HIDE_META_AI = "hide_meta_ai";
    private static final String KEY_STATUS_DOWNLOADER = "status_downloader";
    private static final String KEY_MESSAGE_ARCHIVE = "message_archive";
    private static final String SETTINGS_ROW_TAG = "morphe_patch_settings_entry";

    private static final String PATCH_VERSION = "1.1.0";
    private static final String PROJECT_NAME = "WhatsApp Clean Experience";
    private static final String PROJECT_DESC = "Kustomisasi antarmuka WhatsApp melalui Morphe patches.";

    private static volatile Context appContext;

    // Verified Meta AI AB-Prop boolean IDs (false = disabled/hidden)
    private static final Set<Integer> META_AI_BOOLEAN_PROPS = new HashSet<>(Arrays.asList(
            7413, 8025, 6251, 8026, 14886, 16358, 17382,
            11827, 10034, 12048, 13054, 14210, 12595, 12597
    ));

    // Verified Promotional/Ads AB-Prop boolean IDs
    private static final int PROP_ADS_ENABLE_OPT_OUT = 22904; // true
    private static final int PROP_ADS_SHOW_STATUS_ADS = 14306; // false

    // Verified Meta AI AB-Prop integer ID
    private static final int PROP_META_AI_INT = 15535; // 0

    // Runtime hook status flags for accurate reporting in Section C
    private static volatile boolean propsBooleanHooked = false;
    private static volatile boolean propsIntHooked = false;
    private static volatile boolean settingsHooked = false;

    public static void markPropsBooleanHooked() {
        propsBooleanHooked = true;
    }

    public static void markPropsIntHooked() {
        propsIntHooked = true;
    }

    private static Context getAppContext() {
        if (appContext != null) return appContext;
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Application app = (Application) at.getMethod("currentApplication").invoke(null);
            if (app != null) {
                appContext = app.getApplicationContext();
            }
        } catch (Throwable ignored) {
        }
        return appContext;
    }

    private static SharedPreferences getPrefs(Context ctx) {
        Context c = ctx != null ? ctx.getApplicationContext() : getAppContext();
        if (c == null) return null;
        return c.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public static boolean isHidePromotionalEnabled() {
        SharedPreferences prefs = getPrefs(null);
        return prefs == null || prefs.getBoolean(KEY_HIDE_PROMOTIONAL, true);
    }

    public static boolean isHideMetaAIEnabled() {
        SharedPreferences prefs = getPrefs(null);
        return prefs == null || prefs.getBoolean(KEY_HIDE_META_AI, true);
    }

    public static boolean isStatusDownloaderEnabled() {
        SharedPreferences prefs = getPrefs(null);
        return prefs == null || prefs.getBoolean(KEY_STATUS_DOWNLOADER, true);
    }

    public static boolean isMessageArchiveEnabled() {
        SharedPreferences prefs = getPrefs(null);
        return prefs == null || prefs.getBoolean(KEY_MESSAGE_ARCHIVE, true);
    }

    public static void onStatusPlaybackResume(final Activity activity) {
        if (activity != null) appContext = activity.getApplicationContext();
        StatusDownloaderHelper.onStatusPlaybackResume(activity);
    }

    public static void onStatusFragmentResume(final Object fragment) {
        StatusDownloaderHelper.onStatusFragmentResume(fragment);
    }

    public static void onConversationResume(final Activity activity) {
        if (activity != null) appContext = activity.getApplicationContext();
        ArchiveManager.onConversationResume(activity);
    }

    /**
     * Called from WhatsApp's boolean AB-Prop resolver ("Unknown BooleanField").
     *
     * @return -1 if not overridden, 0 to force false, 1 to force true.
     */
    public static int overrideBooleanProp(int propId) {
        propsBooleanHooked = true;
        if (META_AI_BOOLEAN_PROPS.contains(propId) && isHideMetaAIEnabled()) {
            return 0;
        }
        if (isHidePromotionalEnabled()) {
            if (propId == PROP_ADS_ENABLE_OPT_OUT) return 1;
            if (propId == PROP_ADS_SHOW_STATUS_ADS) return 0;
        }
        return -1;
    }

    /**
     * Called from WhatsApp's integer AB-Prop resolver ("Unknown IntField").
     *
     * @return Integer.MIN_VALUE if not overridden, otherwise the forced integer value.
     */
    public static int overrideIntProp(int propId) {
        propsIntHooked = true;
        if (propId == PROP_META_AI_INT && isHideMetaAIEnabled()) {
            return 0;
        }
        return Integer.MIN_VALUE;
    }

    /**
     * Called from WhatsApp's AdVerify method ("is_wfal_paused") when checking WAMO ads.
     */
    public static boolean shouldPauseWamoAds(Object enumArg) {
        if (!isHidePromotionalEnabled() || enumArg == null) return false;
        return "WAMO".equals(enumArg.toString());
    }

    /**
     * Called from HomeActivity.onResume() to hide Meta AI presentation-layer entry points
     * while preserving normal WhatsApp search and messaging.
     */
    public static void onHomeActivityResume(final Activity activity) {
        if (activity == null) return;
        appContext = activity.getApplicationContext();
        if (!isHideMetaAIEnabled()) return;

        final View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
        if (decor == null) return;

        decor.post(() -> hideMetaAIViews(decor));
    }

    private static void hideMetaAIViews(View root) {
        if (root == null) return;
        try {
            CharSequence desc = root.getContentDescription();
            if (desc != null) {
                String d = desc.toString().toLowerCase();
                if (d.contains("meta ai")) {
                    root.setVisibility(View.GONE);
                    return;
                }
            }

            if (root instanceof TextView) {
                TextView tv = (TextView) root;
                CharSequence hint = tv.getHint();
                if (hint != null && hint.toString().toLowerCase().contains("meta ai")) {
                    String lower = hint.toString().toLowerCase();
                    tv.setHint(lower.contains("cari") ? "Cari..." : "Search...");
                }
                CharSequence text = tv.getText();
                if (text != null && text.toString().toLowerCase().contains("meta ai")) {
                    String lower = text.toString().toLowerCase();
                    if (lower.contains("tanya meta ai") || lower.contains("ask meta ai")) {
                        tv.setText(lower.contains("cari") ? "Cari..." : "Search...");
                    }
                }
            }

            if (root instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) root;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    hideMetaAIViews(vg.getChildAt(i));
                }
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Called from WhatsApp's Settings Activity onCreate/onResume.
     * Inserts "Pengaturan Patch" between "Bahasa Aplikasi" and "Bantuan dan masukan"
     * using the exact styling of existing sibling rows.
     */
    public static void injectSettingsEntry(final Activity activity) {
        if (activity == null) return;
        appContext = activity.getApplicationContext();
        settingsHooked = true;

        final View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
        if (decor == null) return;

        decor.post(() -> tryInjectSettingsRow(activity, decor, 0));
    }

    private static void tryInjectSettingsRow(final Activity activity, final View decor, final int attempt) {
        try {
            if (decor.findViewWithTag(SETTINGS_ROW_TAG) != null) return;

            TextView anchorTitle = findTextViewByText(decor,
                    "Bahasa Aplikasi", "App language", "Bantuan dan masukan", "Help");
            if (anchorTitle == null) {
                if (attempt < 5) {
                    decor.postDelayed(() -> tryInjectSettingsRow(activity, decor, attempt + 1), 150);
                }
                return;
            }

            boolean insertBeforeAnchor = anchorTitle.getText() != null &&
                    (anchorTitle.getText().toString().equalsIgnoreCase("Bantuan dan masukan")
                            || anchorTitle.getText().toString().equalsIgnoreCase("Help"));

            // Walk up to find the clickable row and its LinearLayout container
            View row = anchorTitle;
            ViewGroup parentList = null;
            while (row.getParent() instanceof ViewGroup) {
                ViewGroup p = (ViewGroup) row.getParent();
                if (p instanceof LinearLayout && p.getChildCount() >= 4) {
                    parentList = p;
                    break;
                }
                row = p;
            }

            if (parentList == null) return;

            int anchorIndex = parentList.indexOfChild(row);
            int insertIndex = insertBeforeAnchor ? anchorIndex : anchorIndex + 1;

            final View siblingRow = row;
            View patchRow = buildMatchingSettingsRow(activity, siblingRow);
            patchRow.setTag(SETTINGS_ROW_TAG);
            patchRow.setOnClickListener(v -> showPatchSettingsScreen(activity, siblingRow));

            parentList.addView(patchRow, insertIndex);
        } catch (Throwable ignored) {
        }
    }

    private static TextView findTextViewByText(View root, String... targets) {
        if (root instanceof TextView) {
            CharSequence text = ((TextView) root).getText();
            if (text != null) {
                String s = text.toString().trim();
                for (String t : targets) {
                    if (s.equalsIgnoreCase(t)) {
                        return (TextView) root;
                    }
                }
            }
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                TextView found = findTextViewByText(vg.getChildAt(i), targets);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static View buildMatchingSettingsRow(Activity activity, View siblingRow) {
        // Sample styling from the sibling row
        ImageView siblingIcon = findFirstImageView(siblingRow);
        TextView[] siblingTexts = findTwoTextViews(siblingRow);
        TextView siblingTitle = siblingTexts[0];
        TextView siblingSubtitle = siblingTexts[1];

        // Clone the sibling row's exact structure rather than building from scratch.
        // WhatsApp settings rows use complex custom ViewGroups; we replicate the
        // measurable geometry of the sibling so our row is pixel-aligned.

        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setClickable(true);
        row.setFocusable(true);

        // Copy layout params from sibling
        if (siblingRow.getLayoutParams() != null) {
            ViewGroup.LayoutParams slp = siblingRow.getLayoutParams();
            ViewGroup.MarginLayoutParams rowParams = new ViewGroup.MarginLayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    slp.height > 0 ? slp.height : ViewGroup.LayoutParams.WRAP_CONTENT
            );
            if (slp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams smp = (ViewGroup.MarginLayoutParams) slp;
                rowParams.setMargins(smp.leftMargin, smp.topMargin, smp.rightMargin, smp.bottomMargin);
            }
            row.setLayoutParams(rowParams);
        } else {
            row.setLayoutParams(new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            ));
        }

        // Copy exact padding from sibling
        row.setPadding(
                siblingRow.getPaddingLeft(),
                siblingRow.getPaddingTop(),
                siblingRow.getPaddingRight(),
                siblingRow.getPaddingBottom()
        );
        if (siblingRow.getMinimumHeight() > 0) {
            row.setMinimumHeight(siblingRow.getMinimumHeight());
        } else {
            row.setMinimumHeight(dpToPx(activity, 64));
        }

        // Native ripple touch feedback
        TypedValue outValue = new TypedValue();
        if (activity.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, outValue, true)) {
            row.setBackgroundResource(outValue.resourceId);
        }

        // --- Icon ---
        // Determine icon dimensions and margins from the sibling's ImageView.
        // If the sibling icon can't be found, use hardcoded values that match
        // WhatsApp's native settings rows (24dp icon, ~16dp start margin, ~24dp end margin).
        int iconSize;
        int iconMarginStart;
        int iconMarginEnd;
        int iconMarginTop = 0;
        int iconMarginBottom = 0;

        if (siblingIcon != null && siblingIcon.getLayoutParams() != null) {
            ViewGroup.LayoutParams ilp = siblingIcon.getLayoutParams();
            iconSize = ilp.width > 0 ? ilp.width : dpToPx(activity, 24);
            if (ilp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams imp = (ViewGroup.MarginLayoutParams) ilp;
                iconMarginStart = Build.VERSION.SDK_INT >= 17 ? imp.getMarginStart() : imp.leftMargin;
                iconMarginEnd = Build.VERSION.SDK_INT >= 17 ? imp.getMarginEnd() : imp.rightMargin;
                iconMarginTop = imp.topMargin;
                iconMarginBottom = imp.bottomMargin;
                // If margins are 0, the padding might be on a wrapper; fall back to sensible defaults
                if (iconMarginStart == 0 && iconMarginEnd == 0) {
                    // Measure distance: the icon's left edge relative to the row
                    int[] iconLoc = new int[2];
                    int[] rowLoc = new int[2];
                    siblingIcon.getLocationInWindow(iconLoc);
                    siblingRow.getLocationInWindow(rowLoc);
                    int measuredStart = iconLoc[0] - rowLoc[0];
                    if (measuredStart > 0) {
                        iconMarginStart = measuredStart;
                    } else {
                        iconMarginStart = dpToPx(activity, 20);
                    }
                    // Measure gap between icon right edge and sibling title left edge
                    if (siblingTitle != null) {
                        int[] titleLoc = new int[2];
                        siblingTitle.getLocationInWindow(titleLoc);
                        int measuredEnd = titleLoc[0] - (iconLoc[0] + siblingIcon.getWidth());
                        if (measuredEnd > 0) {
                            iconMarginEnd = measuredEnd;
                        } else {
                            iconMarginEnd = dpToPx(activity, 24);
                        }
                    } else {
                        iconMarginEnd = dpToPx(activity, 24);
                    }
                }
            } else {
                iconMarginStart = dpToPx(activity, 20);
                iconMarginEnd = dpToPx(activity, 24);
            }
        } else {
            // No sibling icon found — use hardcoded defaults matching WhatsApp native layout
            iconSize = dpToPx(activity, 24);
            iconMarginStart = dpToPx(activity, 20);
            iconMarginEnd = dpToPx(activity, 24);
        }

        ImageView iconView = new ImageView(activity);
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(iconSize, iconSize);
        if (Build.VERSION.SDK_INT >= 17) {
            iconParams.setMarginStart(iconMarginStart);
            iconParams.setMarginEnd(iconMarginEnd);
        } else {
            iconParams.leftMargin = iconMarginStart;
            iconParams.rightMargin = iconMarginEnd;
        }
        iconParams.topMargin = iconMarginTop;
        iconParams.bottomMargin = iconMarginBottom;
        iconView.setLayoutParams(iconParams);

        int iconColor = siblingSubtitle != null ? siblingSubtitle.getCurrentTextColor() : 0xFF8696A0;
        iconView.setImageDrawable(new SlidersIconDrawable(iconColor));
        row.addView(iconView);

        // --- Text column ---
        LinearLayout textCol = new LinearLayout(activity);
        textCol.setOrientation(LinearLayout.VERTICAL);
        textCol.setGravity(Gravity.CENTER_VERTICAL);
        textCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView titleView = new TextView(activity);
        titleView.setText("Pengaturan Patch");
        if (siblingTitle != null) {
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_PX, siblingTitle.getTextSize());
            titleView.setTypeface(siblingTitle.getTypeface());
            titleView.setTextColor(siblingTitle.getTextColors());
            titleView.setPadding(siblingTitle.getPaddingLeft(), 0, siblingTitle.getPaddingRight(), 0);
        } else {
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        }
        textCol.addView(titleView);

        TextView subtitleView = new TextView(activity);
        subtitleView.setText("Kelola fitur dan kustomisasi patch");
        if (siblingSubtitle != null) {
            subtitleView.setTextSize(TypedValue.COMPLEX_UNIT_PX, siblingSubtitle.getTextSize());
            subtitleView.setTypeface(siblingSubtitle.getTypeface());
            subtitleView.setTextColor(siblingSubtitle.getTextColors());
            subtitleView.setPadding(siblingSubtitle.getPaddingLeft(), 0, siblingSubtitle.getPaddingRight(), 0);
        } else {
            subtitleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        }
        LinearLayout.LayoutParams subParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        subParams.topMargin = dpToPx(activity, 2);
        subtitleView.setLayoutParams(subParams);
        textCol.addView(subtitleView);

        row.addView(textCol);
        return row;
    }

    private static ImageView findFirstImageView(View root) {
        if (root instanceof ImageView) return (ImageView) root;
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                ImageView iv = findFirstImageView(vg.getChildAt(i));
                if (iv != null) return iv;
            }
        }
        return null;
    }

    private static TextView[] findTwoTextViews(View root) {
        TextView[] result = new TextView[2];
        collectTwoTextViews(root, result);
        return result;
    }

    private static void collectTwoTextViews(View root, TextView[] out) {
        if (out[0] != null && out[1] != null) return;
        if (root instanceof TextView) {
            if (out[0] == null) out[0] = (TextView) root;
            else out[1] = (TextView) root;
            return;
        }
        if (root instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) root;
            for (int i = 0; i < vg.getChildCount(); i++) {
                collectTwoTextViews(vg.getChildAt(i), out);
            }
        }
    }

    /**
     * Opens the dedicated native-styled "Pengaturan Patch" screen.
     */
    public static void showPatchSettingsScreen(final Activity activity, final View sampleRow) {
        try {
            final Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

            // Sample native colors from the current WhatsApp Settings screen
            TextView[] sampleTexts = sampleRow != null ? findTwoTextViews(sampleRow) : new TextView[2];
            int primaryTextColor = sampleTexts[0] != null ? sampleTexts[0].getCurrentTextColor() : resolveThemeColor(activity, android.R.attr.textColorPrimary, 0xFFE9EDEF);
            int secondaryTextColor = sampleTexts[1] != null ? sampleTexts[1].getCurrentTextColor() : resolveThemeColor(activity, android.R.attr.textColorSecondary, 0xFF8696A0);
            int bgColor = resolveWindowBgColor(activity);
            int accentColor = resolveThemeColor(activity, android.R.attr.colorAccent, 0xFF25D366);
            int dividerColor = (secondaryTextColor & 0x00FFFFFF) | 0x26000000;

            LinearLayout root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(bgColor);
            root.setFitsSystemWindows(true);

            // Native-style Toolbar
            LinearLayout toolbar = new LinearLayout(activity);
            toolbar.setOrientation(LinearLayout.HORIZONTAL);
            toolbar.setGravity(Gravity.CENTER_VERTICAL);
            toolbar.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    dpToPx(activity, 56)
            ));
            toolbar.setPadding(dpToPx(activity, 4), 0, dpToPx(activity, 16), 0);

            ImageButton backBtn = new ImageButton(activity);
            backBtn.setLayoutParams(new LinearLayout.LayoutParams(dpToPx(activity, 48), dpToPx(activity, 48)));
            backBtn.setBackgroundColor(0x00000000);
            backBtn.setImageDrawable(new BackArrowDrawable(primaryTextColor));
            backBtn.setContentDescription("Kembali");
            backBtn.setOnClickListener(v -> dialog.dismiss());
            toolbar.addView(backBtn);

            TextView toolbarTitle = new TextView(activity);
            toolbarTitle.setText("Pengaturan Patch");
            toolbarTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            toolbarTitle.setTypeface(Typeface.DEFAULT_BOLD);
            toolbarTitle.setTextColor(primaryTextColor);
            LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            titleParams.leftMargin = dpToPx(activity, 12);
            toolbarTitle.setLayoutParams(titleParams);
            toolbar.addView(toolbarTitle);

            root.addView(toolbar);
            addDivider(activity, root, dividerColor);

            ScrollView scroll = new ScrollView(activity);
            scroll.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));

            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            int pad = dpToPx(activity, 16);
            content.setPadding(pad, dpToPx(activity, 8), pad, pad);

            // SECTION A — PEMBERSIHAN IKLAN
            addSectionHeader(activity, content, "PEMBERSIHAN IKLAN", accentColor);
            addSwitchRow(
                    activity, content,
                    "Sembunyikan Elemen Promosi",
                    "Mengurangi tampilan elemen promosi dan iklan yang didukung.",
                    isHidePromotionalEnabled(),
                    primaryTextColor, secondaryTextColor,
                    (buttonView, isChecked) -> {
                        SharedPreferences prefs = getPrefs(activity);
                        if (prefs != null) {
                            prefs.edit().putBoolean(KEY_HIDE_PROMOTIONAL, isChecked).apply();
                        }
                        Toast.makeText(activity,
                                "Pengaturan disimpan. Mulai ulang WhatsApp untuk menerapkan perubahan.",
                                Toast.LENGTH_SHORT).show();
                    }
            );

            addDivider(activity, content, dividerColor);

            // SECTION B — META AI
            addSectionHeader(activity, content, "META AI", accentColor);
            addSwitchRow(
                    activity, content,
                    "Sembunyikan Meta AI",
                    "Menyembunyikan elemen antarmuka Meta AI yang didukung.",
                    isHideMetaAIEnabled(),
                    primaryTextColor, secondaryTextColor,
                    (buttonView, isChecked) -> {
                        SharedPreferences prefs = getPrefs(activity);
                        if (prefs != null) {
                            prefs.edit().putBoolean(KEY_HIDE_META_AI, isChecked).apply();
                        }
                        Toast.makeText(activity,
                                "Pengaturan disimpan. Mulai ulang WhatsApp untuk menerapkan perubahan.",
                                Toast.LENGTH_SHORT).show();
                    }
            );

            addDivider(activity, content, dividerColor);

            // SECTION C — DOWNLOAD STATUS
            addSectionHeader(activity, content, "DOWNLOAD STATUS", accentColor);
            addSwitchRow(
                    activity, content,
                    "Download Status",
                    "Simpan media Status yang diizinkan.",
                    isStatusDownloaderEnabled(),
                    primaryTextColor, secondaryTextColor,
                    (buttonView, isChecked) -> {
                        SharedPreferences prefs = getPrefs(activity);
                        if (prefs != null) {
                            prefs.edit().putBoolean(KEY_STATUS_DOWNLOADER, isChecked).apply();
                        }
                        Toast.makeText(activity,
                                "Pengaturan Download Status disimpan.",
                                Toast.LENGTH_SHORT).show();
                    }
            );

            addDivider(activity, content, dividerColor);

            // SECTION D — VIEW ONCE (informational only; no unlock switch)
            addSectionHeader(activity, content, "VIEW ONCE", accentColor);
            addInfoRow(
                    activity, content,
                    "View Once Privacy",
                    "Informasi dan dukungan media sesuai izin privasi.\n"
                            + "Media Sekali Lihat (View Once) tidak dapat disimpan atau dibuka ulang melalui patch ini demi menghormati kontrol privasi pengirim.",
                    primaryTextColor, secondaryTextColor
            );

            addDivider(activity, content, dividerColor);

            // SECTION E — MESSAGE AND MEDIA ARCHIVE
            addSectionHeader(activity, content, "MESSAGE AND MEDIA ARCHIVE", accentColor);
            addSwitchRow(
                    activity, content,
                    "Keep Messages & Media",
                    "Kelola arsip lokal pesan dan media.",
                    isMessageArchiveEnabled(),
                    primaryTextColor, secondaryTextColor,
                    (buttonView, isChecked) -> {
                        SharedPreferences prefs = getPrefs(activity);
                        if (prefs != null) {
                            prefs.edit().putBoolean(KEY_MESSAGE_ARCHIVE, isChecked).apply();
                        }
                        Toast.makeText(activity,
                                "Pengaturan Arsip Lokal disimpan.",
                                Toast.LENGTH_SHORT).show();
                    }
            );

            TextView manageArchiveBtn = new TextView(activity);
            manageArchiveBtn.setText("Kelola Arsip Lokal →");
            manageArchiveBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            manageArchiveBtn.setTypeface(Typeface.DEFAULT_BOLD);
            manageArchiveBtn.setTextColor(accentColor);
            manageArchiveBtn.setPadding(0, dpToPx(activity, 4), 0, dpToPx(activity, 12));
            manageArchiveBtn.setOnClickListener(v ->
                    ArchiveManager.showArchiveManagerDialog(
                            activity, bgColor, primaryTextColor, secondaryTextColor, accentColor));
            content.addView(manageArchiveBtn);

            addDivider(activity, content, dividerColor);

            // SECTION F — INFORMASI PATCH
            addSectionHeader(activity, content, "INFORMASI PATCH", accentColor);
            addInfoRow(activity, content, "Proyek", PROJECT_NAME, primaryTextColor, secondaryTextColor);
            addInfoRow(activity, content, "Deskripsi", PROJECT_DESC, primaryTextColor, secondaryTextColor);
            addInfoRow(activity, content, "Versi patch", PATCH_VERSION, primaryTextColor, secondaryTextColor);
            addInfoRow(activity, content, "Versi WhatsApp", getWhatsAppVersion(activity), primaryTextColor, secondaryTextColor);
            addInfoRow(activity, content, "Status kompatibilitas", getCompatibilityStatus(), primaryTextColor, secondaryTextColor);
            addInfoRow(activity, content, "Fitur yang didukung",
                    "Pembersihan UI promosi, Pembersihan UI Meta AI, Download Status, Keep Messages & Media, Pengaturan Patch",
                    primaryTextColor, secondaryTextColor);

            scroll.addView(content);
            root.addView(scroll);

            dialog.setContentView(root);
            if (dialog.getWindow() != null) {
                dialog.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                dialog.getWindow().setBackgroundDrawable(new ColorDrawable(bgColor));
            }
            dialog.show();
        } catch (Throwable ignored) {
        }
    }

    private static String getCompatibilityStatus() {
        if (propsBooleanHooked && settingsHooked) {
            return "Aktif (AB-Props & Settings terhubung)";
        } else if (settingsHooked) {
            return "Sebagian aktif (Settings terhubung; AB-Props belum terpicu)";
        }
        return "Terpasang";
    }

    private static int resolveWindowBgColor(Activity activity) {
        try {
            Drawable bg = activity.getWindow().getDecorView().getBackground();
            if (bg instanceof ColorDrawable) {
                return ((ColorDrawable) bg).getColor();
            }
        } catch (Throwable ignored) {
        }
        return resolveThemeColor(activity, android.R.attr.colorBackground, 0xFF0B141A);
    }

    private static int resolveThemeColor(Context context, int attr, int fallback) {
        TypedValue tv = new TypedValue();
        if (context.getTheme().resolveAttribute(attr, tv, true)) {
            if (tv.type >= TypedValue.TYPE_FIRST_COLOR_INT && tv.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return tv.data;
            }
        }
        return fallback;
    }

    private static void addSectionHeader(Context context, LinearLayout container, String title, int color) {
        TextView header = new TextView(context);
        header.setText(title);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setTextColor(color);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dpToPx(context, 12);
        params.bottomMargin = dpToPx(context, 8);
        header.setLayoutParams(params);
        container.addView(header);
    }

    private static void addSwitchRow(Context context, LinearLayout container,
                                     String title, String description, boolean initialChecked,
                                     int primaryColor, int secondaryColor,
                                     CompoundButton.OnCheckedChangeListener listener) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowParams.topMargin = dpToPx(context, 4);
        rowParams.bottomMargin = dpToPx(context, 12);
        row.setLayoutParams(rowParams);

        LinearLayout textCol = new LinearLayout(context);
        textCol.setOrientation(LinearLayout.VERTICAL);
        textCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        titleView.setTextColor(primaryColor);
        textCol.addView(titleView);

        TextView descView = new TextView(context);
        descView.setText(description);
        descView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        descView.setTextColor(secondaryColor);
        LinearLayout.LayoutParams dp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dp.topMargin = dpToPx(context, 2);
        descView.setLayoutParams(dp);
        textCol.addView(descView);

        row.addView(textCol);

        Switch sw = new Switch(context);
        sw.setChecked(initialChecked);
        sw.setOnCheckedChangeListener(listener);
        LinearLayout.LayoutParams swParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        swParams.leftMargin = dpToPx(context, 12);
        sw.setLayoutParams(swParams);
        row.addView(sw);

        row.setOnClickListener(v -> sw.toggle());
        container.addView(row);
    }

    private static void addInfoRow(Context context, LinearLayout container,
                                   String label, String value,
                                   int primaryColor, int secondaryColor) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams rp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rp.bottomMargin = dpToPx(context, 10);
        row.setLayoutParams(rp);

        TextView lv = new TextView(context);
        lv.setText(label);
        lv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        lv.setTextColor(primaryColor);
        row.addView(lv);

        TextView vv = new TextView(context);
        vv.setText(value);
        vv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        vv.setTextColor(secondaryColor);
        row.addView(vv);

        container.addView(row);
    }

    private static void addDivider(Context context, LinearLayout container, int color) {
        View d = new View(context);
        LinearLayout.LayoutParams dp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 1);
        dp.topMargin = dpToPx(context, 4);
        dp.bottomMargin = dpToPx(context, 4);
        d.setLayoutParams(dp);
        d.setBackgroundColor(color);
        container.addView(d);
    }

    private static String getWhatsAppVersion(Context context) {
        try {
            return context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Throwable t) {
            return "Unknown";
        }
    }

    private static int dpToPx(Context context, int dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics());
    }

    /** Monochrome 3-bar tune/sliders icon matching WhatsApp outlined settings icons. */
    private static class SlidersIconDrawable extends Drawable {
        private final Paint linePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint circlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        SlidersIconDrawable(int color) {
            linePaint.setColor(color);
            linePaint.setStyle(Paint.Style.STROKE);
            linePaint.setStrokeCap(Paint.Cap.ROUND);

            circlePaint.setColor(color);
            circlePaint.setStyle(Paint.Style.STROKE);
            circlePaint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float w = b.width();
            float h = b.height();
            if (w <= 0 || h <= 0) return;

            float stroke = Math.max(1.5f, w * 0.065f);
            linePaint.setStrokeWidth(stroke);
            circlePaint.setStrokeWidth(stroke);

            // Inset slightly so strokes don't clip at bounds
            float inset = stroke;
            float left = b.left + inset;
            float right = b.right - inset;
            float top = b.top + inset;
            float bottom = b.bottom - inset;
            float innerW = right - left;
            float innerH = bottom - top;

            // Three horizontal lines with slider dots at different positions
            float[] ys = {top + innerH * 0.22f, top + innerH * 0.50f, top + innerH * 0.78f};
            float[] xs = {left + innerW * 0.65f, left + innerW * 0.32f, left + innerW * 0.55f};
            float r = innerW * 0.10f;

            for (int i = 0; i < 3; i++) {
                // Line segments on each side of the knob
                canvas.drawLine(left, ys[i], xs[i] - r - stroke * 0.5f, ys[i], linePaint);
                canvas.drawLine(xs[i] + r + stroke * 0.5f, ys[i], right, ys[i], linePaint);
                // Knob circle (outlined, matching WhatsApp's outlined icon style)
                canvas.drawCircle(xs[i], ys[i], r, circlePaint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            linePaint.setAlpha(alpha);
            circlePaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            linePaint.setColorFilter(colorFilter);
            circlePaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** Monochrome back arrow drawable for the native-style toolbar. */
    private static class BackArrowDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        BackArrowDrawable(int color) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float cx = b.centerX();
            float cy = b.centerY();
            float s = Math.min(b.width(), b.height()) * 0.22f;
            paint.setStrokeWidth(Math.max(2f, s * 0.22f));

            canvas.drawLine(cx - s, cy, cx + s, cy, paint);
            canvas.drawLine(cx - s, cy, cx - s * 0.25f, cy - s * 0.75f, paint);
            canvas.drawLine(cx - s, cy, cx - s * 0.25f, cy + s * 0.75f, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
