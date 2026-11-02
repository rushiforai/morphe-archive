package app.myspoti.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Insets;
import android.graphics.drawable.ColorDrawable;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowInsets;
import android.util.Log;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Switch;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Offline tools screen opened from MySpoti Settings > Downloads.
 * Both appearances mirror MySpoti's own Classic and Immersive palettes and accent preferences.
 * Export, tagging, artwork and storage-migration behavior remain unchanged.
 */
public final class DownloadToolsActivity extends Activity {
    private static final int REQUEST_EXPORT_FOLDER = 741;

    // Both looks read their own accent preference; the surrounding surface palette follows the look.
    private int BG = 0xFF121212;
    private int SURFACE = 0xFF1F1F1F;
    private int SURFACE_ALT = 0xFF282828;
    private int DIVIDER = 0xFF3E3E3E;
    private int ACCENT = 0xFF1ED760;
    private int TEXT = Color.WHITE;
    private int MUTED = 0xFFB3B3B3;
    private int SUBTLE = 0xFF808080;
    private boolean immersiveLook;
    private Typeface immersiveTypeface;

    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private TextView trackCount;
    private TextView storageSize;
    private TextView locationName;
    private TextView locationPath;
    private TextView exportSyncStatus;
    private TextView exportArchiveStatus;
    private TextView collectionSyncStatus;
    private TextView restoreStatus;
    private Switch autoSyncSwitch;
    private Switch deleteSyncSwitch;
    private Dialog progressDialog;
    private ProgressBar progressBar;
    private TextView progressMessage;
    private LinearLayout backgroundStopButton;
    private boolean activityResumed;
    private boolean observedActiveSync;
    private final Handler syncStatusHandler = new Handler(Looper.getMainLooper());
    private final Runnable syncStatusPoller = new Runnable() {
        @Override public void run() {
            renderSyncCoordinatorStatus();
            if (activityResumed) syncStatusHandler.postDelayed(this, 750L);
        }
    };

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        applyLookPalette();
        configureWindow();
        buildUi();
        refreshSummary();
        // Opening this screen is read-only: show the saved archive/sync state, but
        // never start an automatic export pass just because the user viewed the page.
        showSavedExportStatus();
    }

    @Override protected void onResume() {
        super.onResume();
        activityResumed = true;
        syncStatusHandler.removeCallbacks(syncStatusPoller);
        syncStatusHandler.post(syncStatusPoller);
    }

    @Override protected void onPause() {
        activityResumed = false;
        syncStatusHandler.removeCallbacks(syncStatusPoller);
        super.onPause();
    }

    private void renderSyncCoordinatorStatus() {
        ExportSyncCoordinator.Snapshot snapshot = ExportSyncCoordinator.snapshot();
        if (snapshot.running) {
            observedActiveSync = true;
            if (exportSyncStatus != null) exportSyncStatus.setText(snapshot.displayText());
            if (backgroundStopButton != null) {
                backgroundStopButton.setVisibility(snapshot.canStop ? View.VISIBLE : View.GONE);
                backgroundStopButton.setEnabled(!snapshot.stopRequested);
            }
        } else {
            if (observedActiveSync && snapshot.lastResult != null && !snapshot.lastResult.trim().isEmpty()
                    && exportSyncStatus != null) exportSyncStatus.setText(snapshot.lastResult);
            observedActiveSync = false;
            if (backgroundStopButton != null) backgroundStopButton.setVisibility(View.GONE);
        }
    }

    /** Read the same look/accent preferences that MySpoti uses in its Compose theme. */
    private void applyLookPalette() {
        immersiveLook = MySpotiImmersiveStyle.isImmersive(this);
        ACCENT = MySpotiImmersiveStyle.accent(this, immersiveLook);
        // Match MySpoti's Classic Material color scheme, including its optional AMOLED black page.
        BG = getSharedPreferences("energy_settings", MODE_PRIVATE)
                .getBoolean("black_background", false) ? Color.BLACK : 0xFF121212;
        SURFACE = 0xFF1F1F1F;
        SURFACE_ALT = 0xFF282828;
        DIVIDER = 0xFF3E3E3E;
        TEXT = Color.WHITE;
        MUTED = 0xFFB3B3B3;
        SUBTLE = 0xFF808080;
        if (immersiveLook) {
            // Reuse MySpoti's packaged Inter font when present; fall back to the Android sans face
            // on builds whose resource table does not expose it to the extension activity.
            if (Build.VERSION.SDK_INT >= 26) {
                int interId = getResources().getIdentifier("inter", "font", null);
                if (interId != 0) {
                    try { immersiveTypeface = getResources().getFont(interId); }
                    catch (Throwable ignored) { immersiveTypeface = null; }
                }
            }
            BG = MySpotiImmersiveStyle.PAGE;
            SURFACE = MySpotiImmersiveStyle.RAISED;
            SURFACE_ALT = MySpotiImmersiveStyle.GLASS_FILL;
            DIVIDER = MySpotiImmersiveStyle.SEPARATOR;
            TEXT = MySpotiImmersiveStyle.TEXT;
            MUTED = MySpotiImmersiveStyle.TEXT_SECONDARY;
            SUBTLE = MySpotiImmersiveStyle.TEXT_TERTIARY;
        }
    }

    private void configureWindow() {
        try {
            if (getActionBar() != null) getActionBar().hide();
        } catch (Throwable ignored) {}
        Window window = getWindow();
        if (window == null) return;
        // Draw edge-to-edge and apply explicit status/navigation insets to the
        // ScrollView content below. This is required for targetSdk 35+ devices.
        if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
        window.setStatusBarColor(BG);
        window.setNavigationBarColor(BG);
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        View decor = window.getDecorView();
        int flags = decor.getSystemUiVisibility();
        flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        decor.setSystemUiVisibility(flags);
    }

    /** Mirrors ImmersiveSwitchRow: white thumb, selected accent track, graphite off track. */
    private void applySwitchColors(Switch control) {
        int checkedThumb = immersiveLook ? Color.WHITE : ACCENT;
        int uncheckedThumb = immersiveLook ? Color.WHITE : 0xFFB3B3B3;
        int checkedTrack = MySpotiImmersiveStyle.withAlpha(ACCENT, immersiveLook ? 255 : 136);
        int uncheckedTrack = immersiveLook ? 0xFF3A3A3F : 0xFF555555;
        control.setThumbTintList(new ColorStateList(
                new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
                new int[] { checkedThumb, uncheckedThumb }));
        control.setTrackTintList(new ColorStateList(
                new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
                new int[] { checkedTrack, uncheckedTrack }));
    }

    private void buildUi() {
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setBackgroundColor(BG);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        final int contentLeft = dp(20);
        final int contentTop = dp(14);
        final int contentRight = dp(20);
        final int contentBottom = dp(34);
        root.setPadding(contentLeft, contentTop, contentRight, contentBottom);
        root.setBackgroundColor(BG);
        // Android 15+ enforces edge-to-edge for apps targeting API 35+. Apply the
        // system-bar insets to the content container so the header never sits
        // underneath the status bar and the final card clears gesture navigation.
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int statusTop;
            int navigationBottom;
            if (Build.VERSION.SDK_INT >= 30) {
                Insets status = insets.getInsets(WindowInsets.Type.statusBars() | WindowInsets.Type.displayCutout());
                Insets navigation = insets.getInsets(WindowInsets.Type.navigationBars());
                statusTop = status.top;
                navigationBottom = navigation.bottom;
            } else {
                statusTop = insets.getSystemWindowInsetTop();
                navigationBottom = insets.getSystemWindowInsetBottom();
            }
            view.setPadding(contentLeft, contentTop + statusTop, contentRight, contentBottom + navigationBottom);
            return insets;
        });
        scroll.addView(root, new ScrollView.LayoutParams(-1, -2));

        // Top navigation / location label.
        LinearLayout top = row(this);
        top.setGravity(Gravity.CENTER_VERTICAL);
        TextView back = new TextView(this);
        back.setText("‹");
        back.setTextColor(TEXT);
        back.setTextSize(34);
        back.setGravity(Gravity.CENTER);
        back.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        back.setBackground(ripple(roundRect(SURFACE_ALT, 50), 0x33FFFFFF));
        back.setContentDescription("Back to Settings");
        back.setOnClickListener(v -> finish());
        LinearLayout.LayoutParams backParams = new LinearLayout.LayoutParams(dp(42), dp(42));
        top.addView(back, backParams);

        TextView breadcrumb = label("SETTINGS  /  DOWNLOADS", 11, MUTED, Typeface.BOLD);
        breadcrumb.setLetterSpacing(0.10f);
        LinearLayout.LayoutParams crumbParams = new LinearLayout.LayoutParams(0, -2, 1f);
        crumbParams.leftMargin = dp(13);
        top.addView(breadcrumb, crumbParams);
        TextView badge = label("OFFLINE", 10, ACCENT, Typeface.BOLD);
        badge.setLetterSpacing(0.12f);
        top.addView(badge);
        root.addView(top);

        addSpace(root, 25);
        TextView title = label("Export & storage", immersiveLook ? 32 : 30, TEXT,
                Typeface.create(immersiveLook ? "sans-serif" : "sans-serif-black", Typeface.BOLD));
        title.setLineSpacing(0, 1f);
        root.addView(title);
        addSpace(root, 5);
        root.addView(label("Take your offline music with you.", 14, MUTED, Typeface.NORMAL));
        addSpace(root, 22);

        // Offline library overview.
        LinearLayout overview = card();
        LinearLayout overviewHeader = row(this);
        overviewHeader.setGravity(Gravity.CENTER_VERTICAL);
        TextView musicIcon = iconBadge("♫", immersiveLook ? SURFACE_ALT : ACCENT, immersiveLook ? ACCENT : Color.BLACK, 46);
        overviewHeader.addView(musicIcon, new LinearLayout.LayoutParams(dp(46), dp(46)));

        LinearLayout overviewTitles = column();
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(0, -2, 1f);
        titleParams.leftMargin = dp(12);
        overviewTitles.addView(label("Your offline library", 17, TEXT, Typeface.BOLD));
        addSpace(overviewTitles, 3);
        overviewTitles.addView(label("Saved on this device", 12, MUTED, Typeface.NORMAL));
        overviewHeader.addView(overviewTitles, titleParams);
        TextView localPill = label("LOCAL", 10, ACCENT, Typeface.BOLD);
        localPill.setLetterSpacing(0.08f);
        overviewHeader.addView(localPill);
        overview.addView(overviewHeader);

        addSpace(overview, 18);
        addDivider(overview);
        addSpace(overview, 16);

        LinearLayout metrics = row(this);
        LinearLayout countMetric = column();
        trackCount = label("—", 27, TEXT, immersiveLook ? Typeface.create("sans-serif", Typeface.BOLD) : Typeface.create("sans-serif-black", Typeface.NORMAL));
        countMetric.addView(trackCount);
        addSpace(countMetric, 2);
        countMetric.addView(label("DOWNLOADED TRACKS", 10, MUTED, Typeface.BOLD));
        metrics.addView(countMetric, new LinearLayout.LayoutParams(0, -2, 1f));

        View metricDivider = new View(this);
        metricDivider.setBackgroundColor(DIVIDER);
        LinearLayout.LayoutParams metricDividerParams = new LinearLayout.LayoutParams(dp(1), dp(42));
        metricDividerParams.leftMargin = dp(10);
        metricDividerParams.rightMargin = dp(16);
        metrics.addView(metricDivider, metricDividerParams);

        LinearLayout sizeMetric = column();
        storageSize = label("—", 27, TEXT, immersiveLook ? Typeface.create("sans-serif", Typeface.BOLD) : Typeface.create("sans-serif-black", Typeface.NORMAL));
        sizeMetric.addView(storageSize);
        addSpace(sizeMetric, 2);
        sizeMetric.addView(label("SPACE USED", 10, MUTED, Typeface.BOLD));
        metrics.addView(sizeMetric, new LinearLayout.LayoutParams(0, -2, 1f));
        overview.addView(metrics);

        addSpace(overview, 17);
        addDivider(overview);
        addSpace(overview, 13);
        overview.addView(label("DOWNLOAD LOCATION", 10, MUTED, Typeface.BOLD));
        addSpace(overview, 5);
        locationName = label("Loading location…", 14, TEXT, Typeface.BOLD);
        overview.addView(locationName);
        addSpace(overview, 4);
        locationPath = label("", 11, SUBTLE, Typeface.NORMAL);
        locationPath.setMaxLines(2);
        overview.addView(locationPath);
        root.addView(overview, cardParams());

        // Export card.
        LinearLayout exportCard = card();
        LinearLayout exportHeading = row(this);
        exportHeading.setGravity(Gravity.CENTER_VERTICAL);
        exportHeading.addView(iconBadge("↗", immersiveLook ? SURFACE_ALT : ACCENT, immersiveLook ? ACCENT : Color.BLACK, 42), new LinearLayout.LayoutParams(dp(42), dp(42)));
        LinearLayout exportTitleBlock = column();
        LinearLayout.LayoutParams exportTitleParams = new LinearLayout.LayoutParams(0, -2, 1f);
        exportTitleParams.leftMargin = dp(12);
        exportTitleBlock.addView(label("Export your music", 18, TEXT, Typeface.BOLD));
        addSpace(exportTitleBlock, 3);
        exportTitleBlock.addView(label("Create files you can play anywhere.", 12, MUTED, Typeface.NORMAL));
        exportHeading.addView(exportTitleBlock, exportTitleParams);
        exportCard.addView(exportHeading);

        addSpace(exportCard, 16);
        exportCard.addView(label("Choose a folder and export your downloaded songs as regular audio files.", 13, MUTED, Typeface.NORMAL));
        addSpace(exportCard, 14);

        LinearLayout formats = row(this);
        formats.setGravity(Gravity.CENTER_VERTICAL);
        formats.addView(chip("MP3"));
        addSpaceHorizontal(formats, 7);
        formats.addView(chip("FLAC"));
        addSpaceHorizontal(formats, 7);
        formats.addView(chip("M4A"));
        addSpaceHorizontal(formats, 7);
        formats.addView(chip("COVER ART + TAGS"));
        exportCard.addView(formats);

        addSpace(exportCard, 18);
        LinearLayout exportButton = actionButton("Choose / reconnect export folder", true, "→");
        exportButton.setOnClickListener(v -> chooseExportFolder());
        exportCard.addView(exportButton, new LinearLayout.LayoutParams(-1, dp(immersiveLook ? 50 : 50)));
        addSpace(exportCard, 10);
        TextView metadataNote = label("Title, artist, album and artwork are embedded where supported. Lyrics are saved separately in Lyrics/LRC and Lyrics/JSON. Audio is not re-encoded.", 11, SUBTLE, Typeface.NORMAL);
        metadataNote.setGravity(Gravity.CENTER);
        exportCard.addView(metadataNote);

        addSpace(exportCard, 15);
        addDivider(exportCard);
        addSpace(exportCard, 12);
        LinearLayout autoSyncRow = row(this);
        autoSyncRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout autoSyncText = column();
        autoSyncText.addView(label("Auto-sync songs, playlists & albums", 14, TEXT, Typeface.BOLD));
        addSpace(autoSyncText, 3);
        autoSyncText.addView(label("Automatically sync each completed song download and playlist/album change.", 11, MUTED, Typeface.NORMAL));
        autoSyncRow.addView(autoSyncText, new LinearLayout.LayoutParams(0, -2, 1f));
        autoSyncSwitch = new Switch(this);
        autoSyncSwitch.setShowText(false);
        applySwitchColors(autoSyncSwitch);
        boolean autoSyncEnabled = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                .getBoolean(ExportIndex.PREF_AUTO_SYNC, false);
        autoSyncSwitch.setChecked(autoSyncEnabled);
        autoSyncSwitch.setOnCheckedChangeListener((button, checked) -> {
            getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE).edit()
                    .putBoolean(ExportIndex.PREF_AUTO_SYNC, checked).apply();
            if (exportSyncStatus != null) exportSyncStatus.setText(checked
                    ? "Auto-sync is on. Completed downloads and playlist/album changes will be exported in the background."
                    : "Auto-sync is off. Use Sync now to update songs, playlists and albums.");
            if (checked) autoSyncSavedFolder();
        });
        autoSyncRow.addView(autoSyncSwitch);
        exportCard.addView(autoSyncRow);

        addSpace(exportCard, 12);
        LinearLayout deleteSyncRow = row(this);
        deleteSyncRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout deleteSyncText = column();
        deleteSyncText.addView(label("Delete exported songs when removed from MySpoti", 14, TEXT, Typeface.BOLD));
        addSpace(deleteSyncText, 3);
        deleteSyncText.addView(label("Off by default. When enabled, the next sync deletes exported songs and lyrics that are no longer in MySpoti Downloads.", 11, MUTED, Typeface.NORMAL));
        deleteSyncRow.addView(deleteSyncText, new LinearLayout.LayoutParams(0, -2, 1f));
        deleteSyncSwitch = new Switch(this);
        deleteSyncSwitch.setShowText(false);
        applySwitchColors(deleteSyncSwitch);
        boolean deleteSyncEnabled = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                .getBoolean(ExportIndex.PREF_DELETE_REMOVED, false);
        deleteSyncSwitch.setChecked(deleteSyncEnabled);
        deleteSyncSwitch.setOnCheckedChangeListener((button, checked) ->
                getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE).edit()
                        .putBoolean(ExportIndex.PREF_DELETE_REMOVED, checked).apply());
        deleteSyncRow.addView(deleteSyncSwitch);
        exportCard.addView(deleteSyncRow);
        addSpace(exportCard, 10);
        exportSyncStatus = label("Auto-sync is off by default. Choose an export folder, then enable it to sync each completed download and playlist/album change.", 11, MUTED, Typeface.NORMAL);
        exportSyncStatus.setLineSpacing(dp(3), 1f);
        exportCard.addView(exportSyncStatus);
        backgroundStopButton = actionButton("Stop active sync", true, "■");
        backgroundStopButton.setOnClickListener(v -> {
            if (ExportSyncCoordinator.requestStop()) {
                renderSyncCoordinatorStatus();
                Toast.makeText(this, "Sync will stop after the current song finishes.", Toast.LENGTH_SHORT).show();
            }
        });
        backgroundStopButton.setVisibility(View.GONE);
        addSpace(exportCard, 8);
        exportCard.addView(backgroundStopButton, new LinearLayout.LayoutParams(-1, dp(42)));
        addSpace(exportCard, 5);
        exportArchiveStatus = label("The export index will be stored inside your chosen folder.", 11, SUBTLE, Typeface.NORMAL);
        exportArchiveStatus.setLineSpacing(dp(3), 1f);
        exportCard.addView(exportArchiveStatus);
        addSpace(exportCard, 12);
        LinearLayout syncNowButton = actionButton("Sync now", false, "↻");
        syncNowButton.setOnClickListener(v -> syncSavedFolderManually());
        exportCard.addView(syncNowButton, new LinearLayout.LayoutParams(-1, dp(46)));
        root.addView(exportCard, cardParams());

        // Collection exports: one audio file per track, with playlist/album manifests
        // pointing to those shared files. This keeps repeated tracks from duplicating storage.
        LinearLayout collectionsCard = card();
        LinearLayout collectionsHeading = row(this);
        collectionsHeading.setGravity(Gravity.CENTER_VERTICAL);
        collectionsHeading.addView(iconBadge("≡", immersiveLook ? SURFACE_ALT : ACCENT, immersiveLook ? ACCENT : Color.BLACK, 42), new LinearLayout.LayoutParams(dp(42), dp(42)));
        LinearLayout collectionsTitleBlock = column();
        LinearLayout.LayoutParams collectionsTitleParams = new LinearLayout.LayoutParams(0, -2, 1f);
        collectionsTitleParams.leftMargin = dp(12);
        collectionsTitleBlock.addView(label("Playlists & albums", 18, TEXT, Typeface.BOLD));
        addSpace(collectionsTitleBlock, 3);
        collectionsTitleBlock.addView(label("Keep your downloaded collections organised.", 12, MUTED, Typeface.NORMAL));
        collectionsHeading.addView(collectionsTitleBlock, collectionsTitleParams);
        collectionsCard.addView(collectionsHeading);
        addSpace(collectionsCard, 13);
        collectionsCard.addView(label("Creates Playlists and Albums folders with M3U8 lists. Each song is stored once in Tracks/ and reused across every collection.", 12, MUTED, Typeface.NORMAL));
        addSpace(collectionsCard, 14);
        LinearLayout collectionButton = actionButton("Sync playlists & albums", false, "↻");
        collectionButton.setOnClickListener(v -> syncSavedFolderManually());
        collectionsCard.addView(collectionButton, new LinearLayout.LayoutParams(-1, dp(46)));
        addSpace(collectionsCard, 9);
        collectionSyncStatus = label("Downloaded playlists and albums will be organised whenever you sync the export folder.", 11, SUBTLE, Typeface.NORMAL);
        collectionSyncStatus.setLineSpacing(dp(3), 1f);
        collectionsCard.addView(collectionSyncStatus);
        root.addView(collectionsCard, cardParams());

        // Restore the portable export archive into MySpoti's own private offline store.
        // This is deliberately explicit: it copies and re-encrypts audio, and can use
        // substantial internal storage after an uninstall/reinstall.
        LinearLayout restoreCard = card();
        LinearLayout restoreHeading = row(this);
        restoreHeading.setGravity(Gravity.CENTER_VERTICAL);
        restoreHeading.addView(iconBadge("↶", immersiveLook ? SURFACE_ALT : ACCENT, immersiveLook ? ACCENT : Color.BLACK, 42), new LinearLayout.LayoutParams(dp(42), dp(42)));
        LinearLayout restoreTitleBlock = column();
        LinearLayout.LayoutParams restoreTitleParams = new LinearLayout.LayoutParams(0, -2, 1f);
        restoreTitleParams.leftMargin = dp(12);
        restoreTitleBlock.addView(label("Restore to MySpoti", 18, TEXT, Typeface.BOLD));
        addSpace(restoreTitleBlock, 3);
        restoreTitleBlock.addView(label("Bring exported songs and offline lyrics back to MySpoti Downloads.", 12, MUTED, Typeface.NORMAL));
        restoreHeading.addView(restoreTitleBlock, restoreTitleParams);
        restoreCard.addView(restoreHeading);
        addSpace(restoreCard, 13);
        restoreCard.addView(label("After reinstalling MySpoti, reconnect the same export folder and restore its music and lyrics here. Audio is encrypted with this installation's key, and lyric files are restored into MySpoti's offline lyrics cache. Existing downloads are skipped; your export folder is never modified.", 12, MUTED, Typeface.NORMAL));
        addSpace(restoreCard, 13);
        LinearLayout restoreButton = actionButton("Restore exported songs to Downloads", true, "↶");
        restoreButton.setOnClickListener(v -> prepareRestoreFromSavedFolder());
        restoreCard.addView(restoreButton, new LinearLayout.LayoutParams(-1, dp(immersiveLook ? 50 : 48)));
        addSpace(restoreCard, 9);
        restoreStatus = label("Reconnect your export folder after reinstall, then restore your songs here.", 11, SUBTLE, Typeface.NORMAL);
        restoreStatus.setLineSpacing(dp(3), 1f);
        restoreCard.addView(restoreStatus);
        root.addView(restoreCard, cardParams());

        // Storage card.
        LinearLayout storageCard = card();
        LinearLayout storageHeading = row(this);
        storageHeading.setGravity(Gravity.CENTER_VERTICAL);
        storageHeading.addView(iconBadge("▣", SURFACE_ALT, ACCENT, 42), new LinearLayout.LayoutParams(dp(42), dp(42)));
        LinearLayout storageTitleBlock = column();
        LinearLayout.LayoutParams storageTitleParams = new LinearLayout.LayoutParams(0, -2, 1f);
        storageTitleParams.leftMargin = dp(12);
        storageTitleBlock.addView(label("Download location", 18, TEXT, Typeface.BOLD));
        addSpace(storageTitleBlock, 3);
        storageTitleBlock.addView(label("Choose where offline music is stored.", 12, MUTED, Typeface.NORMAL));
        storageHeading.addView(storageTitleBlock, storageTitleParams);
        storageCard.addView(storageHeading);

        addSpace(storageCard, 16);
        LinearLayout moveButton = actionButton("Change download location", false, "→");
        moveButton.setOnClickListener(v -> chooseStorageLocation());
        storageCard.addView(moveButton, new LinearLayout.LayoutParams(-1, dp(immersiveLook ? 50 : 48)));
        addSpace(storageCard, 9);
        TextView moveNote = label("Existing downloads are moved, not downloaded again. Keep downloads idle while moving.", 11, SUBTLE, Typeface.NORMAL);
        moveNote.setGravity(Gravity.CENTER);
        storageCard.addView(moveNote);
        root.addView(storageCard, cardParams());

        addSpace(root, 3);
        TextView footer = label("Your export files, lyrics sidecars and MySpoti Export Index.json stay outside app data. After reinstalling, reconnect that folder and use Restore to MySpoti to rebuild Downloads and the offline lyrics cache. Restored audio is encrypted with the new installation's key.", 11, SUBTLE, Typeface.NORMAL);
        footer.setGravity(Gravity.CENTER);
        footer.setPadding(dp(8), dp(4), dp(8), 0);
        root.addView(footer);

        setContentView(scroll);
        root.requestApplyInsets();
    }

    private LinearLayout card() {
        LinearLayout card = column();
        int inset = immersiveLook ? 16 : 17;
        card.setPadding(dp(inset), dp(inset), dp(inset), dp(inset));
        GradientDrawable background = roundRect(SURFACE, immersiveLook ? 14 : 17);
        if (!immersiveLook) background.setStroke(dp(1), 0xFF303030);
        card.setBackground(background);
        return card;
    }

    private LinearLayout column() {
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        return layout;
    }

    private LinearLayout row(Context context) {
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.HORIZONTAL);
        return layout;
    }

    private TextView label(String value, float size, int color, int style) {
        Typeface face = immersiveLook && immersiveTypeface != null
                ? Typeface.create(immersiveTypeface, style)
                : Typeface.create("sans-serif", style);
        return label(value, size, color, face);
    }

    private TextView label(String value, float size, int color, Typeface typeface) {
        TextView text = new TextView(this);
        text.setText(value);
        text.setTextColor(color);
        text.setTextSize(size);
        Typeface face = immersiveLook && immersiveTypeface != null
                ? Typeface.create(immersiveTypeface, typeface == null ? Typeface.NORMAL : typeface.getStyle())
                : typeface;
        text.setTypeface(face);
        text.setIncludeFontPadding(false);
        return text;
    }

    private TextView iconBadge(String glyph, int background, int foreground, int sizeDp) {
        TextView icon = label(glyph, 23, foreground, Typeface.BOLD);
        icon.setGravity(Gravity.CENTER);
        icon.setBackground(roundRect(background, immersiveLook ? 14 : 50));
        return icon;
    }

    private TextView chip(String value) {
        TextView chip = label(value, 9, value.equals("COVER ART + TAGS") ? ACCENT : TEXT, Typeface.BOLD);
        chip.setLetterSpacing(0.04f);
        chip.setGravity(Gravity.CENTER);
        chip.setPadding(dp(9), dp(7), dp(9), dp(7));
        int chipFill = value.equals("COVER ART + TAGS")
                ? (immersiveLook ? MySpotiImmersiveStyle.tintedSurface(this, 44) : 0xFF173522)
                : SURFACE_ALT;
        chip.setBackground(roundRect(chipFill, 30));
        return chip;
    }

    private LinearLayout actionButton(String title, boolean primary, String trailing) {
        LinearLayout button = new LinearLayout(this);
        button.setOrientation(LinearLayout.HORIZONTAL);
        button.setGravity(Gravity.CENTER);
        button.setPadding(dp(16), 0, dp(16), 0);
        button.setBackground(ripple(roundRect(primary ? ACCENT : SURFACE_ALT, immersiveLook ? 14 : 40), primary ? 0x22FFFFFF : 0x33FFFFFF));
        button.setClickable(true);
        button.setFocusable(true);
        button.setContentDescription(title);
        int primaryContent = immersiveLook ? Color.WHITE : Color.BLACK;
        TextView caption = label(title, 14, primary ? primaryContent : TEXT, Typeface.BOLD);
        button.addView(caption);
        if (trailing != null && !trailing.isEmpty()) {
            TextView arrow = label(trailing, 19, primary ? primaryContent : ACCENT, Typeface.BOLD);
            LinearLayout.LayoutParams arrowParams = new LinearLayout.LayoutParams(-2, -2);
            arrowParams.leftMargin = dp(10);
            button.addView(arrow, arrowParams);
        }
        return button;
    }

    private void addDivider(LinearLayout parent) {
        View divider = new View(this);
        divider.setBackgroundColor(DIVIDER);
        parent.addView(divider, new LinearLayout.LayoutParams(-1, dp(1)));
    }

    private void addSpace(LinearLayout parent, int heightDp) {
        View space = new View(this);
        parent.addView(space, new LinearLayout.LayoutParams(1, dp(heightDp)));
    }

    private void addSpaceHorizontal(LinearLayout parent, int widthDp) {
        View space = new View(this);
        parent.addView(space, new LinearLayout.LayoutParams(dp(widthDp), 1));
    }

    private LinearLayout.LayoutParams cardParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.bottomMargin = dp(14);
        return params;
    }

    private GradientDrawable roundRect(int color, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    private RippleDrawable ripple(GradientDrawable content, int rippleColor) {
        return new RippleDrawable(ColorStateList.valueOf(rippleColor), content, null);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private void refreshSummary() {
        try {
            List<?> tracks = downloadedTracks();
            long bytes = 0;
            for (Object track : tracks) {
                File file = audioFile(track);
                if (file.isFile()) bytes += file.length();
            }
            if (trackCount != null) trackCount.setText(String.valueOf(tracks.size()));
            if (storageSize != null) storageSize.setText(android.text.format.Formatter.formatShortFileSize(this, bytes));
            if (locationName != null) locationName.setText(DownloadPatch.storageLabel(this));
            if (locationPath != null) locationPath.setText(DownloadPatch.storageRoot(this).getAbsolutePath());
        } catch (Throwable t) {
            if (trackCount != null) trackCount.setText("—");
            if (storageSize != null) storageSize.setText("Unavailable");
            if (locationName != null) locationName.setText("Could not read download library");
            if (locationPath != null) locationPath.setText(t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage());
        }
    }

    private void chooseExportFolder() {
        if (exportSyncStatus != null) exportSyncStatus.setText("Select your Music or Documents folder. The export index and exported songs will stay together in that folder.");
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        try {
            startActivityForResult(intent, REQUEST_EXPORT_FOLDER);
        } catch (Throwable t) {
            Toast.makeText(this, "Android folder picker is unavailable.", Toast.LENGTH_LONG).show();
        }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_EXPORT_FOLDER || resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri tree = data.getData();
        try {
            int requestedFlags = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION;
            int flags = data.getFlags() & requestedFlags;
            if ((flags & requestedFlags) != requestedFlags) {
                throw new SecurityException("Android did not grant both read and write access to the selected folder.");
            }
            getContentResolver().takePersistableUriPermission(tree, flags);
        } catch (Throwable permissionError) {
            Log.w("MyspotiStoragePatch", "Could not persist access to the selected export folder", permissionError);
            Toast.makeText(this, "Android could not keep access to that folder. Please select it again and allow access.", Toast.LENGTH_LONG).show();
            return;
        }
        // The URI permission is app-scoped, but the JSON ledger beside the exported music is
        // portable. After reinstall, the user reconnects this same folder to restore the ledger.
        getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE).edit()
                .putString(ExportIndex.PREF_EXPORT_TREE_URI, tree.toString())
                .putInt("export_tree_flags", data.getFlags()).apply();
        if (restoreStatus != null) restoreStatus.setText("Export folder connected. Checking whether songs need to be restored into MySpoti's Downloads list…");
        syncExports(tree, false);
        // Queue behind the normal export sync so the portable index is flushed before we
        // offer the restore. The user still confirms before anything is copied into app storage.
        offerRestoreAfterFolderReconnect(tree);
    }

    private void showSavedExportStatus() {
        if (ExportSyncCoordinator.isRunning()) {
            renderSyncCoordinatorStatus();
            return;
        }
        android.content.SharedPreferences preferences = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE);
        boolean enabled = preferences.getBoolean(ExportIndex.PREF_AUTO_SYNC, false);
        String value = preferences.getString(ExportIndex.PREF_EXPORT_TREE_URI, null);
        if (value == null || value.trim().isEmpty()) {
            if (exportSyncStatus != null) exportSyncStatus.setText(enabled
                    ? "Auto-sync is on. Choose an export folder to automatically export future downloads and collection changes."
                    : "Choose an export folder, then use Sync now to export songs, playlists and albums.");
            if (exportArchiveStatus != null) exportArchiveStatus.setText(
                    "The export index will be stored inside your chosen folder.");
            return;
        }
        if (exportSyncStatus != null) exportSyncStatus.setText(enabled
                ? "Auto-sync is on. New downloads and playlist/album changes will be exported automatically. Use Sync now to check existing exports."
                : "Auto-sync is off. Use Sync now to update songs, playlists and albums.");
        // Reading the archive summary does not start a sync or modify exported files.
        loadSavedArchiveSummary();
    }

    private void autoSyncSavedFolder() {
        // Reopening this screen must attach to an existing sync, not start another
        // export pass that waits behind the first pass's SAF lock.
        if (ExportSyncCoordinator.isRunning()) {
            renderSyncCoordinatorStatus();
            return;
        }
        boolean enabled = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                .getBoolean(ExportIndex.PREF_AUTO_SYNC, false);
        if (!enabled) {
            if (exportSyncStatus != null) exportSyncStatus.setText("Auto-sync is off. Use Sync now to update songs, playlists and albums.");
            loadSavedArchiveSummary();
            return;
        }
        String value = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                .getString(ExportIndex.PREF_EXPORT_TREE_URI, null);
        if (value == null || value.trim().isEmpty()) {
            if (exportSyncStatus != null) exportSyncStatus.setText("Choose an export folder once. New downloads and playlist/album changes will then sync automatically.");
            if (exportArchiveStatus != null) exportArchiveStatus.setText("After reinstalling, choose the same folder again; its export index remains beside your music.");
            return;
        }
        try {
            if (exportSyncStatus != null) exportSyncStatus.setText("Checking your export folder for new downloads…");
            syncExports(Uri.parse(value), true);
        } catch (Throwable t) {
            if (exportSyncStatus != null) exportSyncStatus.setText("Export folder needs to be reconnected. Choose the same folder to recover its saved index.");
            Log.w("MyspotiStoragePatch", "Saved export folder could not be reopened", t);
        }
    }

    private void loadSavedArchiveSummary() {
        String value = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                .getString(ExportIndex.PREF_EXPORT_TREE_URI, null);
        if (value == null || value.trim().isEmpty()) return;
        final Uri tree;
        try { tree = Uri.parse(value); } catch (Throwable ignored) { return; }
        worker.execute(() -> {
            try {
                ExportIndex index = ExportIndex.open(this, tree);
                String summary = index.summary();
                int count = index.count();
                runOnUiThread(() -> {
                    if (exportArchiveStatus != null) exportArchiveStatus.setText(summary);
                    if (restoreStatus != null) restoreStatus.setText(count > 0
                            ? count + " exported song(s) are available to restore into MySpoti's Downloads tab."
                            : "No exported songs were found in this folder yet.");
                });
            } catch (Throwable t) {
                Log.w("MyspotiStoragePatch", "Could not read portable export index", t);
            }
        });
    }

    private void syncSavedFolderManually() {
        String value = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                .getString(ExportIndex.PREF_EXPORT_TREE_URI, null);
        if (value == null || value.trim().isEmpty()) {
            chooseExportFolder();
            return;
        }
        try {
            syncExports(Uri.parse(value), false);
        } catch (Throwable t) {
            Toast.makeText(this, "Reconnect your export folder to continue.", Toast.LENGTH_LONG).show();
            chooseExportFolder();
        }
    }

    private void prepareRestoreFromSavedFolder() {
        String value = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                .getString(ExportIndex.PREF_EXPORT_TREE_URI, null);
        if (value == null || value.trim().isEmpty()) {
            Toast.makeText(this, "Reconnect the folder containing MySpoti Export Index.json first.", Toast.LENGTH_LONG).show();
            chooseExportFolder();
            return;
        }
        final Uri tree;
        try { tree = Uri.parse(value); }
        catch (Throwable t) {
            Toast.makeText(this, "Reconnect your export folder to continue.", Toast.LENGTH_LONG).show();
            chooseExportFolder();
            return;
        }
        showProgress("Reading export archive", "Checking the songs available for restore…", false, 0);
        worker.execute(() -> {
            try {
                ExportIndex archive = ExportIndex.open(this, tree);
                int count = archive.count();
                long bytes = archive.totalExportBytes();
                runOnUiThread(() -> {
                    dismissProgress();
                    if (count <= 0) {
                        Toast.makeText(this, "No exported songs were found in this folder.", Toast.LENGTH_LONG).show();
                        if (restoreStatus != null) restoreStatus.setText("No exported songs are available to restore.");
                    } else {
                        showRestoreConfirmation(tree, count, bytes);
                    }
                });
            } catch (Throwable t) {
                runOnUiThread(() -> {
                    dismissProgress();
                    Toast.makeText(this, "Could not read the export archive: " + safeMessage(t), Toast.LENGTH_LONG).show();
                    if (restoreStatus != null) restoreStatus.setText("Reconnect the same export folder and try again.");
                });
            }
        });
    }

    /**
     * After the user reconnects the portable folder (notably after reinstall), detect tracks
     * that exist in the archive but not in MySpoti's private Downloads index and offer a restore.
     * The operation remains opt-in because it copies files and consumes app-private storage.
     */
    private void offerRestoreAfterFolderReconnect(Uri tree) {
        final java.util.Set<String> nativeIds = new java.util.HashSet<>();
        try {
            for (Object track : DownloadPatch.downloadedTracks(this)) {
                String id = DownloadPatch.trackId(track);
                if (id != null && !id.isEmpty()) nativeIds.add(id);
            }
        } catch (Throwable t) {
            Log.w("MyspotiStoragePatch", "Could not snapshot native Downloads before restore offer", t);
            return;
        }
        worker.execute(() -> {
            try {
                ExportIndex archive = ExportIndex.open(this, tree);
                int missing = 0;
                long bytes = 0L;
                for (JSONObject entry : archive.trackEntries()) {
                    String id = entry.optString("trackId", "");
                    if (!id.isEmpty() && !nativeIds.contains(id)) {
                        missing++;
                        bytes += Math.max(0L, entry.optLong("exportedBytes", 0L)) + 20L;
                    }
                }
                if (missing == 0) {
                    final int archivedCount = archive.count();
                    runOnUiThread(() -> {
                        if (isFinishing() || isDestroyed()) return;
                        if (restoreStatus != null) restoreStatus.setText(archivedCount == 0
                                ? "No exported songs were found in this folder yet."
                                : "All " + archivedCount + " archived song(s) are already present in MySpoti's native Downloads.");
                    });
                    return;
                }
                final int count = missing;
                final long estimatedBytes = bytes;
                runOnUiThread(() -> {
                    if (isFinishing() || isDestroyed()) return;
                    if (restoreStatus != null) {
                        restoreStatus.setText(count + " exported song(s) are missing from MySpoti's native Downloads. Restore them to this installation.");
                    }
                    showRestoreConfirmation(tree, count, estimatedBytes);
                });
            } catch (Throwable t) {
                Log.w("MyspotiStoragePatch", "Could not inspect the reconnected export archive for missing native downloads", t);
            }
        });
    }

    private void showRestoreConfirmation(Uri tree, int count, long bytes) {
        Dialog dialog = new Dialog(this);
        LinearLayout panel = dialogPanel();
        panel.addView(label("Restore exported music?", 20, TEXT, Typeface.BOLD));
        addSpace(panel, 8);
        String size = android.text.format.Formatter.formatFileSize(this, Math.max(0L, bytes));
        TextView message = label("This will restore up to " + count + " song(s) into MySpoti's native Downloads library. The audio will be copied and encrypted for this installation and will use approximately " + size + " of additional app storage. Songs already in Downloads are skipped. Your portable export folder is left untouched.", 13, MUTED, Typeface.NORMAL);
        message.setLineSpacing(dp(4), 1f);
        panel.addView(message);
        addSpace(panel, 17);
        LinearLayout buttons = row(this);
        buttons.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout cancel = actionButton("Cancel", false, "");
        cancel.setOnClickListener(v -> dialog.dismiss());
        buttons.addView(cancel, new LinearLayout.LayoutParams(0, dp(48), 1f));
        LinearLayout spacer = new LinearLayout(this);
        buttons.addView(spacer, new LinearLayout.LayoutParams(dp(10), 1));
        LinearLayout restore = actionButton("Restore songs", true, "↶");
        restore.setOnClickListener(v -> {
            dialog.dismiss();
            runNativeRestore(tree);
        });
        buttons.addView(restore, new LinearLayout.LayoutParams(0, dp(48), 1.2f));
        panel.addView(buttons);
        dialog.setContentView(panel);
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);
        dialog.show();
        styleMySpotiDialog(dialog, 460);
    }

    private void runNativeRestore(Uri tree) {
        showProgress("Restoring Downloads", "Copying and encrypting your exported music…", false, 0);
        worker.execute(() -> {
            DownloadPatch.RestoreResult result = null;
            Throwable error = null;
            try {
                ExportIndex archive = ExportIndex.open(this, tree);
                result = DownloadPatch.restoreArchive(this, archive);
            } catch (Throwable t) {
                error = t;
                Log.e("MyspotiStoragePatch", "Could not restore portable archive into MySpoti Downloads", t);
            }
            final DownloadPatch.RestoreResult completed = result;
            final Throwable failure = error;
            runOnUiThread(() -> {
                dismissProgress();
                if (failure != null) {
                    Toast.makeText(this, "Restore failed: " + safeMessage(failure), Toast.LENGTH_LONG).show();
                    if (restoreStatus != null) restoreStatus.setText("Restore did not finish. Your portable export files were left untouched.");
                } else {
                    String summary = "Restored " + completed.restored + ", skipped " + completed.skipped
                            + ", failed " + completed.failed + " song(s). "
                            + completed.collectionsRestored + " complete playlist/album download(s) restored. "
                            + completed.lyricsRestored + " offline lyric set(s) restored.";
                    if (completed.lyricsFailed > 0) summary += " Lyrics restore failed for " + completed.lyricsFailed + " track(s).";
                    if (completed.lastError != null && completed.failed > 0) summary += " Last error: " + completed.lastError;
                    Toast.makeText(this, summary, Toast.LENGTH_LONG).show();
                    if (restoreStatus != null) restoreStatus.setText(summary + " Open MySpoti's Downloads tab to see the restored songs.");
                    refreshSummary();
                }
            });
        });
    }

    private static String safeMessage(Throwable error) {
        String message = error == null ? null : error.getMessage();
        return message == null || message.trim().isEmpty() ? error.getClass().getSimpleName() : message;
    }

    /** Idempotent export/sync: track IDs are exported once, then collection M3U8 manifests are refreshed. */
    private void syncExports(Uri tree, boolean automatic) {
        String mode = automatic ? "Auto-sync" : "Manual sync";
        String initialStatus = automatic ? "Checking your export folder…" : "Preparing downloaded songs…";
        if (!ExportSyncCoordinator.tryStart(mode, !automatic, initialStatus)) {
            renderSyncCoordinatorStatus();
            if (!automatic) Toast.makeText(this, "A sync is already running. Its status is shown on this page.", Toast.LENGTH_SHORT).show();
            return;
        }
        renderSyncCoordinatorStatus();
        final List<?> tracks;
        final List<DownloadPatch.CollectionSnapshot> collections;
        try {
            tracks = downloadedTracks();
        } catch (Throwable t) {
            String error = safeMessage(t);
            ExportSyncCoordinator.finish("Could not start sync: " + error);
            renderSyncCoordinatorStatus();
            DownloadPatch.onExternalExportSyncFinished(getApplicationContext());
            Toast.makeText(this, "Could not read downloads: " + error, Toast.LENGTH_LONG).show();
            return;
        }
        String collectionReadError = null;
        List<DownloadPatch.CollectionSnapshot> collectionSnapshot;
        try {
            collectionSnapshot = DownloadPatch.downloadedCollections();
        } catch (Throwable t) {
            collectionSnapshot = new ArrayList<>();
            collectionReadError = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
            Log.w("MyspotiStoragePatch", "Could not read downloaded playlists/albums", t);
        }
        final String collectionError = collectionReadError;
        collections = collectionSnapshot;
        final java.util.Set<String> activeTrackIds = new java.util.LinkedHashSet<>();
        for (Object track : tracks) {
            String id = DownloadPatch.trackId(track);
            if (id != null && !id.trim().isEmpty()) activeTrackIds.add(id);
        }
        final java.util.Set<String> activeCollectionKeys = collectionError == null
                ? new java.util.LinkedHashSet<>() : null;
        if (activeCollectionKeys != null) for (DownloadPatch.CollectionSnapshot collection : collections) {
            if (collection != null && collection.uri != null && !collection.uri.isEmpty()) {
                activeCollectionKeys.add(collection.type + "|" + collection.uri);
            }
        }
        java.util.Set<String> singleSnapshot = null;
        try { singleSnapshot = DownloadPatch.downloadedSingles(); }
        catch (Throwable error) { Log.w("MyspotiStoragePatch", "Could not snapshot individual downloads", error); }
        final java.util.Set<String> activeSingleIds = singleSnapshot;

        ExportSyncCoordinator.update("Comparing downloaded songs with the export index…", 0, tracks.size());
        showProgress(automatic ? "Checking export folder" : "Syncing downloads",
                tracks.isEmpty() ? "Reading your saved export list…" : "Comparing downloaded songs with the export index…",
                true, Math.max(1, tracks.size()), !automatic);
        try {
        worker.execute(() -> {
            synchronized (DownloadPatch.exportSyncLock()) {
            int exported = 0;
            int skipped = 0;
            int failed = 0;
            int taggedCount = 0;
            int untaggedCount = 0;
            int lyricsSavedCount = 0;
            int lyricsMissingCount = 0;
            int lyricsLookupQueuedCount = 0;
            int lyricsFailureCount = 0;
            String lyricsLastError = null;
            String lastError = null;
            int archiveCount = 0;
            int savedCollectionCount = 0;
            int collectionManifests = 0;
            int collectionTracks = 0;
            int missingCollectionTracks = 0;
            int collectionFailures = 0;
            String archiveSummary = "";
            String collectionSummary = "";
            ExportIndex index = null;
            boolean cancelled = false;
            try {
                index = ExportIndex.open(this, tree);
                try {
                    if (activeSingleIds != null) index.mergeSingleTrackIds(activeSingleIds);
                } catch (Throwable singleError) { Log.w("MyspotiStoragePatch", "Could not snapshot individual download membership", singleError); }
                archiveCount = index.count();
                savedCollectionCount = index.collectionCount();
                archiveSummary = index.summary();
                int done = 0;
                for (Object track : tracks) {
                    if (!automatic && ExportSyncCoordinator.isStopRequested()) {
                        cancelled = true;
                        break;
                    }
                    Uri destination = null;
                    boolean created = false;
                    try {
                        File source = audioFile(track);
                        if (!source.isFile()) throw new java.io.FileNotFoundException("Downloaded audio is missing: " + source.getName());
                        String trackId = DownloadPatch.trackId(track);
                        if (trackId == null || trackId.isEmpty()) throw new IllegalStateException("Track ID is missing; cannot safely de-duplicate this song.");
                        String fingerprint = DownloadPatch.exportFingerprint(track, source);
                        String extension = extension(source.getName());
                        String title = DownloadPatch.trackTitle(track);
                        String artist = DownloadPatch.trackArtist(track);
                        String album = DownloadPatch.trackAlbum(track);
                        String displayName = exportDisplayName(artist, title, source);
                        String relativePathFromRoot = index.relativePathFromRoot(trackId);

                        boolean canEmbedLyrics = AudioMetadataWriter.supportsLyricsEmbedding(extension);
                        // The index flag can outlive user-deleted sidecar files. Verify the
                        // canonical LRC and JSON paths before deciding that lyrics are complete.
                        boolean lyricsSidecarsMissing = false;
                        if (index.hasLyricsAvailable(trackId)) {
                            try { lyricsSidecarsMissing = index.lyricsSidecarsNeedRepair(trackId); }
                            catch (Throwable inspectLyricsError) {
                                Log.w("MyspotiStoragePatch", "Could not inspect portable lyric sidecars for " + trackId, inspectLyricsError);
                            }
                        }
                        boolean needLyricsJson = !index.hasLyricsAvailable(trackId) || lyricsSidecarsMissing
                                || (canEmbedLyrics && !index.hasLyricsEmbedded(trackId));
                        JSONObject lyricsJson = needLyricsJson ? index.readLyricsJson(trackId) : null;
                        if (needLyricsJson && lyricsJson == null) lyricsJson = LyricsStore.readNativeCache(this, trackId);
                        // Recover the JSON archive from a surviving .lrc if the JSON copy and
                        // MySpoti's private cache are both unavailable.
                        if (needLyricsJson && lyricsJson == null) {
                            String savedLrc = index.readLyricsLrc(trackId);
                            lyricsJson = LyricsStore.fromLrc(trackId, savedLrc, "Portable LRC backup");
                        }
                        // A manual sync must not wait up to 30 seconds for every missing lyric set.
                        // Kick MySpoti's own prefetch in the background; its durable cache observer
                        // will trigger an incremental export pass when lyrics arrive (when auto-sync
                        // is enabled). With auto-sync off, the next manual sync picks up the cache.
                        if (needLyricsJson && lyricsJson == null && LyricsStore.requestPrefetch(this, trackId,
                                title, artist, album, DownloadPatch.trackDurationMs(track),
                                DownloadPatch.trackCoverUrl(track), true)) {
                            lyricsLookupQueuedCount++;
                        }
                        boolean hasLyrics = LyricsStore.validLyricsJson(lyricsJson);
                        if (hasLyrics && LyricsStore.readNativeCache(this, trackId) == null) {
                            try { LyricsStore.restoreNativeCache(this, trackId, lyricsJson); }
                            catch (Throwable cacheError) {
                                Log.w("MyspotiStoragePatch", "Could not restore native lyrics cache for " + trackId, cacheError);
                            }
                        }
                        String lyricsText = hasLyrics ? LyricsStore.toPlainText(lyricsJson) : "";
                        String lyricsLrc = hasLyrics ? LyricsStore.toLrc(lyricsJson, title, artist, album) : "";

                        destination = index.existingDocument(trackId);
                        boolean sameFingerprint = destination != null && index.sameFingerprint(trackId, fingerprint);
                        boolean legacyImported = false;
                        if (destination == null) {
                            Uri legacy = index.uniqueLegacyMatch(displayName);
                            if (legacy != null) {
                                destination = legacy;
                                relativePathFromRoot = displayName;
                                legacyImported = true;
                                index.record(trackId, fingerprint, legacy, displayName, title, artist, album,
                                        DownloadPatch.trackDurationMs(track), extension, source.length(), true, displayName,
                                        DownloadPatch.trackAlbumId(track), DownloadPatch.trackCoverUrl(track),
                                        DownloadPatch.trackSource(track), DownloadPatch.trackVerified(track),
                                        DownloadPatch.trackKind(track), DownloadPatch.trackProviderId(track),
                                        DownloadPatch.trackExtensionQuality(track));
                            } else {
                                displayName = addTrackIdSuffix(displayName, trackId);
                                destination = index.createDocumentInPath(mime(extension), displayName, "Tracks");
                                created = true;
                                relativePathFromRoot = "Tracks/" + displayName;
                            }
                        } else if (relativePathFromRoot.isEmpty()) {
                            relativePathFromRoot = displayName;
                        }

                        boolean needAudioWrite = created || (!sameFingerprint && !legacyImported)
                                || (hasLyrics && canEmbedLyrics && !index.hasLyricsEmbedded(trackId));
                        boolean embeddedLyrics = index.hasLyricsEmbedded(trackId);
                        if (needAudioWrite) {
                            try (OutputStream output = getContentResolver().openOutputStream(destination, "w")) {
                                if (output == null) throw new IllegalStateException("Could not open " + displayName);
                                boolean tagged = DownloadPatch.exportTagged(this, source, track, output, lyricsText);
                                if (tagged) taggedCount++;
                                else untaggedCount++;
                                embeddedLyrics = tagged && hasLyrics;
                            }
                            long exportedBytes = queryDocumentSize(destination);
                            if (exportedBytes <= 0) exportedBytes = source.length();
                            index.record(trackId, fingerprint, destination, displayName, title, artist, album,
                                    DownloadPatch.trackDurationMs(track), extension, exportedBytes, legacyImported, relativePathFromRoot,
                                    DownloadPatch.trackAlbumId(track), DownloadPatch.trackCoverUrl(track),
                                    DownloadPatch.trackSource(track), DownloadPatch.trackVerified(track),
                                    DownloadPatch.trackKind(track), DownloadPatch.trackProviderId(track),
                                    DownloadPatch.trackExtensionQuality(track));
                            exported++;
                            archiveCount = index.count();
                        } else {
                            skipped++;
                        }

                        if (hasLyrics && !lyricsLrc.isEmpty()) {
                            try {
                                index.writeLyrics(trackId, lyricsJson, lyricsLrc,
                                        embeddedLyrics || index.hasLyricsEmbedded(trackId));
                                lyricsSavedCount++;
                            } catch (Throwable lyricError) {
                                lyricsFailureCount++;
                                if (lyricsLastError == null) lyricsLastError = lyricError.getMessage() == null
                                        ? lyricError.getClass().getSimpleName() : lyricError.getMessage();
                                Log.w("MyspotiStoragePatch", "Audio exported but lyric sidecars could not be saved for " + title, lyricError);
                            }
                        } else if (!index.hasLyricsAvailable(trackId) || lyricsSidecarsMissing) {
                            lyricsMissingCount++;
                        }
                    } catch (Throwable t) {
                        failed++;
                        if (created && index != null) index.deleteDocument(destination);
                        lastError = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
                    }
                    done++;
                    final int progressValue = done;
                    final int exportedValue = exported;
                    final int skippedValue = skipped;
                    final int failedValue = failed;
                    final int lyricsValue = lyricsSavedCount;
                    String progressText = "Exported " + exportedValue + " new · " + skippedValue + " present · "
                            + lyricsValue + " with lyrics · " + failedValue + " failed";
                    ExportSyncCoordinator.update(progressText, progressValue, tracks.size());
                    runOnUiThread(() -> updateProgress(progressValue, progressText));
                    if (!automatic && ExportSyncCoordinator.isStopRequested()) {
                        cancelled = true;
                        break;
                    }
                }

                if (!automatic && ExportSyncCoordinator.isStopRequested()) cancelled = true;
                if (!cancelled) {
                    boolean deleteRemoved = getSharedPreferences(ExportIndex.PREFS, MODE_PRIVATE)
                            .getBoolean(ExportIndex.PREF_DELETE_REMOVED, false);
                    boolean deletionSyncSafe = deleteRemoved && DownloadPatch.canMirrorDeletedDownloads(
                            this, activeTrackIds, activeCollectionKeys, activeSingleIds);
                    int deletedTracks = 0;
                    int deletedCollections = 0;
                    if (deletionSyncSafe) {
                        // Prune stale audio before regenerating manifests, so no M3U8 points at a
                        // file that this same sync is about to remove.
                        deletedTracks = index.removeTracksNotIn(activeTrackIds);
                        index.replaceSingleTrackIds(activeSingleIds);
                    } else if (deleteRemoved) {
                        Log.w("MyspotiStoragePatch", "Skipped deletion sync because MySpoti's source indexes were not fully loaded");
                    }

                    // Build collection manifests only after the shared track files have been synced
                    // and stale exports pruned. Each list reuses the same Tracks/ document IDs.
                    ExportSyncCoordinator.update("Updating playlist & album lists…", tracks.size(), tracks.size());
                    runOnUiThread(() -> updateProgress(Math.max(1, tracks.size()), "Updating playlist & album lists…"));
                    if (collectionError == null) {
                        CollectionSyncResult collectionResult = syncCollectionManifests(index, collections, !automatic);
                        collectionManifests = collectionResult.manifests;
                        collectionTracks = collectionResult.referencedTracks;
                        missingCollectionTracks = collectionResult.missingTracks;
                        collectionFailures = collectionResult.failures;
                        collectionSummary = collectionResult.summary;
                        if (!automatic && ExportSyncCoordinator.isStopRequested()) {
                            cancelled = true;
                            collectionSummary = "Collection updates stopped. Existing manifests were kept; run Sync now again to finish.";
                        } else if (deletionSyncSafe) {
                            deletedCollections = index.removeCollectionsNotIn(activeCollectionKeys);
                        }
                    } else {
                        collectionSummary = "Could not read MySpoti collection index: " + collectionError;
                        collectionFailures++;
                    }
                    if (deletionSyncSafe) Log.i("MyspotiStoragePatch", "Deletion sync removed " + deletedTracks
                            + " exported song(s) and " + deletedCollections + " obsolete collection manifest(s)");
                } else {
                    collectionSummary = "Collection updates and deletion sync were skipped because you stopped this sync.";
                }
                archiveCount = index.count();
                savedCollectionCount = index.collectionCount();
                archiveSummary = index.summary();
            } catch (Throwable t) {
                failed++;
                lastError = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
            }

            final int newCount = exported;
            final int skippedCount = skipped;
            final int failureCount = failed;
            final int tagCount = taggedCount;
            final int plainCount = untaggedCount;
            final int lyricsCount = lyricsSavedCount;
            final int noLyricsCount = lyricsMissingCount;
            final int lyricsQueuedCount = lyricsLookupQueuedCount;
            final int lyricsFailures = lyricsFailureCount;
            final String lyricError = lyricsLastError;
            final int savedCount = archiveCount;
            final int savedManifestCount = savedCollectionCount;
            final int manifestCount = collectionManifests;
            final int referencedCount = collectionTracks;
            final int missingCount = missingCollectionTracks;
            final int collectionFailureCount = collectionFailures;
            final String savedSummary = archiveSummary;
            final String manifestSummary = collectionSummary;
            final String error = lastError;
            final boolean wasCancelled = cancelled || (!automatic && ExportSyncCoordinator.isStopRequested());
            final boolean wasBackgrounded = ExportSyncCoordinator.snapshot().backgrounded;
            final int problemCount = failureCount + lyricsFailures + collectionFailureCount;
            runOnUiThread(() -> {
                dismissProgress();
                String message;
                if (wasCancelled) {
                    message = "Sync stopped. " + newCount + " song(s) were completed; unfinished songs will be picked up next time.";
                } else if (tracks.isEmpty()) {
                    message = "No MySpoti offline downloads are currently available. Your export archive still contains " + savedCount + " song(s).";
                } else {
                    message = "Sync complete: " + newCount + " new export(s), " + skippedCount
                            + " already present, " + failureCount + " failed.";
                    if (tagCount > 0) message += " Metadata and artwork embedded in " + tagCount + " file(s).";
                    if (plainCount > 0) message += " " + plainCount + " unsupported format(s) exported without embedded tags.";
                }
                if (lyricsCount > 0) message += " Lyrics saved for " + lyricsCount + " track(s): Lyrics/LRC/, Lyrics/JSON/, MySpoti offline cache and embedded tags where supported.";
                if (noLyricsCount > 0) message += " Lyrics were not available yet for " + noLyricsCount + " track(s); sync again later to retry.";
                if (lyricsFailures > 0) message += " Lyrics export failed for " + lyricsFailures + " track(s).";
                if (lyricsQueuedCount > 0) message += " Requested background lyrics lookup for " + lyricsQueuedCount
                        + " track(s); MySpoti will add them to the export on a later sync when they become available.";
                if (manifestCount > 0 || !collections.isEmpty()) {
                    message += " Updated " + manifestCount + " playlist/album list(s), referencing " + referencedCount + " exported track(s).";
                    if (missingCount > 0) message += " " + missingCount + " collection track(s) are not downloaded/exported yet.";
                }
                if (collectionFailureCount > 0) message += " " + collectionFailureCount + " collection manifest(s) could not be updated.";
                if (error != null && failureCount > 0) message += " Last track error: " + error;
                if (lyricError != null && lyricsFailures > 0) message += " Last lyrics error: " + lyricError;
                if (wasBackgrounded) message = "Background sync finished. " + message;
                Toast.makeText(this, message, Toast.LENGTH_LONG).show();
                if (exportSyncStatus != null) {
                    String status;
                    if (wasCancelled) status = "Sync stopped. Completed exports were kept; run Sync now again to finish the remaining songs.";
                    else if (problemCount == 0) status = lyricsQueuedCount > 0
                            ? "Audio sync complete. MySpoti is looking up lyrics for " + lyricsQueuedCount
                                    + " track(s) in the background; they will be exported when available."
                            : "Last sync complete. Auto-sync watches completed song downloads and playlist/album changes in the background when enabled.";
                    else {
                        String detail = error != null ? error : (lyricError != null ? lyricError : manifestSummary);
                        status = "Sync finished with " + problemCount + " problem(s).";
                        if (detail != null && !detail.trim().isEmpty()) status += " Latest detail: " + detail;
                        if (detail != null && (detail.toLowerCase(java.util.Locale.ROOT).contains("permission")
                                || detail.toLowerCase(java.util.Locale.ROOT).contains("securityexception"))) {
                            status += " Reconnect the export folder if Android has revoked its access.";
                        }
                    }
                    exportSyncStatus.setText(status);
                    ExportSyncCoordinator.finish(status);
                    renderSyncCoordinatorStatus();
                } else {
                    ExportSyncCoordinator.finish(wasCancelled ? "Sync stopped. Completed exports were kept." : "Sync finished.");
                }
                DownloadPatch.onExternalExportSyncFinished(getApplicationContext());
                if (exportArchiveStatus != null) exportArchiveStatus.setText(savedSummary.isEmpty()
                        ? savedCount + " song record(s) in the portable export index. The index and lyrics sidecars are stored in the selected folder, not in app data."
                        : savedSummary);
                if (restoreStatus != null) restoreStatus.setText(savedCount > 0
                        ? savedCount + " song(s) and their available lyrics are saved in your portable export archive. Music and lyrics can be restored into MySpoti after reinstall."
                        : "No exported songs were found in this folder yet.");
                if (collectionSyncStatus != null) {
                    if (collectionError != null) collectionSyncStatus.setText("Could not read MySpoti playlists/albums: " + collectionError);
                    else if (collections.isEmpty() && savedManifestCount > 0) collectionSyncStatus.setText(
                            "MySpoti has no downloaded collection records loaded right now, but your portable export folder still contains "
                                    + savedManifestCount + " playlist/album manifest(s). They remain in Playlists/ and Albums/. Re-download a collection in MySpoti to resume automatic updates.");
                    else if (collections.isEmpty()) collectionSyncStatus.setText("No downloaded playlists or albums are recorded yet. Download a playlist or album in MySpoti, then sync again.");
                    else collectionSyncStatus.setText(manifestSummary);
                }
                refreshSummary();
            });
            }
        });
        } catch (Throwable submitError) {
            ExportSyncCoordinator.finish("Could not start sync: " + safeMessage(submitError));
            renderSyncCoordinatorStatus();
            if (!automatic) Toast.makeText(this, "Could not start sync: " + safeMessage(submitError), Toast.LENGTH_LONG).show();
            DownloadPatch.onExternalExportSyncFinished(getApplicationContext());
        }
    }

    private CollectionSyncResult syncCollectionManifests(ExportIndex index,
            List<DownloadPatch.CollectionSnapshot> collections, boolean allowStop) {
        CollectionSyncResult result = new CollectionSyncResult();
        java.util.Map<String, Boolean> availableDocumentCache = new java.util.HashMap<>();
        for (DownloadPatch.CollectionSnapshot collection : collections) {
            if (allowStop && ExportSyncCoordinator.isStopRequested()) break;
            if (collection == null || collection.uri == null || collection.uri.isEmpty()) continue;
            try {
                boolean album = "album".equalsIgnoreCase(collection.type);
                String collectionName = ExportIndex.cleanCollectionName(cleanText(collection.name));
                if (collectionName.isEmpty()) collectionName = album ? "Unknown album" : "Untitled playlist";
                String token = stableToken(collection.uri);
                List<String> folderPath = new ArrayList<>();
                String fileName;
                int folderDepth;
                String albumArtist = "Unknown Artist";
                if (album) {
                    String firstArtist = null;
                    boolean mixedArtists = false;
                    for (String id : collection.trackIds) {
                        JSONObject item = index.entry(id);
                        if (item == null) continue;
                        String trackArtist = cleanText(item.optString("artist", ""));
                        if (trackArtist.isEmpty()) continue;
                        if (firstArtist == null) firstArtist = trackArtist;
                        else if (!firstArtist.equalsIgnoreCase(trackArtist)) {
                            mixedArtists = true;
                            break;
                        }
                    }
                    albumArtist = mixedArtists ? "Various Artists"
                            : (firstArtist == null ? "Unknown Artist" : firstArtist);
                    folderPath.add("Albums");
                    folderPath.add(safeSegment(albumArtist, "Unknown Artist"));
                    folderPath.add(safeSegment(collectionName, "Unknown album") + " [" + token + "]");
                    fileName = "Album.m3u8";
                } else {
                    folderPath.add("Playlists");
                    String playlistSegment = safeSegment(collectionName, "Untitled playlist");
                    // Keep the manifest's visible/display name clean. The stable ID belongs in
                    // its containing folder so same-named playlists never overwrite each other.
                    folderPath.add(playlistSegment + " [" + token + "]");
                    fileName = playlistSegment + ".m3u8";
                }
                folderDepth = folderPath.size();
                String prefix = repeat("../", folderDepth);
                StringBuilder m3u = new StringBuilder("#EXTM3U\n");
                m3u.append("#PLAYLIST:").append(cleanM3uField(collectionName)).append("\n");
                List<String> exportedIds = new ArrayList<>();
                int missing = 0;
                for (String trackId : collection.trackIds) {
                    JSONObject item = index.entry(trackId);
                    if (item == null) { missing++; continue; }
                    Boolean available = availableDocumentCache.get(trackId);
                    if (available == null) {
                        try { available = index.existingDocument(trackId) != null; }
                        catch (Throwable ignored) { available = false; }
                        availableDocumentCache.put(trackId, available);
                    }
                    if (!available) { missing++; continue; }
                    String relativePath = index.relativePathFromRoot(trackId);
                    if (relativePath.isEmpty()) { missing++; continue; }
                    String title = cleanM3uField(item.optString("title", "Untitled"));
                    String artist = cleanM3uField(item.optString("artist", ""));
                    long durationMs = item.optLong("durationMs", 0L);
                    long seconds = durationMs > 0 ? Math.max(1L, durationMs / 1000L) : -1L;
                    m3u.append("#EXTINF:").append(seconds).append(',');
                    if (!artist.isEmpty()) m3u.append(artist).append(" - ");
                    m3u.append(title).append("\n");
                    m3u.append(prefix).append(relativePath.replace('\\', '/')).append("\n");
                    exportedIds.add(trackId);
                }
                String collectionKey = collection.type + "|" + collection.uri;
                index.writeCollectionManifest(collectionKey, collection.uri, collection.type,
                        collectionName, fileName, m3u.toString(), collection.trackIds, exportedIds, missing,
                        folderPath.toArray(new String[0]));
                result.manifests++;
                result.referencedTracks += exportedIds.size();
                result.missingTracks += missing;
                if (album) result.albums++;
                else result.playlists++;
            } catch (Throwable t) {
                result.failures++;
                result.lastError = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
                Log.w("MyspotiStoragePatch", "Could not write collection manifest for " + collection.name, t);
            }
        }
        result.summary = result.manifests + " collection list(s) updated: " + result.playlists + " playlist(s), "
                + result.albums + " album(s). " + result.referencedTracks + " shared audio reference(s) written.";
        if (result.missingTracks > 0) result.summary += " " + result.missingTracks + " track(s) are not downloaded/exported yet and will be picked up on a later sync.";
        if (result.failures > 0) result.summary += " " + result.failures + " manifest(s) failed" + (result.lastError == null ? "." : ": " + result.lastError);
        return result;
    }

    private static String cleanText(String value) {
        return value == null ? "" : value.replace('\n', ' ').replace('\r', ' ').trim();
    }

    private static String cleanM3uField(String value) {
        return cleanText(value).replace(',', ' ').replaceAll("[\\p{Cntrl}]", " ");
    }

    private static String safeSegment(String value, String fallback) {
        String safe = sanitize(cleanText(value)).replaceAll("\\s+", " ").replaceAll("[. ]+$", "").trim();
        if (safe.isEmpty() || safe.equals(".") || safe.equals("..")) safe = fallback;
        return safe.length() > 100 ? safe.substring(0, 100).trim() : safe;
    }

    private static String stableToken(String value) {
        try {
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256")
                    .digest(value.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder token = new StringBuilder();
            for (int i = 0; i < 4; i++) token.append(String.format(java.util.Locale.ROOT, "%02x", digest[i] & 0xff));
            return token.toString();
        } catch (Throwable ignored) {
            return Integer.toHexString(value.hashCode());
        }
    }

    private static String repeat(String value, int count) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < count; i++) result.append(value);
        return result.toString();
    }

    private static final class CollectionSyncResult {
        int manifests;
        int playlists;
        int albums;
        int referencedTracks;
        int missingTracks;
        int failures;
        String lastError;
        String summary = "";
    }

    private String exportDisplayName(String artist, String title, File source) {
        String name = sanitize((artist == null || artist.isEmpty() ? "" : artist + " - ")
                + (title == null || title.isEmpty() ? source.getName() : title));
        if (name.isEmpty()) name = source.getName();
        String extension = extension(source.getName());
        if (!extension.isEmpty() && !name.toLowerCase(java.util.Locale.ROOT).endsWith("." + extension.toLowerCase(java.util.Locale.ROOT))) {
            name += "." + extension;
        }
        return name;
    }

    private static String addTrackIdSuffix(String filename, String trackId) {
        int dot = filename.lastIndexOf('.');
        // A short suffix can collide for two different Spotify IDs. Keep the complete
        // stable ID in the filename so each track has a distinct export and lyric sidecar.
        String suffix = trackId == null ? "unknown" : trackId.replaceAll("[^A-Za-z0-9._-]", "_");
        return dot > 0 ? filename.substring(0, dot) + " [" + suffix + "]" + filename.substring(dot)
                : filename + " [" + suffix + "]";
    }

    private long queryDocumentSize(Uri document) {
        try (android.database.Cursor cursor = getContentResolver().query(document,
                new String[] { DocumentsContract.Document.COLUMN_SIZE }, null, null, null)) {
            if (cursor != null && cursor.moveToFirst() && !cursor.isNull(0)) return cursor.getLong(0);
        } catch (Throwable ignored) {}
        return -1L;
    }

    private void chooseStorageLocation() {
        List<DownloadPatch.StorageOption> options = DownloadPatch.storageOptions(this);
        if (options == null || options.isEmpty()) {
            Toast.makeText(this, "No writable download locations are available.", Toast.LENGTH_LONG).show();
            return;
        }

        final String selectedId = DownloadPatch.selectedStorageId(this);
        Dialog dialog = new Dialog(this);
        LinearLayout panel = dialogPanel();

        TextView title = label("Change download folder", 20, TEXT, Typeface.BOLD);
        panel.addView(title);
        addSpace(panel, 7);
        TextView subtitle = label("Choose where MySpoti saves your offline music. Your existing downloads stay where they are until you confirm a move.", 13, MUTED, Typeface.NORMAL);
        subtitle.setLineSpacing(dp(3), 1f);
        panel.addView(subtitle);
        addSpace(panel, 18);

        ScrollView listScroll = new ScrollView(this);
        listScroll.setFillViewport(false);
        listScroll.setVerticalScrollBarEnabled(false);
        listScroll.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        LinearLayout list = column();
        for (int i = 0; i < options.size(); i++) {
            final DownloadPatch.StorageOption option = options.get(i);
            final boolean isCurrent = option.id.equals(selectedId);
            LinearLayout item = column();
            item.setPadding(dp(14), dp(13), dp(14), dp(13));
            int selectedFill = immersiveLook ? MySpotiImmersiveStyle.tintedSurface(this, 48) : Color.rgb(26, 51, 36);
            GradientDrawable itemBackground = roundRect(isCurrent ? selectedFill : SURFACE_ALT, immersiveLook ? 14 : 13);
            itemBackground.setStroke(dp(1), isCurrent ? ACCENT : DIVIDER);
            item.setBackground(ripple(itemBackground, 0x22FFFFFF));
            item.setClickable(true);
            item.setFocusable(true);

            LinearLayout titleRow = row(this);
            titleRow.setGravity(Gravity.CENTER_VERTICAL);
            TextView optionName = label(option.label, 14, TEXT, Typeface.BOLD);
            titleRow.addView(optionName, new LinearLayout.LayoutParams(0, -2, 1f));
            if (isCurrent) {
                TextView current = label("CURRENT", 9, ACCENT, Typeface.BOLD);
                current.setLetterSpacing(0.09f);
                current.setPadding(dp(8), dp(5), dp(8), dp(5));
                current.setBackground(roundRect(Color.rgb(18, 66, 38), 30));
                titleRow.addView(current);
            } else {
                TextView arrow = label("›", 22, MUTED, Typeface.NORMAL);
                titleRow.addView(arrow);
            }
            item.addView(titleRow);

            addSpace(item, 5);
            TextView path = label(new File(option.base, "offline").getAbsolutePath(), 11, MUTED, Typeface.NORMAL);
            path.setMaxLines(2);
            path.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
            item.addView(path);

            item.setOnClickListener(v -> {
                dialog.dismiss();
                if (isCurrent) {
                    Toast.makeText(this, "That is already the selected location.", Toast.LENGTH_SHORT).show();
                } else {
                    confirmMove(option);
                }
            });
            LinearLayout.LayoutParams itemParams = new LinearLayout.LayoutParams(-1, -2);
            itemParams.bottomMargin = dp(9);
            list.addView(item, itemParams);
        }
        listScroll.addView(list, new ScrollView.LayoutParams(-1, -2));
        int maxListHeight = Math.min(dp(330), (int) (getResources().getDisplayMetrics().heightPixels * 0.42f));
        panel.addView(listScroll, new LinearLayout.LayoutParams(-1, maxListHeight));
        addSpace(panel, 8);

        LinearLayout footer = row(this);
        footer.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        LinearLayout cancel = actionButton("Cancel", false, "");
        cancel.setOnClickListener(v -> dialog.dismiss());
        footer.addView(cancel, new LinearLayout.LayoutParams(-2, dp(44)));
        panel.addView(footer);

        dialog.setContentView(panel);
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);
        dialog.show();
        styleMySpotiDialog(dialog, 440);
    }

    private void confirmMove(DownloadPatch.StorageOption option) {
        Dialog dialog = new Dialog(this);
        LinearLayout panel = dialogPanel();

        TextView title = label("Move existing downloads?", 20, TEXT, Typeface.BOLD);
        panel.addView(title);
        addSpace(panel, 9);
        TextView message = label("MySpoti will move the complete offline library to this location. Your songs and download records will be kept. Make sure no downloads are currently in progress.", 13, MUTED, Typeface.NORMAL);
        message.setLineSpacing(dp(4), 1f);
        panel.addView(message);
        addSpace(panel, 16);

        LinearLayout destination = column();
        destination.setPadding(dp(13), dp(11), dp(13), dp(11));
        destination.setBackground(roundRect(SURFACE_ALT, 12));
        destination.addView(label("NEW DOWNLOAD LOCATION", 9, ACCENT, Typeface.BOLD));
        addSpace(destination, 5);
        destination.addView(label(option.label, 14, TEXT, Typeface.BOLD));
        addSpace(destination, 3);
        TextView path = label(new File(option.base, "offline").getAbsolutePath(), 11, MUTED, Typeface.NORMAL);
        path.setMaxLines(2);
        path.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
        destination.addView(path);
        panel.addView(destination);
        addSpace(panel, 18);

        LinearLayout buttons = row(this);
        buttons.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout cancel = actionButton("Cancel", false, "");
        cancel.setOnClickListener(v -> dialog.dismiss());
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(0, dp(48), 1f);
        buttons.addView(cancel, buttonParams);
        LinearLayout spacer = new LinearLayout(this);
        buttons.addView(spacer, new LinearLayout.LayoutParams(dp(10), 1));
        LinearLayout move = actionButton("Move downloads", true, "→");
        move.setOnClickListener(v -> {
            dialog.dismiss();
            moveStorage(option.id);
        });
        buttons.addView(move, new LinearLayout.LayoutParams(0, dp(48), 1.25f));
        panel.addView(buttons);

        dialog.setContentView(panel);
        dialog.setCancelable(true);
        dialog.setCanceledOnTouchOutside(true);
        dialog.show();
        styleMySpotiDialog(dialog, 440);
    }

    private LinearLayout dialogPanel() {
        LinearLayout panel = column();
        panel.setPadding(dp(20), dp(20), dp(20), dp(18));
        GradientDrawable background = roundRect(SURFACE, 18);
        background.setStroke(dp(1), DIVIDER);
        panel.setBackground(background);
        return panel;
    }

    private void styleMySpotiDialog(Dialog dialog, int maxWidthDp) {
        Window window = dialog.getWindow();
        if (window == null) return;
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        WindowManager.LayoutParams params = window.getAttributes();
        params.width = Math.min(getResources().getDisplayMetrics().widthPixels - dp(40), dp(maxWidthDp));
        params.height = WindowManager.LayoutParams.WRAP_CONTENT;
        params.gravity = Gravity.CENTER;
        params.dimAmount = 0.72f;
        window.setAttributes(params);
    }

    private void moveStorage(String id) {
        showProgress("Moving offline library", "Moving your downloaded music…", false, 0);
        worker.execute(() -> {
            String result = DownloadPatch.moveTo(this, id);
            runOnUiThread(() -> {
                dismissProgress();
                Toast.makeText(this, result, Toast.LENGTH_LONG).show();
                refreshSummary();
            });
        });
    }

    private void showProgress(String title, String message, boolean determinate, int max) {
        showProgress(title, message, determinate, max, false);
    }

    private void showProgress(String title, String message, boolean determinate, int max,
                              boolean allowSyncControls) {
        dismissProgress();
        Dialog dialog = new Dialog(this);
        LinearLayout panel = column();
        panel.setPadding(dp(22), dp(22), dp(22), dp(20));
        GradientDrawable panelBg = roundRect(SURFACE, 18);
        panelBg.setStroke(dp(1), DIVIDER);
        panel.setBackground(panelBg);

        TextView heading = label(title, 18, TEXT, Typeface.BOLD);
        panel.addView(heading);
        addSpace(panel, 8);
        progressMessage = label(message, 13, MUTED, Typeface.NORMAL);
        panel.addView(progressMessage);
        addSpace(panel, 17);
        progressBar = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        progressBar.setIndeterminate(!determinate);
        if (determinate) {
            progressBar.setMax(Math.max(1, max));
            progressBar.setProgress(0);
        }
        progressBar.setProgressTintList(ColorStateList.valueOf(ACCENT));
        progressBar.setProgressBackgroundTintList(ColorStateList.valueOf(DIVIDER));
        panel.addView(progressBar, new LinearLayout.LayoutParams(-1, dp(5)));
        if (allowSyncControls) {
            addSpace(panel, 16);
            LinearLayout actions = row(this);
            actions.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout backgroundButton = actionButton("Run in background", false, "↘");
            backgroundButton.setOnClickListener(v -> {
                ExportSyncCoordinator.markBackgrounded();
                dismissProgress();
                renderSyncCoordinatorStatus();
                Toast.makeText(this, "Sync continues in the background. Return to Export & Storage to check progress.", Toast.LENGTH_SHORT).show();
            });
            actions.addView(backgroundButton, new LinearLayout.LayoutParams(0, dp(44), 1f));
            View gap = new View(this);
            actions.addView(gap, new LinearLayout.LayoutParams(dp(8), 1));
            LinearLayout stopButton = actionButton("Stop sync", true, "■");
            stopButton.setOnClickListener(v -> {
                ExportSyncCoordinator.requestStop();
                updateProgressMessage("Stopping after the current song finishes…");
                stopButton.setEnabled(false);
                stopButton.setClickable(false);
                renderSyncCoordinatorStatus();
            });
            actions.addView(stopButton, new LinearLayout.LayoutParams(0, dp(44), 1f));
            panel.addView(actions);
        }
        dialog.setContentView(panel);
        dialog.setCancelable(false);
        dialog.setCanceledOnTouchOutside(false);
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawableResource(android.R.color.transparent);
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            WindowManager.LayoutParams params = window.getAttributes();
            params.width = Math.min(getResources().getDisplayMetrics().widthPixels - dp(48), dp(420));
            params.height = WindowManager.LayoutParams.WRAP_CONTENT;
            params.gravity = Gravity.CENTER;
            params.dimAmount = 0.65f;
            window.setAttributes(params);
        }
        progressDialog = dialog;
    }

    private void updateProgress(int value, String message) {
        if (progressDialog == null || !progressDialog.isShowing()) return;
        if (progressBar != null && !progressBar.isIndeterminate()) progressBar.setProgress(value);
        if (progressMessage != null) progressMessage.setText(message);
    }

    private void updateProgressMessage(String message) {
        if (progressDialog == null || !progressDialog.isShowing()) return;
        if (progressMessage != null) progressMessage.setText(message);
    }

    private void dismissProgress() {
        if (progressDialog != null) {
            try { if (progressDialog.isShowing()) progressDialog.dismiss(); } catch (Throwable ignored) {}
        }
        progressDialog = null;
        progressBar = null;
        progressMessage = null;
    }

    private List<?> downloadedTracks() throws Exception {
        return DownloadPatch.downloadedTracks(this);
    }

    private File audioFile(Object track) throws Exception {
        return DownloadPatch.audioFile(this, track);
    }

    private static String extension(String filename) {
        int dot = filename.lastIndexOf('.');
        return dot < 0 ? "" : filename.substring(dot + 1);
    }

    private static String sanitize(String name) {
        return name.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
    }

    private static String mime(String ext) {
        if ("flac".equalsIgnoreCase(ext)) return "audio/flac";
        if ("mp3".equalsIgnoreCase(ext)) return "audio/mpeg";
        if ("m4a".equalsIgnoreCase(ext) || "mp4".equalsIgnoreCase(ext)) return "audio/mp4";
        return "application/octet-stream";
    }

    @Override protected void onDestroy() {
        activityResumed = false;
        syncStatusHandler.removeCallbacks(syncStatusPoller);
        dismissProgress();
        // The floating entry belongs to the current Settings > Downloads visit. Clear it
        // when this tools page is explicitly closed; re-entering Downloads installs it again.
        if (isFinishing()) DownloadPatch.onToolsActivityClosed();
        super.onDestroy();
        worker.shutdown();
    }
}
