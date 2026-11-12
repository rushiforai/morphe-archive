// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// Android's permission for an app to install apps: the "Permission required" dialog it shows when the app first
/// installs one ("For your security, your phone currently isn't allowed to install unknown apps from this source."),
/// with "Cancel" and "Settings", and the settings' "Install unknown apps" screen, with "Allow from this source".
/// </summary>
public sealed class InstallUnknownApps(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By PermissionRequired = Locate.Text("Permission required");
    private static readonly OpenQA.Selenium.By Settings = Locate.Text("Settings");
    private static readonly OpenQA.Selenium.By AllowFromThisSource = Locate.Text("Allow from this source");
    private static readonly OpenQA.Selenium.By BackArrow = Locate.Description("Navigate up");

    /// <summary>Waits until Android says "Permission required".</summary>
    public Task WaitUntilPermissionRequiredShownAsync() =>
        Waiting.UntilShownAsync(driver, PermissionRequired, TimeSpan.FromSeconds(10), "Android's \"Permission required\"");

    /// <summary>Taps "Settings": the "Install unknown apps" screen opens.</summary>
    public Task ClickSettingsAsync() => OnScreen.PressAsync(driver, Settings);

    /// <summary>Waits until the "Install unknown apps" screen shows "Allow from this source": also once the install ends.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, AllowFromThisSource, TimeSpan.FromSeconds(90), "Android's \"Install unknown apps\"");

    /// <summary>
    /// Turns on "Allow from this source": Android then carries on with the install the app asked for, "Install this
    /// app?" over the screen.
    /// </summary>
    public Task TickAllowFromThisSourceAsync() => OnScreen.PressAsync(driver, AllowFromThisSource);

    /// <summary>Taps the screen's back arrow, which goes back to the app: after the install, Android shows this screen again.</summary>
    public Task ClickBackArrowAsync() => OnScreen.PressAsync(driver, BackArrow);
}
