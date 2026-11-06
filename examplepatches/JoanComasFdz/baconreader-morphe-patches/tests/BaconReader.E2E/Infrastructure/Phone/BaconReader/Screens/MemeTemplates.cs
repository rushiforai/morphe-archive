// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The meme templates' grid, which "Memes" in the drawing screen's "Choose" dialog opens: one thumbnail a template, in
/// "Fix meme templates"' order, and "Loading template…" while a tapped one downloads. A thumbnail is an image with no
/// id, text or description, so a template is found by its place in the grid.
/// </summary>
public sealed class MemeTemplates(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Grid = Locate.AppId("gridView");
    private static readonly OpenQA.Selenium.By Thumbnail = Locate.Image();
    private static readonly OpenQA.Selenium.By Loading = Locate.Text("Loading template…");

    /// <summary>Waits until the grid shows its thumbnails.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilAsync(() => Thumbnails().Count > 0, TimeSpan.FromSeconds(10), "The meme templates");

    /// <summary>Waits until "Loading template…" is gone: the tapped template downloaded, or failed to.</summary>
    public Task WaitUntilLoadingEndedAsync() =>
        Waiting.UntilAsync(() => driver.FindElements(Loading).Count == 0, TimeSpan.FromSeconds(20), "\"Loading template…\" to close");

    /// <summary>Taps the template at <paramref name="place"/> in the grid, from 0, on the first screen of it.</summary>
    public Task ClickTemplateAsync(int place) =>
        OnScreen.PressAsync(driver, () => Thumbnails()[place]);

    /// <summary>What the grid shows: how many thumbnails are on the screen.</summary>
    public Task<MemeTemplatesSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new MemeTemplatesSnapshot(Thumbnails().Count(thumbnail => thumbnail.Displayed)));

    private IReadOnlyList<OpenQA.Selenium.IWebElement> Thumbnails() =>
        driver.FindElements(Grid).FirstOrDefault()?.FindElements(Thumbnail) ?? [];
}

/// <summary>The meme templates' grid: how many thumbnails are on the screen, 0 when it isn't shown.</summary>
public sealed record MemeTemplatesSnapshot(int Thumbnails);
