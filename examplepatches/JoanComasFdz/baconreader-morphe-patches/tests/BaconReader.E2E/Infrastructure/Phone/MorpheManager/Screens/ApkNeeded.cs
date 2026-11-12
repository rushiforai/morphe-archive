// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager.Screens;

/// <summary>
/// Morphe Manager's "To patch BaconReader Premium, you need the unpatched APK version:", with "Yes, help me find it" and
/// "No, I already have it", before it patches an app the first time.
/// </summary>
public sealed class ApkNeeded(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By AlreadyHaveIt = Locate.Text("No, I already have it");

    /// <summary>Waits until Morphe Manager asks for the APK.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, AlreadyHaveIt, TimeSpan.FromSeconds(10), "Morphe Manager's \"Need help finding the APK?\"");

    /// <summary>Taps "No, I already have it": Android's file picker opens.</summary>
    public Task ClickNoIAlreadyHaveItAsync() => OnScreen.PressAsync(driver, AlreadyHaveIt);
}
