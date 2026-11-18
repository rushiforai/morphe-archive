package app.afterglow.extension.ui;

import android.app.AlertDialog;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.destinations.AiHomeLibrary;
import app.afterglow.extension.destinations.AiHomeRouter;
import app.afterglow.extension.destinations.DestinationStores;
import app.afterglow.extension.destinations.ExperimentRuntime;
import app.afterglow.extension.destinations.ExperimentStore;
import app.afterglow.extension.downloads.DownloadJob;
import app.afterglow.extension.downloads.DownloadManager;
import app.afterglow.extension.downloads.LibraryItem;
import app.afterglow.extension.playback.OverlayModes;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.Capabilities;
import app.afterglow.extension.settings.Descriptor;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.settings.PropertyList;
import app.afterglow.extension.settings.ThemeJson;
import app.afterglow.extension.settings.ThemeStore;

/** Control Center uses the same local stores and settings as each feature's own screen. */
final class ControlCenterScreen extends DestinationScreen {
    private static final String HIDDEN = "controlCenterHiddenQuickControls";
    private static final String[][] QUICK = {
        {"Essentials", "liteModeEnabled", "noAds", "backgroundPlayback", "downloadButton"},
        {"Player", "controlsSheetButton", "overlayDeclutterButton", "lockButton", "muteButton", "tapToSeek", "portraitFullscreen"},
        {"Navigation", "twoRowTabBar", "noCast", "noSearchButton", "noNotifsButton", "noSubbar", "noYTLogo"},
        {"Clean YouTube", "hideShorts", "shortsProgress", "autoSkipShorts", "hideSubs", "hidePrevNext", "noHUDMsgs", "noWatermarks"},
        {"Feed", "removeWatchLaterMenu", "removeSaveToPlaylistMenu", "removeNotInterestedMenu", "removeDontRecommendMenu", "removeReportMenu"}
    };
    private static final String[][] PLAYER = {
        {"Playback", "backgroundPlayback", "tapToSeek", "portraitFullscreen", "autoFullscreen", "exitFullscreen", "rememberCaptionState", "rememberLoop", "classicQuality", "miniplayer", "noRelatedVids", "hideEndScreenCards", "noContinueWatching"},
        {"Overlay Buttons", "muteButton", "lockButton", "downloadButton", "controlsSheetButton", "overlayDeclutterButton"},
        {"Overlay Cleanup", "hideSubs", "hidePrevNext", "replacePrevNext", "noHUDMsgs", "noDarkBg", "noFullscreenActions", "pauseOnOverlay", "stockVolumeHUD", "noWatermarks", "videoEndTime", "24hrFormat"},
        {"Buttons & Menus", "noPlayerDownloadButton", "noPlayerShareButton", "noPlayerSaveButton", "noPlayerRemixButton", "noPlayerClipButton", "removeDownloadMenu", "removeShareMenu"}
    };
    private static final String[][] CLEAN = {
        {"Lite Mode", "liteModeEnabled", "noAds"},
        {"Navigation", "noCast", "noNotifsButton", "noSearchButton", "noVoiceSearchButton", "noSubbar", "noYTLogo", "premiumYTLogo"},
        {"Shorts", "hideShorts", "shortsOnlyMode", "autoSkipShorts", "shortsProgress", "pinchToFullscreenShorts", "shortsToRegular", "resumeShorts"},
        {"Shorts Layout", "hideShortsLogo", "hideShortsSearch", "hideShortsCamera", "hideShortsMore", "hideShortsSubscriptions", "hideShortsLike", "hideShortsDislike", "hideShortsComments", "hideShortsRemix", "hideShortsShare", "hideShortsAvatars", "hideShortsThanks", "hideShortsSource", "hideShortsChannelName", "hideShortsDescription", "hideShortsAudioTrack", "hideShortsPromoCards"},
        {"Feed Menus", "removePlayNext", "removeWatchLaterMenu", "removeSaveToPlaylistMenu", "removeNotInterestedMenu", "removeDontRecommendMenu", "removeReportMenu"}
    };
    private final AfterglowDestinations.Navigator navigator;
    private final DownloadManager downloads;
    private final ExperimentStore experiments;
    private final AiHomeLibrary ai;
    ControlCenterScreen(AfterglowActivity activity, AfterglowDestinations.Navigator navigator) {
        super(activity); this.navigator = navigator; downloads = InstalledTweaks.has("downloads") ? DownloadManager.get(activity) : null;
        experiments = ExperimentRuntime.store(activity); ai = DestinationStores.aiHome(activity);
    }
    @Override String title() { return "Afterglow Control Center"; }
    @Override void build(LinearLayout content) {
        RowViews views = activity.views();
        ControlCenterQueueState queue = ControlCenterQueueUpdates.snapshot(downloads);
        TextView nowStatus = null;
        if (downloads != null) {
        content.addView(views.sectionTitle("Afterglow Vault"));
        row(content, "Browse Media Library", queue.loaded ? queue.libraryCount + " saved items" : "Loading the library…", "Open", () -> DownloadsUi.openVault(activity));
        content.addView(views.sectionTitle("Now"));
        if (!queue.loaded) content.addView(views.caption("Loading the download queue…"));
        else {
            if (queue.current == null) content.addView(views.caption("No active downloads."));
            else {
                DownloadJob job = queue.current;
                row(content, value(job.request.title, job.request.videoId), null, "Details", () -> DownloadsUi.openProgress(activity, job.id));
                nowStatus = (TextView) views.caption(queue.status());
                content.addView(nowStatus);
                if (job.state == DownloadJob.State.RUNNING) row(content, "Pause", null, null, () -> downloads.pause(job.id));
                if (job.state == DownloadJob.State.PAUSED) row(content, "Resume", null, null, () -> downloads.resume(job.id));
                row(content, "Cancel Download", null, null, () -> confirm("Cancel Download", "Stop this download? Completed Vault items are kept.", "Cancel Download", () -> downloads.cancel(job.id)));
            }
            content.addView(views.caption(queue.queued + " waiting · " + queue.failed + " failed"));
        }
        if (queue.recoveryMessage != null) content.addView(views.caption(queue.recoveryMessage));
        if (queue.libraryRecoveryMessage != null) content.addView(views.caption(queue.libraryRecoveryMessage));
        for (LibraryItem item : queue.recent) {
            row(content, value(item.title, item.videoId), item.isMissing() ? "Missing file" : value(item.formatSummary, item.mimeType), "Open", () -> DownloadsUi.openItem(activity, item));
        }
        } else content.addView(views.caption("Select Downloads and Vault to use the library and download queue."));
        content.addView(views.sectionTitle("Quick Controls"));
        addControls(content, QUICK, hidden());
        row(content, "Customize Quick Controls", "Choose which controls appear here. Their settings stay unchanged.", null, this::customize);
        content.addView(views.sectionTitle("Player"));
        String[] modes = {"YouTube controls", "Afterglow controls pinned", "Timed controls with eye", "Eye only (Afterglow buttons hidden)"};
        content.addView(views.caption(modes[Math.max(0, Math.min(3, OverlayModes.mode()))]));
        row(content, "Player & Overlay", "Playback, overlay buttons, and cleanup.", null, () -> activity.push(new ControlsScreen(activity, "Player & Overlay", PLAYER)));
        if (SettingsBehavior.keyVisible("action.resetOverlayMode"))
            row(content, "Reset Player Overlay", "Restore the current overlay session to YouTube controls.", null, () -> { OverlayModes.reset(); activity.refresh(); });
        if (SettingsBehavior.keyVisible("destination.aiHome")) {
        content.addView(views.sectionTitle("Discover"));
        int favorites = 0; for (Map<String, Object> entry : ai.saved()) if (Boolean.TRUE.equals(entry.get("favorite"))) favorites++;
        row(content, "AI Home Studio", ai.saved().size() + " saved · " + favorites + " favorites · " + ai.recent().size() + " recent", null, () -> navigator.openDestination("aiHome"));
        content.addView(views.caption(AiHomeRouter.capability().message));
        if (!ai.saved().isEmpty()) {
            String name = (String) ai.saved().get(0).get("name");
            if (!name.isEmpty()) content.addView(views.caption("Latest saved: " + name)); // never reveal private prompt text here
        }
        row(content, "Back to Normal Home", null, null, () -> { if (AiHomeRouter.openNormalHome()) navigator.closeToNativeHome(); else activity.alert(title(), "Return to YouTube and select Home."); });
        }
        if (SettingsBehavior.keyVisible("destination.experimentLab")) {
        content.addView(views.sectionTitle("Experiments"));
        row(content, "AB Lab", experiments.activeProfile() + " · " + experiments.overrides().size() + " overrides · " + experiments.profiles().size() + " profiles", null, () -> navigator.openDestination("experimentLab"));
        row(content, "Experiment Safety", experimentStatus(), null, () -> activity.push(new ExperimentLabScreen(activity, true)));
        }
        content.addView(views.sectionTitle("Appearance"));
        if (SettingsBehavior.keyVisible("destination.themeStudio")) row(content, "Theme Studio", ThemeStore.snapshot().palette.name, null, () -> navigator.openDestination("themeStudio"));
        if (SettingsBehavior.keyVisible("destination.glowLab")) row(content, "Glow Lab", "Wordmark, native icons, and bloom effects.", null, () -> navigator.openDestination("glowLab"));
        row(content, "Clean YouTube", "Navigation, Shorts, and feed menus.", null, () -> activity.push(new ControlsScreen(activity, "Clean YouTube", CLEAN)));
        content.addView(views.sectionTitle("Health"));
        content.addView(views.caption(InstalledTweaks.all().size() + " installed features · " + ExperimentRuntime.catalog().size() + " observed native flags"));
        row(content, "Export Diagnostics", "Version, installed feature names, and aggregate status. No prompt text, URLs, or experiment values.", null, this::diagnostics);
        row(content, "About Afterglow", "Version, notices, and project information.", null, () -> navigator.openSettingsPage("page:about"));
        content.addView(views.sectionTitle("Recovery"));
        if (downloads != null) {
        row(content, "Retry Failed Downloads", null, null, () -> { for (DownloadJob job : downloads.snapshot()) if (job.state == DownloadJob.State.FAILED) downloads.retry(job.id); });
        row(content, "Scan & Repair Vault", "Check saved files and recover orphaned media.", null, () -> downloads.library().reconcile((items, error) -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            activity.alert("Vault Scan", error == null ? "Scan complete. " + items.size() + " items checked." : error); activity.refresh();
        }));
        }
        if (SettingsBehavior.keyVisible("destination.experimentLab")) {
        content.addView(views.switchRow("Bypass Experiment Overrides", "Keep profiles while using native server values.", experiments.bypass(), true,
                (button, checked) -> run(() -> { experiments.setBypass(checked); ExperimentRuntime.changed(); })));
        row(content, "Reset Active Experiment Overrides", "Other profiles are kept.", null,
                () -> confirm("Reset Active Overrides", "Remove every override in " + experiments.activeProfile() + "?", "Reset", () -> { experiments.resetActive(); ExperimentRuntime.changed(); }));
        }
        if (SettingsBehavior.keyVisible("destination.themeStudio")) row(content, "Reset Theme Colors", "Saved themes are kept. YouTube restarts to apply the reset.", null,
                () -> new AlertDialog.Builder(activity).setTitle("Reset Theme Colors").setNegativeButton("Cancel", null)
                        .setPositiveButton("Reset & Restart", (d, w) -> { ThemeStore.resetToSystem(); AppRestart.restart(activity); }).show());
        attachLiveUpdates(content, queue, nowStatus);
    }
    private void attachLiveUpdates(LinearLayout content, ControlCenterQueueState rendered, TextView nowStatus) {
        // The activity reuses its content container. A per-render child is removed
        // on navigation/refresh, so listeners never accumulate on that container.
        View anchor = new View(activity);
        anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        if (downloads != null) new ControlCenterQueueUpdates(anchor, downloads, rendered, nowStatus,
                () -> !activity.isFinishing() && !activity.isDestroyed(), activity::refresh);
        OverlayModes.Listener overlay = () -> { if (anchor.isAttachedToWindow()) activity.refresh(); };
        anchor.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            public void onViewAttachedToWindow(View view) { OverlayModes.addListener(overlay); }
            public void onViewDetachedFromWindow(View view) { OverlayModes.removeListener(overlay); }
        });
        content.addView(anchor, new LinearLayout.LayoutParams(1, 1));
    }
    private String experimentStatus() {
        if (experiments.recoveryRequired()) return "Recovery required. Overrides are bypassed.";
        if (experiments.bypass()) return "Overrides are bypassed.";
        if (experiments.pending()) return "Pending verification: 30 uninterrupted foreground seconds.";
        return "No pending experiment changes.";
    }
    private Set<String> hidden() {
        Set<String> result = new HashSet<>();
        try { Object raw = ThemeJson.parse(AfterglowPrefs.getString(HIDDEN)); if (raw instanceof List) for (Object key : (List<?>) raw) if (key instanceof String) result.add((String) key); }
        catch (Exception ignored) {}
        return result;
    }
    private void customize() {
        List<String> keys = new ArrayList<>(), titles = new ArrayList<>(); Set<String> hidden = hidden();
        for (String[] group : QUICK) for (int i = 1; i < group.length; i++) if (available(group[i])) { keys.add(group[i]); titles.add(AfterglowPrefs.descriptor(group[i]).title()); }
        boolean[] checked = new boolean[keys.size()]; for (int i = 0; i < checked.length; i++) checked[i] = !hidden.contains(keys.get(i));
        new AlertDialog.Builder(activity).setTitle("Quick Controls").setMultiChoiceItems(titles.toArray(new String[0]), checked, (d, i, value) -> checked[i] = value)
                .setNegativeButton("Cancel", null).setNeutralButton("Show All", (d, w) -> { AfterglowPrefs.remove(HIDDEN); activity.refresh(); })
                .setPositiveButton("Save", (d, w) -> { for (int i = 0; i < checked.length; i++) { if (checked[i]) hidden.remove(keys.get(i)); else hidden.add(keys.get(i)); }
                    AfterglowPrefs.setString(HIDDEN, ThemeJson.write(new ArrayList<>(hidden))); activity.refresh(); }).show();
    }
    private void diagnostics() {
        try {
            Map<String, Object> data = new LinkedHashMap<>(); data.put("schemaVersion", 1L);
            data.put("youtubeVersion", activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName);
            data.put("installedFeatures", new ArrayList<>(InstalledTweaks.all())); data.put("vaultItems", downloads == null ? 0 : downloads.library().snapshot().size());
            data.put("queueJobs", downloads == null ? 0 : downloads.snapshot().size()); data.put("experimentOverrides", experiments.overrides().size());
            data.put("experimentBypass", experiments.bypass() || experiments.recoveryRequired());
            data.put("nativeAiEntry", AiHomeRouter.capability().nativeEntry);
            AfterglowDestinations.export(activity, "Afterglow-Control-Center.plist", PropertyList.write(data));
        } catch (Exception error) { activity.alert(title(), error.getMessage()); }
    }
    private static boolean available(String key) {
        Descriptor descriptor = AfterglowPrefs.descriptor(key);
        return descriptor != null && descriptor.type == Descriptor.Type.BOOLEAN && SettingsBehavior.keyVisible(key);
    }
    private void addControls(LinearLayout content, String[][] groups, Set<String> hidden) { controls(activity, content, groups, hidden); }
    private static void controls(AfterglowActivity activity, LinearLayout content, String[][] groups, Set<String> hidden) {
        for (String[] group : groups) {
            boolean header = false;
            for (int i = 1; i < group.length; i++) {
                String key = group[i]; if (hidden.contains(key) || !available(key)) continue;
                if (!header) { content.addView(activity.views().sectionTitle(group[0])); header = true; }
                Descriptor descriptor = AfterglowPrefs.descriptor(key);
                String description = descriptor.description(); Boolean forced = LiteMode.forcedValue(key);
                if (forced != null) description = value(description, "") + " " + (forced ? SettingsBehavior.NOTE_LITE_ON : SettingsBehavior.NOTE_LITE_OFF);
                content.addView(activity.views().switchRow(descriptor.title(), description, LiteMode.effectiveBool(key),
                        Capabilities.state(descriptor.capability) != Capabilities.State.DISABLED, (button, checked) -> {
                    Runnable apply = () -> {
                        AfterglowPrefs.setBool(key, checked);
                        if (key.equals(LiteMode.KEY) || key.equals("playlistOldMinibar") || descriptor.isRestartRequired()) new AlertDialog.Builder(activity).setTitle("Restart YouTube")
                                .setMessage("Restart YouTube to apply this change throughout the app.").setNegativeButton("Later", null).setPositiveButton("Restart Now", (d, w) -> AppRestart.restart(activity)).show();
                        activity.refresh();
                    };
                    if (key.equals("shortsOnlyMode") && checked) new AlertDialog.Builder(activity).setTitle("Shorts Only")
                            .setMessage("Use only the Shorts feed?").setNegativeButton("Cancel", (d, w) -> activity.refresh()).setOnCancelListener(d -> activity.refresh()).setPositiveButton("Enable", (d, w) -> apply.run()).show();
                    else apply.run();
                }));
            }
        }
    }
    private static String value(String text, String fallback) { return text == null || text.isEmpty() ? fallback : text; }
    private static final class ControlsScreen extends DestinationScreen {
        private final String name; private final String[][] groups;
        ControlsScreen(AfterglowActivity activity, String name, String[][] groups) { super(activity); this.name = name; this.groups = groups; }
        @Override String title() { return name; }
        @Override void build(LinearLayout content) { controls(activity, content, groups, java.util.Collections.emptySet()); }
    }
}
