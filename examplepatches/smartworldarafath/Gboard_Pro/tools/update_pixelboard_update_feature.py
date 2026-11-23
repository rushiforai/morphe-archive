import os

path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateFeature.java'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

target_status = """            case DOWNLOADING:
            case DOWNLOAD_COMPLETED:
            case UP_TO_DATE:
            case CHECKING:
            case IDLE:
            default:
                // No top status box when downloading, downloaded, up to date, or idle to keep UI clean and uncluttered
                break;"""

replacement_status = """            case DOWNLOADING:
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
                        progressStr + "\\nLive real-time transfer directly from GitHub Releases.",
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
                break;"""

target_actions = """        } else if (status == PixelBoardUpdateManager.Status.DOWNLOADING) {
            actionRows.add(new GboardPatchesSettingsContract.CommandRow(
                    "Downloading Update…",
                    "Download is in progress. Check notification panel for status.",
                    false,
                    null));

            String githubUrl = targetRelease != null ? targetRelease.getHtmlUrl() : PixelBoardUpdateManager.GITHUB_REPO_RELEASES_WEB;
            actionRows.add(new GboardPatchesSettingsContract.NavigationRow(
                    "View on GitHub",
                    "Open the release page on GitHub",
                    true,
                    () -> PixelBoardUpdateManager.openReleasePage(context, githubUrl)));"""

replacement_actions = """        } else if (status == PixelBoardUpdateManager.Status.DOWNLOADING) {
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
                    () -> PixelBoardUpdateManager.openReleasePage(context, githubUrl)));"""

target_helper = """    public static String formatRelativeTime(long timestamp) {"""
replacement_helper = """    private static String formatBytes(long bytes) {
        if (bytes <= 0) return "0 MB";
        double mb = bytes / (1024.0 * 1024.0);
        return String.format(java.util.Locale.US, "%.1f MB", mb);
    }

    public static String formatRelativeTime(long timestamp) {"""

norm_content = content.replace('\\r\\n', '\\n')
norm_target_status = target_status.replace('\\r\\n', '\\n')
norm_rep_status = replacement_status.replace('\\r\\n', '\\n')
norm_target_actions = target_actions.replace('\\r\\n', '\\n')
norm_rep_actions = replacement_actions.replace('\\r\\n', '\\n')
norm_target_helper = target_helper.replace('\\r\\n', '\\n')
norm_rep_helper = replacement_helper.replace('\\r\\n', '\\n')

if norm_target_status in norm_content and norm_target_actions in norm_content and norm_target_helper in norm_content:
    norm_content = norm_content.replace(norm_target_status, norm_rep_status, 1)
    norm_content = norm_content.replace(norm_target_actions, norm_rep_actions, 1)
    norm_content = norm_content.replace(norm_target_helper, norm_rep_helper, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_content)
    print("PixelBoardUpdateFeature.java updated successfully!")
else:
    print("Targets not matched in PixelBoardUpdateFeature.java")
