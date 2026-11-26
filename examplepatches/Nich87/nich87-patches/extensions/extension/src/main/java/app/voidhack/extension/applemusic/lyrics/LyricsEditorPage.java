package app.voidhack.extension.applemusic.lyrics;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.UnaryOperator;

/**
 * Apple Music-native full-song mobile lyrics editor.
 *
 * Designed to match Apple Music's own visual grammar: true OLED / system backgrounds,
 * SF Pro typography with tabular numerals, single key_color accent, native Apple Music
 * vector icons, iOS segmented controls, flush hairline-separated lyrics rows, calm elevated
 * inline editing cards, native DialogFlowDialog action sheets, and a docked mini-player
 * thumb bar at the bottom.
 */
final class LyricsEditorPage {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "VoidhackLyricsEditor");
        t.setDaemon(true);
        return t;
    });
    private static final long TICK_INTERVAL_MS = 100L;

    private final Activity activity;
    private final Object fragment;
    private final LyricsLineEditor.Sheet sheet;
    private final LrclibModels.TrackQuery query;
    private final Runnable onSaved;
    private final LyricsEditorModel.Document doc;
    private final Object mediaBrowser;

    private final Dialog dialog;
    private final LinearLayout root;

    // Strict Apple Music semantic palette (Light & Dark aware)
    private final boolean lightTheme;
    private final int bgPrimary;
    private final int bgElevated;
    private final int bgTertiary;
    private final int fillTertiary;
    private final int fillQuaternary;
    private final int labelPrimary;
    private final int labelSecondary;
    private final int labelTertiary;
    private final int accent;
    private final int accentTint;
    private final int destructive;
    private final int separator;
    private final int systemGray;
    private final Typeface regular;
    private final Typeface semibold;

    // Feature visibility (automatically hides Romaji/pronunciation UI when pronunciation guides are off)
    private final boolean canAutoGenerateReading;
    private final boolean showReadingUi;

    // Editor state
    private LyricsEditorModel.EditTab activeTab = LyricsEditorModel.EditTab.LYRICS;
    private int expandedLineId = -1;
    private int expandedInterludeAfter = Integer.MIN_VALUE;
    private boolean cascadeShift = false;
    private boolean findPanelOpen = false;
    private boolean shiftPanelOpen = false;
    private boolean shiftFromSelected = false;
    private LyricsEditorModel.EditTab findScope = LyricsEditorModel.EditTab.BOTH;
    private String findQuery = "";
    private String replaceQuery = "";
    private boolean romanizingBusy = false;

    // Undo coalescing per focused edit session
    private int undoSessionLineId = -1;
    private boolean undoSessionTextRecorded = false;
    private boolean undoSessionReadingRecorded = false;
    private EditText activeLyricEditText;

    // Persistent structural views
    private TextView subtitleTv;
    private TextView saveBtn;
    private LinearLayout segmentWrap;
    private LinearLayout segmentContainer;
    private LinearLayout inlinePanelHost;
    private ScrollView scrollView;
    private LinearLayout timelineContainer;
    private LinearLayout bottomBarHost;

    // Live bottom-bar references
    private ImageView undoBtn;
    private ImageView redoBtn;
    private ImageView playPauseIcon;
    private TextView livePositionTv;
    private boolean lastPlayingState = false;

    // O(1) playback highlight maps
    private final Map<Integer, View> playingBarByLineId = new HashMap<>();
    private final Map<Integer, TextView> timestampViewByLineId = new HashMap<>();
    private final Map<Integer, View> playingBarByInterludeKey = new HashMap<>();
    private final Map<Integer, View[]> dotsByInterludeKey = new HashMap<>();
    private final Map<Integer, View> rowViewByLineId = new HashMap<>();
    private final Map<Integer, View> interludeViewByKey = new HashMap<>();
    private int lastHighlightedLineId = -1;
    private int lastHighlightedInterludeKey = Integer.MIN_VALUE;
    private boolean tickerRunning = false;

    private final Runnable playbackTicker = new Runnable() {
        @Override
        public void run() {
            if (!tickerRunning || !dialog.isShowing()) return;
            updateLivePlaybackUi();
            MAIN.postDelayed(this, TICK_INTERVAL_MS);
        }
    };

    static void open(
            Activity activity,
            Object fragment,
            LyricsLineEditor.Sheet sheet,
            LrclibModels.TrackQuery query,
            int initialFocusLineIndex,
            Runnable onSaved) {
        if (activity == null || activity.isFinishing() || sheet == null || sheet.documentKey == null) return;
        LyricsEditorPage page = new LyricsEditorPage(activity, fragment, sheet, query, initialFocusLineIndex, onSaved);
        page.show();
    }

    private LyricsEditorPage(
            Activity activity,
            Object fragment,
            LyricsLineEditor.Sheet sheet,
            LrclibModels.TrackQuery query,
            int initialFocusLineIndex,
            Runnable onSaved) {
        this.activity = activity;
        this.fragment = fragment;
        this.sheet = sheet;
        this.query = query;
        this.onSaved = onSaved;
        this.mediaBrowser = LrclibController.getMediaBrowser(fragment);

        long durationMs = query != null && query.durationSec > 0 ? query.durationSec * 1000L : 0L;
        if (durationMs <= 0L && mediaBrowser != null) {
            long mbDur = LrclibReflection.getPlaybackDurationMs(mediaBrowser);
            if (mbDur > 0L) durationMs = mbDur;
        }
        LyricsEditTtml.DocumentEdit existingDoc = LyricsEdits.loadDocument(activity, sheet.documentKey);
        Map<Integer, LyricsEditTtml.Edit> existingLegacy = existingDoc == null
                ? LyricsEdits.load(activity, sheet.documentKey) : null;
        this.doc = LyricsEditorModel.Document.fromTtml(
                sheet.baseline, sheet.displayed, existingDoc, existingLegacy, sheet.wordTimed, durationMs);

        this.canAutoGenerateReading = LyricsFeatures.pronunciation() && Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q;
        boolean romanizationActive = LyricsFeatures.pronunciation() && LrclibPrefs.isRomanizationEnabled(activity);
        this.showReadingUi = romanizationActive || sheet.hasOfficialReading || hasAnyDocReading(this.doc);
        if (!this.showReadingUi) {
            this.activeTab = LyricsEditorModel.EditTab.LYRICS;
            this.findScope = LyricsEditorModel.EditTab.LYRICS;
        }

        if (initialFocusLineIndex >= 0 && initialFocusLineIndex < doc.lines.size()) {
            this.expandedLineId = doc.lines.get(initialFocusLineIndex).id;
        }

        // Resolve genuine Apple Music semantic colors
        this.bgPrimary = resolveColor("background_color", 0xFF000000);
        this.lightTheme = Color.luminance(bgPrimary) > 0.5;
        this.bgElevated = resolveColor("secondary_background_color", lightTheme ? 0xFFF2F2F7 : 0xFF1C1C1E);
        this.bgTertiary = resolveColor("tertiary_background_color", lightTheme ? 0xFFFFFFFF : 0xFF2C2C2E);
        this.fillTertiary = resolveColor("tertiary_fill_color", lightTheme ? 0x1F767680 : 0x3D767680);
        this.fillQuaternary = resolveColor("quaternary_fill_color", lightTheme ? 0x14747480 : 0x2E767680);
        this.labelPrimary = resolveColor("label_color", lightTheme ? 0xFF000000 : 0xFFFFFFFF);
        this.labelSecondary = resolveColor("secondary_label_color", lightTheme ? 0x993C3C43 : 0x99EBEBF5);
        this.labelTertiary = resolveColor("tertiary_label_color", lightTheme ? 0x4D3C3C43 : 0x4DEBEBF5);
        this.accent = resolveColor("key_color", 0xFFFA2D48);
        this.accentTint = (accent & 0x00FFFFFF) | (lightTheme ? 0x1A000000 : 0x26000000);
        this.destructive = resolveColor("system_red", 0xFFFF3B30);
        this.separator = resolveColor("separator_color", lightTheme ? 0xFFC6C6C8 : 0xFF38383A);
        this.systemGray = resolveColor("system_gray", 0xFF8E8E93);
        this.regular = resolveFont("regular", Typeface.DEFAULT);
        this.semibold = resolveFont("semibold", Typeface.DEFAULT_BOLD);

        int themeId = LrclibStrings.id(activity, "style", "AppTheme.FullScreenDialog");
        this.dialog = themeId != 0 ? new Dialog(activity, themeId) : new Dialog(activity);
        this.dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        this.dialog.setCancelable(false);
        this.dialog.setOnKeyListener((d, keyCode, event) -> {
            if (keyCode == KeyEvent.KEYCODE_BACK && event.getAction() == KeyEvent.ACTION_UP) {
                requestClose();
                return true;
            }
            return false;
        });
        this.dialog.setOnDismissListener(d -> stopTicker());

        this.root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(bgPrimary);
        if (Build.VERSION.SDK_INT >= 29) {
            root.setForceDarkAllowed(false);
        }
        root.setFocusableInTouchMode(true);
        if (Build.VERSION.SDK_INT >= 30) {
            root.setOnApplyWindowInsetsListener((view, insets) -> {
                android.graphics.Insets safe = insets.getInsets(
                        WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime()
                );
                view.setPadding(safe.left, safe.top, safe.right, safe.bottom);
                return insets;
            });
        }

        buildChrome();
        dialog.setContentView(root);
        configureWindow();
    }

    private void configureWindow() {
        Window window = dialog.getWindow();
        if (window == null) return;
        window.setBackgroundDrawable(new ColorDrawable(bgPrimary));
        window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS
                | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                | WindowManager.LayoutParams.FLAG_LAYOUT_INSET_DECOR);
        if (Build.VERSION.SDK_INT >= 30) {
            window.setDecorFitsSystemWindows(false);
        }
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        window.setStatusBarColor(Color.TRANSPARENT);
        window.setNavigationBarColor(bgElevated);
    }

    private void show() {
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(-1, -1);
            if (Build.VERSION.SDK_INT >= 30 && window.getInsetsController() != null) {
                int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                window.getInsetsController().setSystemBarsAppearance(lightTheme ? mask : 0, mask);
            }
        }
        root.requestApplyInsets();
        rebuildAll(true);
        if (doc.synced && mediaBrowser != null) {
            startTicker();
        }
        if (expandedLineId >= 0) {
            scrollToLineId(expandedLineId);
        } else if (doc.synced && mediaBrowser != null) {
            scrollToCurrentPlaying(false);
        }
    }

    private void startTicker() {
        if (tickerRunning) return;
        tickerRunning = true;
        MAIN.removeCallbacks(playbackTicker);
        MAIN.post(playbackTicker);
    }

    private void stopTicker() {
        tickerRunning = false;
        MAIN.removeCallbacks(playbackTicker);
    }

    // =========================================================================
    // Calm 2-Tier Top Chrome + Scrollable Timeline + Docked Mini-Player Footer
    // =========================================================================

    private void buildChrome() {
        // 1. iOS / Apple Music Modal Navigation Bar (52dp)
        LinearLayout navbar = new LinearLayout(activity);
        navbar.setOrientation(LinearLayout.HORIZONTAL);
        navbar.setGravity(Gravity.CENTER_VERTICAL);
        navbar.setPadding(dp(8), 0, dp(8), 0);

        TextView cancelBtn = borderlessTextAction(activity.getString(android.R.string.cancel), 16, false, accent, this::requestClose);
        cancelBtn.setPadding(dp(8), dp(10), dp(8), dp(10));
        navbar.addView(cancelBtn);

        LinearLayout titleCol = new LinearLayout(activity);
        titleCol.setOrientation(LinearLayout.VERTICAL);
        titleCol.setGravity(Gravity.CENTER);
        titleCol.setPadding(dp(6), 0, dp(6), 0);

        String trackTitle = (query != null && !query.title.isEmpty()) ? query.title : str("editor_title");
        TextView titleTv = text(trackTitle, 16, true, labelPrimary);
        titleTv.setGravity(Gravity.CENTER);
        titleTv.setSingleLine(true);
        titleTv.setEllipsize(TextUtils.TruncateAt.END);
        titleCol.addView(titleTv);

        subtitleTv = text("", 12, false, labelSecondary);
        subtitleTv.setGravity(Gravity.CENTER);
        subtitleTv.setSingleLine(true);
        subtitleTv.setEllipsize(TextUtils.TruncateAt.END);
        subtitleTv.setPadding(0, dp(1), 0, 0);
        titleCol.addView(subtitleTv);
        navbar.addView(titleCol, new LinearLayout.LayoutParams(0, -2, 1f));

        // Native Apple Music More (...) button
        ImageView moreBtn = nativeIconButton("ic_navbar_platter_more", 24, accent, str("editor_more"), this::openMoreSheet);
        navbar.addView(moreBtn, new LinearLayout.LayoutParams(dp(38), dp(40)));

        // Native iOS borderless accent Save action
        saveBtn = borderlessTextAction(str("save"), 16, true, accent, () -> performSave(true));
        saveBtn.setPadding(dp(8), dp(10), dp(8), dp(10));
        navbar.addView(saveBtn);

        root.addView(navbar, new LinearLayout.LayoutParams(-1, dp(52)));

        // 2. Authentic iOS Segmented Control (Lyrics | Romaji | Both) — hidden when pronunciation guides are off
        segmentWrap = new LinearLayout(activity);
        segmentWrap.setOrientation(LinearLayout.VERTICAL);
        segmentWrap.setPadding(dp(16), dp(2), dp(16), dp(10));

        segmentContainer = new LinearLayout(activity);
        segmentContainer.setOrientation(LinearLayout.HORIZONTAL);
        segmentContainer.setBackground(round(fillTertiary, 9));
        segmentContainer.setPadding(dp(2), dp(2), dp(2), dp(2));
        segmentWrap.addView(segmentContainer, new LinearLayout.LayoutParams(-1, dp(32)));
        if (!showReadingUi) {
            segmentWrap.setVisibility(View.GONE);
        }
        root.addView(segmentWrap, new LinearLayout.LayoutParams(-1, -2));

        // 3. Optional Inline Utility Bar (only visible when Find or Batch Shift is opened from More)
        inlinePanelHost = new LinearLayout(activity);
        inlinePanelHost.setOrientation(LinearLayout.VERTICAL);
        inlinePanelHost.setVisibility(View.GONE);
        root.addView(inlinePanelHost, new LinearLayout.LayoutParams(-1, -2));

        root.addView(hairline(), new LinearLayout.LayoutParams(-1, 1));

        // 4. Spacious Scrollable Timeline Body
        scrollView = new ScrollView(activity);
        scrollView.setFillViewport(false);
        timelineContainer = new LinearLayout(activity);
        timelineContainer.setOrientation(LinearLayout.VERTICAL);
        timelineContainer.setPadding(0, dp(4), 0, dp(32));
        scrollView.addView(timelineContainer, new FrameLayout.LayoutParams(-1, -2));
        root.addView(scrollView, new LinearLayout.LayoutParams(-1, 0, 1f));

        // 5. Docked Apple Music Mini-Control Footer Bar
        root.addView(hairline(), new LinearLayout.LayoutParams(-1, 1));
        bottomBarHost = new LinearLayout(activity);
        bottomBarHost.setOrientation(LinearLayout.HORIZONTAL);
        bottomBarHost.setGravity(Gravity.CENTER_VERTICAL);
        bottomBarHost.setBackgroundColor(bgElevated);
        bottomBarHost.setPadding(dp(10), 0, dp(12), 0);
        root.addView(bottomBarHost, new LinearLayout.LayoutParams(-1, dp(52)));
    }

    private void rebuildAll(boolean preserveScroll) {
        final int prevScrollY = preserveScroll ? scrollView.getScrollY() : 0;
        updateHeaderStatus();
        rebuildSegmentControl();
        rebuildInlinePanel();
        rebuildTimeline();
        rebuildBottomBar();
        if (preserveScroll) {
            scrollView.post(() -> scrollView.scrollTo(0, prevScrollY));
        }
        updateLivePlaybackUi();
    }

    private void updateHeaderStatus() {
        int lineCount = doc.lines.size();
        int modified = doc.modifiedLineCount();
        int interludes = doc.interludeCount();
        StringBuilder sub = new StringBuilder();
        sub.append(str("editor_status_lines", lineCount));
        if (doc.synced && interludes > 0) {
            sub.append(" · ").append(str("editor_status_interludes", interludes));
        }
        if (modified > 0) {
            sub.append(" · ").append(str("editor_status_modified", modified));
        }
        if (romanizingBusy) {
            sub.append(" · ").append(str("editor_generating_readings"));
        }
        subtitleTv.setText(sub.toString());
        subtitleTv.setTextColor(labelSecondary);

        boolean canSave = doc.isDirty();
        saveBtn.setAlpha(canSave ? 1f : 0.42f);
        updateUndoRedoButtons();
    }

    private void updateUndoRedoButtons() {
        if (undoBtn != null) {
            undoBtn.setEnabled(doc.canUndo());
            undoBtn.setAlpha(doc.canUndo() ? 1f : 0.28f);
        }
        if (redoBtn != null) {
            redoBtn.setEnabled(doc.canRedo());
            redoBtn.setAlpha(doc.canRedo() ? 1f : 0.28f);
        }
    }

    private void rebuildSegmentControl() {
        segmentContainer.removeAllViews();
        if (!showReadingUi) {
            segmentWrap.setVisibility(View.GONE);
            activeTab = LyricsEditorModel.EditTab.LYRICS;
            return;
        }
        segmentWrap.setVisibility(View.VISIBLE);
        addSegmentTab(LyricsEditorModel.EditTab.LYRICS, str("editor_tab_lyrics"));
        addSegmentTab(LyricsEditorModel.EditTab.READING, str("editor_tab_reading"));
        addSegmentTab(LyricsEditorModel.EditTab.BOTH, str("editor_tab_both"));
    }

    private void addSegmentTab(final LyricsEditorModel.EditTab tab, String label) {
        boolean selected = activeTab == tab;
        TextView tv = text(label, 13, selected, selected ? labelPrimary : labelSecondary);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        if (selected) {
            tv.setBackground(round(bgTertiary, 7));
            tv.setElevation(dp(1.5f));
        } else {
            tv.setBackground(ripple(null));
            tv.setElevation(0f);
        }
        tv.setClickable(true);
        tv.setFocusable(true);
        tv.setOnClickListener(v -> {
            if (activeTab == tab) return;
            activeTab = tab;
            resetUndoSession();
            rebuildAll(true);
        });
        segmentContainer.addView(tv, new LinearLayout.LayoutParams(0, -1, 1f));
    }

    // =========================================================================
    // Docked Bottom Bar (Apple Music Mini-Player / Utility Dock)
    // =========================================================================

    private void rebuildBottomBar() {
        bottomBarHost.removeAllViews();
        playPauseIcon = null;
        livePositionTv = null;

        undoBtn = vectorIconButton(new UndoRedoDrawable(false, labelPrimary, dp(1.7f)), str("editor_undo"), () -> {
            if (doc.undo()) {
                resetUndoSession();
                rebuildAll(true);
            }
        });
        bottomBarHost.addView(undoBtn, new LinearLayout.LayoutParams(dp(38), dp(40)));

        redoBtn = vectorIconButton(new UndoRedoDrawable(true, labelPrimary, dp(1.7f)), str("editor_redo"), () -> {
            if (doc.redo()) {
                resetUndoSession();
                rebuildAll(true);
            }
        });
        bottomBarHost.addView(redoBtn, new LinearLayout.LayoutParams(dp(38), dp(40)));
        updateUndoRedoButtons();

        if (doc.synced && mediaBrowser != null) {
            View leftSpacer = new View(activity);
            bottomBarHost.addView(leftSpacer, new LinearLayout.LayoutParams(0, 1, 1f));

            TextView rewBtn = tabularText("-3s", 13, true, labelSecondary);
            rewBtn.setGravity(Gravity.CENTER);
            rewBtn.setPadding(dp(8), dp(8), dp(8), dp(8));
            rewBtn.setBackground(ripple(null));
            rewBtn.setClickable(true);
            rewBtn.setFocusable(true);
            rewBtn.setOnClickListener(v -> nudgePlayback(-3000L));
            bottomBarHost.addView(rewBtn);

            lastPlayingState = LrclibReflection.isPlaying(mediaBrowser);
            playPauseIcon = nativeIconButton(
                    lastPlayingState ? "ic_nowplaying_pause" : "ic_nowplaying_play",
                    20, labelPrimary,
                    str(lastPlayingState ? "editor_pause" : "editor_play"),
                    this::togglePlayPause);
            bottomBarHost.addView(playPauseIcon, new LinearLayout.LayoutParams(dp(42), dp(42)));

            TextView fwdBtn = tabularText("+3s", 13, true, labelSecondary);
            fwdBtn.setGravity(Gravity.CENTER);
            fwdBtn.setPadding(dp(8), dp(8), dp(8), dp(8));
            fwdBtn.setBackground(ripple(null));
            fwdBtn.setClickable(true);
            fwdBtn.setFocusable(true);
            fwdBtn.setOnClickListener(v -> nudgePlayback(3000L));
            bottomBarHost.addView(fwdBtn);

            livePositionTv = tabularText("00:00.00", 13, false, labelSecondary);
            livePositionTv.setPadding(dp(6), 0, dp(4), 0);
            bottomBarHost.addView(livePositionTv);

            View rightSpacer = new View(activity);
            bottomBarHost.addView(rightSpacer, new LinearLayout.LayoutParams(0, 1, 1f));

            TextView nowBtn = borderlessTextAction(str("editor_jump_now"), 14, true, accent,
                    () -> scrollToCurrentPlaying(true));
            nowBtn.setPadding(dp(8), dp(8), dp(4), dp(8));
            bottomBarHost.addView(nowBtn);
        } else {
            View spacer = new View(activity);
            bottomBarHost.addView(spacer, new LinearLayout.LayoutParams(0, 1, 1f));

            LinearLayout addRow = new LinearLayout(activity);
            addRow.setOrientation(LinearLayout.HORIZONTAL);
            addRow.setGravity(Gravity.CENTER_VERTICAL);
            addRow.setPadding(dp(10), dp(8), dp(6), dp(8));
            addRow.setBackground(ripple(null));
            addRow.setClickable(true);
            addRow.setFocusable(true);
            addRow.setOnClickListener(v -> appendNewLineAndFocus());

            int addIconRes = LrclibStrings.id(activity, "drawable", "ic_navbar_add");
            if (addIconRes != 0) {
                ImageView plusIv = new ImageView(activity);
                plusIv.setImageResource(addIconRes);
                plusIv.setImageTintList(ColorStateList.valueOf(accent));
                LinearLayout.LayoutParams ivLp = new LinearLayout.LayoutParams(dp(14), dp(14));
                ivLp.setMargins(0, 0, dp(6), 0);
                addRow.addView(plusIv, ivLp);
            }
            addRow.addView(text(str("editor_tool_add_line"), 14, true, accent));
            bottomBarHost.addView(addRow);
        }
    }

    // =========================================================================
    // Collapsible Inline Utility Panels (Find & Replace / Batch Timing Shift)
    // =========================================================================

    private void rebuildInlinePanel() {
        inlinePanelHost.removeAllViews();
        if (!findPanelOpen && !shiftPanelOpen) {
            inlinePanelHost.setVisibility(View.GONE);
            return;
        }
        inlinePanelHost.setVisibility(View.VISIBLE);
        inlinePanelHost.setBackgroundColor(bgElevated);
        inlinePanelHost.addView(hairline(), new LinearLayout.LayoutParams(-1, 1));

        LinearLayout inner = new LinearLayout(activity);
        inner.setOrientation(LinearLayout.VERTICAL);
        inner.setPadding(dp(16), dp(10), dp(16), dp(12));
        if (findPanelOpen) {
            buildFindReplacePanel(inner);
        } else if (shiftPanelOpen) {
            buildBatchShiftPanel(inner);
        }
        inlinePanelHost.addView(inner);
    }

    private void buildFindReplacePanel(LinearLayout parent) {
        LinearLayout topHdr = new LinearLayout(activity);
        topHdr.setOrientation(LinearLayout.HORIZONTAL);
        topHdr.setGravity(Gravity.CENTER_VERTICAL);
        topHdr.setPadding(0, 0, 0, dp(8));
        topHdr.addView(text(str("editor_tool_find_replace"), 13, true, labelSecondary),
                new LinearLayout.LayoutParams(0, -2, 1f));
        final TextView matchTv = text("", 12, false, labelSecondary);
        matchTv.setPadding(0, 0, dp(10), 0);
        topHdr.addView(matchTv);
        topHdr.addView(borderlessTextAction(str("editor_done"), 14, true, accent, () -> {
            findPanelOpen = false;
            hideKeyboard();
            rebuildInlinePanel();
        }));
        parent.addView(topHdr);

        LinearLayout inputRow = new LinearLayout(activity);
        inputRow.setOrientation(LinearLayout.HORIZONTAL);

        final EditText findEt = searchStyleInput(str("editor_find_hint"), findQuery);
        final EditText replaceEt = searchStyleInput(str("editor_replace_hint"), replaceQuery);
        LinearLayout.LayoutParams leftLp = new LinearLayout.LayoutParams(0, dp(36), 1f);
        leftLp.setMargins(0, 0, dp(8), 0);
        inputRow.addView(findEt, leftLp);
        inputRow.addView(replaceEt, new LinearLayout.LayoutParams(0, dp(36), 1f));
        parent.addView(inputRow);

        LinearLayout actionRow = new LinearLayout(activity);
        actionRow.setOrientation(LinearLayout.HORIZONTAL);
        actionRow.setGravity(Gravity.CENTER_VERTICAL);
        actionRow.setPadding(0, dp(10), 0, 0);

        // Mini iOS segmented scope selector (only shown when pronunciation UI is active)
        if (showReadingUi) {
            LinearLayout scopeSeg = new LinearLayout(activity);
            scopeSeg.setOrientation(LinearLayout.HORIZONTAL);
            scopeSeg.setBackground(round(fillTertiary, 8));
            scopeSeg.setPadding(dp(2), dp(2), dp(2), dp(2));
            addMiniSegment(scopeSeg, str("editor_tab_lyrics"), findScope == LyricsEditorModel.EditTab.LYRICS, () -> {
                findScope = LyricsEditorModel.EditTab.LYRICS;
                rebuildInlinePanel();
            });
            addMiniSegment(scopeSeg, str("editor_tab_reading"), findScope == LyricsEditorModel.EditTab.READING, () -> {
                findScope = LyricsEditorModel.EditTab.READING;
                rebuildInlinePanel();
            });
            addMiniSegment(scopeSeg, str("editor_tab_both"), findScope == LyricsEditorModel.EditTab.BOTH, () -> {
                findScope = LyricsEditorModel.EditTab.BOTH;
                rebuildInlinePanel();
            });
            actionRow.addView(scopeSeg, new LinearLayout.LayoutParams(0, dp(30), 1f));
        } else {
            findScope = LyricsEditorModel.EditTab.LYRICS;
            actionRow.addView(new View(activity), new LinearLayout.LayoutParams(0, 1, 1f));
        }

        TextView replaceBtn = tintedPillButton(str("editor_replace_all"), accent, accentTint, () -> {
            int count = doc.findAndReplace(findQuery, replaceQuery, findScope, true);
            if (count > 0) {
                toast(str("editor_replace_done", count));
                resetUndoSession();
                rebuildAll(true);
            } else {
                toast(str("editor_replace_none"));
            }
        });
        LinearLayout.LayoutParams repLp = new LinearLayout.LayoutParams(-2, dp(30));
        repLp.setMargins(dp(10), 0, 0, 0);
        actionRow.addView(replaceBtn, repLp);
        parent.addView(actionRow);

        final Runnable updateMatchCount = () -> {
            int count = doc.countMatches(findQuery, findScope, true);
            matchTv.setText(findQuery.isEmpty() ? "" : str("editor_find_matches", count));
            matchTv.setTextColor(count > 0 ? accent : labelSecondary);
        };
        findEt.addTextChangedListener(new SimpleWatcher() {
            @Override
            public void afterTextChanged(Editable s) {
                findQuery = s == null ? "" : s.toString();
                updateMatchCount.run();
            }
        });
        replaceEt.addTextChangedListener(new SimpleWatcher() {
            @Override
            public void afterTextChanged(Editable s) {
                replaceQuery = s == null ? "" : s.toString();
            }
        });
        updateMatchCount.run();
    }

    private void buildBatchShiftPanel(LinearLayout parent) {
        final int selectedIndex = findLineIndexById(expandedLineId);
        if (selectedIndex < 0) shiftFromSelected = false;

        LinearLayout topHdr = new LinearLayout(activity);
        topHdr.setOrientation(LinearLayout.HORIZONTAL);
        topHdr.setGravity(Gravity.CENTER_VERTICAL);
        topHdr.setPadding(0, 0, 0, dp(8));
        topHdr.addView(text(str("editor_tool_batch_shift"), 13, true, labelSecondary),
                new LinearLayout.LayoutParams(0, -2, 1f));
        topHdr.addView(borderlessTextAction(str("editor_sort_by_time"), 13, false, accent, () -> {
            if (doc.sortByTimestamp()) {
                toast(str("editor_sorted_by_time"));
                rebuildAll(true);
            }
        }));
        TextView doneBtn = borderlessTextAction(str("editor_done"), 14, true, accent, () -> {
            shiftPanelOpen = false;
            hideKeyboard();
            rebuildInlinePanel();
        });
        doneBtn.setPadding(dp(14), dp(4), 0, dp(4));
        topHdr.addView(doneBtn);
        parent.addView(topHdr);

        if (selectedIndex >= 0) {
            LinearLayout scopeSeg = new LinearLayout(activity);
            scopeSeg.setOrientation(LinearLayout.HORIZONTAL);
            scopeSeg.setBackground(round(fillTertiary, 8));
            scopeSeg.setPadding(dp(2), dp(2), dp(2), dp(2));
            addMiniSegment(scopeSeg, str("editor_shift_all"), !shiftFromSelected, () -> {
                shiftFromSelected = false;
                rebuildInlinePanel();
            });
            addMiniSegment(scopeSeg, str("editor_shift_from_line", selectedIndex + 1), shiftFromSelected, () -> {
                shiftFromSelected = true;
                rebuildInlinePanel();
            });
            LinearLayout.LayoutParams segLp = new LinearLayout.LayoutParams(-1, dp(30));
            segLp.setMargins(0, 0, 0, dp(8));
            parent.addView(scopeSeg, segLp);
        }

        // Unified segmented step bar (-1s | -0.5 | -0.1 | +0.1 | +0.5 | +1s)
        LinearLayout stepBar = new LinearLayout(activity);
        stepBar.setOrientation(LinearLayout.HORIZONTAL);
        stepBar.setBackground(round(fillTertiary, 8));
        long[] deltas = {-1000L, -500L, -100L, 100L, 500L, 1000L};
        String[] labels = {"-1s", "-0.5", "-0.1", "+0.1", "+0.5", "+1s"};
        for (int i = 0; i < deltas.length; i++) {
            if (i > 0) stepBar.addView(verticalDivider());
            final long delta = deltas[i];
            TextView seg = tabularText(labels[i], 12, true, labelPrimary);
            seg.setGravity(Gravity.CENTER);
            seg.setBackground(ripple(null));
            seg.setClickable(true);
            seg.setFocusable(true);
            seg.setOnClickListener(v -> {
                int from = (shiftFromSelected && selectedIndex >= 0) ? selectedIndex : 0;
                if (doc.shiftRange(from, doc.lines.size() - 1, delta)) {
                    rebuildAll(true);
                }
            });
            stepBar.addView(seg, new LinearLayout.LayoutParams(0, dp(34), 1f));
        }
        parent.addView(stepBar);

        LinearLayout customRow = new LinearLayout(activity);
        customRow.setOrientation(LinearLayout.HORIZONTAL);
        customRow.setGravity(Gravity.CENTER_VERTICAL);
        customRow.setPadding(0, dp(8), 0, 0);

        final EditText customMsInput = searchStyleInput(str("editor_shift_custom_hint"), "");
        customMsInput.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED);
        LinearLayout.LayoutParams etLp = new LinearLayout.LayoutParams(0, dp(34), 1f);
        etLp.setMargins(0, 0, dp(8), 0);
        customRow.addView(customMsInput, etLp);

        TextView applyBtn = tintedPillButton(str("editor_apply"), accent, accentTint, () -> {
            String raw = customMsInput.getText().toString().trim();
            try {
                long ms = Long.parseLong(raw);
                if (ms != 0L) {
                    int from = (shiftFromSelected && selectedIndex >= 0) ? selectedIndex : 0;
                    if (doc.shiftRange(from, doc.lines.size() - 1, ms)) {
                        customMsInput.setText("");
                        hideKeyboard();
                        rebuildAll(true);
                    }
                }
            } catch (NumberFormatException ignored) {
                toast(str("editor_invalid_number"));
            }
        });
        customRow.addView(applyBtn, new LinearLayout.LayoutParams(-2, dp(34)));
        parent.addView(customRow);
    }

    private void addMiniSegment(LinearLayout parent, String label, boolean selected, Runnable onClick) {
        TextView tv = text(label, 12, selected, selected ? labelPrimary : labelSecondary);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        if (selected) {
            tv.setBackground(round(bgTertiary, 6));
            tv.setElevation(dp(1f));
        } else {
            tv.setBackground(ripple(null));
        }
        tv.setClickable(true);
        tv.setFocusable(true);
        tv.setOnClickListener(v -> onClick.run());
        parent.addView(tv, new LinearLayout.LayoutParams(0, -1, 1f));
    }

    // =========================================================================
    // Apple Music Timeline: Flush Hairline Rows + Calm Elevated Active Card
    // =========================================================================

    private void rebuildTimeline() {
        timelineContainer.removeAllViews();
        playingBarByLineId.clear();
        timestampViewByLineId.clear();
        playingBarByInterludeKey.clear();
        dotsByInterludeKey.clear();
        rowViewByLineId.clear();
        interludeViewByKey.clear();
        lastHighlightedLineId = -1;
        lastHighlightedInterludeKey = Integer.MIN_VALUE;
        activeLyricEditText = null;

        if (doc.lines.isEmpty()) {
            TextView empty = text(str("editor_empty_lines"), 15, false, labelSecondary);
            empty.setGravity(Gravity.CENTER);
            empty.setPadding(dp(24), dp(48), dp(24), dp(48));
            timelineContainer.addView(empty, new LinearLayout.LayoutParams(-1, -2));
            return;
        }

        if (doc.synced && doc.hasIntroInterlude()) {
            View introView = buildInterludeItem(-1, 0L, doc.lines.get(0).startMs);
            interludeViewByKey.put(-1, introView);
            timelineContainer.addView(introView, new LinearLayout.LayoutParams(-1, -2));
            if (expandedInterludeAfter != -1) {
                timelineContainer.addView(insetHairline());
            }
        }

        for (int i = 0; i < doc.lines.size(); i++) {
            LyricsEditorModel.Line line = doc.lines.get(i);
            boolean isExpanded = line.id == expandedLineId;
            View row = isExpanded ? buildExpandedLineCard(i, line) : buildCollapsedLineRow(i, line);
            rowViewByLineId.put(line.id, row);
            timelineContainer.addView(row, new LinearLayout.LayoutParams(-1, -2));

            boolean hasFollowingInterlude = doc.synced && i < doc.lines.size() - 1 && doc.hasInterludeAfter(i);
            boolean hasCandidate = doc.synced && i < doc.lines.size() - 1 && !hasFollowingInterlude
                    && doc.isInterludeCandidateAfter(i);

            if (hasFollowingInterlude) {
                if (!isExpanded && expandedInterludeAfter != i) {
                    timelineContainer.addView(insetHairline());
                }
                LyricsEditorModel.Line next = doc.lines.get(i + 1);
                View interludeView = buildInterludeItem(i, line.endMs, next.startMs);
                interludeViewByKey.put(i, interludeView);
                timelineContainer.addView(interludeView, new LinearLayout.LayoutParams(-1, -2));
                boolean nextExpanded = (i + 1 < doc.lines.size() && doc.lines.get(i + 1).id == expandedLineId);
                if (expandedInterludeAfter != i && !nextExpanded) {
                    timelineContainer.addView(insetHairline());
                }
            } else if (hasCandidate) {
                timelineContainer.addView(buildInterludeCandidateDivider(i, line.durationMs()));
            } else if (i < doc.lines.size() - 1) {
                boolean nextExpanded = doc.lines.get(i + 1).id == expandedLineId;
                if (!isExpanded && !nextExpanded) {
                    timelineContainer.addView(insetHairline());
                }
            }
        }
    }

    private View buildCollapsedLineRow(final int index, final LyricsEditorModel.Line line) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setBackground(ripple(null));
        row.setClickable(true);
        row.setFocusable(true);
        row.setOnClickListener(v -> {
            expandedInterludeAfter = Integer.MIN_VALUE;
            expandedLineId = line.id;
            resetUndoSession();
            rebuildAll(true);
            scrollToLineId(line.id);
        });

        // Subtle 3dp left live-playback accent bar (transparent until active)
        View playBar = new View(activity);
        playBar.setBackground(round(Color.TRANSPARENT, 2));
        LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(dp(3), -1);
        barLp.setMargins(dp(4), dp(12), dp(9), dp(12));
        row.addView(playBar, barLp);
        playingBarByLineId.put(line.id, playBar);

        LinearLayout body = new LinearLayout(activity);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(0, dp(12), dp(16), dp(12));

        // Compact single-line quiet metadata header
        LinearLayout meta = new LinearLayout(activity);
        meta.setOrientation(LinearLayout.HORIZONTAL);
        meta.setGravity(Gravity.CENTER_VERTICAL);

        if (doc.synced && line.startMs >= 0L) {
            TextView tsTv = tabularText(LyricsEditorModel.formatTimestamp(line.startMs), 12, true, labelSecondary);
            tsTv.setPadding(0, dp(2), dp(8), dp(2));
            tsTv.setBackground(ripple(null));
            tsTv.setClickable(true);
            tsTv.setFocusable(true);
            tsTv.setOnClickListener(v -> seekToPreview(line.startMs, false));
            meta.addView(tsTv);
            timestampViewByLineId.put(line.id, tsTv);
        } else {
            TextView numTv = tabularText(String.valueOf(index + 1), 12, false, labelTertiary);
            numTv.setPadding(0, 0, dp(6), 0);
            meta.addView(numTv);
        }

        // Quiet 5dp dot for modified lines (replaces noisy badge pills)
        if (line.isModified(doc.synced)) {
            View modDot = new View(activity);
            GradientDrawable dotBg = new GradientDrawable();
            dotBg.setShape(GradientDrawable.OVAL);
            dotBg.setColor(accent);
            modDot.setBackground(dotBg);
            LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dp(5), dp(5));
            dotLp.setMargins(0, 0, dp(6), 0);
            meta.addView(modDot, dotLp);
        }

        View spacer = new View(activity);
        meta.addView(spacer, new LinearLayout.LayoutParams(0, 1, 1f));

        if (doc.synced && line.startMs >= 0L) {
            String rightMeta = "#" + (index + 1);
            long dur = line.durationMs();
            if (dur > 0L) {
                rightMeta = str("editor_seconds_short", LyricsEditorModel.formatDurationSeconds(dur)) + "  #" + (index + 1);
            }
            meta.addView(tabularText(rightMeta, 11, false, labelTertiary));
        }
        body.addView(meta);

        // Mode-aware lyric / reading typography (pure SF Pro hierarchy)
        if (activeTab == LyricsEditorModel.EditTab.LYRICS) {
            TextView lyricTv = text(
                    line.text.isEmpty() ? str("editor_empty_line_placeholder") : line.text,
                    16, false, line.text.isEmpty() ? labelTertiary : labelPrimary);
            lyricTv.setPadding(0, dp(3), 0, 0);
            lyricTv.setLineSpacing(dp(2), 1f);
            lyricTv.setMaxLines(3);
            lyricTv.setEllipsize(TextUtils.TruncateAt.END);
            body.addView(lyricTv);

            if (showReadingUi && !line.reading.isEmpty()) {
                TextView readPreview = text(line.reading, 13, false, labelSecondary);
                readPreview.setPadding(0, dp(2), 0, 0);
                readPreview.setMaxLines(1);
                readPreview.setEllipsize(TextUtils.TruncateAt.END);
                body.addView(readPreview);
            }
        } else if (activeTab == LyricsEditorModel.EditTab.READING) {
            TextView refTv = text(line.text, 13, false, labelSecondary);
            refTv.setPadding(0, dp(3), 0, 0);
            refTv.setMaxLines(2);
            refTv.setEllipsize(TextUtils.TruncateAt.END);
            body.addView(refTv);

            boolean emptyRead = line.reading.isEmpty();
            TextView readTv = text(
                    emptyRead ? str("editor_no_reading_placeholder") : line.reading,
                    16, false, emptyRead ? labelTertiary : labelPrimary);
            readTv.setPadding(0, dp(2), 0, 0);
            readTv.setLineSpacing(dp(2), 1f);
            readTv.setMaxLines(3);
            readTv.setEllipsize(TextUtils.TruncateAt.END);
            body.addView(readTv);
        } else {
            TextView lyricTv = text(
                    line.text.isEmpty() ? str("editor_empty_line_placeholder") : line.text,
                    16, false, line.text.isEmpty() ? labelTertiary : labelPrimary);
            lyricTv.setPadding(0, dp(3), 0, 0);
            lyricTv.setLineSpacing(dp(2), 1f);
            lyricTv.setMaxLines(3);
            lyricTv.setEllipsize(TextUtils.TruncateAt.END);
            body.addView(lyricTv);

            boolean emptyRead = line.reading.isEmpty();
            TextView readTv = text(
                    emptyRead ? str("editor_no_reading_placeholder") : line.reading,
                    14, false, emptyRead ? labelTertiary : labelSecondary);
            readTv.setPadding(0, dp(3), 0, 0);
            readTv.setMaxLines(2);
            readTv.setEllipsize(TextUtils.TruncateAt.END);
            body.addView(readTv);
        }

        row.addView(body, new LinearLayout.LayoutParams(0, -2, 1f));
        return row;
    }

    private View buildExpandedLineCard(final int index, final LyricsEditorModel.Line line) {
        FrameLayout wrapper = new FrameLayout(activity);
        wrapper.setPadding(dp(12), dp(8), dp(12), dp(8));

        LinearLayout outer = new LinearLayout(activity);
        outer.setOrientation(LinearLayout.HORIZONTAL);
        GradientDrawable cardBg = round(bgElevated, 14);
        cardBg.setStroke(1, (separator & 0x00FFFFFF) | 0x55000000);
        outer.setBackground(cardBg);

        View playBar = new View(activity);
        playBar.setBackground(round(Color.TRANSPARENT, 2));
        LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(dp(3), -1);
        barLp.setMargins(dp(4), dp(12), dp(4), dp(12));
        outer.addView(playBar, barLp);
        playingBarByLineId.put(line.id, playBar);

        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(8), dp(10), dp(14), dp(10));

        // 1. Calm Card Header (#index + time span + Up/Down chevrons + Done)
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);

        String headerLabel = "#" + (index + 1);
        if (doc.synced && line.startMs >= 0L) {
            headerLabel += "  " + LyricsEditorModel.formatTimestamp(line.startMs)
                    + " – " + LyricsEditorModel.formatTimestamp(line.endMs);
        }
        TextView hdrTv = tabularText(headerLabel, 13, true, labelSecondary);
        hdrTv.setSingleLine(true);
        hdrTv.setEllipsize(TextUtils.TruncateAt.END);
        header.addView(hdrTv, new LinearLayout.LayoutParams(0, -2, 1f));
        if (doc.synced) {
            timestampViewByLineId.put(line.id, hdrTv);
        }

        ImageView upBtn = nativeIconButton("ic_actionsheet_chevron_up", 16, labelSecondary,
                str("editor_prev_line"), () -> moveExpandedLine(index - 1));
        upBtn.setEnabled(index > 0);
        upBtn.setAlpha(index > 0 ? 1f : 0.28f);
        header.addView(upBtn, new LinearLayout.LayoutParams(dp(32), dp(32)));

        ImageView downBtn = nativeIconButton("ic_actionsheet_chevron_down", 16, labelSecondary,
                str("editor_next_line"), () -> moveExpandedLine(index + 1));
        downBtn.setEnabled(index + 1 < doc.lines.size());
        downBtn.setAlpha(index + 1 < doc.lines.size() ? 1f : 0.28f);
        header.addView(downBtn, new LinearLayout.LayoutParams(dp(32), dp(32)));

        TextView doneBtn = borderlessTextAction(str("editor_done"), 14, true, accent, () -> {
            hideKeyboard();
            expandedLineId = -1;
            resetUndoSession();
            rebuildAll(true);
        });
        doneBtn.setPadding(dp(8), dp(4), 0, dp(4));
        header.addView(doneBtn);
        card.addView(header);

        // 2. Clean Borderless Apple Music Text / Reading Inputs
        if (activeTab == LyricsEditorModel.EditTab.READING) {
            card.addView(hairline(), verticalMarginParams(dp(8), dp(8)));
            TextView refLabel = text(str("edit_lyric_text"), 12, true, labelSecondary);
            card.addView(refLabel);
            TextView refTv = text(line.text, 15, false, labelSecondary);
            refTv.setPadding(0, dp(3), 0, 0);
            card.addView(refTv);
        }

        if (activeTab == LyricsEditorModel.EditTab.LYRICS || activeTab == LyricsEditorModel.EditTab.BOTH) {
            card.addView(hairline(), verticalMarginParams(dp(8), dp(8)));

            LinearLayout lyricLabelRow = new LinearLayout(activity);
            lyricLabelRow.setOrientation(LinearLayout.HORIZONTAL);
            lyricLabelRow.setGravity(Gravity.CENTER_VERTICAL);
            lyricLabelRow.addView(text(str("edit_lyric_text"), 12, true, labelSecondary),
                    new LinearLayout.LayoutParams(0, -2, 1f));
            if (line.isTextModified() && !line.isAdded()) {
                lyricLabelRow.addView(borderlessTextAction(str("reset_lyric_line"), 12, false, accent, () -> {
                    if (doc.setLineText(index, line.originalText)) {
                        resetUndoSession();
                        rebuildAll(true);
                    }
                }));
            }
            card.addView(lyricLabelRow);

            final EditText lyricEt = cleanFormInput(str("editor_lyric_input_hint"), line.text, 16);
            lyricEt.addTextChangedListener(new SimpleWatcher() {
                @Override
                public void afterTextChanged(Editable s) {
                    boolean needUndo = (undoSessionLineId != line.id) || !undoSessionTextRecorded;
                    if (needUndo) {
                        undoSessionLineId = line.id;
                        undoSessionTextRecorded = true;
                    }
                    doc.updateLineTextDirect(index, s == null ? "" : s.toString(), needUndo);
                    updateHeaderStatus();
                }
            });
            activeLyricEditText = lyricEt;
            card.addView(lyricEt, new LinearLayout.LayoutParams(-1, -2));

            if (showReadingUi && activeTab == LyricsEditorModel.EditTab.LYRICS && !line.reading.isEmpty()) {
                TextView readQuick = text(line.reading, 13, false, labelSecondary);
                readQuick.setPadding(0, dp(2), 0, dp(2));
                readQuick.setBackground(ripple(null));
                readQuick.setClickable(true);
                readQuick.setFocusable(true);
                readQuick.setOnClickListener(v -> {
                    activeTab = LyricsEditorModel.EditTab.READING;
                    resetUndoSession();
                    rebuildAll(true);
                });
                card.addView(readQuick);
            }
        }

        if (showReadingUi && (activeTab == LyricsEditorModel.EditTab.READING || activeTab == LyricsEditorModel.EditTab.BOTH)) {
            card.addView(hairline(), verticalMarginParams(dp(8), dp(8)));

            LinearLayout readLabelRow = new LinearLayout(activity);
            readLabelRow.setOrientation(LinearLayout.HORIZONTAL);
            readLabelRow.setGravity(Gravity.CENTER_VERTICAL);
            readLabelRow.addView(text(str("edit_lyric_reading"), 12, true, labelSecondary),
                    new LinearLayout.LayoutParams(0, -2, 1f));

            if (canAutoGenerateReading) {
                readLabelRow.addView(borderlessTextAction(str("editor_auto_gen_one"), 12, true, accent,
                        () -> autoGenerateSingleReading(index)));
            }
            if (line.isReadingModified() && !line.isAdded()) {
                TextView resetRead = borderlessTextAction(str("reset_lyric_line"), 12, false, labelSecondary, () -> {
                    if (doc.setLineReading(index, line.originalReading)) {
                        resetUndoSession();
                        rebuildAll(true);
                    }
                });
                resetRead.setPadding(dp(12), dp(2), 0, dp(2));
                readLabelRow.addView(resetRead);
            }
            card.addView(readLabelRow);

            final EditText readingEt = cleanFormInput(str("editor_reading_input_hint"), line.reading, 15);
            readingEt.addTextChangedListener(new SimpleWatcher() {
                @Override
                public void afterTextChanged(Editable s) {
                    boolean needUndo = (undoSessionLineId != line.id) || !undoSessionReadingRecorded;
                    if (needUndo) {
                        undoSessionLineId = line.id;
                        undoSessionReadingRecorded = true;
                    }
                    doc.updateLineReadingDirect(index, s == null ? "" : s.toString(), needUndo);
                    updateHeaderStatus();
                }
            });
            card.addView(readingEt, new LinearLayout.LayoutParams(-1, -2));
        }

        // 3. Clean iOS Timing Controls (synced lyrics only)
        if (doc.synced && line.startMs >= 0L) {
            card.addView(hairline(), verticalMarginParams(dp(8), dp(10)));

            card.addView(buildTimeAdjustBlock(
                    str("editor_time_start"),
                    line.startMs,
                    delta -> {
                        if (doc.nudgeLineStart(index, delta, cascadeShift)) rebuildAll(true);
                    },
                    () -> capturePlaybackTime(pos -> {
                        if (doc.setLineStart(index, pos, cascadeShift)) rebuildAll(true);
                    }),
                    () -> openTimestampSheet(str("editor_time_start"), line.startMs, ms -> {
                        if (doc.setLineStart(index, ms, cascadeShift)) rebuildAll(true);
                    })));

            LinearLayout endBlock = buildTimeAdjustBlock(
                    str("editor_time_end"),
                    line.endMs,
                    delta -> {
                        if (doc.nudgeLineEnd(index, delta)) rebuildAll(true);
                    },
                    () -> capturePlaybackTime(pos -> {
                        if (doc.setLineEnd(index, pos)) rebuildAll(true);
                    }),
                    () -> openTimestampSheet(str("editor_time_end"), line.endMs, ms -> {
                        if (doc.setLineEnd(index, ms)) rebuildAll(true);
                    }));
            endBlock.setPadding(0, dp(10), 0, 0);
            card.addView(endBlock);

            // Apple Music signature tinted action row: [Set Now & Next]  [Preview]
            if (mediaBrowser != null) {
                LinearLayout syncBtns = new LinearLayout(activity);
                syncBtns.setOrientation(LinearLayout.HORIZONTAL);
                syncBtns.setPadding(0, dp(12), 0, 0);

                TextView tapSyncBtn = tintedButton(str("editor_stamp_and_next"), accent, accentTint, () ->
                        capturePlaybackTime(pos -> {
                            doc.setLineStart(index, pos, false);
                            if (index + 1 < doc.lines.size()) {
                                expandedLineId = doc.lines.get(index + 1).id;
                            }
                            resetUndoSession();
                            rebuildAll(true);
                            if (expandedLineId >= 0) scrollToLineId(expandedLineId);
                        }));
                LinearLayout.LayoutParams stampLp = new LinearLayout.LayoutParams(0, dp(38), 1.55f);
                stampLp.setMargins(0, 0, dp(8), 0);
                syncBtns.addView(tapSyncBtn, stampLp);

                View previewBtn = iconTextTintedButton(
                        "ic_nowplaying_play", 12, str("editor_audition"), labelPrimary, fillTertiary,
                        () -> seekToPreview(Math.max(0L, line.startMs - 400L), true));
                syncBtns.addView(previewBtn, new LinearLayout.LayoutParams(0, dp(38), 1f));
                card.addView(syncBtns);
            }

            // Clean native Switch row for Cascade Shift
            LinearLayout.LayoutParams cascadeLp = new LinearLayout.LayoutParams(-1, -2);
            cascadeLp.setMargins(0, dp(10), 0, 0);
            card.addView(buildCascadeSwitchRow(), cascadeLp);
        }

        // 4. Calm Borderless Row Footer Actions (Zero rainbow boxes!)
        card.addView(hairline(), verticalMarginParams(dp(10), dp(4)));
        LinearLayout footerRow = new LinearLayout(activity);
        footerRow.setOrientation(LinearLayout.HORIZONTAL);
        footerRow.setGravity(Gravity.CENTER_VERTICAL);

        if (doc.synced && index < doc.lines.size() - 1 && !doc.hasInterludeAfter(index)) {
            TextView interludeBtn = borderlessTextAction(str("editor_insert_interlude_after"), 13, true, accent, () -> {
                long preferred = currentPlaybackMs();
                if (doc.insertInterludeAfter(index, preferred)) {
                    expandedLineId = -1;
                    expandedInterludeAfter = index;
                    resetUndoSession();
                    rebuildAll(true);
                    scrollToInterlude(index);
                }
            });
            interludeBtn.setPadding(0, dp(8), dp(14), dp(4));
            footerRow.addView(interludeBtn);
        }

        TextView addBelowBtn = borderlessTextAction(str("editor_add_below"), 13, false, labelPrimary, () -> {
            int pos = doc.insertLineAt(index + 1, "", "");
            if (pos >= 0 && pos < doc.lines.size()) {
                expandedLineId = doc.lines.get(pos).id;
                resetUndoSession();
                rebuildAll(true);
                scrollToLineId(expandedLineId);
            }
        });
        addBelowBtn.setPadding(0, dp(8), dp(14), dp(4));
        footerRow.addView(addBelowBtn);

        View footerSpacer = new View(activity);
        footerRow.addView(footerSpacer, new LinearLayout.LayoutParams(0, 1, 1f));

        // Row options sheet button (Add Above, Split, Restore Line, Delete)
        ImageView rowMoreBtn = nativeIconButton("ic_navbar_platter_more", 20, labelSecondary,
                str("editor_row_actions"), () -> openLineOptionsSheet(index, line));
        footerRow.addView(rowMoreBtn, new LinearLayout.LayoutParams(dp(34), dp(34)));

        if (doc.lines.size() > 1) {
            TextView deleteBtn = borderlessTextAction(str("editor_delete_line"), 13, false, destructive, () -> {
                if (doc.deleteLine(index)) {
                    expandedLineId = -1;
                    resetUndoSession();
                    rebuildAll(true);
                }
            });
            deleteBtn.setPadding(dp(10), dp(8), 0, dp(4));
            footerRow.addView(deleteBtn);
        }

        card.addView(footerRow);
        outer.addView(card, new LinearLayout.LayoutParams(0, -2, 1f));
        wrapper.addView(outer, new FrameLayout.LayoutParams(-1, -2));
        return wrapper;
    }

    // =========================================================================
    // Apple Music Authentic Interlude Rows (3 Circular Dots — No Amber Slop!)
    // =========================================================================

    private View buildInterludeItem(final int afterLineIndex, final long startMs, final long endMs) {
        final boolean isIntro = afterLineIndex < 0;
        final boolean expanded = expandedInterludeAfter == afterLineIndex;
        final long durationMs = Math.max(0L, endMs - startMs);
        final boolean dotsEligible = durationMs >= LyricsInterludes.EXPLICIT_THRESHOLD_MS;
        final String title = isIntro ? str("editor_intro_interlude") : str("editor_interlude");
        final String rangeStr = LyricsEditorModel.formatTimestamp(startMs)
                + " – " + LyricsEditorModel.formatTimestamp(endMs)
                + " · " + str("editor_seconds_short", LyricsEditorModel.formatDurationSeconds(durationMs));

        if (!expanded) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setBackground(ripple(null));
            row.setClickable(true);
            row.setFocusable(true);
            row.setOnClickListener(v -> {
                expandedLineId = -1;
                expandedInterludeAfter = afterLineIndex;
                resetUndoSession();
                rebuildAll(true);
                scrollToInterlude(afterLineIndex);
            });

            View playBar = new View(activity);
            playBar.setBackground(round(Color.TRANSPARENT, 2));
            LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(dp(3), dp(22));
            barLp.setMargins(dp(4), dp(10), dp(9), dp(10));
            row.addView(playBar, barLp);
            playingBarByInterludeKey.put(afterLineIndex, playBar);

            // Genuine 3-dot Apple Music instrumental indicator
            View[] dots = new View[3];
            row.addView(buildInterludeDotsRow(dots, 7, 4, labelSecondary));
            dotsByInterludeKey.put(afterLineIndex, dots);

            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(LinearLayout.HORIZONTAL);
            labels.setGravity(Gravity.CENTER_VERTICAL);
            labels.setPadding(dp(10), dp(12), dp(8), dp(12));

            labels.addView(text(title, 13, true, labelSecondary));
            TextView rangeTv = tabularText("  " + rangeStr, 12, false, labelTertiary);
            rangeTv.setSingleLine(true);
            rangeTv.setEllipsize(TextUtils.TruncateAt.END);
            labels.addView(rangeTv, new LinearLayout.LayoutParams(0, -2, 1f));
            row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1f));

            int chevId = LrclibStrings.id(activity, "drawable", "ic_actionsheet_chevron_down");
            if (chevId != 0) {
                ImageView chev = new ImageView(activity);
                chev.setImageResource(chevId);
                chev.setImageTintList(ColorStateList.valueOf(labelTertiary));
                LinearLayout.LayoutParams clp = new LinearLayout.LayoutParams(dp(14), dp(14));
                clp.setMargins(0, 0, dp(16), 0);
                row.addView(chev, clp);
            }
            return row;
        }

        // Expanded Interlude Card (matches expanded line card calm elevation)
        FrameLayout wrapper = new FrameLayout(activity);
        wrapper.setPadding(dp(12), dp(8), dp(12), dp(8));

        LinearLayout outer = new LinearLayout(activity);
        outer.setOrientation(LinearLayout.HORIZONTAL);
        GradientDrawable cardBg = round(bgElevated, 14);
        cardBg.setStroke(1, (separator & 0x00FFFFFF) | 0x55000000);
        outer.setBackground(cardBg);

        View playBar = new View(activity);
        playBar.setBackground(round(Color.TRANSPARENT, 2));
        LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(dp(3), -1);
        barLp.setMargins(dp(4), dp(12), dp(4), dp(12));
        outer.addView(playBar, barLp);
        playingBarByInterludeKey.put(afterLineIndex, playBar);

        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(8), dp(10), dp(14), dp(10));

        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);

        View[] dots = new View[3];
        header.addView(buildInterludeDotsRow(dots, 7, 4, dotsEligible ? accent : labelSecondary));
        dotsByInterludeKey.put(afterLineIndex, dots);

        TextView titleTv = tabularText("  " + title + " · "
                + str("editor_seconds_short", LyricsEditorModel.formatDurationSeconds(durationMs)),
                14, true, labelPrimary);
        titleTv.setSingleLine(true);
        titleTv.setEllipsize(TextUtils.TruncateAt.END);
        header.addView(titleTv, new LinearLayout.LayoutParams(0, -2, 1f));

        header.addView(borderlessTextAction(str("editor_done"), 14, true, accent, () -> {
            expandedInterludeAfter = Integer.MIN_VALUE;
            rebuildAll(true);
        }));
        card.addView(header);

        TextView noteTv = text(
                dotsEligible ? str("editor_interlude_dots_active") : str("editor_interlude_dots_short"),
                12, false, labelSecondary);
        noteTv.setPadding(0, dp(4), 0, 0);
        card.addView(noteTv);

        card.addView(hairline(), verticalMarginParams(dp(10), dp(10)));

        if (!isIntro) {
            card.addView(buildTimeAdjustBlock(
                    str("editor_interlude_start"),
                    startMs,
                    delta -> {
                        if (doc.adjustInterludeStart(afterLineIndex, startMs + delta)) rebuildAll(true);
                    },
                    () -> capturePlaybackTime(pos -> {
                        if (doc.adjustInterludeStart(afterLineIndex, pos)) rebuildAll(true);
                    }),
                    () -> openTimestampSheet(str("editor_interlude_start"), startMs, ms -> {
                        if (doc.adjustInterludeStart(afterLineIndex, ms)) rebuildAll(true);
                    })));
        }

        LinearLayout endBlock = buildTimeAdjustBlock(
                str("editor_interlude_end"),
                endMs,
                delta -> {
                    if (doc.adjustInterludeEnd(afterLineIndex, endMs + delta, cascadeShift)) rebuildAll(true);
                },
                () -> capturePlaybackTime(pos -> {
                    if (doc.adjustInterludeEnd(afterLineIndex, pos, cascadeShift)) rebuildAll(true);
                }),
                () -> openTimestampSheet(str("editor_interlude_end"), endMs, ms -> {
                    if (doc.adjustInterludeEnd(afterLineIndex, ms, cascadeShift)) rebuildAll(true);
                }));
        if (!isIntro) endBlock.setPadding(0, dp(10), 0, 0);
        card.addView(endBlock);

        LinearLayout.LayoutParams cascadeLp = new LinearLayout.LayoutParams(-1, -2);
        cascadeLp.setMargins(0, dp(10), 0, 0);
        card.addView(buildCascadeSwitchRow(), cascadeLp);

        card.addView(hairline(), verticalMarginParams(dp(10), dp(4)));
        LinearLayout footerRow = new LinearLayout(activity);
        footerRow.setOrientation(LinearLayout.HORIZONTAL);
        footerRow.setGravity(Gravity.CENTER_VERTICAL);

        if (mediaBrowser != null) {
            View previewBtn = iconTextTintedButton(
                    "ic_nowplaying_play", 11, str("editor_interlude_audition"), labelPrimary, fillTertiary,
                    () -> seekToPreview(Math.max(0L, startMs - 1500L), true));
            footerRow.addView(previewBtn, new LinearLayout.LayoutParams(-2, dp(34)));
        }
        View sp = new View(activity);
        footerRow.addView(sp, new LinearLayout.LayoutParams(0, 1, 1f));

        TextView removeBtn = borderlessTextAction(str("editor_remove_interlude"), 13, false, destructive, () -> {
            if (doc.removeInterludeAfter(afterLineIndex)) {
                expandedInterludeAfter = Integer.MIN_VALUE;
                rebuildAll(true);
            }
        });
        removeBtn.setPadding(dp(8), dp(6), 0, dp(6));
        footerRow.addView(removeBtn);

        card.addView(footerRow);
        outer.addView(card, new LinearLayout.LayoutParams(0, -2, 1f));
        wrapper.addView(outer, new FrameLayout.LayoutParams(-1, -2));
        return wrapper;
    }

    /**
     * Whisper-quiet hairline divider with a subtle capsule when LRCLIB holds a line across a long gap.
     */
    private View buildInterludeCandidateDivider(final int afterLineIndex, long stuckDurationMs) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(4), dp(16), dp(4));

        row.addView(hairline(), new LinearLayout.LayoutParams(0, 1, 1f));

        LinearLayout pill = new LinearLayout(activity);
        pill.setOrientation(LinearLayout.HORIZONTAL);
        pill.setGravity(Gravity.CENTER_VERTICAL);
        pill.setPadding(dp(12), dp(5), dp(12), dp(5));
        pill.setBackground(ripple(round(fillQuaternary, 14)));
        pill.setClickable(true);
        pill.setFocusable(true);
        pill.setOnClickListener(v -> {
            long preferred = currentPlaybackMs();
            if (doc.insertInterludeAfter(afterLineIndex, preferred)) {
                expandedLineId = -1;
                expandedInterludeAfter = afterLineIndex;
                resetUndoSession();
                rebuildAll(true);
                scrollToInterlude(afterLineIndex);
            }
        });

        pill.addView(buildInterludeDotsRow(new View[3], 4, 3, labelSecondary));
        TextView labelTv = tabularText(
                "  " + str("editor_interlude_candidate_cta", LyricsEditorModel.formatDurationSeconds(stuckDurationMs)),
                12, true, labelSecondary);
        pill.addView(labelTv);

        LinearLayout.LayoutParams pillLp = new LinearLayout.LayoutParams(-2, -2);
        pillLp.setMargins(dp(10), 0, dp(10), 0);
        row.addView(pill, pillLp);

        row.addView(hairline(), new LinearLayout.LayoutParams(0, 1, 1f));
        return row;
    }

    private LinearLayout buildInterludeDotsRow(View[] outDots, int diameterDp, int gapDp, int color) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        for (int i = 0; i < 3; i++) {
            View dot = new View(activity);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.OVAL);
            bg.setColor(color);
            dot.setBackground(bg);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(diameterDp), dp(diameterDp));
            if (i > 0) lp.setMargins(dp(gapDp), 0, 0, 0);
            row.addView(dot, lp);
            if (outDots != null && i < outDots.length) outDots[i] = dot;
        }
        return row;
    }

    private void setDotsColor(View[] dots, int color) {
        if (dots == null) return;
        for (View dot : dots) {
            if (dot != null && dot.getBackground() instanceof GradientDrawable) {
                ((GradientDrawable) dot.getBackground()).setColor(color);
            }
        }
    }

    private LinearLayout buildTimeAdjustBlock(
            String label,
            long timeMs,
            final LongConsumer onNudge,
            final Runnable onCaptureNow,
            final Runnable onEditExact) {
        LinearLayout block = new LinearLayout(activity);
        block.setOrientation(LinearLayout.VERTICAL);

        LinearLayout hdr = new LinearLayout(activity);
        hdr.setOrientation(LinearLayout.HORIZONTAL);
        hdr.setGravity(Gravity.CENTER_VERTICAL);
        hdr.addView(text(label, 12, true, labelSecondary), new LinearLayout.LayoutParams(0, -2, 1f));

        TextView tsBtn = tabularText(LyricsEditorModel.formatTimestamp(timeMs), 14, true, labelPrimary);
        tsBtn.setPadding(dp(10), dp(4), dp(10), dp(4));
        tsBtn.setBackground(ripple(round(fillQuaternary, 7)));
        tsBtn.setClickable(true);
        tsBtn.setFocusable(true);
        tsBtn.setOnClickListener(v -> onEditExact.run());
        hdr.addView(tsBtn);
        block.addView(hdr);

        // Unified iOS-style segmented stepper bar
        LinearLayout stepper = new LinearLayout(activity);
        stepper.setOrientation(LinearLayout.HORIZONTAL);
        stepper.setBackground(round(fillTertiary, 8));
        LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(-1, dp(34));
        barLp.setMargins(0, dp(6), 0, 0);

        stepper.addView(stepperCell("-0.5", labelPrimary, false, () -> onNudge.accept(-500L)));
        stepper.addView(verticalDivider());
        stepper.addView(stepperCell("-0.1", labelPrimary, false, () -> onNudge.accept(-100L)));
        if (mediaBrowser != null) {
            stepper.addView(verticalDivider());
            stepper.addView(stepperCell(str("editor_set_now"), accent, true, onCaptureNow));
        }
        stepper.addView(verticalDivider());
        stepper.addView(stepperCell("+0.1", labelPrimary, false, () -> onNudge.accept(100L)));
        stepper.addView(verticalDivider());
        stepper.addView(stepperCell("+0.5", labelPrimary, false, () -> onNudge.accept(500L)));

        block.addView(stepper, barLp);
        return block;
    }

    private TextView stepperCell(String label, int fg, boolean bold, Runnable onClick) {
        TextView tv = tabularText(label, 12, bold, fg);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);
        tv.setBackground(ripple(null));
        tv.setClickable(true);
        tv.setFocusable(true);
        tv.setOnClickListener(v -> onClick.run());
        tv.setLayoutParams(new LinearLayout.LayoutParams(0, -1, 1f));
        return tv;
    }

    private LinearLayout buildCascadeSwitchRow() {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.addView(text(str("editor_cascade_shift"), 13, false, labelSecondary),
                new LinearLayout.LayoutParams(0, -2, 1f));

        Switch sw = new Switch(activity);
        sw.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        sw.setChecked(cascadeShift);
        sw.setThumbTintList(new ColorStateList(
                new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                new int[]{accent, systemGray}));
        sw.setOnCheckedChangeListener((buttonView, isChecked) -> cascadeShift = isChecked);
        row.addView(sw);
        row.setOnClickListener(v -> sw.toggle());
        return row;
    }

    // =========================================================================
    // Native Apple Music Bottom Action Sheets (AppTheme.DialogFlowDialog)
    // =========================================================================

    private void openMoreSheet() {
        hideKeyboard();
        AppleSheet s = new AppleSheet(null);

        s.addAction(str("editor_tool_find_replace"), labelPrimary, false, () -> {
            findPanelOpen = !findPanelOpen;
            if (findPanelOpen) shiftPanelOpen = false;
            rebuildInlinePanel();
        });

        if (doc.synced) {
            s.addAction(str("editor_tool_batch_shift"), labelPrimary, false, () -> {
                shiftPanelOpen = !shiftPanelOpen;
                if (shiftPanelOpen) findPanelOpen = false;
                rebuildInlinePanel();
            });

            int candidates = doc.interludeCandidateCount();
            String interludeLabel = candidates > 0
                    ? str("editor_tool_auto_interludes_count", candidates)
                    : str("editor_tool_auto_interludes");
            s.addAction(interludeLabel, candidates > 0 ? accent : labelPrimary, candidates > 0, () -> {
                int inserted = doc.autoInsertInterludes();
                if (inserted > 0) {
                    toast(str("editor_auto_interludes_done", inserted));
                    rebuildAll(true);
                } else {
                    toast(str("editor_auto_interludes_none"));
                }
            });

            if (!doc.hasIntroInterlude()) {
                s.addAction(str("editor_tool_add_intro"), labelPrimary, false, () -> {
                    if (doc.insertIntroInterlude(LyricsEditorModel.DEFAULT_INSERT_INTERLUDE_MS)) {
                        expandedLineId = -1;
                        expandedInterludeAfter = -1;
                        rebuildAll(false);
                        scrollView.post(() -> scrollView.smoothScrollTo(0, 0));
                    }
                });
            }
        } else {
            s.addAction(str("editor_tool_convert_synced"), accent, true, () -> {
                if (doc.convertToSynced()) {
                    toast(str("editor_converted_to_synced"));
                    if (mediaBrowser != null) startTicker();
                    rebuildAll(true);
                }
            });
        }

        s.addAction(str("editor_tool_bulk_text"), labelPrimary, false, this::openBulkTextSheet);
        s.addAction(str("export_lrc_action"), labelPrimary, false, this::openExportCurrentLrc);

        if (canAutoGenerateReading) {
            s.addAction(
                    romanizingBusy ? str("editor_generating_readings") : str("editor_tool_auto_readings"),
                    labelPrimary, false,
                    () -> {
                        if (!romanizingBusy) promptAutoGenerateAllReadings();
                    });
        }

        s.addAction(str("editor_tool_add_line"), labelPrimary, false, this::appendNewLineAndFocus);

        if (doc.modifiedLineCount() > 0 || doc.hadSavedEditsInitially()) {
            s.addAction(str("editor_tool_restore_all"), destructive, false, this::confirmRestoreAll);
        }

        s.addCancel();
        s.show();
    }

    private void openLineOptionsSheet(final int index, final LyricsEditorModel.Line line) {
        hideKeyboard();
        AppleSheet s = new AppleSheet(str("editor_row_actions"));

        s.addAction(str("editor_add_above"), labelPrimary, false, () -> {
            int pos = doc.insertLineAt(index, "", "");
            if (pos >= 0 && pos < doc.lines.size()) {
                expandedLineId = doc.lines.get(pos).id;
                resetUndoSession();
                rebuildAll(true);
                scrollToLineId(expandedLineId);
            }
        });

        if (line.text.length() >= 2) {
            s.addAction(str("editor_split_line"), labelPrimary, false, () -> {
                int cursor = -1;
                if (activeLyricEditText != null) {
                    int sel = activeLyricEditText.getSelectionStart();
                    if (sel > 0 && sel < line.text.length()) cursor = sel;
                }
                if (doc.splitLine(index, cursor)) {
                    resetUndoSession();
                    rebuildAll(true);
                }
            });
        }

        if (line.isModified(doc.synced) && !line.isAdded()) {
            s.addAction(str("reset_lyric_line"), labelPrimary, false, () -> {
                if (doc.restoreLine(index)) {
                    resetUndoSession();
                    rebuildAll(true);
                }
            });
        }

        if (doc.lines.size() > 1) {
            s.addAction(str("editor_delete_line"), destructive, false, () -> {
                if (doc.deleteLine(index)) {
                    expandedLineId = -1;
                    resetUndoSession();
                    rebuildAll(true);
                }
            });
        }

        s.addCancel();
        s.show();
    }

    private void openTimestampSheet(String title, long currentMs, final LongConsumer onCommit) {
        hideKeyboard();
        AppleSheet s = new AppleSheet(title);

        LinearLayout inputWrap = new LinearLayout(activity);
        inputWrap.setOrientation(LinearLayout.VERTICAL);
        inputWrap.setPadding(dp(20), dp(4), dp(20), dp(14));

        final EditText input = new EditText(activity);
        input.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        input.setTypeface(semibold);
        input.setFontFeatureSettings("tnum");
        input.setTextSize(20);
        input.setTextColor(labelPrimary);
        input.setHintTextColor(labelTertiary);
        input.setGravity(Gravity.CENTER);
        input.setSingleLine(true);
        input.setSelectAllOnFocus(true);
        input.setHint("01:23.45");
        input.setText(LyricsEditorModel.formatTimestamp(currentMs));
        input.setBackground(round(fillQuaternary, 10));
        input.setPadding(dp(12), dp(10), dp(12), dp(10));
        inputWrap.addView(input, new LinearLayout.LayoutParams(-1, -2));

        TextView hintTv = text(str("editor_time_input_hint"), 12, false, labelSecondary);
        hintTv.setGravity(Gravity.CENTER);
        hintTv.setPadding(0, dp(8), 0, 0);
        inputWrap.addView(hintTv);
        s.addCustomView(inputWrap);

        s.addAction(str("editor_apply"), accent, true, () -> {
            long parsed = LyricsEditorModel.parseTimestamp(input.getText().toString());
            if (parsed < 0L) {
                toast(str("editor_invalid_timestamp"));
            } else {
                onCommit.accept(parsed);
            }
        });
        if (mediaBrowser != null) {
            s.addAction(str("editor_set_now"), labelPrimary, false, () -> capturePlaybackTime(onCommit));
        }
        s.addCancel();
        s.showWithKeyboard(input);
    }

    private void promptAutoGenerateAllReadings() {
        boolean anyExisting = false;
        for (LyricsEditorModel.Line l : doc.lines) {
            if (!l.reading.isEmpty()) {
                anyExisting = true;
                break;
            }
        }
        if (!anyExisting) {
            runAutoGenerateAllReadings(false);
            return;
        }
        AppleSheet s = new AppleSheet(str("editor_tool_auto_readings"));
        s.addAction(str("editor_auto_gen_missing_only"), labelPrimary, false, () -> runAutoGenerateAllReadings(false));
        s.addAction(str("editor_auto_gen_overwrite_all"), labelPrimary, false, () -> runAutoGenerateAllReadings(true));
        s.addCancel();
        s.show();
    }

    private void confirmRestoreAll() {
        AppleSheet s = new AppleSheet(str("restore_all_song_edits"), str("editor_restore_all_confirm"));
        s.addAction(str("editor_tool_restore_all"), destructive, true, () -> {
            if (LyricsLineEditor.restoreAll(activity, sheet.documentKey)) {
                toast(str("song_edits_restored"));
                dialog.dismiss();
                if (onSaved != null) onSaved.run();
            }
        });
        s.addCancel();
        s.show();
    }

    private void requestClose() {
        hideKeyboard();
        if (!doc.isDirty()) {
            dialog.dismiss();
            return;
        }
        AppleSheet s = new AppleSheet(str("editor_unsaved_title"), str("editor_unsaved_message"));
        s.addAction(str("save"), accent, true, () -> performSave(true));
        s.addAction(str("editor_discard"), destructive, false, dialog::dismiss);
        s.addCancel();
        s.show();
    }

    // =========================================================================
    // Bulk Text / Romaji / LRC Modal Sheet (Apple Music Native Style)
    // =========================================================================

    private void openBulkTextSheet() {
        hideKeyboard();
        final Dialog bulkDialog = createFullScreenSubDialog();
        final LinearLayout bulkRoot = new LinearLayout(activity);
        bulkRoot.setOrientation(LinearLayout.VERTICAL);
        bulkRoot.setBackgroundColor(bgPrimary);
        if (Build.VERSION.SDK_INT >= 29) {
            bulkRoot.setForceDarkAllowed(false);
        }
        if (Build.VERSION.SDK_INT >= 30) {
            bulkRoot.setOnApplyWindowInsetsListener((view, insets) -> {
                android.graphics.Insets safe = insets.getInsets(
                        WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime()
                );
                view.setPadding(safe.left, safe.top, safe.right, safe.bottom);
                return insets;
            });
        }

        final int[] bulkMode = new int[]{
                (showReadingUi && activeTab == LyricsEditorModel.EditTab.READING) ? 1 : 0
        };

        // Native iOS Modal Nav Bar
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(8), 0, dp(8), 0);

        TextView cancelBtn = borderlessTextAction(
                activity.getString(android.R.string.cancel), 16, false, accent, bulkDialog::dismiss);
        cancelBtn.setPadding(dp(8), dp(10), dp(8), dp(10));
        bar.addView(cancelBtn);

        TextView heading = text(str("editor_bulk_title"), 16, true, labelPrimary);
        heading.setGravity(Gravity.CENTER);
        bar.addView(heading, new LinearLayout.LayoutParams(0, -2, 1f));

        final EditText editorBox = new EditText(activity);
        TextView applyBtn = borderlessTextAction(str("editor_apply"), 16, true, accent, () -> {
            String raw = editorBox.getText().toString();
            LyricsEditorModel.BulkApplyResult res;
            if (bulkMode[0] == 2 && doc.synced) {
                res = doc.applyBulkLrc(raw);
            } else {
                res = doc.applyBulkPlain(raw, bulkMode[0] == 1);
            }
            if (res.applied) {
                resetUndoSession();
                expandedLineId = -1;
                expandedInterludeAfter = Integer.MIN_VALUE;
                toast(str("editor_bulk_applied", res.updatedLines + res.addedLines));
                bulkDialog.dismiss();
                rebuildAll(true);
            } else {
                toast(str("editor_bulk_no_changes"));
            }
        });
        applyBtn.setPadding(dp(8), dp(10), dp(8), dp(10));
        bar.addView(applyBtn);
        bulkRoot.addView(bar, new LinearLayout.LayoutParams(-1, dp(52)));

        // Authentic iOS Segmented Control
        LinearLayout segWrap = new LinearLayout(activity);
        segWrap.setOrientation(LinearLayout.VERTICAL);
        segWrap.setPadding(dp(16), dp(2), dp(16), dp(8));
        final LinearLayout modeBar = new LinearLayout(activity);
        modeBar.setOrientation(LinearLayout.HORIZONTAL);
        modeBar.setBackground(round(fillTertiary, 9));
        modeBar.setPadding(dp(2), dp(2), dp(2), dp(2));
        segWrap.addView(modeBar, new LinearLayout.LayoutParams(-1, dp(32)));
        bulkRoot.addView(segWrap, new LinearLayout.LayoutParams(-1, -2));

        final TextView hintTv = text("", 12, false, labelSecondary);
        hintTv.setPadding(dp(18), dp(2), dp(18), dp(10));
        hintTv.setLineSpacing(dp(2), 1f);
        bulkRoot.addView(hintTv, new LinearLayout.LayoutParams(-1, -2));

        editorBox.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        editorBox.setGravity(Gravity.TOP | Gravity.START);
        editorBox.setTextColor(labelPrimary);
        editorBox.setHintTextColor(labelTertiary);
        editorBox.setTextSize(15);
        editorBox.setLineSpacing(dp(4), 1f);
        editorBox.setBackground(round(bgElevated, 12));
        editorBox.setPadding(dp(14), dp(12), dp(14), dp(12));
        editorBox.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        editorBox.setHorizontallyScrolling(false);
        editorBox.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        LinearLayout.LayoutParams boxLp = new LinearLayout.LayoutParams(-1, 0, 1f);
        boxLp.setMargins(dp(16), 0, dp(16), dp(16));
        bulkRoot.addView(editorBox, boxLp);

        final Runnable[] refreshBulkMode = new Runnable[1];
        refreshBulkMode[0] = () -> {
            modeBar.removeAllViews();
            int modeCount = 1 + (showReadingUi ? 1 : 0) + (doc.synced ? 1 : 0);
            segWrap.setVisibility(modeCount > 1 ? View.VISIBLE : View.GONE);
            addMiniSegment(modeBar, str("editor_bulk_mode_lyrics"), bulkMode[0] == 0, () -> {
                bulkMode[0] = 0;
                refreshBulkMode[0].run();
            });
            if (showReadingUi) {
                addMiniSegment(modeBar, str("editor_bulk_mode_reading"), bulkMode[0] == 1, () -> {
                    bulkMode[0] = 1;
                    refreshBulkMode[0].run();
                });
            }
            if (doc.synced) {
                addMiniSegment(modeBar, str("editor_bulk_mode_lrc"), bulkMode[0] == 2, () -> {
                    bulkMode[0] = 2;
                    refreshBulkMode[0].run();
                });
            }
            if (bulkMode[0] == 0) {
                hintTv.setText(str("editor_bulk_hint_lyrics", doc.lines.size()));
                editorBox.setTypeface(regular);
                editorBox.setFontFeatureSettings(null);
                editorBox.setText(doc.exportBulkPlain(false));
            } else if (bulkMode[0] == 1) {
                hintTv.setText(str("editor_bulk_hint_reading", doc.lines.size()));
                editorBox.setTypeface(regular);
                editorBox.setFontFeatureSettings(null);
                editorBox.setText(doc.exportBulkPlain(true));
            } else {
                hintTv.setText(str("editor_bulk_hint_lrc"));
                editorBox.setTypeface(regular);
                editorBox.setFontFeatureSettings("tnum");
                editorBox.setText(doc.exportBulkLrc());
            }
        };
        refreshBulkMode[0].run();

        bulkDialog.setContentView(bulkRoot);
        bulkDialog.show();
        Window w = bulkDialog.getWindow();
        if (w != null) {
            w.setLayout(-1, -1);
            if (Build.VERSION.SDK_INT >= 30 && w.getInsetsController() != null) {
                int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                w.getInsetsController().setSystemBarsAppearance(lightTheme ? mask : 0, mask);
            }
        }
        bulkRoot.requestApplyInsets();
    }

    // =========================================================================
    // Auto-Romanize Helpers & Actions
    // =========================================================================

    private void appendNewLineAndFocus() {
        int insertedPos = doc.insertLineAt(doc.lines.size(), "", "");
        if (insertedPos >= 0 && insertedPos < doc.lines.size()) {
            expandedInterludeAfter = Integer.MIN_VALUE;
            expandedLineId = doc.lines.get(insertedPos).id;
            resetUndoSession();
            rebuildAll(false);
            scrollToLineId(expandedLineId);
        }
    }

    private void autoGenerateSingleReading(final int index) {
        if (index < 0 || index >= doc.lines.size()) return;
        final LyricsEditorModel.Line line = doc.lines.get(index);
        final String sourceText = line.text;
        if (sourceText.isEmpty()) return;
        final StringBuilder contextSample = new StringBuilder();
        for (LyricsEditorModel.Line l : doc.lines) {
            contextSample.append(l.text).append('\n');
        }
        final int targetId = line.id;
        WORKER.execute(() -> {
            UnaryOperator<String> rom = LrclibRomanizer.create("", contextSample.toString());
            String generated = rom != null ? rom.apply(sourceText) : null;
            MAIN.post(() -> {
                if (!dialog.isShowing()) return;
                if (generated == null || generated.trim().isEmpty()) {
                    toast(str("editor_auto_gen_unavailable"));
                    return;
                }
                int idx = findLineIndexById(targetId);
                if (idx >= 0) {
                    doc.setLineReading(idx, generated.trim());
                    resetUndoSession();
                    rebuildAll(true);
                }
            });
        });
    }

    private void runAutoGenerateAllReadings(final boolean overwriteExisting) {
        romanizingBusy = true;
        updateHeaderStatus();
        final List<String> texts = new ArrayList<>(doc.lines.size());
        final StringBuilder all = new StringBuilder();
        for (LyricsEditorModel.Line l : doc.lines) {
            texts.add(l.text);
            all.append(l.text).append('\n');
        }
        WORKER.execute(() -> {
            UnaryOperator<String> rom = LrclibRomanizer.create("", all.toString());
            final List<String> generated = new ArrayList<>(texts.size());
            if (rom != null) {
                for (String t : texts) {
                    String g = rom.apply(t);
                    generated.add(g == null ? "" : g.trim());
                }
            }
            MAIN.post(() -> {
                romanizingBusy = false;
                if (!dialog.isShowing()) return;
                if (generated.isEmpty()) {
                    toast(str("editor_auto_gen_unavailable"));
                    updateHeaderStatus();
                    return;
                }
                List<String> merged = new ArrayList<>(doc.lines.size());
                int count = 0;
                for (int i = 0; i < doc.lines.size(); i++) {
                    LyricsEditorModel.Line l = doc.lines.get(i);
                    String gen = i < generated.size() ? generated.get(i) : "";
                    if ((overwriteExisting || l.reading.isEmpty()) && !gen.isEmpty() && !gen.equals(l.reading)) {
                        merged.add(gen);
                        count++;
                    } else {
                        merged.add(l.reading);
                    }
                }
                if (count > 0) {
                    StringBuilder joined = new StringBuilder();
                    for (int i = 0; i < merged.size(); i++) {
                        if (i > 0) joined.append('\n');
                        joined.append(merged.get(i));
                    }
                    doc.applyBulkPlain(joined.toString(), true);
                    toast(str("editor_auto_gen_done", count));
                } else {
                    toast(str("editor_auto_gen_unavailable"));
                }
                rebuildAll(true);
            });
        });
    }

    // =========================================================================
    // Playback Control & O(1) Live Highlighting
    // =========================================================================

    private long currentPlaybackMs() {
        if (mediaBrowser == null) return -1L;
        return LrclibReflection.getPlaybackPositionMs(mediaBrowser);
    }

    private void capturePlaybackTime(LongConsumer onPosition) {
        long pos = currentPlaybackMs();
        if (pos < 0L) {
            toast(str("editor_playback_unavailable"));
            return;
        }
        onPosition.accept(pos);
    }

    private void togglePlayPause() {
        if (mediaBrowser == null) return;
        if (LrclibReflection.isPlaying(mediaBrowser)) {
            LrclibReflection.pause(mediaBrowser);
        } else {
            LrclibReflection.play(mediaBrowser);
        }
        updateLivePlaybackUi();
    }

    private void nudgePlayback(long deltaMs) {
        if (mediaBrowser == null) return;
        long pos = LrclibReflection.getPlaybackPositionMs(mediaBrowser);
        if (pos < 0L) return;
        LrclibReflection.seekTo(mediaBrowser, Math.max(0L, pos + deltaMs));
        updateLivePlaybackUi();
    }

    private void seekToPreview(long positionMs, boolean startIfPaused) {
        if (mediaBrowser == null) return;
        LrclibReflection.seekTo(mediaBrowser, Math.max(0L, positionMs));
        if (startIfPaused && !LrclibReflection.isPlaying(mediaBrowser)) {
            LrclibReflection.play(mediaBrowser);
        }
        updateLivePlaybackUi();
    }

    private void updateLivePlaybackUi() {
        if (mediaBrowser == null || !doc.synced) return;
        boolean playing = LrclibReflection.isPlaying(mediaBrowser);
        long pos = LrclibReflection.getPlaybackPositionMs(mediaBrowser);

        if (playPauseIcon != null && playing != lastPlayingState) {
            lastPlayingState = playing;
            int iconRes = LrclibStrings.id(activity, "drawable",
                    playing ? "ic_nowplaying_pause" : "ic_nowplaying_play");
            if (iconRes != 0) {
                playPauseIcon.setImageResource(iconRes);
                playPauseIcon.setImageTintList(ColorStateList.valueOf(labelPrimary));
            }
            playPauseIcon.setContentDescription(str(playing ? "editor_pause" : "editor_play"));
        }
        if (livePositionTv != null && pos >= 0L) {
            livePositionTv.setText(LyricsEditorModel.formatTimestamp(pos));
        }
        if (pos < 0L) return;

        int activeLineIdx = doc.findPlayingLineIndex(pos);
        int activeLineId = (activeLineIdx >= 0 && activeLineIdx < doc.lines.size())
                ? doc.lines.get(activeLineIdx).id : -1;
        int activeInterlude = doc.findPlayingInterludeAfter(pos);
        int interludeKey = activeInterlude == -2 ? -1 : (activeInterlude >= 0 ? activeInterlude : Integer.MIN_VALUE);

        if (activeLineId != lastHighlightedLineId) {
            View oldBar = playingBarByLineId.get(lastHighlightedLineId);
            if (oldBar != null) oldBar.setBackground(round(Color.TRANSPARENT, 2));
            TextView oldTs = timestampViewByLineId.get(lastHighlightedLineId);
            if (oldTs != null) oldTs.setTextColor(labelSecondary);

            View newBar = playingBarByLineId.get(activeLineId);
            if (newBar != null) newBar.setBackground(round(accent, 2));
            TextView newTs = timestampViewByLineId.get(activeLineId);
            if (newTs != null) newTs.setTextColor(accent);
            lastHighlightedLineId = activeLineId;
        }

        if (interludeKey != lastHighlightedInterludeKey) {
            View oldBar = playingBarByInterludeKey.get(lastHighlightedInterludeKey);
            if (oldBar != null) oldBar.setBackground(round(Color.TRANSPARENT, 2));
            if (lastHighlightedInterludeKey != expandedInterludeAfter) {
                setDotsColor(dotsByInterludeKey.get(lastHighlightedInterludeKey), labelSecondary);
            }

            View newBar = playingBarByInterludeKey.get(interludeKey);
            if (newBar != null) newBar.setBackground(round(accent, 2));
            setDotsColor(dotsByInterludeKey.get(interludeKey), accent);
            lastHighlightedInterludeKey = interludeKey;
        }
    }

    private void scrollToCurrentPlaying(boolean expandIfFound) {
        long pos = currentPlaybackMs();
        if (pos < 0L) return;
        int interlude = doc.findPlayingInterludeAfter(pos);
        if (interlude == -2) {
            scrollToInterlude(-1);
            return;
        }
        if (interlude >= 0) {
            scrollToInterlude(interlude);
            return;
        }
        int idx = doc.findPlayingLineIndex(pos);
        if (idx < 0) {
            for (int i = 0; i < doc.lines.size(); i++) {
                if (doc.lines.get(i).startMs >= pos) {
                    idx = i;
                    break;
                }
            }
        }
        if (idx >= 0 && idx < doc.lines.size()) {
            int targetId = doc.lines.get(idx).id;
            if (expandIfFound && expandedLineId != targetId) {
                expandedInterludeAfter = Integer.MIN_VALUE;
                expandedLineId = targetId;
                resetUndoSession();
                rebuildAll(true);
            }
            scrollToLineId(targetId);
        }
    }

    private void moveExpandedLine(int newIndex) {
        if (newIndex < 0 || newIndex >= doc.lines.size()) return;
        expandedInterludeAfter = Integer.MIN_VALUE;
        expandedLineId = doc.lines.get(newIndex).id;
        resetUndoSession();
        rebuildAll(true);
        scrollToLineId(expandedLineId);
    }

    private void scrollToLineId(final int lineId) {
        scrollView.post(() -> {
            View row = rowViewByLineId.get(lineId);
            if (row != null) {
                int targetY = Math.max(0, row.getTop() - dp(16));
                scrollView.smoothScrollTo(0, targetY);
            }
        });
    }

    private void scrollToInterlude(final int key) {
        scrollView.post(() -> {
            View card = interludeViewByKey.get(key);
            if (card != null) {
                int targetY = Math.max(0, card.getTop() - dp(16));
                scrollView.smoothScrollTo(0, targetY);
            }
        });
    }

    private void openExportCurrentLrc() {
        hideKeyboard();
        String exportTtml = sheet.displayed;
        try {
            LyricsEditTtml.DocumentEdit currentEdit = doc.toDocumentEdit();
            if (!currentEdit.lines.isEmpty() && sheet.original != null && !sheet.original.isEmpty()) {
                exportTtml = LyricsEditTtml.applyDocument(
                        sheet.original,
                        sheet.baseline,
                        currentEdit,
                        doc.wordTimed,
                        false,
                        null,
                        LyricsFeatures.pronunciation());
            }
        } catch (Exception ignored) {
        }
        LrclibUi.openExportLrcPage(
                activity,
                query,
                sheet.withDisplay(exportTtml),
                doc.isDirty() || doc.hadSavedEditsInitially());
    }

    private static boolean hasAnyDocReading(LyricsEditorModel.Document document) {
        if (document == null) return false;
        for (LyricsEditorModel.Line l : document.lines) {
            if (l.reading != null && !l.reading.isEmpty()) return true;
        }
        return false;
    }

    private void performSave(boolean dismissAfter) {
        hideKeyboard();
        LyricsEditTtml.DocumentEdit edit = doc.toDocumentEdit();
        if (edit.lines.isEmpty()) {
            toast(str("empty_lyric_line"));
            return;
        }
        if (LyricsLineEditor.saveDocument(activity, sheet, query, edit)) {
            toast(str("editor_saved"));
            if (dismissAfter) {
                dialog.dismiss();
            }
            if (onSaved != null) onSaved.run();
        }
    }

    private void resetUndoSession() {
        undoSessionLineId = -1;
        undoSessionTextRecorded = false;
        undoSessionReadingRecorded = false;
    }

    private int findLineIndexById(int id) {
        if (id < 0) return -1;
        for (int i = 0; i < doc.lines.size(); i++) {
            if (doc.lines.get(i).id == id) return i;
        }
        return -1;
    }

    // =========================================================================
    // Native Apple Music Bottom Action Sheet Helper (matches LyricsEditSheet)
    // =========================================================================

    private final class AppleSheet {
        private final Dialog sheetDialog;
        private final LinearLayout sheetRoot;
        private boolean hasItems = false;

        AppleSheet(String title) {
            this(title, null);
        }

        AppleSheet(String title, String message) {
            int theme = LrclibStrings.id(activity, "style", "AppTheme.DialogFlowDialog");
            sheetDialog = theme == 0 ? new Dialog(activity) : new Dialog(activity, theme);
            sheetDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            sheetDialog.setCanceledOnTouchOutside(true);

            sheetRoot = new LinearLayout(activity);
            sheetRoot.setOrientation(LinearLayout.VERTICAL);
            if (Build.VERSION.SDK_INT >= 29) {
                sheetRoot.setForceDarkAllowed(false);
            }
            sheetRoot.setPadding(0, dp(8), 0, dp(8));

            // Native Apple Music bottom sheet grabber bar
            int grabberId = LrclibStrings.id(activity, "drawable", "ic_bottom_sheet_grapple");
            View grabber;
            if (grabberId != 0) {
                ImageView iv = new ImageView(activity);
                iv.setImageResource(grabberId);
                iv.setImageTintList(ColorStateList.valueOf(labelTertiary));
                grabber = iv;
            } else {
                grabber = new View(activity);
                grabber.setBackground(round(labelTertiary, 2));
            }
            LinearLayout.LayoutParams gLp = new LinearLayout.LayoutParams(dp(36), dp(4));
            gLp.gravity = Gravity.CENTER_HORIZONTAL;
            gLp.setMargins(0, dp(2), 0, dp(8));
            sheetRoot.addView(grabber, gLp);

            if ((title != null && !title.isEmpty()) || (message != null && !message.isEmpty())) {
                LinearLayout header = new LinearLayout(activity);
                header.setOrientation(LinearLayout.VERTICAL);
                header.setGravity(Gravity.CENTER_HORIZONTAL);
                header.setPadding(dp(20), dp(4), dp(20), dp(12));
                if (title != null && !title.isEmpty()) {
                    TextView t = text(title, 14, true, labelSecondary);
                    t.setGravity(Gravity.CENTER);
                    header.addView(t);
                }
                if (message != null && !message.isEmpty()) {
                    TextView m = text(message, 13, false, labelSecondary);
                    m.setGravity(Gravity.CENTER);
                    m.setLineSpacing(dp(2), 1f);
                    m.setPadding(0, dp(4), 0, 0);
                    header.addView(m);
                }
                sheetRoot.addView(header);
                hasItems = true;
            }

            sheetDialog.setContentView(sheetRoot);
            Window window = sheetDialog.getWindow();
            if (window != null) {
                int rounded = LrclibStrings.id(activity, "drawable", "rounded_top_background_system_dialog");
                if (rounded != 0) {
                    window.setBackgroundDrawableResource(rounded);
                } else {
                    GradientDrawable bg = new GradientDrawable();
                    bg.setColor(bgElevated);
                    float r = dp(20);
                    bg.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
                    window.setBackgroundDrawable(bg);
                }
                int animations = LrclibStrings.id(activity, "style", "AppTheme.DialogFlowDialog.WindowAnimations");
                if (animations != 0) window.setWindowAnimations(animations);
                window.setGravity(Gravity.BOTTOM);
                window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                window.setDimAmount(0.45f);
            }
        }

        void addCustomView(View view) {
            sheetRoot.addView(view, new LinearLayout.LayoutParams(-1, -2));
            hasItems = true;
        }

        void addAction(String label, int color, boolean bold, Runnable onClick) {
            if (hasItems) {
                sheetRoot.addView(hairline(), new LinearLayout.LayoutParams(-1, 1));
            }
            Button row = new Button(activity, null, android.R.attr.borderlessButtonStyle);
            row.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            row.setAllCaps(false);
            row.setText(label);
            row.setTextColor(color);
            row.setTextSize(17);
            row.setTypeface(bold ? semibold : regular);
            row.setMinWidth(0);
            row.setMinHeight(dp(50));
            row.setGravity(Gravity.CENTER);
            row.setPadding(dp(16), dp(8), dp(16), dp(8));
            row.setBackground(ripple(null));
            row.setOnClickListener(v -> {
                sheetDialog.dismiss();
                if (onClick != null) onClick.run();
            });
            sheetRoot.addView(row, new LinearLayout.LayoutParams(-1, -2));
            hasItems = true;
        }

        void addCancel() {
            addAction(activity.getString(android.R.string.cancel), accent, true, null);
        }

        void show() {
            sheetDialog.show();
            Window w = sheetDialog.getWindow();
            if (w != null) w.setLayout(-1, -2);
        }

        void showWithKeyboard(EditText focusTarget) {
            Window w = sheetDialog.getWindow();
            if (w != null) {
                w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                        | WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE);
            }
            sheetDialog.show();
            if (w != null) w.setLayout(-1, -2);
            if (focusTarget != null) {
                focusTarget.requestFocus();
            }
        }
    }

    // =========================================================================
    // Crisp SF-Symbol-Style Vector Drawable for Undo & Redo
    // =========================================================================

    private static final class UndoRedoDrawable extends Drawable {
        private final boolean redo;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        UndoRedoDrawable(boolean redo, int color, float strokePx) {
            this.redo = redo;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(strokePx);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float w = b.width();
            float h = b.height();
            if (w <= 0f || h <= 0f) return;

            canvas.save();
            if (redo) {
                canvas.scale(-1f, 1f, b.exactCenterX(), b.exactCenterY());
            }
            float l = b.left;
            float t = b.top;

            // SF-style curved undo arrow (arrow.uturn.backward)
            Path arrow = new Path();
            arrow.moveTo(l + w * 0.40f, t + h * 0.22f);
            arrow.lineTo(l + w * 0.20f, t + h * 0.40f);
            arrow.lineTo(l + w * 0.40f, t + h * 0.58f);
            canvas.drawPath(arrow, paint);

            Path arc = new Path();
            arc.moveTo(l + w * 0.22f, t + h * 0.40f);
            arc.lineTo(l + w * 0.58f, t + h * 0.40f);
            arc.cubicTo(
                    l + w * 0.82f, t + h * 0.40f,
                    l + w * 0.82f, t + h * 0.78f,
                    l + w * 0.56f, t + h * 0.78f);
            arc.lineTo(l + w * 0.34f, t + h * 0.78f);
            canvas.drawPath(arc, paint);
            canvas.restore();
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

    // =========================================================================
    // Apple Music View Helpers
    // =========================================================================

    private Dialog createFullScreenSubDialog() {
        int themeId = LrclibStrings.id(activity, "style", "AppTheme.FullScreenDialog");
        Dialog d = themeId != 0 ? new Dialog(activity, themeId) : new Dialog(activity);
        d.requestWindowFeature(Window.FEATURE_NO_TITLE);
        Window w = d.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(bgPrimary));
            w.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            w.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS
                    | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                    | WindowManager.LayoutParams.FLAG_LAYOUT_INSET_DECOR);
            if (Build.VERSION.SDK_INT >= 30) w.setDecorFitsSystemWindows(false);
            w.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            w.setStatusBarColor(Color.TRANSPARENT);
            w.setNavigationBarColor(bgPrimary);
        }
        return d;
    }

    private EditText cleanFormInput(String hint, String value, int sp) {
        EditText et = new EditText(activity);
        et.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        et.setTypeface(regular);
        et.setTextSize(sp);
        et.setTextColor(labelPrimary);
        et.setHintTextColor(labelTertiary);
        et.setHint(hint);
        et.setText(value == null ? "" : value);
        et.setBackground(null);
        et.setHorizontallyScrolling(false);
        et.setMaxLines(4);
        et.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        et.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        et.setPadding(0, dp(6), 0, dp(4));
        return et;
    }

    private EditText searchStyleInput(String hint, String value) {
        EditText et = new EditText(activity);
        et.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        et.setTypeface(regular);
        et.setTextSize(14);
        et.setTextColor(labelPrimary);
        et.setHintTextColor(labelTertiary);
        et.setHint(hint);
        et.setText(value == null ? "" : value);
        et.setSingleLine(true);
        et.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        et.setBackground(round(fillTertiary, 10));
        et.setPadding(dp(11), 0, dp(11), 0);
        return et;
    }

    private ImageView nativeIconButton(String drawableName, int iconDp, int tint, String desc, Runnable onClick) {
        ImageView iv = new ImageView(activity);
        int resId = LrclibStrings.id(activity, "drawable", drawableName);
        if (resId != 0) {
            iv.setImageResource(resId);
            iv.setImageTintList(ColorStateList.valueOf(tint));
        }
        iv.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        int pad = Math.max(dp(4), dp((38 - iconDp) / 2f));
        iv.setPadding(pad, pad, pad, pad);
        iv.setBackground(ripple(null));
        iv.setContentDescription(desc);
        iv.setClickable(true);
        iv.setFocusable(true);
        iv.setOnClickListener(v -> onClick.run());
        return iv;
    }

    private ImageView vectorIconButton(Drawable drawable, String desc, Runnable onClick) {
        ImageView iv = new ImageView(activity);
        iv.setImageDrawable(drawable);
        iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
        iv.setPadding(dp(9), dp(10), dp(9), dp(10));
        iv.setBackground(ripple(null));
        iv.setContentDescription(desc);
        iv.setClickable(true);
        iv.setFocusable(true);
        iv.setOnClickListener(v -> onClick.run());
        return iv;
    }

    private TextView borderlessTextAction(String label, int sp, boolean bold, int color, Runnable onClick) {
        TextView tv = text(label, sp, bold, color);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);
        tv.setBackground(ripple(null));
        tv.setClickable(true);
        tv.setFocusable(true);
        tv.setOnClickListener(v -> onClick.run());
        return tv;
    }

    private TextView tintedButton(String label, int fg, int bg, Runnable onClick) {
        TextView tv = text(label, 14, true, fg);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        tv.setPadding(dp(12), 0, dp(12), 0);
        tv.setBackground(ripple(round(bg, 10)));
        tv.setClickable(true);
        tv.setFocusable(true);
        tv.setOnClickListener(v -> onClick.run());
        return tv;
    }

    private TextView tintedPillButton(String label, int fg, int bg, Runnable onClick) {
        TextView tv = text(label, 13, true, fg);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);
        tv.setPadding(dp(12), 0, dp(12), 0);
        tv.setBackground(ripple(round(bg, 8)));
        tv.setClickable(true);
        tv.setFocusable(true);
        tv.setOnClickListener(v -> onClick.run());
        return tv;
    }

    private View iconTextTintedButton(
            String drawableName, int iconDp, String label, int fg, int bg, Runnable onClick) {
        LinearLayout btn = new LinearLayout(activity);
        btn.setOrientation(LinearLayout.HORIZONTAL);
        btn.setGravity(Gravity.CENTER);
        btn.setPadding(dp(12), 0, dp(12), 0);
        btn.setBackground(ripple(round(bg, 10)));
        btn.setClickable(true);
        btn.setFocusable(true);
        btn.setOnClickListener(v -> onClick.run());

        int resId = LrclibStrings.id(activity, "drawable", drawableName);
        if (resId != 0) {
            ImageView iv = new ImageView(activity);
            iv.setImageResource(resId);
            iv.setImageTintList(ColorStateList.valueOf(fg));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(iconDp), dp(iconDp));
            lp.setMargins(0, 0, dp(6), 0);
            btn.addView(iv, lp);
        }
        TextView tv = text(label, 14, true, fg);
        tv.setSingleLine(true);
        btn.addView(tv);
        return btn;
    }

    private TextView text(String value, int sp, boolean bold, int color) {
        TextView tv = new TextView(activity);
        tv.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        tv.setText(value);
        tv.setTextSize(sp);
        tv.setTextColor(color);
        tv.setTypeface(bold ? semibold : regular);
        tv.setIncludeFontPadding(false);
        return tv;
    }

    private TextView tabularText(String value, int sp, boolean bold, int color) {
        TextView tv = text(value, sp, bold, color);
        tv.setFontFeatureSettings("tnum");
        return tv;
    }

    private View hairline() {
        View v = new View(activity);
        v.setBackgroundColor(separator);
        return v;
    }

    private View insetHairline() {
        View v = hairline();
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, 1);
        lp.setMargins(dp(16), 0, 0, 0);
        v.setLayoutParams(lp);
        return v;
    }

    private View verticalDivider() {
        View v = new View(activity);
        v.setBackgroundColor((separator & 0x00FFFFFF) | 0x66000000);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(1, -1);
        lp.setMargins(0, dp(7), 0, dp(7));
        v.setLayoutParams(lp);
        return v;
    }

    private LinearLayout.LayoutParams verticalMarginParams(int topPx, int bottomPx) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, 1);
        lp.setMargins(0, topPx, 0, bottomPx);
        return lp;
    }

    private GradientDrawable round(int color, float radiusDp) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(dp(radiusDp));
        return d;
    }

    private RippleDrawable ripple(Drawable content) {
        return new RippleDrawable(
                ColorStateList.valueOf((labelPrimary & 0x00FFFFFF) | 0x16000000),
                content,
                new ColorDrawable(Color.WHITE));
    }

    private void hideKeyboard() {
        InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null && root.getWindowToken() != null) {
            imm.hideSoftInputFromWindow(root.getWindowToken(), 0);
        }
    }

    private void toast(String message) {
        Toast.makeText(activity, message, Toast.LENGTH_SHORT).show();
    }

    private String str(String key, Object... args) {
        return LrclibStrings.text(activity, key, args);
    }

    private int dp(float value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private int resolveColor(String name, int fallback) {
        int resId = LrclibStrings.id(activity, "color", name);
        if (resId == 0) return fallback;
        try {
            return activity.getColor(resId);
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    private Typeface resolveFont(String name, Typeface fallback) {
        int resId = LrclibStrings.id(activity, "font", name);
        if (resId == 0) return fallback;
        try {
            return activity.getResources().getFont(resId);
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    private interface LongConsumer {
        void accept(long value);
    }

    private abstract static class SimpleWatcher implements TextWatcher {
        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {}
    }
}
