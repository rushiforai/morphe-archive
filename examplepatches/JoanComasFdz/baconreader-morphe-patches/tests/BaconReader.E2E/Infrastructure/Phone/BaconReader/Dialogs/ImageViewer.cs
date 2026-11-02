// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Appium.Android.Enums;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// The full-screen viewer a double tap on an image opens ("Embed comment images"): the image on black, which the patch
/// names <c>baconreader_patches_image_viewer</c>. A tap or Back closes it.
/// </summary>
public sealed class ImageViewer(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Image = Locate.AppId("baconreader_patches_image_viewer");
    private static readonly OpenQA.Selenium.By Window = Locate.AndroidId("content");

    /// <summary>Waits until the viewer is shown.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Image, TimeSpan.FromSeconds(10), "The full-screen image viewer");

    /// <summary>Closes the viewer with Android's Back.</summary>
    public Task ClickBackAsync() => OnScreen.DoAsync(driver, () => driver.PressKeyCode(AndroidKeyCode.Back));

    /// <summary>Where the viewer's image is, and the window it's shown in, in pixels.</summary>
    public Task<ImageViewerLayoutSnapshot> ReadLayoutAsync() =>
        OnScreen.ReadAsync(driver, () => new ImageViewerLayoutSnapshot(
            Bounds(driver.FindElement(Image)),
            Bounds(driver.FindElement(Window))));

    private static Rectangle Bounds(OpenQA.Selenium.IWebElement element) => new(element.Location, element.Size);
}

/// <summary>Where the viewer's image is, and the window the viewer is shown in (the screen, but Android's bars), in pixels.</summary>
public sealed record ImageViewerLayoutSnapshot(Rectangle Image, Rectangle Window);
