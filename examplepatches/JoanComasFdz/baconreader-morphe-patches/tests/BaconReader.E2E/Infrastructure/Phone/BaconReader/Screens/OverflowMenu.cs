// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>The menu the toolbar's "More options" opens: "List View", "View Sidebar".</summary>
public sealed class OverflowMenu(AndroidDriver driver)
{
    private static readonly By Title = Locate.AppId("title");

    /// <summary>Waits until the menu shows "View Sidebar".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(
            driver,
            Locate.AppIdWithText("title", new OverflowMenuEntry.ViewSidebar().ToShownText()),
            TimeSpan.FromSeconds(10),
            "The menu of \"More options\"");

    /// <summary>
    /// What the menu shows: its entries, top to bottom, and whether each is enabled. A greyed-out entry's row is disabled,
    /// though its title, inside it, still reads as enabled.
    /// </summary>
    public Task<OverflowMenuSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new OverflowMenuSnapshot(
            [.. driver.FindElements(Title).Select(title => title.Text.Trim()).Select(shown => new OverflowMenuItem(
                OverflowMenuEntryShowing.ReadOverflowMenuEntry(shown),
                driver.FindElements(Locate.AppIdWithTextInDisabled("title", shown)).Count == 0))]));
}

/// <summary>An entry of the "More options" menu, and whether it can be tapped (not greyed out).</summary>
public sealed record OverflowMenuItem(OverflowMenuEntry Entry, bool Enabled);

/// <summary>What the "More options" menu shows: its entries, top to bottom.</summary>
public sealed record OverflowMenuSnapshot(ImmutableArray<OverflowMenuItem> Items);
