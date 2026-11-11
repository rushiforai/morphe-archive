// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure.Device;

/// <summary>
/// The phone's home screen, where each scenario starts, so its recording opens on it. Stopping BaconReader leaves on the
/// screen whatever was under it: the last scenario's other app, Android's settings at times, which made a video start
/// somewhere that has nothing to do with it.
/// </summary>
internal static class HomeScreen
{
    // The launcher's animation home takes ~0.3 s.
    private static readonly TimeSpan Shown = TimeSpan.FromSeconds(3);

    /// <summary>Presses Home and waits until the launcher has the focus, for at most <see cref="Shown"/>.</summary>
    public static async Task ShowAsync()
    {
        // "<package>/<activity>" on the last line.
        var launcher = (await Commands.ShellAsync(
                "cmd package resolve-activity --brief -a android.intent.action.MAIN -c android.intent.category.HOME"))
            .Split('\n', StringSplitOptions.RemoveEmptyEntries)[^1].Split('/')[0].Trim();
        await Commands.ShellAsync("input keyevent KEYCODE_HOME");
        var waiting = System.Diagnostics.Stopwatch.StartNew();
        while (waiting.Elapsed < Shown)
        {
            if ((await Commands.ShellAsync("dumpsys window | grep mCurrentFocus || true")).Contains(launcher, StringComparison.Ordinal))
            {
                return;
            }

            await Task.Delay(100);
        }

        // Not fatal: the scenario opens BaconReader from wherever the phone is; only its video starts elsewhere.
        RunLog.RetryFired("HomeScreen.ShowAsync: the launcher didn't take the focus", 1, launcher);
    }
}
