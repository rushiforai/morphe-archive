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
    /// Scrolls the screen until the titles of <paramref name="first"/> through <paramref name="last"/>, settings that fit
    /// on the screen together, all show: down a little while <paramref name="last"/> is below the screen, up a little
    /// while <paramref name="first"/> is above it. The screen lists every section, so a scroll to the last can leave the
    /// first above the screen.
    /// </summary>
    public async Task ScrollToAsync(PatchSetting first, PatchSetting last)
    {
        await ScrollToAsync(last);
        for (var scrolls = 0; scrolls < 10; scrolls++)
        {
            var direction = await Task.Run(() =>
                !driver.FindElements(Titled(last.ToShownText())).Any(title => title.Displayed) ? "down"
                : !driver.FindElements(Titled(first.ToShownText())).Any(title => title.Displayed) ? "up"
                : null);
            if (direction is null)
            {
                return;
            }

            await OnScreen.DoAsync(driver, () => OnScreen.ScrollGesture(driver, driver.FindElement(List), direction, 0.2));
        }

        throw new InvalidOperationException($"\"{first.ToShownText()}\" through \"{last.ToShownText()}\" didn't show together after 10 scrolls.");
    }

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

    /// <summary>Waits until the choices of a setting show <paramref name="choice"/>.</summary>
    public Task WaitUntilChoiceShownAsync(AvatarSize choice) =>
        Waiting.UntilShownAsync(driver, Titled(choice.ToShownText()), TimeSpan.FromSeconds(10), $"The choice \"{choice.ToShownText()}\"");

    /// <summary>Selects <paramref name="choice"/> among the setting's choices, which closes them.</summary>
    public Task SelectAsync(AvatarSize choice) => OnScreen.PressAsync(driver, Titled(choice.ToShownText()));

    /// <summary>Waits until the setting's dialog closed, back on the screen: <paramref name="setting"/>'s title shows alone.</summary>
    public Task WaitUntilDialogClosedAsync(PatchSetting setting) =>
        Waiting.UntilAsync(
            () => driver.FindElements(Locate.TextField()).Count == 0 && driver.FindElements(Titled(setting.ToShownText())).Count == 1,
            TimeSpan.FromSeconds(10),
            $"The dialog of \"{setting.ToShownText()}\" closing");

    /// <summary>Whether the screen shows, its first section, "Images and videos", listed.</summary>
    public Task<PatchesSettingsScreenSnapshot> ReadScreenAsync() =>
        OnScreen.ReadAsync(driver, () => new PatchesSettingsScreenSnapshot(driver.FindElements(FirstSection).Any(title => title.Displayed)));

    /// <summary>Whether <paramref name="setting"/>'s switch, on its row to the right of its title, is on.</summary>
    public Task<PatchSettingSwitchSnapshot> ReadSwitchAsync(PatchSetting setting) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var title = driver.FindElements(Titled(setting.ToShownText())).First(found => found.Displayed);
            // The row's switch is the first one below the title's top, as each row's switch sits by its title and summary.
            var toggle = driver.FindElements(Locate.Switch())
                .Where(found => found.Displayed && found.Location.Y + found.Size.Height > title.Location.Y)
                .OrderBy(found => found.Location.Y)
                .First();
            return new PatchSettingSwitchSnapshot(setting, toggle.GetAttribute("checked") == "true");
        });

    /// <summary>
    /// Taps <paramref name="setting"/> in <paramref name="section"/>, on the screen itself, which turns its switch over: the
    /// first title of that name below the section's own, as "Account colors"' setting has its section's title.
    /// </summary>
    public Task TickAsync(PatchSetting setting, PatchesSection section) =>
        OnScreen.PressAsync(driver, () => SettingIn(setting, section)!);

    /// <summary>
    /// Scrolls the screen down until <paramref name="section"/>'s title shows, then a little more until
    /// <paramref name="setting"/>'s title shows under it.
    /// </summary>
    public async Task ScrollToAsync(PatchSetting setting, PatchesSection section)
    {
        await OnScreen.ScrollToAsync(driver, List, Titled(section.ToShownText()), $"The section \"{section.ToShownText()}\"");
        for (var scrolls = 0; await Task.Run(() => SettingIn(setting, section)) is null; scrolls++)
        {
            if (scrolls == 10)
            {
                throw new InvalidOperationException($"\"{setting.ToShownText()}\" didn't show under \"{section.ToShownText()}\" after 10 scrolls.");
            }

            await OnScreen.DoAsync(driver, () => OnScreen.ScrollGesture(driver, driver.FindElement(List), "down", 0.2));
        }
    }

    // The first title of the setting's name below the section's title, both on the screen; null while either isn't.
    private OpenQA.Selenium.IWebElement? SettingIn(PatchSetting setting, PatchesSection section)
    {
        var header = driver.FindElements(Titled(section.ToShownText())).Where(found => found.Displayed).OrderBy(found => found.Location.Y).FirstOrDefault();
        return header is null
            ? null
            : driver.FindElements(Titled(setting.ToShownText()))
                .Where(found => found.Displayed && found.Location.Y > header.Location.Y)
                .OrderBy(found => found.Location.Y)
                .FirstOrDefault();
    }

    /// <summary>Whether <paramref name="setting"/>'s title shows under <paramref name="section"/>'s, on the screen.</summary>
    public Task<PatchSettingPlaceSnapshot> ReadPlaceAsync(PatchSetting setting, PatchesSection section) =>
        OnScreen.ReadAsync(driver, () => new PatchSettingPlaceSnapshot(setting, section, SettingIn(setting, section) is not null));

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

/// <summary>Whether the patches' settings screen shows.</summary>
public sealed record PatchesSettingsScreenSnapshot(bool Shown);

/// <summary>Whether a setting shows under a section's title.</summary>
public sealed record PatchSettingPlaceSnapshot(PatchSetting Setting, PatchesSection Section, bool Under);

/// <summary>Whether a setting's switch is on.</summary>
public sealed record PatchSettingSwitchSnapshot(PatchSetting Setting, bool On);
