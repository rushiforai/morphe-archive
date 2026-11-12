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
        FolderPicker = new FolderPicker(driver);
        Clipboard = new Clipboard(driver);
        BaconReader = new BaconReaderApp(driver, Launcher, patches, noteAppShown);
        Chrome = new Chrome.ChromeApp(driver);
        MorpheManager = new MorpheManager.MorpheManagerApp(driver);
        FilePicker = new FilePicker(driver);
        InstallUnknownApps = new InstallUnknownApps(driver);
        PackageInstaller = new PackageInstaller(driver);
        NotificationPermission = new NotificationPermission(driver);
    }

    /// <summary>Chrome, the phone's browser.</summary>
    public Chrome.ChromeApp Chrome { get; }

    /// <summary>Morphe Manager, the patcher's app, for a Manager scenario.</summary>
    public MorpheManager.MorpheManagerApp MorpheManager { get; }

    /// <summary>Android's file picker, which an app opens to be given a file.</summary>
    public FilePicker FilePicker { get; }

    /// <summary>Android's permission for an app to install apps: "Permission required", then "Install unknown apps".</summary>
    public InstallUnknownApps InstallUnknownApps { get; }

    /// <summary>Android's package installer: "Install this app?".</summary>
    public PackageInstaller PackageInstaller { get; }

    /// <summary>Android's "Allow BaconReader Premium to send you notifications?".</summary>
    public NotificationPermission NotificationPermission { get; }

    /// <summary>Android's launcher: opens an app, as tapping its icon does.</summary>
    public Launcher Launcher { get; }

    /// <summary>Android's Downloads folder: what BaconReader saved in Downloads/BaconReader.</summary>
    public Downloads Downloads { get; }

    /// <summary>Android's App info for BaconReader: "Force stop".</summary>
    public AppInfo AppInfo { get; }

    /// <summary>Android's "Open by default" screen for BaconReader: which of its links open in it.</summary>
    public OpenByDefault OpenByDefault { get; }

    /// <summary>Android's folder picker, which an app opens to be given a folder.</summary>
    public FolderPicker FolderPicker { get; }

    /// <summary>Android's clipboard: what an app copied last.</summary>
    public Clipboard Clipboard { get; }

    /// <summary>BaconReader, patched with the scenario's patches (<see cref="PatchSet"/>).</summary>
    public BaconReaderApp BaconReader { get; }

    /// <summary>Goes back, as Android's Back does: closes the dialog or the screen on top.</summary>
    public Task GoBackAsync() => OnScreen.PressBackAsync(driver);
}
