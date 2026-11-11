// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The post's screen in its "Slide Show View", which the toolbar's "Slide Show View" switches to and "Detail View"
/// back from: the post's media over the whole screen. A link post shows "Tap to open link", then its page, in a web view
/// whose JavaScript "Improve post media loading" decides ("JavaScript in link posts"); BaconReader's own browser, which a
/// thumbnail opens, always runs JavaScript.
/// </summary>
public sealed class SlideShow(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By SlideShowViewButton = Locate.Description("Slide Show View");
    private static readonly OpenQA.Selenium.By DetailViewButton = Locate.Description("Detail View");
    private static readonly OpenQA.Selenium.By TapToOpenLink = Locate.Text("Tap to open link");
    private static readonly OpenQA.Selenium.By Page = Locate.AnyWebPage();
    private static readonly OpenQA.Selenium.By GalleryStrip = Locate.AppId("recyclerView");
    private static readonly OpenQA.Selenium.By GalleryThumbnail = Locate.AppId("imageView");
    private static readonly OpenQA.Selenium.By Video = Locate.AppId("videoView");
    private static readonly OpenQA.Selenium.By Card = Locate.AppId("headerContent");
    private static readonly OpenQA.Selenium.By PostText = Locate.AppId("selfText");
    // The scroll view "Fix slide show" puts an image post's text in.
    private static readonly OpenQA.Selenium.By PostTextScroll = Locate.AppId("baconreader_patches_post_text_scroll");
    // The sort bar's "Best", as high as the bar, which has no id: it sits under the card, in the post's page.
    private static readonly OpenQA.Selenium.By SortBar = Locate.AppId("sortTitle");
    private static readonly OpenQA.Selenium.By BottomBar = Locate.AppId("card_controls");

    /// <summary>Taps "Slide Show View" in the post's toolbar, which shows the post's media over the whole screen.</summary>
    public Task ClickSlideShowViewAsync() => OnScreen.PressAsync(driver, SlideShowViewButton);

    /// <summary>Waits until the toolbar offers "Detail View": the post's screen shows its slide show.</summary>
    public Task WaitUntilSlideShowShownAsync() =>
        Waiting.UntilShownAsync(driver, DetailViewButton, TimeSpan.FromSeconds(10), "The post's slide show");

    /// <summary>Waits until a link post shows "Tap to open link".</summary>
    public Task WaitUntilTapToOpenLinkShownAsync() =>
        Waiting.UntilShownAsync(driver, TapToOpenLink, TimeSpan.FromSeconds(10), "\"Tap to open link\"");

    /// <summary>Taps "Tap to open link", which loads the link post's page.</summary>
    public Task ClickTapToOpenLinkAsync() => OnScreen.PressAsync(driver, TapToOpenLink);

    /// <summary>Waits until the link post's page shows.</summary>
    public Task WaitUntilPageShownAsync() =>
        Waiting.UntilShownAsync(driver, Page, TimeSpan.FromSeconds(10), "The link post's page");

    /// <summary>Waits until a gallery shows, its strip of thumbnails under its image.</summary>
    public Task WaitUntilGalleryShownAsync() =>
        Waiting.UntilAsync(() => GalleryThumbnails() > 0, TimeSpan.FromSeconds(15), "The gallery");

    /// <summary>Waits until a video plays in the post's player.</summary>
    public Task WaitUntilVideoPlaysAsync() =>
        Waiting.UntilAsync(PlaysAVideo, TimeSpan.FromSeconds(15), "The video playing");

    /// <summary>What the slide show shows: a gallery's thumbnails in its strip (0 without a gallery), a video playing.</summary>
    public Task<SlideShowSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new SlideShowSnapshot(GalleryThumbnails()) { PlaysAVideo = PlaysAVideo() });

    /// <summary>Waits until an image, GIF or video post shows its text, under its media.</summary>
    public Task WaitUntilPostTextShownAsync() =>
        Waiting.UntilAsync(() => OnThisPost(PostText) is not null, TimeSpan.FromSeconds(10), "The post's text");

    /// <summary>Taps the post's text, which shows it whole ("...see more") or short again.</summary>
    public Task ClickPostTextAsync() => OnScreen.PressAsync(driver, () => OnThisPost(PostText) ?? throw new InvalidOperationException("The post shows no text."));

    /// <summary>Waits until the post's text shows whole: it no longer ends with "...see more".</summary>
    public Task WaitUntilPostTextExpandedAsync() =>
        Waiting.UntilAsync(
            () => OnThisPost(PostText) is { } text && !text.Text.TrimEnd().EndsWith("see more", StringComparison.Ordinal),
            TimeSpan.FromSeconds(10),
            "The post's text showing whole");

    /// <summary>Scrolls the post's text down, inside the post, until it can't scroll further.</summary>
    public Task ScrollPostTextToItsEndAsync() =>
        OnScreen.ActAsync(driver, PostTextScroll, scroll =>
        {
            for (var swipes = 0; ; swipes++)
            {
                if (swipes == 10)
                {
                    throw new InvalidOperationException("The post's text could still scroll after 10 swipes.");
                }

                var canScrollMore = OnScreen.ScrollGesture(driver, scroll, "down", 0.75);
                if (canScrollMore is false)
                {
                    return;
                }
            }
        });

    /// <summary>
    /// Where the post's card, its text and its gallery's thumbnails are, and the sort bar under the card and the bottom
    /// bar, in pixels. A view below the screen's bottom isn't on it: the sort bar is null when the card runs on behind the
    /// bottom bar.
    /// </summary>
    public Task<SlideShowLayoutSnapshot> ReadLayoutAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var text = OnThisPost(PostText);
            return new SlideShowLayoutSnapshot(
                BoundsOf(OnThisPost(Card) ?? throw new InvalidOperationException("The slide show shows no post.")),
                OnThisPost(SortBar) is { } sortBar ? BoundsOf(sortBar) : null,
                BoundsOf(driver.FindElement(BottomBar)))
            {
                PostText = text?.Text.Trim(),
                PostTextBounds = text is null ? null : BoundsOf(text),
                GalleryStrip = OnThisPost(GalleryStrip) is { } strip ? BoundsOf(strip) : null,
            };
        });

    /// <summary>Taps "Detail View" in the toolbar, which shows the post over its comments again.</summary>
    public Task ClickDetailViewAsync() => OnScreen.PressAsync(driver, DetailViewButton);

    /// <summary>Waits until the toolbar offers "Slide Show View" again: the post's screen is back in its detail view.</summary>
    public Task WaitUntilDetailViewShownAsync() =>
        Waiting.UntilShownAsync(driver, SlideShowViewButton, TimeSpan.FromSeconds(10), "The post's detail view");

    // The thumbnails in a gallery's strip, under the image it shows; 0 without a gallery.
    private int GalleryThumbnails() =>
        driver.FindElements(GalleryStrip).Where(strip => strip.Displayed).Sum(strip => strip.FindElements(GalleryThumbnail).Count);

    // The view on the post on the screen: the pager has the posts before and after it ready, to each side of the screen.
    private OpenQA.Selenium.IWebElement? OnThisPost(OpenQA.Selenium.By by) =>
        driver.FindElements(by).FirstOrDefault(view => view.Displayed && view.Location.X >= 0 && view.Location.X < 100);

    private static System.Drawing.Rectangle BoundsOf(OpenQA.Selenium.IWebElement view) => new(view.Location, view.Size);

    // Whether the post on the screen plays a video. The slide show is a pager that has the posts before and after it
    // ready, to each side of the screen: their players are left out.
    private bool PlaysAVideo() =>
        driver.FindElements(Video).Any(video => video.Displayed && video.Location.X >= 0 && video.Location.X < 100);
}

/// <summary>What the slide show shows: a gallery's thumbnails in its strip (0 without a gallery), a video playing.</summary>
public sealed record SlideShowSnapshot(int GalleryThumbnails)
{
    /// <summary>Whether the post on the screen plays a video in its player.</summary>
    public bool PlaysAVideo { get; init; }
}

/// <summary>
/// Where the slide show's post shows, in pixels: its card, the sort bar under it (null when it isn't on the screen) and
/// the bottom bar, and the post's text and its gallery's thumbnails, when it has them.
/// </summary>
public sealed record SlideShowLayoutSnapshot(System.Drawing.Rectangle Card, System.Drawing.Rectangle? SortBar, System.Drawing.Rectangle BottomBar)
{
    /// <summary>What the post's text says, or null without one.</summary>
    public string? PostText { get; init; }

    /// <summary>Where the post's text shows, or null without one.</summary>
    public System.Drawing.Rectangle? PostTextBounds { get; init; }

    /// <summary>Where the gallery's strip of thumbnails shows, or null without a gallery.</summary>
    public System.Drawing.Rectangle? GalleryStrip { get; init; }
}
