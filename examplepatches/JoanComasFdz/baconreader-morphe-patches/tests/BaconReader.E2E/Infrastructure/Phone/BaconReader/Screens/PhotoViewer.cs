// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// BaconReader's own screen for a link to an image (a tap on one in a text): the image, zoomable, under a toolbar with
/// "Share" and "Refresh". Not the full-screen viewer of "Embed comment images" (<see cref="Dialogs.ImageViewer"/>).
/// </summary>
public sealed class PhotoViewer(AndroidDriver driver)
{
    private static readonly By Photo = Locate.AppId("photoView2");
    private static readonly By Share = Locate.AppId("action_share");

    /// <summary>Waits until the screen shows, with its photo.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilAsync(
            () => driver.FindElements(Share).Count > 0 && driver.FindElements(Photo).Any(photo => photo.Size.Height > 0),
            TimeSpan.FromSeconds(10),
            "BaconReader's photo viewer");

    /// <summary>Whether the screen shows, with its photo and its "Share".</summary>
    public Task<PhotoViewerSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new PhotoViewerSnapshot(
            driver.FindElements(Share).Count > 0 && driver.FindElements(Photo).Any(photo => photo.Size.Height > 0)));

    /// <summary>Taps Android's Back, which closes the screen.</summary>
    public Task ClickBackAsync() => OnScreen.DoAsync(driver, () => driver.PressKeyCode(OpenQA.Selenium.Appium.Android.Enums.AndroidKeyCode.Back));
}

/// <summary>Whether BaconReader's photo viewer shows, with its photo.</summary>
public sealed record PhotoViewerSnapshot(bool Shown);
