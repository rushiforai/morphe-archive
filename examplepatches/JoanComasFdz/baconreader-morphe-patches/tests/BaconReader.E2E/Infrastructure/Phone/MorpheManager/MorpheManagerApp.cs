// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Phone.MorpheManager.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.MorpheManager.Screens;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager;

/// <summary>
/// Morphe Manager, the patcher's app (<see cref="Device.TheManager"/> installs it): its screens and dialogs, as a user
/// adds the BaconReader source and patches BaconReader with it.
/// </summary>
public sealed class MorpheManagerApp(AndroidDriver driver)
{
    /// <summary>"Do you want to add this patch source to Morphe?", when a link hands it a source.</summary>
    public AddSource AddSource { get; } = new(driver);

    /// <summary>Its home screen: "What app do you want to patch?", the apps its sources patch.</summary>
    public Apps Apps { get; } = new(driver);

    /// <summary>"To patch BaconReader Premium, you need the unpatched APK version:", before it patches an app the first time.</summary>
    public ApkNeeded ApkNeeded { get; } = new(driver);

    /// <summary>The app it patched: "Patched", its version, its patches, the source and its version, and "Install".</summary>
    public Patched Patched { get; } = new(driver);

    /// <summary>"Would you like to be notified when updates are available?", after it installs an app the first time.</summary>
    public UpdatesNotificationPrompt UpdatesNotificationPrompt { get; } = new(driver);

    /// <summary>"Quick feature tour", after it installs an app the first time.</summary>
    public FeatureTour FeatureTour { get; } = new(driver);
}
