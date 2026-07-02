package dev.jason.gboardpatches.extension.symbolfooter;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardSymbolFooterOrderSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private final Context stringContext;
    private final String entryTitle;
    private final String headerBadge;
    private final String entrySummary;
    private final String headerSummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String currentOrderTitle;
    private final String reorderTitle;
    private final String reorderSummary;
    private final String resetTitle;
    private final String resetSummary;
    private final String emptyOrderSummary;
    private final String sectionCurrentConfiguration;
    private final String sectionBehavior;
    private final String sectionAdvanced;

    public GboardSymbolFooterOrderSettingsFeature() {
        this(null);
    }

    public GboardSymbolFooterOrderSettingsFeature(Context context) {
        stringContext = context;
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_title,
                "Emojis, stickers & GIFs Tab Order");
        headerBadge = GboardSettingsText.get(context,
                R.string.gboard_patches_header_badge,
                "Gboard");
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_summary,
                "Reorder the bottom tabs in Gboard's Emojis, stickers & GIFs panel.");
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_header_summary,
                "Controls the bottom tab order used by Gboard's Emojis, stickers & GIFs panel.");
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_error_title,
                "Emojis, stickers & GIFs tab order unavailable");
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_error_summary,
                "The footer order screen failed to load. Reopen Gboard settings and try again.");
        currentOrderTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_current_title,
                "Current order");
        reorderTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_reorder_title,
                "Reorder tabs");
        reorderSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_reorder_summary,
                "Drag the handle to move tabs.");
        resetTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_reset_title,
                "Reset to default order");
        resetSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_reset_summary,
                "");
        emptyOrderSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_empty_summary,
                "No tabs available in this build.");
        sectionCurrentConfiguration = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_section_current,
                "Current configuration");
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_section_behavior,
                "Behavior");
        sectionAdvanced = GboardSettingsText.get(context,
                R.string.gboard_patches_symbol_footer_section_advanced,
                "Advanced");
    }

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entrySummary;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_SYMBOL_FOOTER_ORDER);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            Context context = host.getContext();
            SharedPreferences preferences = GboardSymbolFooterOrderSettings.preferences(context);
            GboardSymbolFooterOrderSettings.ensureDefaults(preferences);

            List<String> currentOrder = visibleOrder(
                    GboardSymbolFooterOrderSettings.readSymbolFooterOrder(preferences),
                    availableTabTypes(context));
            List<GboardPatchesSettingsContract.Row> currentRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            currentRows.add(new GboardPatchesSettingsContract.DetailRow(
                    currentOrderTitle,
                    buildCurrentOrderSummary(currentOrder),
                    true,
                    true));
            List<GboardPatchesSettingsContract.Row> behaviorRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            behaviorRows.add(new GboardPatchesSettingsContract.CommandRow(
                    reorderTitle,
                    reorderSummary,
                    true,
                    new ShowReorderDialogAction(this, host)));
            List<GboardPatchesSettingsContract.Row> advancedRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            advancedRows.add(new GboardPatchesSettingsContract.DangerRow(
                    resetTitle,
                    resetSummary,
                    true,
                    new ResetOrderAction(host),
                    GboardSettingsText.get(stringContext,
                            R.string.gboard_patches_symbol_footer_reset_confirm_title,
                            "Reset tab order"),
                    GboardSettingsText.get(stringContext,
                            R.string.gboard_patches_symbol_footer_reset_confirm_message,
                            "Restore the default Emojis, stickers & GIFs tab order?")));
            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    Collections.emptyList(),
                    Arrays.asList(
                            new GboardPatchesSettingsContract.Section(
                                    sectionCurrentConfiguration,
                                    currentRows),
                            new GboardPatchesSettingsContract.Section(
                                    sectionBehavior,
                                    behaviorRows),
                            new GboardPatchesSettingsContract.Section(
                                    sectionAdvanced,
                                    null,
                                    GboardPatchesSettingsContract.SectionStyle.ADVANCED,
                                    advancedRows)));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render Emojis, stickers & GIFs settings screen", throwable);
            return buildErrorScreen();
        }
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                errorTitle,
                errorSummary,
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                entryTitle,
                headerSummary,
                statusBlocks,
                Collections.emptyList());
    }

    private void showReorderDialog(GboardPatchesSettingsContract.Host host) {
        if (host == null || host.getContext() == null) {
            return;
        }
        try {
            Context context = host.getContext();
            if (!(context instanceof Activity)) {
                return;
            }
            Activity activity = (Activity) context;
            List<String> availableTabs = availableTabTypes(context);
            if (availableTabs.isEmpty()) {
                Log.i(TAG, "Skipping reorder dialog because no tabs are available");
                return;
            }
            List<String> storedOrder = GboardSymbolFooterOrderSettings.readSymbolFooterOrder(
                    context);
            List<String> currentOrder = visibleOrder(storedOrder, availableTabs);
            GboardSymbolFooterOrderEditorDialog.show(
                    activity,
                    currentOrder,
                    new TabLabelResolver(),
                    new SaveReorderedOrderAction(context, host, storedOrder, availableTabs));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to show Emojis, stickers & GIFs reorder dialog", throwable);
        }
    }

    private static List<String> availableTabTypes(Context context) {
        List<String> tabs = new ArrayList<String>();
        boolean hasCustomSymbols = GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_CUSTOM_SYMBOLS);
        for (String tabType : GboardSymbolFooterOrderSettings.DEFAULT_SYMBOL_FOOTER_ORDER) {
            if (!hasCustomSymbols
                    && GboardSymbolFooterOrderSettings.SYMBOL_FOOTER_TAB_CUSTOM_SYMBOLS.equals(
                            tabType)) {
                continue;
            }
            tabs.add(tabType);
        }
        return tabs;
    }

    private static List<String> visibleOrder(List<String> storedOrder, List<String> availableTabs) {
        LinkedHashSet<String> allowed = new LinkedHashSet<String>(availableTabs);
        LinkedHashSet<String> visible = new LinkedHashSet<String>();
        if (storedOrder != null) {
            for (String tabType : storedOrder) {
                if (allowed.contains(tabType)) {
                    visible.add(tabType);
                }
            }
        }
        for (String tabType : availableTabs) {
            visible.add(tabType);
        }
        return new ArrayList<String>(visible);
    }

    private static List<String> mergeStoredAndVisibleOrder(List<String> storedOrder,
            List<String> visibleOrder,
            List<String> availableTabs) {
        List<String> normalizedStoredOrder =
                GboardSymbolFooterOrderSettings.DEFAULT_SYMBOL_FOOTER_ORDER;
        if (storedOrder != null && !storedOrder.isEmpty()) {
            normalizedStoredOrder = new ArrayList<String>(storedOrder);
        }
        List<String> normalizedVisibleOrder = visibleOrder(visibleOrder, availableTabs);
        LinkedHashSet<String> availableSet = new LinkedHashSet<String>(availableTabs);
        Map<Integer, List<String>> hiddenTabsByVisibleSlot =
                new LinkedHashMap<Integer, List<String>>();
        int visibleCount = 0;
        for (String tabType : normalizedStoredOrder) {
            if (availableSet.contains(tabType)) {
                visibleCount++;
                continue;
            }
            List<String> tabsInSlot = hiddenTabsByVisibleSlot.get(Integer.valueOf(visibleCount));
            if (tabsInSlot == null) {
                tabsInSlot = new ArrayList<String>();
                hiddenTabsByVisibleSlot.put(Integer.valueOf(visibleCount), tabsInSlot);
            }
            tabsInSlot.add(tabType);
        }

        List<String> merged = new ArrayList<String>();
        appendHiddenTabsForSlot(hiddenTabsByVisibleSlot, merged, 0);
        for (int index = 0; index < normalizedVisibleOrder.size(); index++) {
            merged.add(normalizedVisibleOrder.get(index));
            appendHiddenTabsForSlot(hiddenTabsByVisibleSlot, merged, index + 1);
        }
        return merged;
    }

    private static void appendHiddenTabsForSlot(Map<Integer, List<String>> hiddenTabsByVisibleSlot,
            List<String> merged,
            int visibleSlot) {
        List<String> hiddenTabs = hiddenTabsByVisibleSlot.get(Integer.valueOf(visibleSlot));
        if (hiddenTabs == null || hiddenTabs.isEmpty()) {
            return;
        }
        merged.addAll(hiddenTabs);
    }

    private String buildCurrentOrderSummary(List<String> currentOrder) {
        if (currentOrder == null || currentOrder.isEmpty()) {
            return emptyOrderSummary;
        }
        StringBuilder builder = new StringBuilder();
        for (int index = 0; index < currentOrder.size(); index++) {
            if (index > 0) {
                builder.append('\n');
            }
            builder.append(index + 1)
                    .append(". ")
                    .append(tabLabel(currentOrder.get(index)));
        }
        return builder.toString();
    }

    private String tabLabel(String tabType) {
        if (GboardSymbolFooterOrderSettings.SYMBOL_FOOTER_TAB_EMOJI.equals(tabType)) {
            return GboardSettingsText.get(stringContext,
                    R.string.gboard_patches_symbol_tab_emoji,
                    "Emoji");
        }
        if (GboardSymbolFooterOrderSettings.SYMBOL_FOOTER_TAB_CUSTOM_SYMBOLS.equals(tabType)) {
            return GboardSettingsText.get(stringContext,
                    R.string.gboard_patches_symbol_tab_custom_symbols,
                    "Custom Symbols");
        }
        if (GboardSymbolFooterOrderSettings.SYMBOL_FOOTER_TAB_EMOTICON.equals(tabType)) {
            return GboardSettingsText.get(stringContext,
                    R.string.gboard_patches_symbol_tab_emoticon,
                    "Emoticon");
        }
        if (GboardSymbolFooterOrderSettings.SYMBOL_FOOTER_TAB_GIF.equals(tabType)) {
            return GboardSettingsText.get(stringContext,
                    R.string.gboard_patches_symbol_tab_gif,
                    "GIF");
        }
        if (GboardSymbolFooterOrderSettings.SYMBOL_FOOTER_TAB_STICKER.equals(tabType)) {
            return GboardSettingsText.get(stringContext,
                    R.string.gboard_patches_symbol_tab_sticker,
                    "Sticker");
        }
        return tabType;
    }

    private final class ShowReorderDialogAction implements Runnable {
        private final GboardSymbolFooterOrderSettingsFeature feature;
        private final GboardPatchesSettingsContract.Host host;

        ShowReorderDialogAction(GboardSymbolFooterOrderSettingsFeature feature,
                GboardPatchesSettingsContract.Host host) {
            this.feature = feature;
            this.host = host;
        }

        @Override
        public void run() {
            if (feature == null || host == null) {
                return;
            }
            feature.showReorderDialog(host);
        }
    }

    private static final class ResetOrderAction implements Runnable {
        private final GboardPatchesSettingsContract.Host host;

        ResetOrderAction(GboardPatchesSettingsContract.Host host) {
            this.host = host;
        }

        @Override
        public void run() {
            if (host == null) {
                return;
            }
            try {
                GboardSymbolFooterOrderSettings.writeSymbolFooterOrder(
                        host.getContext(),
                        GboardSymbolFooterOrderSettings.DEFAULT_SYMBOL_FOOTER_ORDER);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to reset expression footer tab order", throwable);
            }
            safeRefresh(host);
        }
    }

    private final class TabLabelResolver
            implements GboardSymbolFooterOrderEditorDialog.LabelResolver {
        @Override
        public String labelFor(String tabType) {
            return tabLabel(tabType);
        }
    }

    private static final class SaveReorderedOrderAction
            implements GboardSymbolFooterOrderEditorDialog.SaveCallback {
        private final Context context;
        private final GboardPatchesSettingsContract.Host host;
        private final List<String> storedOrder;
        private final List<String> availableTabs;

        SaveReorderedOrderAction(Context context,
                GboardPatchesSettingsContract.Host host,
                List<String> storedOrder,
                List<String> availableTabs) {
            this.context = context;
            this.host = host;
            this.storedOrder = storedOrder;
            this.availableTabs = availableTabs;
        }

        @Override
        public void onSave(List<String> reorderedVisibleOrder) {
            try {
                List<String> mergedOrder =
                        mergeStoredAndVisibleOrder(storedOrder, reorderedVisibleOrder, availableTabs);
                Log.i(TAG, "Saving expression footer tab order: visible=" + reorderedVisibleOrder
                        + ", merged=" + mergedOrder
                        + ", stored=" + storedOrder
                        + ", available=" + availableTabs);
                GboardSymbolFooterOrderSettings.writeSymbolFooterOrder(
                        context,
                        mergedOrder);
            } catch (Throwable throwable) {
                Log.w(TAG, "Failed to save expression footer tab order", throwable);
            } finally {
                safeRefresh(host);
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
            Log.w(TAG, "Failed to refresh settings after expression footer update", throwable);
        }
    }
}
