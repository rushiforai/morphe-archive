// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// "FINAL RELEASE ANNOUNCEMENT!", the dialog BaconReader shows on every start until it is closed, with one button, "GOT
/// IT :(". "Disable final release announcement" stops it.
/// </summary>
public sealed class FinalReleaseAnnouncement(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.Text("FINAL RELEASE ANNOUNCEMENT!");
    private static readonly OpenQA.Selenium.By GotIt = Locate.Text("GOT IT :(");

    /// <summary>Waits until the dialog is shown (BaconReader shows it a moment after it opens).</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "The \"FINAL RELEASE ANNOUNCEMENT!\" dialog");

    /// <summary>
    /// Waits, once the main screen shows, as long as the dialog would take to show over it (3 s; BaconReader shows it as
    /// it creates the main screen), for one that should never come: it ends sooner when it does, for the check to say so.
    /// </summary>
    public async Task WaitUntilNotShownAsync() =>
        await Waiting.FindWithinAsync(driver, Title, TimeSpan.FromSeconds(3), "The \"FINAL RELEASE ANNOUNCEMENT!\" dialog, which shouldn't show");

    /// <summary>Taps "GOT IT :(", which closes the dialog.</summary>
    public Task ClickGotItAsync() => OnScreen.PressAsync(driver, GotIt);

    /// <summary>Whether the dialog is on the screen.</summary>
    public Task<FinalReleaseAnnouncementSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new FinalReleaseAnnouncementSnapshot(driver.FindElements(Title).Count > 0));
}

/// <summary>Whether "FINAL RELEASE ANNOUNCEMENT!" is on the screen.</summary>
public sealed record FinalReleaseAnnouncementSnapshot(bool Shown);
