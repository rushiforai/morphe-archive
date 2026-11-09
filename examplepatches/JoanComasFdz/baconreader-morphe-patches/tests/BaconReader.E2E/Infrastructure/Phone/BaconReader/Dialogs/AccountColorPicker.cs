// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// "Color for &lt;user name&gt;", the dialog a tap on an account's circle in the left menu opens ("Account colors"):
/// twelve round swatches, named by their descriptions ("Red", "Pink"…), four a row, and "NO COLOR". A tap on either
/// closes it.
/// </summary>
public sealed class AccountColorPicker(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.AndroidId("alertTitle");
    private static readonly OpenQA.Selenium.By Swatch = Locate.Described();
    private static readonly OpenQA.Selenium.By NoColor = Locate.AndroidId("button2");

    /// <summary>Waits until the dialog shows, its title "Color for …".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.TextStartingWith("Color for "), TimeSpan.FromSeconds(10), "\"Color for …\"");

    /// <summary>Taps <paramref name="choice"/>: a swatch, or "NO COLOR".</summary>
    public Task ClickAsync(AccountColorChoice choice) =>
        choice is AccountColorChoice.NoColor
            ? OnScreen.PressAsync(driver, NoColor)
            : OnScreen.PressAsync(driver, Locate.Description(choice.ToShownText()));

    /// <summary>Waits until the dialog has closed.</summary>
    public Task WaitUntilClosedAsync() =>
        Waiting.UntilAsync(() => driver.FindElements(Title).Count == 0, TimeSpan.FromSeconds(10), "\"Color for …\" closing");

    /// <summary>What the dialog shows: its title, then its swatches row by row, then its button.</summary>
    public Task<AccountColorPickerSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new AccountColorPickerSnapshot(
            driver.FindElement(Title).Text.Trim(),
            [
                .. driver.FindElements(Swatch)
                    .Select(swatch => (swatch, choice: AccountColorChoiceShowing.ReadAccountColorChoice(swatch.GetAttribute("content-desc") ?? "")))
                    .Where(found => found.choice is not AccountColorChoice.Unlisted)
                    .OrderBy(found => found.swatch.Location.Y).ThenBy(found => found.swatch.Location.X)
                    .Select(found => found.choice),
                .. driver.FindElements(NoColor).Select(button => AccountColorChoiceShowing.ReadAccountColorChoice(button.Text.Trim())),
            ]));
}

/// <summary>What "Color for &lt;user name&gt;" shows: its title, and its choices in order.</summary>
public sealed record AccountColorPickerSnapshot(string Title, ImmutableArray<AccountColorChoice> Choices);
