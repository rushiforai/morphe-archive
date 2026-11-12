// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager.Dialogs;

/// <summary>Morphe Manager's "Quick feature tour", with "Skip" and "Show me around", which it offers once.</summary>
public sealed class FeatureTour(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.Text("Quick feature tour");
    private static readonly OpenQA.Selenium.By Skip = Locate.Text("Skip");

    /// <summary>Waits until Morphe Manager offers the tour.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "Morphe Manager's \"Quick feature tour\"");

    /// <summary>Taps "Skip": back to its home screen.</summary>
    public Task ClickSkipAsync() => OnScreen.PressAsync(driver, Skip);
}
