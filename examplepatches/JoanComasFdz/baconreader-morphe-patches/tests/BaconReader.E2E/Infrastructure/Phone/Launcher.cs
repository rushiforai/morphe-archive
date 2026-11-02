// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>Android's launcher, from which the user opens BaconReader.</summary>
public sealed class Launcher(AndroidDriver driver)
{
    /// <summary>Opens BaconReader, as tapping its icon does.</summary>
    public Task OpenBaconReaderAsync() => OnScreen.DoAsync(driver, () => driver.ActivateApp(E2EDevice.Package));
}
