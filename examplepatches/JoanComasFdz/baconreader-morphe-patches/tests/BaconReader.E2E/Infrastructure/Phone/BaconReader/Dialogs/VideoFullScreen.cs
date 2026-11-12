// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// The full screen "Full screen" over a comment's video opens ("Embed comment images"): the video on black, which the
/// patch names <c>baconreader_patches_video_full_screen</c>, with "Exit full screen" while the player's controls show.
/// The button or Back closes it.
/// </summary>
public sealed class VideoFullScreen(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Video = Locate.AppId("baconreader_patches_video_full_screen");
    private static readonly OpenQA.Selenium.By Window = Locate.AndroidId("content");

    /// <summary>Waits until the full screen is shown.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Video, TimeSpan.FromSeconds(10), "The video in full screen");

    /// <summary>Taps <paramref name="button"/>, found by what it says to a screen reader.</summary>
    public Task ClickAsync(VideoButton button) => OnScreen.PressAsync(driver, Locate.Description(button.ToShownText()));

    /// <summary>Closes the full screen with Android's Back.</summary>
    public Task ClickBackAsync() => OnScreen.PressBackAsync(driver);

    /// <summary>Waits until the full screen has closed.</summary>
    public Task WaitUntilClosedAsync() =>
        Waiting.UntilAsync(() => driver.FindElements(Video).Count == 0, TimeSpan.FromSeconds(10), "The video's full screen closing");

    /// <summary>Where the video is, and the window it's shown in, in pixels.</summary>
    public Task<VideoFullScreenLayoutSnapshot> ReadLayoutAsync() =>
        OnScreen.ReadAsync(driver, () => new VideoFullScreenLayoutSnapshot(
            Bounds(driver.FindElement(Video)),
            Bounds(driver.FindElement(Window))));

    private static Rectangle Bounds(OpenQA.Selenium.IWebElement element) => new(element.Location, element.Size);
}

/// <summary>Where the video is, and the window the full screen is shown in, in pixels.</summary>
public sealed record VideoFullScreenLayoutSnapshot(Rectangle Video, Rectangle Window);
