// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// BaconReader's Imgur album viewer (ImgurGalleryViewer), which "imgur.com" in an Imgur album post's header opens: one
/// image of the album, or its video playing, over a strip of the album's thumbnails, each marked with a play badge when it
/// is a video. An arrow at each side goes to the image before and after: the first image shows only the one after, the
/// last only the one before.
/// </summary>
public sealed class ImgurGalleryViewer(AndroidDriver driver)
{
    private static readonly By Strip = Locate.AppId("recyclerView");
    private static readonly By Image = Locate.AppId("imageView");
    private static readonly By VideoMark = Locate.AppId("playView");
    private static readonly By Player = Locate.AppId("player_view");
    private static readonly By Back = Locate.AppId("backButton");
    private static readonly By Forward = Locate.AppId("forwardButton");
    private static readonly By Thumbnail = Locate.AppId("imageContainer");

    /// <summary>
    /// Waits until the album shows its image <paramref name="position"/> of <paramref name="count"/>: the image over
    /// <paramref name="count"/> thumbnails, with the arrows that image shows.
    /// </summary>
    public Task WaitUntilImageShownAsync(int position, int count) =>
        Waiting.UntilAsync(
            () => Read() is var viewer && viewer.ShowsImage && viewer.Thumbnails == count && viewer.ShowsBack == position > 1 && viewer.ShowsForward == position < count,
            TimeSpan.FromSeconds(10),
            $"The Imgur album's image {position} of {count}");

    /// <summary>Waits until the album plays its video.</summary>
    public Task WaitUntilVideoPlaysAsync() =>
        Waiting.UntilShownAsync(driver, Player, TimeSpan.FromSeconds(10), "The Imgur album's video playing");

    /// <summary>Taps the arrow to the image after.</summary>
    public Task ClickNextAsync() => OnScreen.PressAsync(driver, Forward);

    /// <summary>Taps Android's Back, which closes the album and goes back to the post.</summary>
    public Task ClickBackAsync() => OnScreen.DoAsync(driver, () => driver.PressKeyCode(OpenQA.Selenium.Appium.Android.Enums.AndroidKeyCode.Back));

    /// <summary>What the album shows: its image or its video, its thumbnails and their play badges, and its arrows.</summary>
    public Task<ImgurGalleryViewerSnapshot> ReadAsync() => OnScreen.ReadAsync(driver, Read);

    private ImgurGalleryViewerSnapshot Read()
    {
        var strip = driver.FindElements(Strip).FirstOrDefault();
        var top = strip?.Location.Y ?? int.MaxValue;
        // The album's image is the image above the strip; the strip's thumbnails are images too.
        var image = driver.FindElements(Image).Any(view => view.Location.Y + view.Size.Height <= top && view.Size.Height > 0);
        return new ImgurGalleryViewerSnapshot(
            strip?.FindElements(Thumbnail).Count ?? 0,
            strip?.FindElements(VideoMark).Count ?? 0,
            image,
            driver.FindElements(Player).Count > 0,
            driver.FindElements(Back).Count > 0,
            driver.FindElements(Forward).Count > 0);
    }
}

/// <summary>
/// What the Imgur album viewer shows: how many thumbnails, how many of them marked as a video, whether it shows an image
/// or plays a video, and which arrows it shows.
/// </summary>
public sealed record ImgurGalleryViewerSnapshot(int Thumbnails, int VideoThumbnails, bool ShowsImage, bool PlaysVideo, bool ShowsBack, bool ShowsForward);
