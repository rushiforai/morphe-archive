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
    // A section's entry in the menu, and a setting's title (or a header) in a section, share this id.
    private static readonly OpenQA.Selenium.By Setting = Locate.AppId("text");

    private static OpenQA.Selenium.By Section(SettingsSection section) => Locate.AppIdWithText("text", section.ToShownText());

    /// <summary>Waits until the settings menu shows <paramref name="section"/>.</summary>
    public Task WaitUntilShownAsync(SettingsSection section) =>
        Waiting.UntilShownAsync(driver, Section(section), TimeSpan.FromSeconds(10), $"\"{section.ToShownText()}\" in BaconReader's settings");

    /// <summary>Taps <paramref name="section"/>, which opens it.</summary>
    public Task ClickAsync(SettingsSection section) => OnScreen.PressAsync(driver, Section(section));

    /// <summary>Waits until <paramref name="section"/> is open: the toolbar names it.</summary>
    public Task WaitUntilSectionShownAsync(SettingsSection section) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText("toolbarTitle", section.ToShownText()), TimeSpan.FromSeconds(10), $"BaconReader's \"{section.ToShownText()}\" settings");

    /// <summary>What the open section offers: its settings and headers, top to bottom, as far as the screen shows them.</summary>
    public Task<SettingsSectionSnapshot> ReadSectionAsync() =>
        OnScreen.ReadAsync(driver, () => new SettingsSectionSnapshot(
            [.. driver.FindElements(Setting).Where(setting => setting.Displayed).Select(setting => BaconReaderSettingShowing.ReadBaconReaderSetting(setting.Text.Trim()))]));
}

/// <summary>What a section of BaconReader's settings offers: its settings and headers, top to bottom.</summary>
public sealed record SettingsSectionSnapshot(System.Collections.Immutable.ImmutableArray<BaconReaderSetting> Settings);
