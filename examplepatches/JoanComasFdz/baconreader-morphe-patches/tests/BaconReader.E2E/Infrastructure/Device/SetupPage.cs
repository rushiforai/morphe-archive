// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

namespace BaconReader.E2E.Infrastructure.Device;

/// <summary>
/// The fake Reddit's setup page (<c>/_fake/setup</c>) in the phone's Chrome: a recording starts on it, so the video shows
/// the scenario's Given lines make its accounts and posts, before the app opens over it. Only when recording: a run that
/// doesn't record never opens Chrome. Chrome's first run must have been done on the phone (the README, "The phone").
/// </summary>
public static class SetupPage
{
    private const string Chrome = "com.android.chrome";

    /// <summary>How long a recording waits for the page to show a Given line's result before going on without it.</summary>
    public static readonly TimeSpan ShowingTimeout = TimeSpan.FromSeconds(5);

    // Chrome takes a moment to start and show the page before the recording starts.
    private static readonly TimeSpan Loading = TimeSpan.FromMilliseconds(1500);

    /// <summary>Opens the setup page in Chrome, in the same tab each time.</summary>
    public static async Task ShowAsync()
    {
        // The application id makes Chrome reuse the tab it opened for it, so tabs don't pile up scenario after scenario.
        await Commands.ShellAsync(
            $"am start -a android.intent.action.VIEW -d {E2EDevice.FakeRedditUrl}/_fake/setup"
            + $" -e com.android.browser.application_id e2e-setup {Chrome}");
        await Task.Delay(Loading);
    }

    /// <summary>Brings Chrome, on the setup page, back in front of the app, without loading the page again.</summary>
    public static Task BringToFrontAsync() => LaunchAsync(Chrome);

    /// <summary>Brings the app back in front of Chrome, on the screen it was on: its launcher's intent resumes its task.</summary>
    public static Task ShowAppAsync() => LaunchAsync(E2EDevice.Package);

    private static Task LaunchAsync(string package) =>
        Commands.ShellAsync($"monkey -p {package} -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1");

    /// <summary>
    /// Closes the setup page's tab and Chrome, so the next scenario starts from the home screen: Back on the page closes
    /// a tab another app opened, as it would go back to that app.
    /// </summary>
    public static async Task CloseAsync()
    {
        await BringToFrontAsync();
        await Task.Delay(TimeSpan.FromSeconds(1));
        await Commands.ShellAsync("input keyevent KEYCODE_BACK");
        await Task.Delay(TimeSpan.FromMilliseconds(500));
        await Commands.ShellAsync($"am force-stop {Chrome}");
    }
}
