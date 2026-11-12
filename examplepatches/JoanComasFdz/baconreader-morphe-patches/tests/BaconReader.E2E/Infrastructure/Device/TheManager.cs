// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure.Device;

/// <summary>
/// The patcher's manager, Morphe Manager, as a Manager scenario's Given has it (<see cref="Vocabulary.PatchSet.ByTheManager"/>):
/// installed at <see cref="Version"/>, as just installed (its data cleared, not yet allowed to install apps), with no
/// BaconReader on the phone and the clean BaconReader Premium 6.1.4 APK in Downloads, as a user who just got both has
/// them. The scenario then adds the source and patches through the screens. The APK of the manager is downloaded once,
/// from its release on GitHub, into <see cref="E2EDevice.WorkFolder"/>.
/// </summary>
public static class TheManager
{
    /// <summary>Morphe Manager's package.</summary>
    public const string Package = "app.morphe.manager";

    /// <summary>The version the Manager scenarios play with, whose screens their Gherkins quote.</summary>
    public const string Version = "2.5.0";

    /// <summary>Where the clean APK is on the phone: what the scenario picks in Android's file picker.</summary>
    public const string ApkInDownloads = "/sdcard/Download/BaconReaderPremium-6.1.4.apk";

    private static readonly Uri Download = new($"https://github.com/MorpheApp/morphe-manager/releases/download/v{Version}/morphe-manager-{Version}.apk");

    /// <summary>
    /// Leaves the phone as a Manager scenario starts: no BaconReader, the manager installed at <see cref="Version"/> with
    /// its data cleared and its permission to install apps back to Android's default (it asks), Chrome stopped, and the
    /// clean APK alone in Downloads (Downloads/BaconReader, which the other scenarios fill, emptied).
    /// </summary>
    public static async Task PrepareAsync()
    {
        await Commands.ShellAsync($"pm uninstall {E2EDevice.Package} > /dev/null 2>&1 || true");
        if (!(await Commands.ShellAsync($"dumpsys package {Package} | grep versionName= || true")).Contains($"versionName={Version}", StringComparison.Ordinal))
        {
            await Commands.AdbAsync("install", "-r", await DownloadAsync());
        }

        await Commands.ShellAsync($"pm clear {Package}");
        await Commands.ShellAsync($"appops set {Package} REQUEST_INSTALL_PACKAGES default");
        await Commands.ShellAsync("am force-stop com.android.chrome");
        await Commands.ShellAsync("rm -rf /sdcard/Download/BaconReader");
        if ((await Commands.ShellAsync($"ls {ApkInDownloads} 2> /dev/null || true")).Trim().Length == 0)
        {
            await Commands.AdbAsync("push", E2EDevice.BaseApk, ApkInDownloads);
        }
    }

    /// <summary>
    /// After a Manager scenario: BaconReader, which the manager signed with its own key, uninstalled, so the next
    /// scenario's install of a test-signed one isn't refused; the manager and Chrome stopped.
    /// </summary>
    public static async Task CleanUpAsync()
    {
        await Commands.ShellAsync($"pm uninstall {E2EDevice.Package} > /dev/null 2>&1 || true");
        await Commands.ShellAsync($"am force-stop {Package}");
        await Commands.ShellAsync("am force-stop com.android.chrome");
    }

    // The manager's APK, downloaded once.
    private static async Task<string> DownloadAsync()
    {
        var apk = Path.Combine(E2EDevice.WorkFolder, $"morphe-manager-{Version}.apk");
        if (!File.Exists(apk))
        {
            Directory.CreateDirectory(E2EDevice.WorkFolder);
            using var http = new HttpClient();
            var bytes = await http.GetByteArrayAsync(Download);
            await File.WriteAllBytesAsync(apk + ".part", bytes);
            File.Move(apk + ".part", apk, overwrite: true);
        }

        return apk;
    }
}
