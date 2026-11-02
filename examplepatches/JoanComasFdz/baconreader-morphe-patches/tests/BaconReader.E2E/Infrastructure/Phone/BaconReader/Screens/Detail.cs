// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using System.Drawing;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Interactions;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>The screen a post opens on (DetailActivity): the post, then its comments.</summary>
public sealed class Detail(AndroidDriver driver)
{
    private static readonly By Loading = Locate.Text("Loading...");
    private static readonly By Upvote = Locate.AppId("upvote_left");
    private static readonly By Downvote = Locate.AppId("downvote_left");
    private static readonly By CommentHeader = Locate.AppId("commentSubText");

    /// <summary>A text post's text, under its title.</summary>
    public PostText PostText { get; } = new(driver);

    /// <summary>The post's comments, under the post and the sort bar.</summary>
    public Comments Comments { get; } = new(driver);

    /// <summary>The bar over the comments: their sort, "Search comments" and "COLLAPSE ALL".</summary>
    public SortBar SortBar { get; } = new(driver);

    /// <summary>The find bar "Search comments" opens over the sort bar.</summary>
    public CommentSearchBar CommentSearch { get; } = new(driver);

    /// <summary>
    /// Taps the up arrow of the bar at the bottom while the comments still load ("Loading..."), which upvotes the post,
    /// or takes its upvote back. Fails when the comments loaded before the tap: the vote wasn't made while they load.
    /// </summary>
    public Task UpvoteWhileTheCommentsLoadAsync() => VoteWhileTheCommentsLoadAsync(Upvote, "upvote");

    /// <summary>
    /// Taps the down arrow of the bar at the bottom while the comments still load ("Loading..."), which downvotes the
    /// post. Fails when the comments loaded before the tap.
    /// </summary>
    public Task DownvoteWhileTheCommentsLoadAsync() => VoteWhileTheCommentsLoadAsync(Downvote, "downvote");

    private async Task VoteWhileTheCommentsLoadAsync(By arrow, string vote)
    {
        await Waiting.UntilShownAsync(driver, Loading, TimeSpan.FromSeconds(10), "\"Loading...\" while the post's comments load");
        await OnScreen.PressAsync(driver, arrow);
        if (driver.FindElements(CommentHeader).Count > 0)
        {
            throw new InvalidOperationException($"The comments loaded before the {vote}: Reddit answered them too soon for the vote to be made while they load.");
        }
    }
}

/// <summary>
/// A text post's text, under its title, and with "Embed comment images" the images under it (views the patch makes and
/// names <c>baconreader_patches_comment_image</c>, as a comment's).
/// </summary>
public sealed class PostText(AndroidDriver driver)
{
    private static readonly By Text = Locate.AppId("quickSelfText");

    /// <summary>Waits until the post's text shows an image, loaded: its view is empty, and so hidden, until then.</summary>
    public Task WaitUntilMediaShownAsync() =>
        Waiting.UntilAsync(
            () => driver.FindElements(Text).Any(text => text.Displayed) && Media.Images(PostImages(driver)).Count > 0,
            TimeSpan.FromSeconds(10),
            "An image under the post's text loading");

    /// <summary>What the post's text shows: its text, and how many images under it.</summary>
    public Task<PostTextSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new PostTextSnapshot(
            driver.FindElement(Text).Text.Trim(),
            Media.Images(PostImages(driver)).Count));

    /// <summary>Where the post's text and its first image are on the screen, in pixels.</summary>
    public Task<PostTextLayoutSnapshot> ReadLayoutAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var image = Media.Images(PostImages(driver)).FirstOrDefault();
            return new PostTextLayoutSnapshot(Bounds(driver.FindElement(Text)), image is null ? null : Bounds(image));
        });

    /// <summary>What the tables of the post's text show.</summary>
    public Task<TableSnapshot> ReadTableAsync() => OnScreen.ReadAsync(driver, () => Tables.Read(driver.FindElement(Text)));

    /// <summary>Where the cells of the post's table show.</summary>
    public Task<TableLayoutSnapshot> ReadTableLayoutAsync() =>
        OnScreen.ReadAsync(driver, () => Tables.ReadLayout(driver.FindElement(Text), driver.Manage().Window.Size.Width));

    /// <summary>Waits until the post's text shows a table's cells.</summary>
    public Task WaitUntilTableShownAsync() =>
        Waiting.UntilAsync(
            () => driver.FindElements(Text).FirstOrDefault() is { } text && Tables.HasCells(text),
            TimeSpan.FromSeconds(10),
            "A table in the post's text");

    private static Rectangle Bounds(IWebElement element) => new(element.Location, element.Size);

    // The images that aren't under a comment.
    private static IReadOnlyCollection<IWebElement> PostImages(AndroidDriver driver)
    {
        var inComments = driver.FindElements(Comments.Comment).SelectMany(comment => comment.FindElements(Media.Image)).Select(Id).ToHashSet();
        return [.. driver.FindElements(Media.Image).Where(image => !inComments.Contains(Id(image)))];
    }

    private static string Id(IWebElement element) => ((AppiumElement)element).Id;
}

/// <summary>What a post's text shows: its text, and how many images under it.</summary>
public sealed record PostTextSnapshot(string Text, int Images);

/// <summary>Where a post's text and its first image (null without one) are on the screen, in pixels.</summary>
public sealed record PostTextLayoutSnapshot(Rectangle Text, Rectangle? Image);

/// <summary>
/// The comments of the post shown, each named by its text (what it says before its media, which shows under it), and with "Embed comment images" the GIFs, images and videos
/// under it: views the patch makes and names <c>baconreader_patches_comment_gif</c>, <c>baconreader_patches_comment_image</c>
/// and <c>baconreader_patches_comment_video</c>. A tap on an image switches it between full width and 200×200, a double
/// tap opens it in full screen (<see cref="Dialogs.ImageViewer"/>), a long press saves it; a tap on a video plays it,
/// in ExoPlayer's player, whose controls show when it ends.
/// </summary>
public sealed class Comments(AndroidDriver driver)
{
    /// <summary>A comment: its text and what the patch shows under it.</summary>
    internal static readonly By Comment = Locate.AppId("commentBodyContainer");

    private static readonly By List = Locate.AppId("listView");
    private static readonly By Header = Locate.AppId("commentSubText");
    private static readonly By Text = Locate.AppId("commentBody");
    private static readonly By Position = Locate.AppId("exo_position");
    private static readonly By Duration = Locate.AppId("exo_duration");
    private static readonly By HiddenComments = Locate.AppId("hiddenComments");

    // A "load more comments" row, whose id the main screen's lists use too.
    private static readonly By LoadMore = Locate.AppId("text");
    private static readonly By Loading = Locate.Text("Loading...");

    // Where the image of each comment was before a tap, to see it change.
    private readonly Dictionary<string, Rectangle> imageBefore = [];
    private double? density;

    /// <summary>
    /// Waits until a comment shows (Reddit takes a moment to answer): its header, the author and score, which every
    /// comment shows.
    /// </summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Header, TimeSpan.FromSeconds(10), "A comment of the post");

    /// <summary>Waits until the comment "<paramref name="text"/>" shows: Reddit's answer can come late.</summary>
    public Task WaitUntilCommentShownAsync(string text) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText("commentBody", text), TimeSpan.FromSeconds(30), $"The comment \"{text}\"");

    /// <summary>
    /// Scrolls the comments until the comment "<paramref name="text"/>" shows whole, between the sort bar and
    /// the buttons at the bottom.
    /// </summary>
    public async Task ScrollToCommentAsync(string text)
    {
        for (var scrolls = 0; ; scrolls++)
        {
            var direction = await Task.Run(() => WhereIs(text));
            if (direction is null)
            {
                return;
            }

            if (scrolls == 15)
            {
                throw new InvalidOperationException($"The comment \"{text}\" didn't show whole after scrolling 15 times.");
            }

            await OnScreen.DoAsync(driver, () => driver.ExecuteScript("mobile: scrollGesture", new Dictionary<string, object>
            {
                ["elementId"] = ((AppiumElement)driver.FindElement(List)).Id,
                ["direction"] = direction,
                ["percent"] = 0.3,
            }));
        }
    }

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" shows a GIF, an image or a video under it,
    /// loaded: an image's view is empty, and so hidden, until then.
    /// </summary>
    public Task WaitUntilMediaShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment
                && Media.Gifs(comment).Count + Media.Images(comment.FindElements(Media.Image)).Count + Media.Videos(comment).Count > 0,
            TimeSpan.FromSeconds(30),
            $"A GIF, an image or a video under the comment \"{text}\" loading");

    /// <summary>What the comment "<paramref name="text"/>" shows: its text, and its GIFs, images and videos.</summary>
    public Task<CommentSnapshot> ReadAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comment = FindCommentOrFail(text);
            return new CommentSnapshot(
                comment.FindElements(Text).FirstOrDefault()?.Text.Trim() ?? "",
                Media.Gifs(comment).Count,
                Media.Images(comment.FindElements(Media.Image)).Count,
                Media.Videos(comment).Count);
        });

    /// <summary>
    /// Where the comment "<paramref name="text"/>" and its image are on the screen, in pixels, and the
    /// screen's pixels per dp.
    /// </summary>
    public Task<CommentLayoutSnapshot> ReadLayoutAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comment = FindCommentOrFail(text);
            var image = Media.Images(comment.FindElements(Media.Image)).Concat(Media.Gifs(comment)).FirstOrDefault();
            return new CommentLayoutSnapshot(Bounds(comment), image is null ? null : Bounds(image), Density());
        });

    /// <summary>Taps the image of the comment "<paramref name="text"/>".</summary>
    public Task ClickImageAsync(string text) =>
        OnScreen.PressAsync(driver, () =>
        {
            var image = ImageOf(text);
            imageBefore[text] = Bounds(image);
            return image;
        });

    /// <summary>
    /// Waits until the image of the comment "<paramref name="text"/>" has changed its size since the last
    /// tap on it, and stopped changing.
    /// </summary>
    public Task WaitUntilImageResizedAsync(string text)
    {
        var before = imageBefore.GetValueOrDefault(text);
        Rectangle? last = null;
        return Waiting.UntilAsync(
            () =>
            {
                var now = Bounds(ImageOf(text));
                var settled = now != before && now == last;
                last = now;
                return settled;
            },
            TimeSpan.FromSeconds(10),
            $"The image of the comment \"{text}\" changing its size");
    }

    /// <summary>
    /// Double taps the image of the comment "<paramref name="text"/>": two taps close enough for Android to
    /// tell them from two single taps (W3C actions, as UiAutomator2's own double click was too slow for it).
    /// </summary>
    public Task DoubleClickImageAsync(string text) =>
        OnScreen.TouchAsync(driver, () => ImageOf(text), image =>
        {
            var bounds = Bounds(image);
            var center = new Point(bounds.X + (bounds.Width / 2), bounds.Y + (bounds.Height / 2));
            var finger = new PointerInputDevice(PointerKind.Touch, "finger");
            var taps = new ActionSequence(finger, 0);
            taps.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, center.X, center.Y, TimeSpan.Zero));
            taps.AddAction(finger.CreatePointerDown(MouseButton.Touch));
            taps.AddAction(finger.CreatePause(TimeSpan.FromMilliseconds(40)));
            taps.AddAction(finger.CreatePointerUp(MouseButton.Touch));
            taps.AddAction(finger.CreatePause(TimeSpan.FromMilliseconds(60)));
            taps.AddAction(finger.CreatePointerDown(MouseButton.Touch));
            taps.AddAction(finger.CreatePause(TimeSpan.FromMilliseconds(40)));
            taps.AddAction(finger.CreatePointerUp(MouseButton.Touch));
            driver.PerformActions([taps]);
        });

    /// <summary>Long presses the image of the comment "<paramref name="text"/>".</summary>
    public Task LongClickImageAsync(string text) =>
        OnScreen.TouchAsync(driver, () => ImageOf(text), image => driver.ExecuteScript("mobile: longClickGesture", new Dictionary<string, object>
        {
            ["elementId"] = ((AppiumElement)image).Id,
        }));

    /// <summary>Taps the video of the comment "<paramref name="text"/>", which plays it.</summary>
    public Task ClickVideoAsync(string text) =>
        OnScreen.PressAsync(driver, () => FindCommentOrFail(text).FindElement(Media.Video));

    /// <summary>
    /// Waits until the video of the comment "<paramref name="text"/>" has ended: its player shows its
    /// controls, with its position at its length.
    /// </summary>
    public Task WaitUntilVideoEndedAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment
                && comment.FindElements(Position).FirstOrDefault()?.Text is { Length: > 0 } position
                && position == comment.FindElements(Duration).FirstOrDefault()?.Text,
            TimeSpan.FromSeconds(30),
            $"The video of the comment \"{text}\" playing to its end");

    /// <summary>What the player of the comment "<paramref name="text"/>" shows: its position and its length.</summary>
    public Task<VideoSnapshot> ReadVideoAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comment = FindCommentOrFail(text);
            return new VideoSnapshot(
                comment.FindElements(Position).FirstOrDefault()?.Text.Trim() ?? "",
                comment.FindElements(Duration).FirstOrDefault()?.Text.Trim() ?? "");
        });

    /// <summary>
    /// What the comments on the screen show, top to bottom: each comment's text and how far it is indented, and each
    /// "load more comments" among them.
    /// </summary>
    public Task<CommentsSnapshot> ReadShownAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comments = driver.FindElements(Text).Select(text => (text.Location.Y, Shown: new ShownComment(text.Text.Trim(), text.Location.X, IsLoadMore: false)));
            var loadMores = driver.FindElements(LoadMore)
                .Where(row => row.Text.StartsWith("load more comments", StringComparison.Ordinal))
                .Select(row => (row.Location.Y, Shown: new ShownComment(row.Text.Trim(), row.Location.X, IsLoadMore: true)));
            return new CommentsSnapshot([.. comments.Concat(loadMores).OrderBy(found => found.Y).Select(found => found.Shown)]);
        });

    /// <summary>
    /// Scrolls the comments to their end, a fling at a time, until they move no more: the list loads the comments it
    /// hasn't yet as it gets there, showing "Loading..." at its end meanwhile, which takes seconds when they come
    /// from their threads.
    /// </summary>
    public Task ScrollToTheEndAsync() =>
        OnScreen.DoAsync(driver, () =>
        {
            var flings = 0;
            do
            {
                while (FlingDown())
                {
                    if (++flings == 200)
                    {
                        throw new InvalidOperationException("The comments didn't reach their end after 200 flings.");
                    }
                }
            }
            while (LoadedItsEnd());
        });

    /// <summary>Taps "<paramref name="loadMore"/>", which loads the comments it hides.</summary>
    public Task ClickLoadMoreAsync(string loadMore) =>
        OnScreen.PressAsync(driver, () => driver.FindElement(Locate.AppIdWithText("text", loadMore)));

    /// <summary>Waits until the comment "<paramref name="text"/>" shows "<paramref name="loadMore"/>" under it.</summary>
    public Task WaitUntilLoadMoreShownAsync(string loadMore) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText("text", loadMore), TimeSpan.FromSeconds(10), $"\"{loadMore}\"");

    /// <summary>Waits until the comment "<paramref name="text"/>" shows a table's cells.</summary>
    public Task WaitUntilTableShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(text) is not null && Tables.HasCells(TextOf(text)),
            TimeSpan.FromSeconds(10),
            $"A table in the comment \"{text}\"");

    /// <summary>What the tables of the comment "<paramref name="text"/>" show.</summary>
    public Task<TableSnapshot> ReadTableAsync(string text) =>
        OnScreen.ReadAsync(driver, () => Tables.Read(TextOf(text)));

    /// <summary>Where the cells of the table of the comment "<paramref name="text"/>" show.</summary>
    public Task<TableLayoutSnapshot> ReadTableLayoutAsync(string text) =>
        OnScreen.ReadAsync(driver, () => Tables.ReadLayout(TextOf(text), driver.Manage().Window.Size.Width));

    /// <summary>Taps <paramref name="button"/> under the table of the comment "<paramref name="text"/>".</summary>
    public Task ClickTableButtonAsync(string text, TableButton button) =>
        OnScreen.PressAsync(driver, () =>
            Tables.Buttons(TextOf(text)).FirstOrDefault(found => found.Text == button.ToShownText())
            ?? throw new InvalidOperationException($"The table of the comment \"{text}\" shows no \"{button.ToShownText()}\"."));

    /// <summary>Waits until the table of the comment "<paramref name="text"/>" shows <paramref name="button"/>.</summary>
    public Task WaitUntilTableButtonShownAsync(string text, TableButton button) =>
        Waiting.UntilAsync(
            () => FindComment(text) is not null && Tables.Buttons(TextOf(text)).Any(found => found.Text == button.ToShownText()),
            TimeSpan.FromSeconds(10),
            $"\"{button.ToShownText()}\" under the table of the comment \"{text}\"");

    /// <summary>
    /// Swipes the table of the comment "<paramref name="text"/>" to the left, from near its right edge to near its left
    /// one, along its first row: an expanded table scrolls sideways.
    /// </summary>
    public Task SwipeTableLeftAsync(string text) =>
        OnScreen.TouchAsync(driver, () => Tables.FirstCell(TextOf(text)) ?? throw new InvalidOperationException($"The table of the comment \"{text}\" shows no cell."), cell =>
        {
            var row = Bounds(cell);
            var table = Bounds(TextOf(text));
            var y = row.Top + (row.Height / 2);
            var finger = new PointerInputDevice(PointerKind.Touch, "finger");
            var swipe = new ActionSequence(finger, 0);
            swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, table.Right - 40, y, TimeSpan.Zero));
            swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
            swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, table.Left + 40, y, TimeSpan.FromMilliseconds(600)));
            swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
            driver.PerformActions([swipe]);
        });

    /// <summary>Waits until the table of the comment "<paramref name="text"/>" shows the cell "<paramref name="cell"/>" whole.</summary>
    public Task WaitUntilTableCellShownAsync(string text, string cell) =>
        Waiting.UntilAsync(
            () => FindComment(text) is not null && Tables.FindCell(TextOf(text), cell) is { } found
                && Bounds(found).Right < Bounds(TextOf(text)).Right,
            TimeSpan.FromSeconds(10),
            $"The cell \"{cell}\" of the table of the comment \"{text}\"");

    /// <summary>Taps the link "<paramref name="link"/>" in a cell of the table of the comment "<paramref name="text"/>".</summary>
    public Task ClickTableLinkAsync(string text, string link) =>
        OnScreen.PressAsync(driver, () => Tables.FindCell(TextOf(text), link)
            ?? throw new InvalidOperationException($"The table of the comment \"{text}\" has no cell \"{link}\"."));

    /// <summary>Taps the text of the comment "<paramref name="text"/>", at its start: a spoiler there shows, or hides.</summary>
    public Task ClickTextAsync(string text) =>
        OnScreen.TouchAsync(driver, () => TextOf(text), body =>
        {
            var bounds = Bounds(body);
            driver.ExecuteScript("mobile: clickGesture", new Dictionary<string, object>
            {
                ["x"] = bounds.Left + 30,
                ["y"] = bounds.Top + (bounds.Height / 2),
            });
        });

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" reads its text to accessibility, every spoiler of it shown:
    /// "Hide formatted spoilers" has it read a hidden one as "spoiler".
    /// </summary>
    public Task WaitUntilSpoilersShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment && string.IsNullOrEmpty(comment.FindElements(Text).FirstOrDefault()?.GetAttribute("content-desc")),
            TimeSpan.FromSeconds(10),
            $"The spoilers of the comment \"{text}\" showing");

    /// <summary>What the comment "<paramref name="text"/>" reads as to accessibility: its text, or with a hidden spoiler "spoiler" in its place.</summary>
    public Task<CommentReadingSnapshot> ReadReadingAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var body = TextOf(text);
            var description = body.GetAttribute("content-desc");
            return new CommentReadingSnapshot(body.Text.Trim(), string.IsNullOrEmpty(description) ? body.Text.Trim() : description);
        });

    /// <summary>What the comment "<paramref name="text"/>" shows under it when collapsed: "1 hidden comment", or null.</summary>
    public Task<CollapsedCommentSnapshot> ReadCollapsedAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comment = Bounds(FindCommentOrFail(text));
            var next = driver.FindElements(Header).Select(Bounds).Where(header => header.Top > comment.Bottom).Select(header => header.Top).DefaultIfEmpty(int.MaxValue).Min();
            var hidden = driver.FindElements(HiddenComments).FirstOrDefault(row => Bounds(row).Top >= comment.Bottom - 10 && Bounds(row).Top < next);
            return new CollapsedCommentSnapshot(text, hidden?.Text.Trim());
        });

    /// <summary>Waits until the comment "<paramref name="text"/>" shows how many comments it hides.</summary>
    public Task WaitUntilCollapsedAsync(string text) =>
        Waiting.UntilShownAsync(driver, HiddenComments, TimeSpan.FromSeconds(10), $"The comments the comment \"{text}\" hides");

    private IWebElement TextOf(string text) =>
        FindCommentOrFail(text).FindElements(Text).FirstOrDefault() ?? throw new InvalidOperationException($"The comment \"{text}\" shows no text.");

    // Whether the list scrolled: false at its end.
    // How long the end of the list may take to load its next comments: 50 threads, one at a time.
    private static readonly TimeSpan EndLoad = TimeSpan.FromSeconds(60);

    // Whether the list was loading comments at its end ("Loading..."): then it waits until they are in.
    private bool LoadedItsEnd()
    {
        if (driver.FindElements(Loading).Count == 0)
        {
            return false;
        }

        var until = DateTimeOffset.UtcNow + EndLoad;
        while (driver.FindElements(Loading).Count > 0)
        {
            if (DateTimeOffset.UtcNow > until)
            {
                throw new InvalidOperationException($"The comments kept loading at their end for {EndLoad.TotalSeconds} s.");
            }

            Thread.Sleep(500);
        }

        return true;
    }

    private bool FlingDown() =>
        driver.ExecuteScript("mobile: flingGesture", new Dictionary<string, object>
        {
            ["elementId"] = ((AppiumElement)driver.FindElement(List)).Id,
            ["direction"] = "down",
            ["speed"] = 7500,
        }) is true;

    // The comment whose text is the given text, or else the one whose text starts with it: with the patch's images or
    // videos off, a comment shows the link under its text.
    private IWebElement? FindComment(string text)
    {
        var shown = driver.FindElements(Comment).Select(comment => (comment, text: comment.FindElements(Text).FirstOrDefault()?.Text.Trim() ?? "")).ToList();
        return shown.FirstOrDefault(found => found.text == text).comment
            ?? shown.FirstOrDefault(found => found.text.StartsWith(text + "\n", StringComparison.Ordinal)).comment;
    }

    private IWebElement FindCommentOrFail(string text) =>
        FindComment(text) ?? throw new InvalidOperationException($"The comment \"{text}\" isn't on the screen.");

    private IWebElement ImageOf(string text) =>
        Media.Images(FindCommentOrFail(text).FindElements(Media.Image)).FirstOrDefault()
        ?? throw new InvalidOperationException($"The comment \"{text}\" shows no image.");

    // Null when the comment shows whole; else the way to scroll: "down" while it's below or cut at the bottom (Android
    // gives a view only the bounds of its part on the screen), "up" while it's cut at the top.
    private string? WhereIs(string text)
    {
        var list = Bounds(driver.FindElement(List));
        if (FindComment(text) is not { } comment)
        {
            return "down";
        }

        var bounds = Bounds(comment);
        return bounds.Bottom >= list.Bottom ? "down" : bounds.Top <= list.Top ? "up" : null;
    }

    private double Density() =>
        density ??= driver.ExecuteScript("mobile: deviceInfo") is IDictionary<string, object> info
            ? Convert.ToDouble(info["displayDensity"], System.Globalization.CultureInfo.InvariantCulture) / 160
            : throw new InvalidOperationException("Appium's mobile: deviceInfo didn't answer the screen's density.");

    private static Rectangle Bounds(IWebElement element) => new(element.Location, element.Size);
}

/// <summary>A comment on the screen, or a "load more comments" among them: its text, and how far it is indented, in pixels.</summary>
public sealed record ShownComment(string Text, int Left, bool IsLoadMore);

/// <summary>The comments on the screen, top to bottom, and the "load more comments" among them.</summary>
public sealed record CommentsSnapshot(ImmutableArray<ShownComment> Comments);

/// <summary>What a comment reads as to accessibility (<paramref name="ReadAs"/>), and the text it shows.</summary>
public sealed record CommentReadingSnapshot(string Text, string ReadAs);

/// <summary>What the collapsed comment "<paramref name="Text"/>" shows under it: "1 hidden comment", or null.</summary>
public sealed record CollapsedCommentSnapshot(string Text, string? Hidden);

/// <summary>What a comment shows: its text, and the GIFs, images and videos under it.</summary>
public sealed record CommentSnapshot(string Text, int Gifs, int Images, int Videos);

/// <summary>
/// Where a comment and its image (null without one) are on the screen, in pixels, and how many pixels a dp is: Android
/// sizes views in dp.
/// </summary>
public sealed record CommentLayoutSnapshot(Rectangle Comment, Rectangle? Image, double PixelsPerDp);

/// <summary>What a video's player shows: its position and its length, as "00:10".</summary>
public sealed record VideoSnapshot(string Position, string Duration);

// The views "Embed comment images" makes for media, by their ids.
internal static class Media
{
    public static readonly By Gif = Locate.AppId("baconreader_patches_comment_gif");
    public static readonly By Image = Locate.AppId("baconreader_patches_comment_image");
    public static readonly By Video = Locate.AppId("baconreader_patches_comment_video");

    public static IReadOnlyCollection<IWebElement> Gifs(ISearchContext within) =>
        [.. within.FindElements(Gif).Where(Loaded)];

    public static IReadOnlyCollection<IWebElement> Images(IEnumerable<IWebElement> images) =>
        [.. images.Where(Loaded)];

    public static IReadOnlyCollection<IWebElement> Videos(ISearchContext within) =>
        [.. within.FindElements(Video).Where(Loaded)];

    // An image's view is empty, 0 high, until its image loads.
    private static bool Loaded(IWebElement view) => view.Displayed && view.Size.Height > 0;
}
