// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Phone.BaconReader;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Appium.Android.Enums;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// The phone as the user holds it: Android's own screens (<see cref="Launcher"/>, <see cref="Downloads"/>,
/// <see cref="AppInfo"/>, <see cref="OpenByDefault"/>), and the apps on it (<see cref="BaconReader"/>), each named and
/// nested as the user sees them. Locators stay private to their class (<see cref="Locate"/>).
/// </summary>
public sealed class Phone
{
    private readonly AndroidDriver driver;

    public Phone(AndroidDriver driver, PatchSet patches, Action noteAppShown)
    {
        this.driver = driver;
        Launcher = new Launcher(driver);
        Downloads = new Downloads(driver);
        AppInfo = new AppInfo(driver);
        OpenByDefault = new OpenByDefault(driver);
        BaconReader = new BaconReaderApp(driver, Launcher, patches, noteAppShown);
    }

    /// <summary>Android's launcher: opens an app, as tapping its icon does.</summary>
    public Launcher Launcher { get; }

    /// <summary>Android's Downloads folder: what BaconReader saved in Downloads/BaconReader.</summary>
    public Downloads Downloads { get; }

    /// <summary>Android's App info for BaconReader: "Force stop".</summary>
    public AppInfo AppInfo { get; }

    /// <summary>Android's "Open by default" screen for BaconReader: which of its links open in it.</summary>
    public OpenByDefault OpenByDefault { get; }

    /// <summary>BaconReader, patched with the scenario's patches (<see cref="PatchSet"/>).</summary>
    public BaconReaderApp BaconReader { get; }

    /// <summary>Goes back, as Android's Back does: closes the dialog or the screen on top.</summary>
    public Task GoBackAsync() => OnScreen.DoAsync(driver, () => driver.PressKeyCode(AndroidKeyCode.Back));
}
