// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.Chrome;

/// <summary>
/// morphe.software's page for adding a patch source, in Chrome: "Do you want to add this patch source to Morphe?", and
/// "Open in Morphe", which hands the source to Morphe Manager.
/// </summary>
public sealed class MorpheAddSource(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Question = Locate.Text("Do you want to add this patch source to Morphe?");
    private static readonly OpenQA.Selenium.By OpenInMorphe = Locate.Text("Open in Morphe");

    /// <summary>Waits until the page asks to add the source.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Question, TimeSpan.FromSeconds(30), "morphe.software's \"Do you want to add this patch source to Morphe?\"");

    /// <summary>Taps "Open in Morphe".</summary>
    public Task ClickOpenInMorpheAsync() => OnScreen.PressAsync(driver, OpenInMorphe);
}
