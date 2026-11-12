// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>Android's package installer: "Install this app?", with "Cancel" and "Install", for an app another app installs.</summary>
public sealed class PackageInstaller(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By InstallThisApp = Locate.Text("Install this app?");
    private static readonly OpenQA.Selenium.By Install = Locate.Text("Install");

    /// <summary>Waits until Android asks "Install this app?".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, InstallThisApp, TimeSpan.FromSeconds(30), "Android's \"Install this app?\"");

    /// <summary>Taps "Install".</summary>
    public Task ClickInstallAsync() => OnScreen.PressAsync(driver, Install);
}
