// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager.Dialogs;

/// <summary>
/// Morphe Manager's "Would you like to be notified when updates are available?", with "Cancel" and "Allow", which it
/// asks once it installed an app the first time.
/// </summary>
public sealed class UpdatesNotificationPrompt(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Question = Locate.Text("Would you like to be notified when updates are available?");
    private static readonly OpenQA.Selenium.By Cancel = Locate.Text("Cancel");

    /// <summary>Waits until Morphe Manager asks, after the install.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Question, TimeSpan.FromSeconds(90), "Morphe Manager's \"Would you like to be notified when updates are available?\"");

    /// <summary>Taps "Cancel".</summary>
    public Task ClickCancelAsync() => OnScreen.PressAsync(driver, Cancel);
}
