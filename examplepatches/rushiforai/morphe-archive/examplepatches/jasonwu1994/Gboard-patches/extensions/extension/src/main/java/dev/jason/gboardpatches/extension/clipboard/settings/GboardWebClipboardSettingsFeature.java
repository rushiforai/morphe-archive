package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.webclipboard.WebClipboardPreferences;

public final class GboardWebClipboardSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardWebClipboard";
    private static final String FALLBACK_ENTRY_TITLE = "Web Clipboard";
    private static final String FALLBACK_ENTRY_SUMMARY =
            "Zero-install clipboard sharing hosted by this phone. Open the same LAN page on"
                    + " multiple devices to keep your phone and browsers in sync. Recommended:"
                    + " turn on Quick Settings Tile.";
    private static final String FALLBACK_ERROR_TITLE = "Web Clipboard settings unavailable";
    private static final String FALLBACK_ERROR_SUMMARY =
            "The Web Clipboard settings screen failed to load. Reopen Gboard settings and try"
                    + " again.";

    private String entryTitle = FALLBACK_ENTRY_TITLE;
    private String entrySummary = FALLBACK_ENTRY_SUMMARY;

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
        initializeText(context);
        return GboardPatchesFeatureAvailability.hasFeature(
                context,
                GboardPatchesFeatureAvailability.FEATURE_WEB_CLIPBOARD);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.Host host) {
        try {
            Context context = host.getContext();
            initializeText(context);
            SharedPreferences preferences = WebClipboardPreferences.preferences(context);
            WebClipboardPreferences.ensureDefaults(preferences);
            return createSection(context).buildHomeScreen(host, preferences);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render Web Clipboard settings screen", throwable);
            return buildErrorScreen();
        }
    }

    String getHostedEntrySummary(Context context, SharedPreferences preferences) {
        initializeText(context);
        return createSection(context).getEntrySummary(context, preferences);
    }

    private void initializeText(Context context) {
        GboardClipboardSyncSettingsSection section = createSection(context);
        entryTitle = section.getEntryTitle();
        entrySummary = section.getEntrySummary();
    }

    private GboardClipboardSyncSettingsSection createSection(Context context) {
        return new GboardClipboardSyncSettingsSection(context);
    }

    private GboardPatchesSettingsContract.Screen buildErrorScreen() {
        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks =
                new ArrayList<GboardPatchesSettingsContract.StatusBlock>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                FALLBACK_ERROR_TITLE,
                FALLBACK_ERROR_SUMMARY,
                GboardPatchesSettingsContract.StatusTone.WARNING));
        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                "Gboard",
                entryTitle,
                entrySummary,
                statusBlocks,
                Collections.emptyList());
    }
}
