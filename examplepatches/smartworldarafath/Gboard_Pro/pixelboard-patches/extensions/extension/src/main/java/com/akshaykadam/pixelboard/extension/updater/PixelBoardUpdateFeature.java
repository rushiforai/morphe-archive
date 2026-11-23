/**
 * PixelBoard - Gboard Enhancement Mod
 *
 * Maintained and customized by Arafath Rahman (@smartworldarafath)
 * Repository: https://github.com/Akshayykadam/PixelBoard
 * Licensed under the GNU General Public License v3.0 (GPLv3)
 */
package com.akshaykadam.pixelboard.extension.updater;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;

import com.akshaykadam.pixelboard.extension.BuildConfig;

import com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsContract;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Settings feature exposing the in-app PixelBoard Update screen with What's New notes,
 * direct APK downloading from GitHub, and package installation.
 */
public final class PixelBoardUpdateFeature implements GboardPatchesSettingsContract.Feature {

    private final String entryTitle;
    private final String entrySummary;
    private final String headerBadge;
    private final String headerTitle;
    private final String headerSummary;

    public PixelBoardUpdateFeature(Context context) {
        entryTitle = "Gboard Pro Updates";
        entrySummary = "Check for latest updates & releases";
        headerBadge = "Beta";
        headerTitle = "Gboard Pro Updates";
        headerSummary = "Stay updated with the latest features and fixes";
    }

    @Override
    public String getEntryTitle() {
        return entryTitle;
    }

    @Override
    public String getEntrySummary() {
        Context context = null;
        PixelBoardUpdateManager updateManager = PixelBoardUpdateManager.getInstance();
        ReleaseInfo releaseInfo = updateManager.getCurrentReleaseInfo();
        PixelBoardUpdateManager.Status status = updateManager.getCurrentStatus();

        if (status == PixelBoardUpdateManager.Status.UPDATE_AVAILABLE && releaseInfo != null) {
            String size = releaseInfo.getFormattedFileSize();
            return "Update available: v" + releaseInfo.getVersion() + (size.isEmpty() ? "" : (" (" + size + ")"));
        } else if (status == PixelBoardUpdateManager.Status.UP_TO_DATE && releaseInfo != null) {
            return "v" + releaseInfo.getVersion() + " • Up to date";
        }
        return entrySummary;
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    private static final long ONE_HOUR_MS = 3600000L;

    @Override
    public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
        if (host == null) {
            return;
        }
        Context context = host.getContext();
        PixelBoardUpdateManager updateManager = PixelBoardUpdateManager.getInstance();

        // Auto-check on first screen visit if enabled and hasn't checked in 1 hour
        if (PixelBoardUpdateManager.isAutoCheckEnabled(context)
                && updateManager.getCurrentStatus() == PixelBoardUpdateManager.Status.IDLE) {
            long lastCheck = PixelBoardUpdateManager.getLastCheckTime(context);
            long now = System.currentTimeMillis();
            if (now - lastCheck > ONE_HOUR_MS) {
                String installedVersion = resolveInstalledVersion(context);
                updateManager.checkForUpdates(context, installedVersion, (status, releaseInfo, msg) -> {
                    GboardPatchesSettingsContract.refresh(host);
                });
            }
        }
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        Context context = host.getContext();
        String installedVersion = resolveInstalledVersion(context);
        PixelBoardUpdateManager updateManager = PixelBoardUpdateManager.getInstance();
        ReleaseInfo releaseInfo = updateManager.getCurrentReleaseInfo();
        if (releaseInfo == null) {
            releaseInfo = updateManager.getCachedReleaseInfo(context);
        }
        PixelBoardUpdateManager.Status status = updateManager.getCurrentStatus();

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        // 1. Build Status Block matching Material 3 tones
        switch (status) {
            case UPDATE_AVAILABLE:
                String updateTitle = releaseInfo != null
                        ? "Update Available: v" + releaseInfo.getVersion()
                        : "Update Available";
                String updateSummary = releaseInfo != null
                        ? "Gboard Pro v" + releaseInfo.getVersion() + " is ready for download ("
                                + releaseInfo.getFormattedFileSize() + ").\nPublished: "
                                + releaseInfo.getFormattedDate()
                        : "A new version of Gboard Pro is ready to install.";
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        updateTitle,
                        updateSummary,
                        GboardPatchesSettingsContract.StatusTone.INFO));
                break;
            case ERROR:
                String errorSummary = updateManager.getLastErrorMessage().isEmpty()
                        ? "Unable to check for updates. Please verify your connection."
                        : (updateManager.getLastErrorMessage() + "\nYou can still download releases directly via browser.");
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        "Check Failed",
                        errorSummary,
                        GboardPatchesSettingsContract.StatusTone.WARNING));
                break;
            case DOWNLOADING:
                float speedMbps = updateManager.getCurrentSpeedMbps();
                int percent = updateManager.getDownloadProgressPercent();
                long dl = updateManager.getDownloadedBytes();
                long tot = updateManager.getTotalBytes();
                String speedStr = speedMbps > 0.05f
                        ? String.format(java.util.Locale.US, "%.1f Mbps", speedMbps)
                        : "Calculating speed...";
                String progressStr = tot > 0L
                        ? (formatBytes(dl) + " / " + formatBytes(tot) + " (" + percent + "%)")
                        : "Downloading package...";
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        "Downloading Update • " + speedStr,
                        progressStr + "\nLive real-time transfer directly from GitHub Releases.",
                        GboardPatchesSettingsContract.StatusTone.INFO));
                break;
            case DOWNLOAD_COMPLETED:
                statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                        "Download Complete",
                        "Update package is ready to install. Tap 'Install Update' below to proceed.",
                        GboardPatchesSettingsContract.StatusTone.INFO));
                break;
            case UP_TO_DATE:
            case CHECKING:
            case IDLE:
            default:
                break;
        }

        // 2. Actions Section
        List<GboardPatchesSettingsContract.Row> actionRows = new ArrayList<>();
        final ReleaseInfo targetRelease = releaseInfo;
        if (status == PixelBoardUpdateManager.Status.UPDATE_AVAILABLE && targetRelease != null) {
            String downloadSummary = targetRelease.hasApkAsset()
                    ? ("Download " + targetRelease.getApkFileName() + " (" + targetRelease.getFormattedFileSize() + ") directly from Git")
                    : "Open release page on GitHub";

            actionRows.add(new GboardPatchesSettingsContract.CommandRow(
                    "Download and Install",
                    downloadSummary,
                    true,
                    () -> {
                        if (context instanceof Activity activity) {
                            updateManager.downloadAndInstall(activity, targetRelease, () -> {
                                GboardPatchesSettingsContract.refresh(host);
                            });
                        } else {
                            PixelBoardUpdateManager.openReleasePage(context, targetRelease.getApkDownloadUrl());
                        }
                    }));

            actionRows.add(new GboardPatchesSettingsContract.NavigationRow(
                    "View on GitHub",
                    "Open the release page on GitHub",
                    true,
                    () -> PixelBoardUpdateManager.openReleasePage(context, targetRelease.getHtmlUrl())));
        } else if (status == PixelBoardUpdateManager.Status.DOWNLOADING) {
            float speedMbps = updateManager.getCurrentSpeedMbps();
            int percent = updateManager.getDownloadProgressPercent();
            long dl = updateManager.getDownloadedBytes();
            long tot = updateManager.getTotalBytes();
            String speedStr = speedMbps > 0.05f
                    ? String.format(java.util.Locale.US, "%.1f Mbps", speedMbps)
                    : "Connecting...";
            String dlText = tot > 0L
                    ? (formatBytes(dl) + " of " + formatBytes(tot) + " (" + percent + "%)")
                    : "In progress...";

            actionRows.add(new GboardPatchesSettingsContract.CommandRow(
                    "Speed: " + speedStr,
                    dlText,
                    false,
                    null));

            String githubUrl = targetRelease != null ? targetRelease.getHtmlUrl() : PixelBoardUpdateManager.GITHUB_REPO_RELEASES_WEB;
            actionRows.add(new GboardPatchesSettingsContract.NavigationRow(
                    "View on GitHub",
                    "Open the release page on GitHub",
                    true,
                    () -> PixelBoardUpdateManager.openReleasePage(context, githubUrl)));
        } else if (status == PixelBoardUpdateManager.Status.DOWNLOAD_COMPLETED) {
            actionRows.add(new GboardPatchesSettingsContract.CommandRow(
                    "Install Update",
                    "Update package is downloaded. Tap to begin installation.",
                    true,
                    () -> {
                        Uri apkUri = updateManager.getLastDownloadedApkUri();
                        if (apkUri != null) {
                            PixelBoardUpdateManager.promptInstallApk(context, apkUri);
                        } else if (targetRelease != null) {
                            if (context instanceof Activity activity) {
                                updateManager.downloadAndInstall(activity, targetRelease, () -> {
                                    GboardPatchesSettingsContract.refresh(host);
                                });
                            }
                        }
                    }));

            String githubUrl = targetRelease != null ? targetRelease.getHtmlUrl() : PixelBoardUpdateManager.GITHUB_REPO_RELEASES_WEB;
            actionRows.add(new GboardPatchesSettingsContract.NavigationRow(
                    "View on GitHub",
                    "Open the release page on GitHub",
                    true,
                    () -> PixelBoardUpdateManager.openReleasePage(context, githubUrl)));
        } else {
            long lastCheck = PixelBoardUpdateManager.getLastCheckTime(context);
            String checkSummary;
            if (status == PixelBoardUpdateManager.Status.CHECKING) {
                checkSummary = "Connecting to GitHub Releases repository…";
            } else if (status == PixelBoardUpdateManager.Status.UP_TO_DATE) {
                String relative = lastCheck > 0L ? formatRelativeTime(lastCheck) : "just now";
                checkSummary = "You're up to date • Checked " + relative;
            } else if (lastCheck > 0L) {
                checkSummary = "Last checked: " + formatRelativeTime(lastCheck);
            } else {
                checkSummary = "Check for newer versions and changelogs";
            }

            actionRows.add(new GboardPatchesSettingsContract.CommandRow(
                    "Check for Updates",
                    checkSummary,
                    status != PixelBoardUpdateManager.Status.CHECKING,
                    () -> {
                        updateManager.checkForUpdates(context, installedVersion, (resStatus, resInfo, msg) -> {
                            GboardPatchesSettingsContract.refresh(host);
                        });
                    }));

            actionRows.add(new GboardPatchesSettingsContract.NavigationRow(
                    "All Releases",
                    "Browse past changelogs on GitHub",
                    true,
                    () -> PixelBoardUpdateManager.openReleasePage(context, PixelBoardUpdateManager.GITHUB_REPO_RELEASES_WEB)));
        }

        sections.add(new GboardPatchesSettingsContract.Section(
                "ACTIONS",
                actionRows));

        // 3. "What's New" Section (Changelog Highlights)
        ReleaseInfo changelogRelease;
        if (releaseInfo != null && releaseInfo.isNewerThan(installedVersion)) {
            changelogRelease = releaseInfo;
        } else if (releaseInfo != null && releaseInfo.getVersion().equals(installedVersion)) {
            changelogRelease = releaseInfo;
        } else {
            changelogRelease = new ReleaseInfo(
                    installedVersion,
                    "Gboard Pro v" + installedVersion,
                    getDefaultChangelog(),
                    "",
                    PixelBoardUpdateManager.GITHUB_REPO_RELEASES_WEB,
                    "",
                    "",
                    0L);
        }

        List<ReleaseInfo.Highlight> highlights = changelogRelease.getParsedHighlights();
        List<GboardPatchesSettingsContract.Row> changelogRows = new ArrayList<>();

        int maxItems = 7;
        int count = 0;
        if (!highlights.isEmpty()) {
            for (ReleaseInfo.Highlight highlight : highlights) {
                if (count >= maxItems) {
                    break;
                }
                changelogRows.add(new GboardPatchesSettingsContract.DetailRow(
                        highlight.getTitle(),
                        highlight.getDescription(),
                        true));
                count++;
            }
        } else if (!changelogRelease.getTitle().isEmpty()) {
            changelogRows.add(new GboardPatchesSettingsContract.DetailRow(
                    changelogRelease.getTitle(),
                    changelogRelease.getChangelog().isEmpty() ? "See GitHub release notes for details." : changelogRelease.getChangelog(),
                    true));
        }

        final ReleaseInfo finalRel = changelogRelease;
        changelogRows.add(new GboardPatchesSettingsContract.CommandRow(
                "View full changelog on GitHub",
                "Open GitHub release page",
                true,
                () -> PixelBoardUpdateManager.openReleasePage(context, finalRel.getHtmlUrl())));

        if (!changelogRows.isEmpty()) {
            String sectionTitle = "Gboard Pro v" + changelogRelease.getVersion();
            String sectionDesc = (status == PixelBoardUpdateManager.Status.UPDATE_AVAILABLE)
                    ? "Highlights and improvements in the upcoming update"
                    : "Highlights and key improvements in this release";
            sections.add(new GboardPatchesSettingsContract.Section(
                    sectionTitle,
                    sectionDesc,
                    GboardPatchesSettingsContract.SectionStyle.DEFAULT,
                    changelogRows));
        }

        // 4. Update Preferences Section
        List<GboardPatchesSettingsContract.Row> prefRows = new ArrayList<>();
        prefRows.add(new GboardPatchesSettingsContract.ToggleRow(
                "Check for updates automatically",
                "Automatically check every 8 hours in the background for new releases",
                true,
                PixelBoardUpdateManager.isAutoCheckEnabled(context),
                value -> {
                    PixelBoardUpdateManager.setAutoCheckEnabled(context, value);
                    GboardPatchesSettingsContract.refresh(host);
                }));

        sections.add(new GboardPatchesSettingsContract.Section(
                "PREFERENCES",
                prefRows));

        // 5. Build Information Section
        List<GboardPatchesSettingsContract.Row> infoRows = new ArrayList<>();
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Installed Version",
                "v" + installedVersion,
                true));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Base Gboard",
                resolveBaseGboardVersion(context),
                true));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Package Name",
                context != null ? context.getPackageName() : "com.akshaykadam.pixelboard",
                true));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Author",
                "Arafath Rahman (@smartworldarafath)",
                true));

        sections.add(new GboardPatchesSettingsContract.Section(
                "VERSION INFO",
                infoRows));

        return new GboardPatchesSettingsContract.Screen(
                entryTitle,
                headerBadge,
                headerTitle,
                headerSummary,
                statusBlocks,
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null);
    }

    public static String resolveInstalledVersion(Context context) {
        try {
            if (BuildConfig.PATCH_VERSION != null && !BuildConfig.PATCH_VERSION.trim().isEmpty()) {
                return BuildConfig.PATCH_VERSION.trim();
            }
        } catch (Throwable ignored) {
        }
        if (context != null) {
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
                if (packageInfo != null && packageInfo.versionName != null) {
                    return packageInfo.versionName;
                }
            } catch (PackageManager.NameNotFoundException ignored) {
            }
        }
        return "2.0.7";
    }

    private static String resolveBaseGboardVersion(Context context) {
        if (context != null) {
            try {
                PackageInfo packageInfo = context.getPackageManager()
                        .getPackageInfo(context.getPackageName(), 0);
                if (packageInfo != null && packageInfo.versionName != null) {
                    String clean = packageInfo.versionName.trim();
                    int dash = clean.indexOf('-');
                    if (dash > 0) {
                        clean = clean.substring(0, dash);
                    }
                    String[] parts = clean.split("\\.");
                    if (parts.length >= 3) {
                        clean = parts[0] + "." + parts[1] + "." + parts[2];
                    }
                    if (!clean.isEmpty()) {
                        return "v" + clean + " (Release)";
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return "v18.4.1 (Release)";
    }

    private static String formatBytes(long bytes) {
        if (bytes <= 0) return "0 MB";
        double mb = bytes / (1024.0 * 1024.0);
        return String.format(java.util.Locale.US, "%.1f MB", mb);
    }

    public static String formatRelativeTime(long timestamp) {
        if (timestamp <= 0L) {
            return "Never";
        }
        long diff = System.currentTimeMillis() - timestamp;
        if (diff < 60000L) {
            return "Just now";
        } else if (diff < 3600000L) {
            long minutes = diff / 60000L;
            return minutes + (minutes == 1 ? " minute ago" : " minutes ago");
        } else if (diff < 86400000L) {
            long hours = diff / 3600000L;
            return hours + (hours == 1 ? " hour ago" : " hours ago");
        } else {
            long days = diff / 86400000L;
            return days + (days == 1 ? " day ago" : " days ago");
        }
    }

    private static String getDefaultChangelog() {
        return "* **AI Writing Tools Server Connection Fix**: Enforced reliable Gboard Server backend, eliminated 'cannot connect to server' errors, refined prompt template evaluation and request timeouts, and removed unstable V2 flag overrides for rock-solid proofreading and rewrite\n"
                + "* **Direct Boot & Secure Storage Safety**: Full user-unlock state verification preventing crashes during cold device boots prior to first unlock\n"
                + "* **Refined Voice Dictation & Anti-Drift**: Robust speech diff preservation for voice edits, rotation grace window, and strict language enforcement\n"
                + "* **Extended 24h Clipboard Retention**: 24h default retention, 100-item recent clip capacity, 5-step slider, and localized pin tips across 83 languages\n"
                + "* **Gboard Pro Customization Suite**: All 5 Material 3 Expressive themes, AMOLED Pure Black, Pro hub, and 8h automated update checks preserved";
    }
}
