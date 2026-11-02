// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// BaconReader's settings (SettingsActivity), which "Settings" in the left menu opens: a menu of its sections
/// ("Appearance", "List View"… and the patches' "Patches" last), under the toolbar's "BaconReader".
/// </summary>
public sealed class Settings(AndroidDriver driver)
{
    private static OpenQA.Selenium.By Section(SettingsSection section) => Locate.AppIdWithText("text", section.ToShownText());

    /// <summary>Waits until the settings menu shows <paramref name="section"/>.</summary>
    public Task WaitUntilShownAsync(SettingsSection section) =>
        Waiting.UntilShownAsync(driver, Section(section), TimeSpan.FromSeconds(10), $"\"{section.ToShownText()}\" in BaconReader's settings");

    /// <summary>Taps <paramref name="section"/>, which opens it.</summary>
    public Task ClickAsync(SettingsSection section) => OnScreen.PressAsync(driver, Section(section));
}
