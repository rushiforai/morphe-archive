// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// A post's media in its detail view, under its title, which BaconReader shows only with "Show large image" on: an
/// image or a GIF in the media's view (<c>viewFlipper</c>); a video, playing, in its player (<c>videoView</c>, described
/// "Show player controls"); or, with "Video autoplay in detail view" off, the post's preview with a play button,
/// described "Play video".
/// </summary>
public sealed class DetailMedia(AndroidDriver driver)
{
    private static readonly By Media = Locate.AppId("viewFlipper");
    private static readonly By Video = Locate.AppId("videoView");
    private static readonly By PlayVideo = Locate.Description("Play video");

    /// <summary>Waits until the post's video plays in its player.</summary>
    public Task WaitUntilVideoPlaysAsync() =>
        Waiting.UntilShownAsync(driver, Video, TimeSpan.FromSeconds(15), "The post's video playing");

    /// <summary>Waits until the post shows its preview with "Play video".</summary>
    public Task WaitUntilPlayVideoShownAsync() =>
        Waiting.UntilShownAsync(driver, PlayVideo, TimeSpan.FromSeconds(10), "\"Play video\" over the post's preview");

    /// <summary>Waits until the post shows its media: an image or a GIF.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Media, TimeSpan.FromSeconds(10), "The post's media");

    /// <summary>Taps "Play video", which plays the video in its place.</summary>
    public Task ClickPlayVideoAsync() => OnScreen.PressAsync(driver, PlayVideo);

    /// <summary>What the post's media shows: a video playing, "Play video" over the preview, or neither (an image, a GIF).</summary>
    public Task<DetailMediaSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new DetailMediaSnapshot(
            Shown(Media) || Shown(Video) || Shown(PlayVideo),
            Shown(Video),
            Shown(PlayVideo)));

    private bool Shown(By view) => driver.FindElements(view).Any(found => found.Displayed);
}

/// <summary>
/// What a post's media shows in its detail view: whether it shows at all, a video playing in its player, "Play video"
/// over its preview.
/// </summary>
public sealed record DetailMediaSnapshot(bool Shown, bool PlaysAVideo, bool ShowsPlayVideo);
