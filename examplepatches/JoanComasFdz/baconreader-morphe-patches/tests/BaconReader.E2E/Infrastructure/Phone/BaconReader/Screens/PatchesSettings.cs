// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The patches' settings, which "Patches" in BaconReader's settings opens: the extension's one screen, "Patches", with a
/// section for each area ("Images and videos", "Links"…). A section lists its settings, each a title, a summary and a
/// switch; a tap on the title switches it. The views are Android's preferences', with Android's ids: they're found by
/// their texts.
/// </summary>
public sealed class PatchesSettings(AndroidDriver driver)
{
    // The first section: it shows when "Embed comment images" is patched in.
    private static readonly OpenQA.Selenium.By FirstSection = Locate.Text("Images and videos");

    // Android's preference list.
    private static readonly OpenQA.Selenium.By List = Locate.AndroidId("list");

    private static OpenQA.Selenium.By Titled(string text) => Locate.Text(text);

    /// <summary>Waits until the screen is shown, its first section listed.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, FirstSection, TimeSpan.FromSeconds(10), "The patches' settings, \"Patches\"");

    /// <summary>Taps <paramref name="setting"/>'s title, which switches it.</summary>
    public Task TickAsync(PatchSetting setting) => OnScreen.PressAsync(driver, Titled(setting.ToShownText()));

    /// <summary>Scrolls the screen down until <paramref name="setting"/>'s title shows.</summary>
    public Task ScrollToAsync(PatchSetting setting) =>
        OnScreen.ScrollToAsync(driver, List, Titled(setting.ToShownText()), $"\"{setting.ToShownText()}\"");

    /// <summary>
    /// Scrolls the screen down until <paramref name="setting"/>'s title shows, and taps it, which opens its dialog: a
    /// number, or a choice.
    /// </summary>
    public async Task ClickAsync(PatchSetting setting)
    {
        await OnScreen.ScrollToAsync(driver, List, Titled(setting.ToShownText()), $"\"{setting.ToShownText()}\"");
        await OnScreen.PressAsync(driver, Titled(setting.ToShownText()));
    }

    /// <summary>Waits until the dialog of a setting with a number shows its field.</summary>
    public Task WaitUntilTextFieldShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.TextField(), TimeSpan.FromSeconds(10), "The setting's number field");

    /// <summary>Types <paramref name="value"/> in the setting's number field, instead of what it held.</summary>
    public Task TypeAsync(string value) =>
        OnScreen.ActAsync(driver, Locate.TextField(), field =>
        {
            field.Clear();
            field.SendKeys(value);
        });

    /// <summary>Taps "OK" on the setting's dialog, which saves it.</summary>
    public Task ClickOkAsync() => OnScreen.PressAsync(driver, Locate.AndroidId("button1"));

    /// <summary>Waits until the choices of a setting show <paramref name="choice"/>.</summary>
    public Task WaitUntilChoiceShownAsync(RepliesToAutoLoad choice) =>
        Waiting.UntilShownAsync(driver, Titled(choice.ToShownText()), TimeSpan.FromSeconds(10), $"The choice \"{choice.ToShownText()}\"");

    /// <summary>Selects <paramref name="choice"/> among the setting's choices, which closes them.</summary>
    public Task SelectAsync(RepliesToAutoLoad choice) => OnScreen.PressAsync(driver, Titled(choice.ToShownText()));

    /// <summary>Waits until the setting's dialog closed, back on the screen: <paramref name="setting"/>'s title shows alone.</summary>
    public Task WaitUntilDialogClosedAsync(PatchSetting setting) =>
        Waiting.UntilAsync(
            () => driver.FindElements(Locate.TextField()).Count == 0 && driver.FindElements(Titled(setting.ToShownText())).Count == 1,
            TimeSpan.FromSeconds(10),
            $"The dialog of \"{setting.ToShownText()}\" closing");

    /// <summary>What the screen shows: the settings it lists, top to bottom.</summary>
    public Task<PatchesSettingsSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new PatchesSettingsSnapshot(
        [
            .. PatchSettingShowing.Listed
                .Select(setting => (setting, title: driver.FindElements(Titled(setting.ToShownText())).FirstOrDefault(title => title.Displayed)))
                .Where(found => found.title is not null)
                .OrderBy(found => found.title!.Location.Y)
                .Select(found => found.setting),
        ]));
}

/// <summary>What the patches' settings show: the settings listed, top to bottom.</summary>
public sealed record PatchesSettingsSnapshot(ImmutableArray<PatchSetting> Settings);
