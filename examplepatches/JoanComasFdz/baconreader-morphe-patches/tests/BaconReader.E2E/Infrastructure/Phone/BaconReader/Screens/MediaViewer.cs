// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The screen a post's thumbnail opens, in the list view or in a post's header (BrowserActivity): the post's media, an image, a GIF, a video, a
/// gallery or a web page, under a toolbar with "More options". While the media loads, "Improve post media loading"
/// draws a loading bar over it, which isn't in the screen's tree: the media's view (<c>viewFlipper</c>) is described
/// "Loading media" then, with its size once known ("Loading media, GIF · 0.4 MB"), or "Media failed to load".
/// </summary>
public sealed class MediaViewer(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Media = Locate.AppId("viewFlipper");
    private static readonly OpenQA.Selenium.By MoreOptionsButton = Locate.Description("More options");
    // A short page, which doesn't scroll.
    private static readonly OpenQA.Selenium.By Page = Locate.AnyWebPage();
    private static readonly OpenQA.Selenium.By GalleryStrip = Locate.AppId("recyclerView");
    private static readonly OpenQA.Selenium.By GalleryThumbnail = Locate.AppId("imageView");
    private static readonly OpenQA.Selenium.By Video = Locate.AppId("videoView");
    // An image, zoomable, in the media's view.
    private static readonly OpenQA.Selenium.By Image = Locate.AppId("subsamplingScaleImageContainer");
    // The toolbar's title: the host of the post's link ("127.0.0.1", "v.redd.it").
    private static readonly OpenQA.Selenium.By ToolbarTitle = Locate.AppId("toolbarTitle");
    // A gallery's arrows, at each side of its image: the first image shows only the one after, the last only the one
    // before.
    private static readonly OpenQA.Selenium.By GalleryBack = Locate.AppId("backButton");
    private static readonly OpenQA.Selenium.By GalleryForward = Locate.AppId("forwardButton");
    // BaconReader's message in place of media it can't show: "Improve post media loading" says so for a RedGIFs video
    // that was deleted, "This RedGIFs video was deleted", or that RedGIFs never had, "This RedGIFs video was not found".
    private static readonly OpenQA.Selenium.By Message = Locate.AppId("errorText");

    private const string Loading = "Loading media";
    private const string Failed = "Media failed to load";

    /// <summary>The menu "More options" opens: "Save".</summary>
    public OverflowMenu MoreOptions { get; } = new(driver);

    /// <summary>Waits until the screen shows the media's view.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Media, TimeSpan.FromSeconds(10), "The post's media");

    /// <summary>Waits until the media shows its loading bar with its size: "Loading media, …".</summary>
    public Task WaitUntilLoadingWithSizeShownAsync() =>
        Waiting.UntilAsync(() => LoadingState()?.StartsWith(Loading + ", ", StringComparison.Ordinal) == true, TimeSpan.FromSeconds(10), "The media's loading bar with its size");

    /// <summary>Waits until the media's loading bar is gone: the media arrived (a GIF comes 8 seconds late at most).</summary>
    public Task WaitUntilLoadedAsync() =>
        Waiting.UntilAsync(() => driver.FindElements(Media).Count > 0 && LoadingState() is null, TimeSpan.FromSeconds(20), "The media's loading bar gone");

    /// <summary>Waits until the media's loading bar shows the media failed: "Media failed to load".</summary>
    public Task WaitUntilLoadingFailedAsync() =>
        Waiting.UntilAsync(() => LoadingState() == Failed, TimeSpan.FromSeconds(20), "The media's loading bar failed");

    /// <summary>Waits until the gallery shows, its strip of thumbnails under its image, its loading bar gone.</summary>
    public Task WaitUntilGalleryShownAsync() =>
        Waiting.UntilAsync(() => GalleryThumbnails() > 0 && LoadingState() is null, TimeSpan.FromSeconds(10), "The gallery");

    /// <summary>
    /// Waits until the gallery shows its image <paramref name="position"/> of <paramref name="count"/>: its image over
    /// <paramref name="count"/> thumbnails, with the arrows that image shows.
    /// </summary>
    public Task WaitUntilGalleryImageShownAsync(int position, int count) =>
        Waiting.UntilAsync(
            () => GalleryThumbnails() == count && GalleryArrowShown(GalleryBack) == position > 1 && GalleryArrowShown(GalleryForward) == position < count,
            TimeSpan.FromSeconds(10),
            $"The gallery's image {position} of {count}");

    /// <summary>Swipes left on the gallery's image ("Swipe through albums"), which goes to the image after.</summary>
    public Task SwipeLeftOnTheImageAsync() => OnScreen.DoAsync(driver, () => AlbumGestures.Swipe(driver, GalleryImage(), toTheLeft: true));

    /// <summary>Swipes right on the gallery's image ("Swipe through albums"), which goes to the image before.</summary>
    public Task SwipeRightOnTheImageAsync() => OnScreen.DoAsync(driver, () => AlbumGestures.Swipe(driver, GalleryImage(), toTheLeft: false));

    /// <summary>Zooms in on the gallery's image, two fingers moving apart.</summary>
    public Task ZoomInOnTheImageAsync() => OnScreen.DoAsync(driver, () => AlbumGestures.ZoomIn(driver, GalleryImage()));

    /// <summary>Waits until a video plays in the media's player.</summary>
    public Task WaitUntilVideoPlaysAsync() =>
        Waiting.UntilShownAsync(driver, Video, TimeSpan.FromSeconds(15), "The video playing");

    /// <summary>Waits until the media shows an image.</summary>
    public Task WaitUntilImageShownAsync() =>
        Waiting.UntilShownAsync(driver, Image, TimeSpan.FromSeconds(15), "The image");

    /// <summary>Waits until the media shows the message "<paramref name="text"/>" in its place.</summary>
    public Task WaitUntilMessageShownAsync(string text) =>
        Waiting.UntilAsync(() => ShownMessage() == text, TimeSpan.FromSeconds(15), $"The message \"{text}\"");

    /// <summary>Waits until the screen shows a web page, a link post's.</summary>
    public Task WaitUntilPageShownAsync() =>
        Waiting.UntilShownAsync(driver, Page, TimeSpan.FromSeconds(10), "The link post's web page");

    /// <summary>Taps Android's Back, which closes the media and goes back to where it was opened from.</summary>
    public Task ClickBackAsync() => OnScreen.PressBackAsync(driver);

    /// <summary>Taps "More options" in the toolbar, which opens its menu.</summary>
    public Task ClickMoreOptionsAsync() => OnScreen.PressAsync(driver, MoreOptionsButton);

    /// <summary>What the media shows: its loading bar's state, and a gallery's thumbnails in its strip.</summary>
    public Task<MediaViewerSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new MediaViewerSnapshot(LoadingState(), GalleryThumbnails())
        {
            ShowsGalleryBack = GalleryArrowShown(GalleryBack),
            ShowsGalleryForward = GalleryArrowShown(GalleryForward),
            PlaysAVideo = driver.FindElements(Video).Any(video => video.Displayed),
            Message = ShownMessage(),
            ShowsAnImage = driver.FindElements(Image).Any(image => image.Displayed),
            ShowsAPage = driver.FindElements(Page).Any(page => page.Displayed),
            Title = driver.FindElements(ToolbarTitle).FirstOrDefault(title => title.Displayed)?.Text,
        });

    // The description of the media's view on the screen, while the loading bar shows; null without one. The viewer is a
    // pager that has the posts before and after it ready, to each side of the screen: their media's views are left out.
    private string? LoadingState() =>
        driver.FindElements(Media).Where(media => media.Displayed && Math.Abs(media.Location.X) < 10)
            .Select(media => media.GetAttribute("content-desc")).FirstOrDefault(state => state is { Length: > 0 });

    // The message shown in the media's place; null without one.
    private string? ShownMessage() =>
        driver.FindElements(Message).Where(message => message.Displayed).Select(message => message.Text).FirstOrDefault(text => text is { Length: > 0 });

    // Whether the gallery on the screen shows the arrow: the pager's posts before and after, to each side of the screen,
    // have theirs too.
    private bool GalleryArrowShown(OpenQA.Selenium.By arrow) =>
        driver.FindElements(arrow).Any(view => view.Displayed && view.Location.X >= 0 && view.Location.X < driver.Manage().Window.Size.Width);

    // The gallery's image on the screen: the media's view above its strip of thumbnails.
    private Rectangle GalleryImage()
    {
        var media = driver.FindElements(Media).First(view => view.Displayed && Math.Abs(view.Location.X) < 10);
        var strip = driver.FindElements(GalleryStrip).First(view => view.Displayed && Math.Abs(view.Location.X) < 10);
        return Rectangle.FromLTRB(media.Location.X, media.Location.Y, media.Location.X + media.Size.Width, strip.Location.Y);
    }

    // The thumbnails in a gallery's strip, under the image it shows; 0 without a gallery.
    private int GalleryThumbnails() =>
        driver.FindElements(GalleryStrip).Where(strip => strip.Displayed).Sum(strip => strip.FindElements(GalleryThumbnail).Count);
}

/// <summary>
/// What the media viewer shows: the media's loading bar ("Loading media, GIF · 0.4 MB", "Media failed to load"; null
/// when none shows), and a gallery's thumbnails in its strip (0 without a gallery).
/// </summary>
public sealed record MediaViewerSnapshot(string? Loading, int GalleryThumbnails)
{
    /// <summary>Whether the media's player shows a video.</summary>
    public bool PlaysAVideo { get; init; }

    /// <summary>The message shown in the media's place ("This RedGIFs video was deleted"); null without one.</summary>
    public string? Message { get; init; }

    /// <summary>Whether a gallery shows its arrow to the image before: every image but the first.</summary>
    public bool ShowsGalleryBack { get; init; }

    /// <summary>Whether a gallery shows its arrow to the image after: every image but the last.</summary>
    public bool ShowsGalleryForward { get; init; }

    /// <summary>Whether the media shows an image.</summary>
    public bool ShowsAnImage { get; init; }

    /// <summary>Whether the screen shows a web page.</summary>
    public bool ShowsAPage { get; init; }

    /// <summary>The toolbar's title, the host of the post's link ("127.0.0.1"); null without one.</summary>
    public string? Title { get; init; }
}
