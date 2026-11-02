// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Device;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// Android's App info for BaconReader: "Force stop". Done over adb, as the button does it, not by tapping through
/// Android's settings: a scenario stops the app to open it again with its data kept, and what it checks is BaconReader.
/// </summary>
public sealed class AppInfo(AndroidDriver driver)
{
    /// <summary>Stops BaconReader, as "Force stop" does: its data stays, and opening it starts it afresh.</summary>
    public Task ForceStopBaconReaderAsync() =>
        OnScreen.DoAsync(driver, () => Commands.ShellAsync($"am force-stop {E2EDevice.Package}").GetAwaiter().GetResult());
}
