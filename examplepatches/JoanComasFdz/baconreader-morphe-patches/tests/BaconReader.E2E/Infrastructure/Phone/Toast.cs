// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// A toast: the short message Android shows at the bottom of the screen for a few seconds. UiAutomator2 has it only in
/// its page source, as an android.widget.Toast, so it is read from there. It may be gone by the time a check reads it,
/// so the wait keeps the one it saw, and the read returns that one.
/// </summary>
public sealed class Toast(AndroidDriver driver)
{
    // The page source also has the name of the app that showed the toast, as a toast of its own.
    private const string AppName = "BaconReader Premium";

    private string? seen;

    /// <summary>Waits until a toast shows, and keeps what it says for <see cref="ReadAsync"/>.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilAsync(
            () =>
            {
                seen = ScreenSnapshot.Take(driver).Root.Descendants()
                    .FirstOrDefault(view => view.ClassName == "android.widget.Toast" && view.Text.Length > 0 && view.Text != AppName)?.Text;
                return seen is not null;
            },
            TimeSpan.FromSeconds(10),
            "A toast");

    /// <summary>What the toast <see cref="WaitUntilShownAsync"/> saw says.</summary>
    public Task<ToastSnapshot> ReadAsync() => Task.FromResult(new ToastSnapshot(seen ?? ""));
}

/// <summary>What a toast says.</summary>
public sealed record ToastSnapshot(string Text);
