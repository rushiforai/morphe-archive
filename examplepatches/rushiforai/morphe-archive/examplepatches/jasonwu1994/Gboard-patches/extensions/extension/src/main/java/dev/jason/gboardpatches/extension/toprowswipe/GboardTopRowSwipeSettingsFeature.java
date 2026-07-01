package dev.jason.gboardpatches.extension.toprowswipe;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.text.InputType;
import android.text.method.KeyListener;
import android.util.Log;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

public final class GboardTopRowSwipeSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatchesTopRow";
    private static final String PREVIEW_VIDEO_ENABLED_ASSET =
            "settings-previews/keyboard/gboard_top_row_swipe_enabled_preview.mp4";
    private static final GboardTopRowSwipeStrings DEFAULT_STRINGS =
            GboardTopRowSwipeStrings.from(null);
    private static final String EXPORT_FILE_NAME = "gboard-top-row-swipe-slots.json";
    private static final String EXPORT_MIME_TYPE = "application/json";
    private static final int EXAMPLE_CODE_COLLAPSED_MAX_LINES = 3;
    private static final String[] IMPORT_MIME_TYPES = {
            "application/json",
            "text/json",
            "text/plain"
    };
    private final GboardTopRowSwipeStrings entryStrings;

    public GboardTopRowSwipeSettingsFeature() {
        this(null);
    }

    public GboardTopRowSwipeSettingsFeature(Context context) {
        entryStrings = GboardTopRowSwipeStrings.from(context);
    }

    @Override
    public String getEntryTitle() {
        return entryStrings.entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entryStrings.entrySummary;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_TOP_ROW_SWIPE);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        Context context = host != null ? host.getContext() : null;
        GboardTopRowSwipeStrings strings = GboardTopRowSwipeStrings.from(context);
        try {
            if (context == null) {
                return buildErrorScreen(strings);
            }
            GboardTopRowSwipeSettings.ensureDefaults(context);
            SharedPreferences preferences = GboardTopRowSwipeSettings.preferences(context);

            boolean enabled = GboardTopRowSwipeSettings.readEnabled(preferences);
            boolean zhuyinEnabled = GboardTopRowSwipeSettings.readZhuyinEnabled(preferences);
            boolean englishQwertyEnabled =
                    GboardTopRowSwipeSettings.readEnglishQwertyEnabled(preferences);
            String globalJavaScript =
                    GboardTopRowSwipeSettings.readGlobalJavaScript(preferences);
            GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits =
                    GboardTopRowSwipeSettings.readJavaScriptRuntimeLimits(preferences);
            List<GboardTopRowSwipeSettings.SlotText> slots =
                    GboardTopRowSwipeSettings.readSlots(preferences);
            boolean subordinateRowsEnabled = enabled;

            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    strings.enabledTitle,
                    strings.enabledSummary,
                    true,
                    enabled,
                    value -> GboardTopRowSwipeSettings.writeEnabled(context, value),
                    buildEnabledPreview(strings)));

            List<GboardPatchesSettingsContract.Row> layoutRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            layoutRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    strings.zhuyinLayoutTitle,
                    strings.zhuyinLayoutSummary,
                    subordinateRowsEnabled,
                    zhuyinEnabled,
                    value -> GboardTopRowSwipeSettings.writeZhuyinEnabled(
                            context, value)));
            layoutRows.add(new GboardPatchesSettingsContract.ToggleRow(
                    strings.englishQwertyLayoutTitle,
                    strings.englishQwertyLayoutSummary,
                    subordinateRowsEnabled,
                    englishQwertyEnabled,
                    value -> GboardTopRowSwipeSettings.writeEnglishQwertyEnabled(
                            context, value)));

            List<GboardPatchesSettingsContract.Row> javaScriptRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            javaScriptRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.globalJavaScriptTitle,
                    strings.globalJavaScriptSummary(globalJavaScript),
                    subordinateRowsEnabled,
                    new ShowGlobalJavaScriptEditorAction(host, globalJavaScript, strings)));
            javaScriptRows.add(new GboardPatchesSettingsContract.SelectorRow(
                    strings.javaScriptRuntimeLimitsTitle,
                    strings.javaScriptRuntimeLimitsSummary,
                    strings.javaScriptRuntimeLimitsCurrentValue(javaScriptRuntimeLimits),
                    subordinateRowsEnabled,
                    new ShowJavaScriptRuntimeLimitsAction(host, javaScriptRuntimeLimits,
                            strings)));

            List<GboardPatchesSettingsContract.Row> slotRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            for (int index = 0; index < GboardTopRowSwipeSettings.SLOT_COUNT; index++) {
                GboardTopRowSwipeSettings.SlotText slot = slots.get(index);
                slotRows.add(new GboardPatchesSettingsContract.CommandRow(
                        strings.slotTitle(index),
                        strings.slotSummary(slot),
                        subordinateRowsEnabled,
                        new ShowSlotEditorAction(host, index, slot)));
            }

            List<GboardPatchesSettingsContract.Row> transferRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            transferRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.exportTitle,
                    strings.exportSummary,
                    subordinateRowsEnabled,
                    new ExportSlotsAction(host, strings)));
            transferRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.importTitle,
                    strings.importSummary,
                    subordinateRowsEnabled,
                    new ImportSlotsAction(host, strings)));

            List<GboardPatchesSettingsContract.Row> advancedRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            advancedRows.add(new GboardPatchesSettingsContract.DangerRow(
                    strings.resetTitle,
                    strings.resetSummary,
                    subordinateRowsEnabled,
                    new ResetSlotsAction(host),
                    strings.resetConfirmTitle,
                    strings.resetConfirmMessage));

            List<GboardPatchesSettingsContract.Row> guideRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            guideRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.javaScriptGuideExecutionTitle,
                    strings.javaScriptGuideExecutionSummary,
                    true,
                    new ShowJavaScriptGuideDialogAction(host,
                            strings.javaScriptGuideExecutionTitle,
                            strings.javaScriptGuideExecutionDialogMessage,
                            strings)));
            guideRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.javaScriptGuideReturnTitle,
                    strings.javaScriptGuideReturnSummary,
                    true,
                    new ShowJavaScriptGuideDialogAction(host,
                            strings.javaScriptGuideReturnTitle,
                            strings.javaScriptGuideReturnDialogMessage,
                            strings)));
            guideRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.javaScriptGuideHttpTitle,
                    strings.javaScriptGuideHttpSummary,
                    true,
                    new ShowJavaScriptGuideDialogAction(host,
                            strings.javaScriptGuideHttpTitle,
                            strings.javaScriptGuideHttpDialogMessage,
                            strings)));
            guideRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.javaScriptGuideLimitsTitle,
                    strings.javaScriptGuideLimitsSummary,
                    true,
                    new ShowJavaScriptGuideDialogAction(host,
                            strings.javaScriptGuideLimitsTitle,
                            strings.javaScriptGuideLimitsDialogMessage,
                            strings)));
            guideRows.add(new GboardPatchesSettingsContract.CommandRow(
                    strings.javaScriptGuideExamplesTitle,
                    strings.javaScriptGuideExamplesSummary,
                    true,
                    new ShowJavaScriptExamplesDialogAction(host,
                            strings)));

            return new GboardPatchesSettingsContract.Screen(
                    strings.entryTitle,
                    strings.headerBadge,
                    strings.entryTitle,
                    strings.headerSummary,
                    Collections.emptyList(),
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(
                                    strings.sectionBehavior,
                                    behaviorRows),
                            new GboardPatchesSettingsContract.Section(
                                    strings.sectionLayouts,
                                    layoutRows),
                            new GboardPatchesSettingsContract.Section(
                                    strings.sectionJavaScript,
                                    javaScriptRows),
                            new GboardPatchesSettingsContract.Section(
                                    strings.sectionSlots,
                                    slotRows),
                            new GboardPatchesSettingsContract.Section(
                                    strings.sectionTransfer,
                                    transferRows),
                            new GboardPatchesSettingsContract.Section(
                                    strings.sectionAdvanced,
                                    null,
                                    GboardPatchesSettingsContract.SectionStyle.ADVANCED,
                                    advancedRows),
                            new GboardPatchesSettingsContract.Section(
                                    strings.sectionJavaScriptGuide,
                                    null,
                                    GboardPatchesSettingsContract.SectionStyle.DEFAULT,
                                    guideRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render Top Row Swipe settings screen", throwable);
            return buildErrorScreen(strings);
        }
    }

    static String slotSummary(GboardTopRowSwipeSettings.SlotText slot) {
        return DEFAULT_STRINGS.slotSummary(slot);
    }

    static String globalJavaScriptSummary(String globalJavaScript) {
        return DEFAULT_STRINGS.globalJavaScriptSummary(globalJavaScript);
    }

    private static GboardPatchesSettingsContract.PreviewSpec buildEnabledPreview(
            GboardTopRowSwipeStrings strings) {
        return new GboardPatchesSettingsContract.PreviewSpec(
                strings.entryTitle,
                "",
                GboardPatchesSettingsContract.PreviewLayout.STACKED,
                GboardPatchesSettingsContract.PreviewVideo.fromAsset(
                        PREVIEW_VIDEO_ENABLED_ASSET,
                        ""));
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen(
            GboardTopRowSwipeStrings strings) {
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                strings.errorTitle,
                strings.errorSummary,
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                strings.entryTitle,
                strings.headerBadge,
                strings.entryTitle,
                strings.headerSummary,
                statusBlocks,
                Collections.emptyList());
    }

    private static final class ShowSlotEditorAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;
        private final int index;
        private final GboardTopRowSwipeSettings.SlotText slot;

        ShowSlotEditorAction(GboardPatchesSettingsContract.Host host, int index,
                GboardTopRowSwipeSettings.SlotText slot) {
            this.host = host;
            this.index = index;
            this.slot = slot;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            Context context = host.getContext();
            if (!(context instanceof Activity activity)) {
                return;
            }
            try {
                GboardTopRowSwipeSlotEditorDialog.show(
                        activity,
                        index,
                        slot,
                        editedSlot -> {
                            GboardTopRowSwipeSettings.writeSlot(context, index, editedSlot);
                            safeRefresh(host);
                        });
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to show Top Row Swipe slot editor", throwable);
            }
        }
    }

    private static final class ShowGlobalJavaScriptEditorAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;
        private final String globalJavaScript;
        private final GboardTopRowSwipeStrings strings;

        ShowGlobalJavaScriptEditorAction(GboardPatchesSettingsContract.Host host,
                String globalJavaScript,
                GboardTopRowSwipeStrings strings) {
            this.host = host;
            this.globalJavaScript = globalJavaScript;
            this.strings = strings;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            Context context = host.getContext();
            if (!(context instanceof Activity activity) || activity.isFinishing()) {
                return;
            }
            try {
                showGlobalJavaScriptDialog(activity, context, host, globalJavaScript, strings);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to show Global JavaScript editor", throwable);
            }
        }
    }

    private static final class ShowJavaScriptRuntimeLimitsAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;
        private final GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits;
        private final GboardTopRowSwipeStrings strings;

        ShowJavaScriptRuntimeLimitsAction(GboardPatchesSettingsContract.Host host,
                GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits,
                GboardTopRowSwipeStrings strings) {
            this.host = host;
            this.javaScriptRuntimeLimits = javaScriptRuntimeLimits;
            this.strings = strings;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            Context context = host.getContext();
            if (!(context instanceof Activity activity) || activity.isFinishing()) {
                return;
            }
            try {
                showJavaScriptRuntimeLimitsDialog(activity, context, host,
                        javaScriptRuntimeLimits, strings);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to show JavaScript runtime limits editor", throwable);
            }
        }
    }

    private static final class ShowJavaScriptGuideDialogAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;
        private final String title;
        private final String message;
        private final GboardTopRowSwipeStrings strings;

        ShowJavaScriptGuideDialogAction(GboardPatchesSettingsContract.Host host,
                String title,
                String message,
                GboardTopRowSwipeStrings strings) {
            this.host = host;
            this.title = title;
            this.message = message;
            this.strings = strings;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            Context context = host.getContext();
            if (!(context instanceof Activity activity) || activity.isFinishing()) {
                return;
            }
            showInfoDialog(activity, title, message, strings);
        }
    }

    private static final class ShowJavaScriptExamplesDialogAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;
        private final GboardTopRowSwipeStrings strings;

        ShowJavaScriptExamplesDialogAction(GboardPatchesSettingsContract.Host host,
                GboardTopRowSwipeStrings strings) {
            this.host = host;
            this.strings = strings;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            Context context = host.getContext();
            if (!(context instanceof Activity activity) || activity.isFinishing()) {
                return;
            }
            showJavaScriptExamplesDialog(activity, strings);
        }
    }

    private static final class ResetSlotsAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;

        ResetSlotsAction(GboardPatchesSettingsContract.Host host) {
            this.host = host;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            resetAllSlots(host.getContext(), host);
        }
    }

    private static final class ExportSlotsAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;
        private final GboardTopRowSwipeStrings strings;

        ExportSlotsAction(GboardPatchesSettingsContract.Host host,
                GboardTopRowSwipeStrings strings) {
            this.host = host;
            this.strings = strings;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            Context context = host.getContext();
            try {
                List<GboardTopRowSwipeSettings.SlotText> slots =
                        GboardTopRowSwipeSettings.readSlots(context);
                String globalJavaScript = GboardTopRowSwipeSettings.readGlobalJavaScript(context);
                GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits =
                        GboardTopRowSwipeSettings.readJavaScriptRuntimeLimits(context);
                host.createTextDocument(
                        EXPORT_FILE_NAME,
                        EXPORT_MIME_TYPE,
                        GboardTopRowSwipeSettings.exportSettings(globalJavaScript,
                                javaScriptRuntimeLimits, slots),
                        () -> Toast.makeText(
                                context,
                                strings.exportDoneMessage,
                                Toast.LENGTH_SHORT).show());
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to export Top Row Swipe slots", throwable);
            }
        }
    }

    private static final class ImportSlotsAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;
        private final GboardTopRowSwipeStrings strings;

        ImportSlotsAction(GboardPatchesSettingsContract.Host host,
                GboardTopRowSwipeStrings strings) {
            this.host = host;
            this.strings = strings;
        }

        @Override
        public void run() {
            if (host == null || host.getContext() == null) {
                return;
            }
            Context context = host.getContext();
            if (!(context instanceof Activity activity)) {
                return;
            }
            try {
                host.openTextDocument(
                        IMPORT_MIME_TYPES,
                        text -> importSlotsFromText(activity, context, host, text, strings));
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to import Top Row Swipe slots", throwable);
            }
        }
    }

    private static void safeRefresh(GboardPatchesSettingsContract.Host host) {
        if (host == null) {
            return;
        }
        try {
            host.refresh();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to refresh Top Row Swipe settings", throwable);
        }
    }

    private static void resetAllSlots(Context context, GboardPatchesSettingsContract.Host host) {
        try {
            GboardTopRowSwipeSettings.resetSlots(context);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to reset Top Row Swipe slots", throwable);
        }
        safeRefresh(host);
    }

    private static void importSlotsFromText(Activity activity, Context context,
            GboardPatchesSettingsContract.Host host, String text,
            GboardTopRowSwipeStrings strings) {
        try {
            GboardTopRowSwipeSettings.ExportedSettings imported =
                    GboardTopRowSwipeSettings.parseExportedSettings(text);
            GboardTopRowSwipeSettings.writeImportedSettings(context, imported);
            Toast.makeText(context, strings.importDoneMessage, Toast.LENGTH_SHORT).show();
            safeRefresh(host);
        } catch (IllegalArgumentException exception) {
            showImportError(activity, strings, strings.importInvalidSummary);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to apply imported Top Row Swipe slots", throwable);
            showImportError(activity, strings, strings.importFailedSummary);
        }
    }

    private static void showImportError(Activity activity,
            GboardTopRowSwipeStrings strings,
            String message) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        runUiActionSafely(activity, "show Top Row Swipe import error dialog", () ->
                new AlertDialog.Builder(activity)
                        .setTitle(strings.importFailedTitle)
                        .setMessage(message)
                        .setPositiveButton(strings.closeButton, null)
                        .show());
    }

    private static void showInfoDialog(Activity activity,
            String title,
            String message,
            GboardTopRowSwipeStrings strings) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        runUiActionSafely(activity, "show info dialog", () ->
                new AlertDialog.Builder(activity)
                        .setTitle(title)
                        .setMessage(message)
                        .setPositiveButton(strings.closeButton, null)
                        .show());
    }

    private static void showJavaScriptExamplesDialog(Activity activity,
            GboardTopRowSwipeStrings strings) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        runUiActionSafely(activity, "show JavaScript examples dialog", () -> {
            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            int horizontalPadding = dp(activity, 20);
            int verticalPadding = dp(activity, 16);
            content.setPadding(horizontalPadding, verticalPadding,
                    horizontalPadding, verticalPadding);

            for (JavaScriptExampleSnippet example : buildJavaScriptExamples(strings)) {
                addJavaScriptExampleCard(activity, content, example, strings);
            }

            ScrollView scrollView = new ScrollView(activity);
            scrollView.addView(content, new ScrollView.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            new AlertDialog.Builder(activity)
                    .setTitle(strings.javaScriptGuideExamplesDialogTitle)
                    .setView(scrollView)
                    .setPositiveButton(strings.closeButton, null)
                    .show();
        });
    }

    private static void addJavaScriptExampleCard(Activity activity,
            LinearLayout parent,
            JavaScriptExampleSnippet example,
            GboardTopRowSwipeStrings strings) {
        if (activity == null || parent == null || example == null) {
            return;
        }
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        int cardPadding = dp(activity, 12);
        card.setPadding(cardPadding, cardPadding, cardPadding, cardPadding);
        LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        if (parent.getChildCount() > 0) {
            cardParams.topMargin = dp(activity, 12);
        }

        TextView titleView = new TextView(activity);
        titleView.setText(example.title);
        titleView.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        titleView.setTextColor(Color.WHITE);

        TextView summaryView = new TextView(activity);
        summaryView.setText(example.summary);
        summaryView.setTextColor(Color.WHITE);
        LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        summaryParams.topMargin = dp(activity, 6);
        summaryView.setLayoutParams(summaryParams);

        TextView codeView = new TextView(activity);
        codeView.setText(example.code);
        codeView.setTypeface(Typeface.MONOSPACE);
        codeView.setTextIsSelectable(true);
        codeView.setHorizontallyScrolling(true);
        codeView.setHorizontalScrollBarEnabled(true);
        LinearLayout.LayoutParams codeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        codeParams.topMargin = dp(activity, 10);
        HorizontalScrollView codeScrollView = new HorizontalScrollView(activity);
        codeScrollView.setHorizontalScrollBarEnabled(true);
        codeScrollView.setLayoutParams(codeParams);
        codeScrollView.addView(codeView, new HorizontalScrollView.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        Button toggleButton = buildExampleCodeToggleButton(activity, strings);
        boolean shouldCollapseCode =
                example.codeLineCount() > EXAMPLE_CODE_COLLAPSED_MAX_LINES;
        if (shouldCollapseCode) {
            codeView.setMaxLines(EXAMPLE_CODE_COLLAPSED_MAX_LINES);
            toggleButton.setText(strings.javaScriptGuideExamplesExpandButton);
            toggleButton.setOnClickListener(view -> {
                boolean expanded = codeView.getMaxLines() > EXAMPLE_CODE_COLLAPSED_MAX_LINES;
                if (expanded) {
                    codeView.setMaxLines(EXAMPLE_CODE_COLLAPSED_MAX_LINES);
                    toggleButton.setText(strings.javaScriptGuideExamplesExpandButton);
                    return;
                }
                codeView.setMaxLines(Integer.MAX_VALUE);
                toggleButton.setText(strings.javaScriptGuideExamplesCollapseButton);
            });
        }

        Button copyButton = new Button(activity);
        copyButton.setText(strings.javaScriptGuideExamplesCopyButton);
        copyButton.setOnClickListener(view -> runUiActionSafely(
                activity,
                "copy JavaScript example",
                () -> copyJavaScriptExampleToClipboard(activity, example, strings)));
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        buttonParams.topMargin = dp(activity, 10);
        copyButton.setLayoutParams(buttonParams);

        card.addView(titleView);
        card.addView(summaryView);
        card.addView(codeScrollView);
        if (shouldCollapseCode) {
            card.addView(toggleButton);
        }
        card.addView(copyButton);
        parent.addView(card, cardParams);
    }

    private static Button buildExampleCodeToggleButton(Activity activity,
            GboardTopRowSwipeStrings strings) {
        Button toggleButton = new Button(activity);
        toggleButton.setAllCaps(false);
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        buttonParams.topMargin = dp(activity, 8);
        toggleButton.setLayoutParams(buttonParams);
        return toggleButton;
    }

    private static void copyJavaScriptExampleToClipboard(Activity activity,
            JavaScriptExampleSnippet example,
            GboardTopRowSwipeStrings strings) {
        if (activity == null || example == null || strings == null) {
            return;
        }
        ClipboardManager clipboardManager = activity.getSystemService(ClipboardManager.class);
        if (clipboardManager == null) {
            Toast.makeText(activity, strings.javaScriptGuideExamplesClipboardUnavailable,
                    Toast.LENGTH_SHORT).show();
            return;
        }
        clipboardManager.setPrimaryClip(ClipData.newPlainText(example.title, example.code));
        Toast.makeText(activity,
                String.format(strings.javaScriptGuideExamplesCopiedFormat, example.title),
                Toast.LENGTH_SHORT).show();
    }

    private static List<JavaScriptExampleSnippet> buildJavaScriptExamples(
            GboardTopRowSwipeStrings strings) {
        List<JavaScriptExampleSnippet> examples = new ArrayList<JavaScriptExampleSnippet>();
        examples.add(new JavaScriptExampleSnippet(
                strings.javaScriptExampleHelloWorldTitle,
                strings.javaScriptExampleHelloWorldSummary,
                javaScriptExampleHelloWorld()));
        examples.add(new JavaScriptExampleSnippet(
                strings.javaScriptExampleReturnInputTitle,
                strings.javaScriptExampleReturnInputSummary,
                javaScriptExampleReturnInput()));
        examples.add(new JavaScriptExampleSnippet(
                strings.javaScriptExampleIpTitle,
                strings.javaScriptExampleIpSummary,
                javaScriptExampleCurrentIp()));
        examples.add(new JavaScriptExampleSnippet(
                strings.javaScriptExampleOpenAiTitle,
                strings.javaScriptExampleOpenAiSummary,
                javaScriptExampleOpenAiResponses()));
        examples.add(new JavaScriptExampleSnippet(
                strings.javaScriptExampleTimestampTitle,
                strings.javaScriptExampleTimestampSummary,
                javaScriptExampleTimestamp()));
        examples.add(new JavaScriptExampleSnippet(
                strings.javaScriptExampleUkTimeTitle,
                strings.javaScriptExampleUkTimeSummary,
                javaScriptExampleUkTime()));
        examples.add(new JavaScriptExampleSnippet(
                strings.javaScriptExampleUnitConvertTitle,
                strings.javaScriptExampleUnitConvertSummary,
                javaScriptExampleUnitConversion()));
        return examples;
    }

    private static String javaScriptExampleHelloWorld() {
        return "return \"Hello World!\";";
    }

    private static String javaScriptExampleReturnInput() {
        return "return input;";
    }

    private static String javaScriptExampleCurrentIp() {
        return "const response = JSON.parse(httpGet(\"https://api.ipify.org?format=json\"));\n"
                + "return response.ip || \"\";";
    }

    private static String javaScriptExampleOpenAiResponses() {
        return "const apiKey = \"REPLACE_WITH_OPENAI_API_KEY\";\n"
                + "if (apiKey === \"REPLACE_WITH_OPENAI_API_KEY\") {\n"
                + "  throw new Error(\"Set your OpenAI API key first.\");\n"
                + "}\n\n"
                + "const prompt = input && input.trim()\n"
                + "  ? \"Rewrite this more clearly:\\n\\n\" + input.trim()\n"
                + "  : \"Say hello from OpenAI.\";\n\n"
                + "const response = JSON.parse(httpRequest({\n"
                + "  method: \"POST\",\n"
                + "  url: \"https://api.openai.com/v1/responses\",\n"
                + "  headers: {\n"
                + "    \"Content-Type\": \"application/json\",\n"
                + "    \"Authorization\": \"Bearer \" + apiKey\n"
                + "  },\n"
                + "  body: JSON.stringify({\n"
                + "    model: \"gpt-5.5\",\n"
                + "    input: prompt\n"
                + "  })\n"
                + "}));\n\n"
                + "if (response.output_text) {\n"
                + "  return response.output_text;\n"
                + "}\n"
                + "const first = response.output && response.output[0];\n"
                + "const content = first && first.content && first.content[0];\n"
                + "return content && content.text ? content.text : \"\";";
    }

    private static String javaScriptExampleTimestamp() {
        return "return String(Date.now());";
    }

    private static String javaScriptExampleUkTime() {
        return "const response = JSON.parse(\n"
                + "  httpGet(\"https://timeapi.io/api/Time/current/zone?timeZone=Europe/London\")\n"
                + ");\n"
                + "const date = response.date || \"\";\n"
                + "const time = response.time || \"\";\n"
                + "return date && time ? (date + \" \" + time) : \"\";";
    }

    private static String javaScriptExampleUnitConversion() {
        return "function truncate(value, decimals) {\n"
                + "  const factor = Math.pow(10, decimals);\n"
                + "  return (value < 0 ? Math.ceil(value * factor) : Math.floor(value * factor)) / factor;\n"
                + "}\n\n"
                + "const text = input ? input.trim() : \"\";\n"
                + "let match = text.match(/^(-?\\d+(?:\\.\\d+)?)\\s*(lbs?)$/i);\n"
                + "if (match) {\n"
                + "  const pounds = Number(match[1]);\n"
                + "  const kg = truncate(pounds * 0.45359237, 2);\n"
                + "  return kg.toFixed(2) + \"kg\";\n"
                + "}\n\n"
                + "match = text.match(/^(-?\\d+(?:\\.\\d+)?)\\s*(kgs?)$/i);\n"
                + "if (match) {\n"
                + "  const kilograms = Number(match[1]);\n"
                + "  const lbs = truncate(kilograms / 0.45359237, 2);\n"
                + "  return lbs.toFixed(2) + \"lbs\";\n"
                + "}\n\n"
                + "match = text.match(/^(-?\\d+(?:\\.\\d+)?)\\s*°?\\s*F$/i);\n"
                + "if (match) {\n"
                + "  const fahrenheit = Number(match[1]);\n"
                + "  const celsius = truncate(((fahrenheit - 32) * 5) / 9, 1);\n"
                + "  return celsius.toFixed(1) + \"C\";\n"
                + "}\n\n"
                + "match = text.match(/^(-?\\d+(?:\\.\\d+)?)\\s*°?\\s*C$/i);\n"
                + "if (match) {\n"
                + "  const celsius = Number(match[1]);\n"
                + "  const fahrenheit = truncate((celsius * 9) / 5 + 32, 1);\n"
                + "  return fahrenheit.toFixed(1) + \"F\";\n"
                + "}\n\n"
                + "return text;";
    }

    private static final class JavaScriptExampleSnippet {
        final String title;
        final String summary;
        final String code;

        JavaScriptExampleSnippet(String title, String summary, String code) {
            this.title = title != null ? title : "";
            this.summary = summary != null ? summary : "";
            this.code = code != null ? code : "";
        }

        int codeLineCount() {
            if (code.isEmpty()) {
                return 0;
            }
            int count = 1;
            for (int index = 0; index < code.length(); index++) {
                if (code.charAt(index) == '\n') {
                    count++;
                }
            }
            return count;
        }
    }

    private static void showGlobalJavaScriptDialog(Activity activity,
            Context context,
            GboardPatchesSettingsContract.Host host,
            String initialValue,
            GboardTopRowSwipeStrings strings) {
        runUiActionSafely(activity, "show global JavaScript dialog", () -> {
            EditText input = new EditText(activity);
            input.setHint(strings.globalJavaScriptHint);
            input.setSingleLine(false);
            input.setMinLines(8);
            input.setMaxLines(16);
            input.setInputType(InputType.TYPE_CLASS_TEXT
                    | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                    | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
            input.setTypeface(Typeface.SANS_SERIF);
            input.setHorizontallyScrolling(true);
            input.setHorizontalScrollBarEnabled(true);
            input.setVerticalScrollBarEnabled(true);
            input.setText(initialValue != null ? initialValue : "");
            input.setSelectAllOnFocus(false);
            input.setSelection(input.getText().length());
            input.setTextIsSelectable(true);
            KeyListener editableKeyListener = input.getKeyListener();
            int editableInputType = input.getInputType();
            TextView lockButton = buildEditorLockButton(activity);
            final boolean[] locked = { true };
            input.setOnFocusChangeListener((view, hasFocus) -> {
                if (hasFocus && !locked[0]) {
                    showSoftInputForEditor(input, false);
                }
            });
            input.setOnClickListener(view -> {
                if (!locked[0]) {
                    showSoftInputForEditor(input, false);
                }
            });

            Runnable applyLockState = () -> applyEditorLockedState(
                    input,
                    editableKeyListener,
                    editableInputType,
                    locked[0],
                    lockButton,
                    strings);
            lockButton.setOnClickListener(view -> runUiActionSafely(
                    activity,
                    "toggle global JavaScript editor lock",
                    () -> {
                        locked[0] = !locked[0];
                        applyLockState.run();
                    }));
            applyLockState.run();

            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(0, 0, 0, 0);
            content.addView(buildEditorToolbar(activity, lockButton),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
            LinearLayout.LayoutParams inputParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            inputParams.topMargin = dp(activity, 8);
            content.addView(input, inputParams);

            ScrollView scrollView = new ScrollView(activity);
            scrollView.addView(content, new ScrollView.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setTitle(strings.globalJavaScriptTitle)
                    .setView(scrollView)
                    .setPositiveButton(strings.saveButton, null)
                    .setNegativeButton(strings.cancelButton, null)
                    .setNeutralButton(strings.clearButton, null)
                    .create();
            dialog.setOnShowListener(ignored -> runUiActionSafely(
                    activity,
                    "configure global JavaScript dialog",
                    () -> {
                        if (dialog.getWindow() != null) {
                            dialog.getWindow().clearFlags(
                                    WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
                        }
                        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(
                                view -> runUiActionSafely(
                                        activity,
                                        "save global JavaScript",
                                        () -> {
                                            GboardTopRowSwipeSettings.writeGlobalJavaScript(
                                                    context,
                                                    input.getText() != null
                                                            ? input.getText().toString() : "");
                                            safeRefresh(host);
                                            dialog.dismiss();
                                        }));
                        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(
                                view -> runUiActionSafely(
                                        activity,
                                        "clear global JavaScript",
                                        () -> {
                                            input.setText("");
                                            if (input.getText() != null) {
                                                input.setSelection(0);
                                            }
                                        }));
                    }));
            dialog.show();
        });
    }

    private static void showJavaScriptRuntimeLimitsDialog(Activity activity,
            Context context,
            GboardPatchesSettingsContract.Host host,
            GboardTopRowSwipeSettings.JavaScriptRuntimeLimits initialLimits,
            GboardTopRowSwipeStrings strings) {
        runUiActionSafely(activity, "show JavaScript runtime limits dialog", () -> {
            GboardTopRowSwipeSettings.JavaScriptRuntimeLimits limits = initialLimits != null
                    ? initialLimits : GboardTopRowSwipeSettings.defaultJavaScriptRuntimeLimits();

            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            int dialogHorizontalPadding = dp(activity, 20);
            int dialogVerticalPadding = dp(activity, 16);
            content.setPadding(dialogHorizontalPadding, dialogVerticalPadding,
                    dialogHorizontalPadding, dialogVerticalPadding);

            EditText responseBodyLimitInput = buildNumberInput(activity,
                    Integer.toString(limits.responseBodyLimitBytes / 1024),
                    strings.javaScriptRuntimeResponseBodyLimitHint);
            EditText timeoutMaxInput = buildNumberInput(activity,
                    Integer.toString(limits.timeoutMaxMs),
                    strings.javaScriptRuntimeTimeoutMaxHint);
            EditText memoryLimitInput = buildNumberInput(activity,
                    Integer.toString(limits.memoryLimitBytes / (1024 * 1024)),
                    strings.javaScriptRuntimeMemoryLimitHint);
            EditText maxStackInput = buildNumberInput(activity,
                    Integer.toString(limits.maxStackBytes / 1024),
                    strings.javaScriptRuntimeMaxStackHint);

            addLabeledField(content, activity, strings.javaScriptRuntimeResponseBodyLimitLabel,
                    responseBodyLimitInput);
            addLabeledField(content, activity, strings.javaScriptRuntimeTimeoutMaxLabel,
                    timeoutMaxInput);
            addLabeledField(content, activity, strings.javaScriptRuntimeMemoryLimitLabel,
                    memoryLimitInput);
            addLabeledField(content, activity, strings.javaScriptRuntimeMaxStackLabel,
                    maxStackInput);

            ScrollView scrollView = new ScrollView(activity);
            scrollView.addView(content, new ScrollView.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            AlertDialog dialog = new AlertDialog.Builder(activity)
                    .setTitle(strings.javaScriptRuntimeLimitsDialogTitle)
                    .setView(scrollView)
                    .setPositiveButton(strings.saveButton, null)
                    .setNegativeButton(strings.cancelButton, null)
                    .setNeutralButton(strings.resetButton, null)
                    .create();
            dialog.setOnShowListener(ignored -> runUiActionSafely(
                    activity,
                    "configure JavaScript runtime limits dialog",
                    () -> {
                        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(
                                view -> runUiActionSafely(
                                        activity,
                                        "save JavaScript runtime limits",
                                        () -> {
                                            try {
                                                GboardTopRowSwipeSettings
                                                        .JavaScriptRuntimeLimits edited =
                                                        new GboardTopRowSwipeSettings
                                                                .JavaScriptRuntimeLimits(
                                                                parsePositiveScaledInt(
                                                                        responseBodyLimitInput,
                                                                        1024),
                                                                parsePositiveInt(timeoutMaxInput),
                                                                parsePositiveScaledInt(
                                                                        memoryLimitInput,
                                                                        1024 * 1024),
                                                                parsePositiveScaledInt(
                                                                        maxStackInput,
                                                                        1024));
                                                GboardTopRowSwipeSettings
                                                        .writeJavaScriptRuntimeLimits(context,
                                                                edited);
                                                safeRefresh(host);
                                                dialog.dismiss();
                                            } catch (IllegalArgumentException exception) {
                                                Toast.makeText(activity,
                                                        strings.javaScriptRuntimeDialogError,
                                                        Toast.LENGTH_SHORT).show();
                                            }
                                        }));
                        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(
                                view -> runUiActionSafely(
                                        activity,
                                        "reset JavaScript runtime limits",
                                        () -> setJavaScriptRuntimeLimitInputs(
                                                responseBodyLimitInput,
                                                timeoutMaxInput,
                                                memoryLimitInput,
                                                maxStackInput,
                                                GboardTopRowSwipeSettings
                                                        .defaultJavaScriptRuntimeLimits())));
                    }));
            dialog.show();
        });
    }

    private static void setJavaScriptRuntimeLimitInputs(EditText responseBodyLimitInput,
            EditText timeoutMaxInput, EditText memoryLimitInput, EditText maxStackInput,
            GboardTopRowSwipeSettings.JavaScriptRuntimeLimits limits) {
        GboardTopRowSwipeSettings.JavaScriptRuntimeLimits safeLimits = limits != null
                ? limits : GboardTopRowSwipeSettings.defaultJavaScriptRuntimeLimits();
        setEditTextValue(responseBodyLimitInput,
                Integer.toString(safeLimits.responseBodyLimitBytes / 1024));
        setEditTextValue(timeoutMaxInput, Integer.toString(safeLimits.timeoutMaxMs));
        setEditTextValue(memoryLimitInput,
                Integer.toString(safeLimits.memoryLimitBytes / (1024 * 1024)));
        setEditTextValue(maxStackInput, Integer.toString(safeLimits.maxStackBytes / 1024));
    }

    private static void setEditTextValue(EditText input, String value) {
        if (input == null) {
            return;
        }
        input.setText(value != null ? value : "");
        if (input.getText() != null) {
            input.setSelection(input.getText().length());
        }
    }

    private static LinearLayout buildEditorToolbar(Context context, TextView lockButton) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        row.addView(lockButton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    private static TextView buildEditorLockButton(Context context) {
        TextView button = new TextView(context);
        button.setTextSize(13f);
        button.setTypeface(Typeface.SANS_SERIF, Typeface.BOLD);
        int horizontalPadding = dp(context, 12);
        int verticalPadding = dp(context, 8);
        button.setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding);
        button.setClickable(true);
        button.setFocusable(false);
        button.setFocusableInTouchMode(false);
        return button;
    }

    private static TextView buildLabel(Context context, String text) {
        TextView label = new TextView(context);
        label.setText(text);
        label.setTextSize(14f);
        return label;
    }

    private static EditText buildNumberInput(Context context, String value, String hint) {
        EditText input = new EditText(context);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setText(value != null ? value : "");
        input.setHint(hint);
        input.setSingleLine(true);
        return input;
    }

    private static void addLabeledField(LinearLayout content, Context context, String labelText,
            EditText input) {
        if (content.getChildCount() > 0) {
            LinearLayout.LayoutParams spacing = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            spacing.topMargin = dp(context, 12);
            input.setLayoutParams(spacing);
        }
        content.addView(buildLabel(context, labelText));
        content.addView(input, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private static void applyEditorLockedState(EditText input,
            KeyListener editableKeyListener,
            int editableInputType,
            boolean locked,
            TextView lockButton,
            GboardTopRowSwipeStrings strings) {
        if (input == null || lockButton == null || strings == null) {
            return;
        }
        if (locked) {
            input.setKeyListener(null);
            input.setCursorVisible(false);
            input.setFocusable(true);
            input.setFocusableInTouchMode(true);
            input.setClickable(true);
            input.setLongClickable(true);
            input.setShowSoftInputOnFocus(false);
            hideSoftInputForEditor(input);
            input.clearFocus();
            lockButton.setText("\uD83D\uDD12 " + strings.editorLockedState);
            return;
        }
        input.setKeyListener(editableKeyListener);
        input.setInputType(editableInputType);
        input.setCursorVisible(true);
        input.setFocusable(true);
        input.setFocusableInTouchMode(true);
        input.setClickable(true);
        input.setLongClickable(true);
        input.setShowSoftInputOnFocus(true);
        lockButton.setText("\uD83D\uDD13 " + strings.editorUnlockedState);
        showSoftInputForEditor(input, true);
    }

    private static void showSoftInputForEditor(EditText input, boolean moveCursorToEnd) {
        if (input == null) {
            return;
        }
        try {
            input.requestFocusFromTouch();
            input.requestFocus();
            input.post(() -> {
                try {
                    input.requestFocusFromTouch();
                    input.requestFocus();
                    InputMethodManager inputMethodManager = (InputMethodManager)
                            input.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
                    if (inputMethodManager != null) {
                        inputMethodManager.restartInput(input);
                        inputMethodManager.showSoftInput(input,
                                InputMethodManager.SHOW_IMPLICIT);
                    }
                    if (moveCursorToEnd && input.getText() != null) {
                        input.setSelection(input.getText().length());
                    }
                } catch (Throwable throwable) {
                    Log.w(TAG, "Failed to show editor soft input", throwable);
                }
            });
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to prepare editor soft input", throwable);
        }
    }

    private static void hideSoftInputForEditor(EditText input) {
        if (input == null) {
            return;
        }
        try {
            InputMethodManager inputMethodManager = (InputMethodManager)
                    input.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
            if (inputMethodManager != null) {
                inputMethodManager.hideSoftInputFromWindow(input.getWindowToken(), 0);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to hide editor soft input", throwable);
        }
    }

    private static void runUiActionSafely(Activity activity, String operationName,
            Runnable action) {
        if (action == null || activity == null || activity.isFinishing()) {
            return;
        }
        try {
            action.run();
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to " + operationName, throwable);
        }
    }

    private static int dp(Context context, int value) {
        float density = context != null && context.getResources() != null
                ? context.getResources().getDisplayMetrics().density : 1f;
        return Math.round(value * density);
    }

    private static int parsePositiveInt(EditText input) {
        if (input == null || input.getText() == null) {
            throw new IllegalArgumentException("Missing numeric input");
        }
        String rawValue = input.getText().toString().trim();
        if (rawValue.isEmpty()) {
            throw new IllegalArgumentException("Blank numeric input");
        }
        try {
            int parsed = Integer.parseInt(rawValue);
            if (parsed <= 0) {
                throw new IllegalArgumentException("Non-positive numeric input");
            }
            return parsed;
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException("Invalid numeric input", exception);
        }
    }

    private static int parsePositiveScaledInt(EditText input, int multiplier) {
        int value = parsePositiveInt(input);
        long scaled = (long) value * (long) multiplier;
        if (scaled > Integer.MAX_VALUE) {
            throw new IllegalArgumentException("Scaled numeric input exceeds int range");
        }
        return (int) scaled;
    }
}
