// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The bar over a post's comments: their sort ("Best"), the search button "Search comments" adds (an icon named by its
/// description) and "COLLAPSE ALL", which collapses every comment with replies, and then reads "EXPAND ALL".
/// </summary>
public sealed class SortBar(AndroidDriver driver)
{
    private static readonly By Search = Locate.Description("Search comments");
    private static readonly By Collapse = Locate.AppId("collapseButton");

    /// <summary>Taps "Search comments", which opens the find bar over the sort bar.</summary>
    public Task ClickSearchCommentsAsync() => OnScreen.PressAsync(driver, Search);

    /// <summary>Taps "COLLAPSE ALL".</summary>
    public Task ClickCollapseAllAsync() => OnScreen.PressAsync(driver, Locate.AppIdWithText("collapseButton", "COLLAPSE ALL"));

    /// <summary>Waits until the sort bar shows, with "Search comments".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Search, TimeSpan.FromSeconds(10), "\"Search comments\" in the sort bar");

    /// <summary>Where "Search comments" and "COLLAPSE ALL" are on the screen, in pixels.</summary>
    public Task<SortBarLayoutSnapshot> ReadLayoutAsync() =>
        OnScreen.ReadAsync(driver, () => new SortBarLayoutSnapshot(Bounds(driver.FindElement(Search)), Bounds(driver.FindElement(Collapse))));

    private static Rectangle Bounds(IWebElement element) => new(element.Location, element.Size);
}

/// <summary>Where the sort bar's "Search comments" and "COLLAPSE ALL" are on the screen, in pixels.</summary>
public sealed record SortBarLayoutSnapshot(Rectangle Search, Rectangle CollapseAll);
