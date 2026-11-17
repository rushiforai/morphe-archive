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

    /// <summary>Taps <paramref name="setting"/> in the open section, which ticks or unticks its checkbox.</summary>
    public Task TickAsync(BaconReaderSetting setting) => OnScreen.PressAsync(driver, Locate.AppIdWithText("text", setting.ToShownText()));

    /// <summary>
    /// Whether <paramref name="setting"/>'s checkbox, in the open section, is ticked: the checkbox on its row, at the
    /// right end, level with its title.
    /// </summary>
    public Task<BaconReaderCheckboxSnapshot> ReadCheckboxAsync(BaconReaderSetting setting) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = ScreenSnapshot.Take(driver);
            var title = screen.WithAppId("text").First(found => found.Displayed && found.Text.Trim() == setting.ToShownText());
            var middle = title.Center.Y;
            var checkbox = screen.Root.Descendants()
                .First(found => found.ClassName == "android.widget.CheckBox" && found.Bounds.Top <= middle && found.Bounds.Bottom >= middle);
            return new BaconReaderCheckboxSnapshot(setting, checkbox.Checked);
        });

    /// <summary>What the settings menu lists: its sections, top to bottom.</summary>
    public Task<SettingsMenuSnapshot> ReadMenuAsync() =>
        OnScreen.ReadAsync(driver, () => new SettingsMenuSnapshot(
            [.. driver.FindElements(Setting).Where(entry => entry.Displayed).OrderBy(entry => entry.Location.Y).Select(entry => SettingsSectionShowing.ReadSettingsSection(entry.Text.Trim()))]));

    /// <summary>What the open section offers: its settings and headers, top to bottom, as far as the screen shows them.</summary>
    public Task<SettingsSectionSnapshot> ReadSectionAsync() =>
        OnScreen.ReadAsync(driver, () => new SettingsSectionSnapshot(
            [.. driver.FindElements(Setting).Where(setting => setting.Displayed).Select(setting => BaconReaderSettingShowing.ReadBaconReaderSetting(setting.Text.Trim()))]));
}

/// <summary>What BaconReader's settings menu lists: its sections, top to bottom.</summary>
public sealed record SettingsMenuSnapshot(System.Collections.Immutable.ImmutableArray<SettingsSection> Sections);

/// <summary>What a section of BaconReader's settings offers: its settings and headers, top to bottom.</summary>
public sealed record SettingsSectionSnapshot(System.Collections.Immutable.ImmutableArray<BaconReaderSetting> Settings);

/// <summary>Whether a setting's checkbox, in a section of BaconReader's settings, is ticked.</summary>
public sealed record BaconReaderCheckboxSnapshot(BaconReaderSetting Setting, bool Ticked);
