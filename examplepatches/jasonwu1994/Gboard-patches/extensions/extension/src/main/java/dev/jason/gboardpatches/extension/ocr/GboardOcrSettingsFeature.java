package dev.jason.gboardpatches.extension.ocr;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.List;
import java.util.Map;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardOcrSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";

    private static volatile GboardOcrEngine pendingEngine;
    private static volatile GboardOcrEngine failedEngine;

    private enum ModuleState {
        CHECKING,
        INSTALLED,
        NOT_INSTALLED,
        CHECK_FAILED
    }

    private final GboardOcrModuleInstallRequester moduleInstallRequester;
    private final GboardOcrModuleAvailabilityChecker moduleAvailabilityChecker;
    private final Map<GboardOcrEngine, ModuleState> moduleStates =
            new EnumMap<GboardOcrEngine, ModuleState>(GboardOcrEngine.class);
    private final String entryTitle;
    private final String headerBadge;
    private final String headerSummary;
    private final String entrySummary;
    private final String errorTitle;
    private final String errorSummary;
    private final String engineTitle;
    private final String statusInstalled;
    private final String statusNotInstalled;
    private final String statusChecking;
    private final String statusCheckFailed;
    private final String statusDownloading;
    private final String statusDownloadFailed;
    private final String statusCurrent;
    private final String[] engineLabels;

    public GboardOcrSettingsFeature(Context context) {
        this(context, GboardOcrModuleInstaller::request,
                GboardOcrModuleInstaller::checkAvailability);
    }

    GboardOcrSettingsFeature(Context context,
            GboardOcrModuleInstallRequester moduleInstallRequester,
            GboardOcrModuleAvailabilityChecker moduleAvailabilityChecker) {
        this.moduleInstallRequester = moduleInstallRequester;
        this.moduleAvailabilityChecker = moduleAvailabilityChecker;
        entryTitle = GboardSettingsText.get(context, R.string.gboard_patches_ocr_title);
        headerBadge = GboardSettingsText.get(context, R.string.gboard_patches_header_badge);
        headerSummary = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_header_summary);
        entrySummary = GboardSettingsText.get(context, R.string.gboard_patches_ocr_summary);
        errorTitle = GboardSettingsText.get(context, R.string.gboard_patches_ocr_error_title);
        errorSummary = GboardSettingsText.get(context, R.string.gboard_patches_ocr_error_summary);
        engineTitle = GboardSettingsText.get(context, R.string.gboard_patches_ocr_engine_title);
        statusInstalled = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_status_installed);
        statusNotInstalled = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_status_not_installed);
        statusChecking = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_status_checking);
        statusCheckFailed = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_status_check_failed);
        statusDownloading = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_status_downloading);
        statusDownloadFailed = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_status_download_failed);
        statusCurrent = GboardSettingsText.get(
                context, R.string.gboard_patches_ocr_status_current);
        engineLabels = new String[]{
                GboardSettingsText.get(context, R.string.gboard_patches_ocr_engine_latin_label),
                GboardSettingsText.get(context, R.string.gboard_patches_ocr_engine_chinese_label),
                GboardSettingsText.get(context, R.string.gboard_patches_ocr_engine_japanese_label),
                GboardSettingsText.get(context, R.string.gboard_patches_ocr_engine_korean_label),
                GboardSettingsText.get(
                        context, R.string.gboard_patches_ocr_engine_devanagari_label)
        };
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
                GboardPatchesFeatureAvailability.FEATURE_OCR_SCAN_TEXT);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            if (host == null || host.getContext() == null) {
                return buildErrorScreen();
            }
            Context context = host.getContext();
            SharedPreferences preferences = GboardOcrSettings.preferences(context);
            GboardOcrSettings.ensureDefaults(preferences);
            ensureAvailabilityChecks(host);
            GboardOcrEngine currentEngine = GboardOcrSettings.readEngine(preferences);
            GboardOcrEngine downloadingEngine = pendingEngine;

            List<GboardPatchesSettingsContract.Row> engineRows =
                    new ArrayList<GboardPatchesSettingsContract.Row>();
            for (GboardOcrEngine engine : GboardOcrEngine.values()) {
                ModuleState moduleState = moduleState(engine);
                String status = statusFor(engine, moduleState, downloadingEngine);
                String trailingText = engine == currentEngine ? statusCurrent : null;
                boolean selectionEnabled = downloadingEngine == null
                        && moduleState != ModuleState.CHECKING;
                engineRows.add(new GboardPatchesSettingsContract.NavigationRow(
                        labelForEngine(engine),
                        status,
                        trailingText,
                        selectionEnabled,
                        () -> selectEngine(host, preferences, engine),
                        false));
            }

            return new GboardPatchesSettingsContract.Screen(
                    entryTitle,
                    headerBadge,
                    entryTitle,
                    headerSummary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            engineTitle,
                            engineRows)),
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT);
        } catch (Throwable failure) {
            logFailure("Failed to render OCR settings screen", failure);
            return buildErrorScreen();
        }
    }

    private String statusFor(GboardOcrEngine engine, ModuleState moduleState,
            GboardOcrEngine downloadingEngine) {
        if (engine == downloadingEngine) {
            return statusDownloading;
        }
        if (moduleState == ModuleState.CHECKING) {
            return statusChecking;
        }
        if (moduleState == ModuleState.INSTALLED) {
            return statusInstalled;
        }
        if (engine == failedEngine) {
            return statusDownloadFailed;
        }
        if (moduleState == ModuleState.CHECK_FAILED) {
            return statusCheckFailed;
        }
        return statusNotInstalled;
    }

    private void selectEngine(GboardPatchesSettingsContract.FeatureHost host,
            SharedPreferences preferences, GboardOcrEngine engine) {
        Context context = host.getContext();
        if (moduleState(engine) == ModuleState.INSTALLED) {
            failedEngine = null;
            if (GboardOcrSettings.readEngine(preferences) != engine) {
                if (!GboardOcrSettings.writeEngine(preferences, engine.getSettingsValue())) {
                    logFailure("Failed to save OCR engine", null);
                    return;
                }
                refreshSafely(host);
            }
            return;
        }

        pendingEngine = engine;
        failedEngine = null;
        refreshSafely(host);
        moduleInstallRequester.request(context, engine, new GboardOcrModuleInstaller.Callback() {
            @Override
            public void onSuccess() {
                pendingEngine = null;
                setModuleState(engine, ModuleState.INSTALLED);
                if (!GboardOcrSettings.writeEngine(preferences, engine.getSettingsValue())) {
                    failedEngine = engine;
                    logFailure("Failed to save OCR engine", null);
                } else {
                    failedEngine = null;
                }
                refreshSafely(host);
            }

            @Override
            public void onFailure(Throwable failure) {
                pendingEngine = null;
                failedEngine = engine;
                setModuleState(engine, ModuleState.NOT_INSTALLED);
                logFailure("Failed to install OCR modules for "
                        + engine.getSettingsValue(), failure);
                refreshSafely(host);
            }
        });
    }

    private void ensureAvailabilityChecks(GboardPatchesSettingsContract.FeatureHost host) {
        for (GboardOcrEngine engine : GboardOcrEngine.values()) {
            synchronized (moduleStates) {
                if (moduleStates.containsKey(engine)) {
                    continue;
                }
                moduleStates.put(engine, ModuleState.CHECKING);
            }
            try {
                moduleAvailabilityChecker.check(host.getContext(), engine,
                        new GboardOcrModuleInstaller.AvailabilityCallback() {
                            @Override
                            public void onResult(boolean installed) {
                                setModuleState(engine, installed
                                        ? ModuleState.INSTALLED
                                        : ModuleState.NOT_INSTALLED);
                                refreshSafely(host);
                            }

                            @Override
                            public void onFailure(Throwable failure) {
                                setModuleState(engine, ModuleState.CHECK_FAILED);
                                logFailure("Failed to inspect OCR module for "
                                        + engine.getSettingsValue(), failure);
                                refreshSafely(host);
                            }
                        });
            } catch (Throwable failure) {
                setModuleState(engine, ModuleState.CHECK_FAILED);
                logFailure("Failed to request OCR module availability for "
                        + engine.getSettingsValue(), failure);
            }
        }
    }

    private ModuleState moduleState(GboardOcrEngine engine) {
        synchronized (moduleStates) {
            ModuleState state = moduleStates.get(engine);
            return state == null ? ModuleState.CHECKING : state;
        }
    }

    private void setModuleState(GboardOcrEngine engine, ModuleState state) {
        synchronized (moduleStates) {
            moduleStates.put(engine, state);
        }
    }

    private static void refreshSafely(GboardPatchesSettingsContract.FeatureHost host) {
        try {
            GboardPatchesSettingsContract.refresh(host);
        } catch (Throwable failure) {
            logFailure("Failed to refresh OCR settings", failure);
        }
    }

    private String labelForEngine(GboardOcrEngine engine) {
        int index = engine.ordinal();
        return index >= 0 && index < engineLabels.length ? engineLabels[index] : engine.name();
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

    private static void logFailure(String message, Throwable failure) {
        try {
            if (failure == null) {
                Log.w(TAG, message);
            } else {
                Log.w(TAG, message, failure);
            }
        } catch (Throwable ignored) {
            // Logging must not affect Gboard.
        }
    }

    static void resetForTests() {
        pendingEngine = null;
        failedEngine = null;
    }
}
