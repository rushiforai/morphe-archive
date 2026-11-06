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

/// <summary>
/// The screen a post opens on (DetailActivity): the post, then its comments, and the post's action bar at the bottom,
/// whose ⋮ opens the post's menu.
/// </summary>
public sealed class Detail(AndroidDriver driver)
{
    private static readonly By Header = Locate.AppId("headerContent");
    private static readonly By AwardIcons = Locate.AppId("award_layout");
    private static readonly By MenuButton = Locate.AppId("more_button");
    private static readonly By Loading = Locate.Text("Loading...");
    private static readonly By Upvote = Locate.AppId("upvote_left");
    private static readonly By Downvote = Locate.AppId("downvote_left");
    private static readonly By CommentHeader = Locate.AppId("commentSubText");
    private static readonly By PostTitle = Locate.AppId("title");
    private static readonly By PostSubtext = Locate.AppId("subtext");
    private static readonly By HeaderThumbnail = Locate.AppId("thumbnail");

    /// <summary>A text post's text, under its title.</summary>
    public PostText PostText { get; } = new(driver);

    /// <summary>The post's media, under its title, with BaconReader's "Show large image" on.</summary>
    public DetailMedia PostMedia { get; } = new(driver);

    /// <summary>The post's comments, under the post and the sort bar.</summary>
    public Comments Comments { get; } = new(driver);

    /// <summary>The bar over the comments: their sort, "Search comments" and "COLLAPSE ALL".</summary>
    public SortBar SortBar { get; } = new(driver);

    /// <summary>The find bar "Search comments" opens over the sort bar.</summary>
    public CommentSearchBar CommentSearch { get; } = new(driver);

    /// <summary>Waits until the post shows over its comments: its title, author and score.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Header, TimeSpan.FromSeconds(10), "The post over its comments");

    /// <summary>What the post shows over its comments: its title, and how many award icons.</summary>
    public Task<DetailPostSnapshot> ReadPostAsync() =>
        OnScreen.ReadAsync(driver, () => new DetailPostSnapshot(
            driver.FindElement(PostTitle).Text,
            driver.FindElements(Header).SelectMany(header => header.FindElements(AwardIcons))
                .Sum(icons => icons.FindElements(By.ClassName("android.widget.ImageView")).Count)));

    /// <summary>Taps the ⋮ of the post's action bar at the bottom, which opens the post's menu.</summary>
    public Task ClickMenuButtonAsync() => OnScreen.PressAsync(driver, MenuButton);

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

    /// <summary>Waits until the screen shows the post "<paramref name="title"/>": a link opens it a moment after the tap.</summary>
    public Task WaitUntilPostShownAsync(string title) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText("title", title), TimeSpan.FromSeconds(30), $"The post \"{title}\"");

    /// <summary>
    /// Taps the link "<paramref name="link"/>" on the first line of the post's header, after its author ("by e2e_poster
    /// www.reddit.com"): a link post's site, which opens what the post links to. A link inside a text has no view of its
    /// own, so the tap lands on its middle character, at about 0.45 of a line's height a character.
    /// </summary>
    public Task ClickHeaderLinkAsync(string link) =>
        OnScreen.TouchAsync(driver, () => driver.FindElement(Header).FindElement(PostSubtext), subtext =>
        {
            var lines = subtext.Text.Split('\n');
            var start = lines[0].IndexOf(link, StringComparison.Ordinal);
            if (start < 0)
            {
                throw new InvalidOperationException($"The post's header shows \"{lines[0]}\" on its first line, but the link \"{link}\" was expected there.");
            }

            var bounds = new Rectangle(subtext.Location, subtext.Size);
            var lineHeight = bounds.Height / lines.Length;
            driver.ExecuteScript("mobile: clickGesture", new Dictionary<string, object>
            {
                ["x"] = bounds.Left + (int)((start + (link.Length / 2.0)) * lineHeight * 0.45),
                ["y"] = bounds.Top + (lineHeight / 2),
            });
        });

    /// <summary>Taps the thumbnail in the post's header, which opens the post's media.</summary>
    public Task ClickHeaderThumbnailAsync() =>
        OnScreen.PressAsync(driver, () => driver.FindElement(Header).FindElement(HeaderThumbnail));

    /// <summary>Taps Android's Back, which closes the post and goes back to where it was opened from.</summary>
    public Task ClickBackAsync() => OnScreen.DoAsync(driver, () => driver.PressKeyCode(OpenQA.Selenium.Appium.Android.Enums.AndroidKeyCode.Back));

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

    /// <summary>
    /// Waits until the post's text shows an image, loaded: its view is empty, and so hidden, until then. A text that starts
    /// with the image shows no text before it.
    /// </summary>
    public Task WaitUntilMediaShownAsync() =>
        Waiting.UntilAsync(
            () => Texts(driver).Count > 0 && Media.Images(PostViews(driver, Media.Image)).Count > 0,
            TimeSpan.FromSeconds(10),
            "An image in the post's text loading");

    /// <summary>
    /// What the post's text shows: its text, the parts after its media included, one per line, and how many images in
    /// it.
    /// </summary>
    public Task<PostTextSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new PostTextSnapshot(
            string.Join('\n', Texts(driver).Select(text => text.Text.Trim())),
            Media.Images(PostViews(driver, Media.Image)).Count));

    /// <summary>
    /// The pictures the images of the post's text show, to tell whether one shows twice. The views don't say which picture
    /// they show, so this reads a screenshot (E2E-TEST-CODE-RULES.md, rule d).
    /// </summary>
    public Task<PicturesSnapshot> ReadPicturesAsync() =>
        OnScreen.ReadAsync(driver, () => new PicturesSnapshot(
            "The post's text",
            Screenshots.Pictures(driver.GetScreenshot().AsByteArray, Media.Images(PostViews(driver, Media.Image)).Select(Media.BoundsOf))));

    /// <summary>Where the post's text and its first image are on the screen, in pixels.</summary>
    public Task<PostTextLayoutSnapshot> ReadLayoutAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var image = Media.Images(PostViews(driver, Media.Image)).FirstOrDefault();
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

    // The post's text, and the parts of it after its media: the post's own view is hidden when its text starts with one.
    private static IReadOnlyCollection<IWebElement> Texts(AndroidDriver driver) =>
        [.. driver.FindElements(Text).Concat(PostViews(driver, Media.TextAfterMedia)).Where(text => text.Displayed)];

    // The views that aren't in a comment.
    private static IReadOnlyCollection<IWebElement> PostViews(AndroidDriver driver, By by)
    {
        var inComments = driver.FindElements(Comments.Comment).SelectMany(comment => Media.In(comment, by)).Select(Id).ToHashSet();
        return [.. driver.FindElements(by).Where(view => !inComments.Contains(Id(view)))];
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

    // A comment's header, its award icons and its text; a swipe flips it to its action bar.
    private static readonly By Content = Locate.AppId("contentContainer");
    private static readonly By AwardIcons = Locate.AppId("award_layout");
    private static readonly By ActionBarMoreOptions = Locate.Description("More options");
    private static readonly By ActionBarComment = Locate.Description("Comment");

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
    public Task ScrollToCommentAsync(string text) => ScrollToAsync(() => FindComment(text), $"The comment \"{text}\"");

    /// <summary>
    /// Scrolls the comments until the comment by u/<paramref name="author"/> shows whole, between the sort bar and the
    /// buttons at the bottom: a comment found by its author, which shows media and no text before it.
    /// </summary>
    public Task ScrollToCommentByAsync(string author) => ScrollToAsync(() => FindCommentBy(author), $"The comment by u/{author}");

    private async Task ScrollToAsync(Func<IWebElement?> find, string what)
    {
        for (var scrolls = 0; ; scrolls++)
        {
            var direction = await Task.Run(() => WhereIs(find));
            if (direction is null)
            {
                return;
            }

            if (scrolls == 15)
            {
                throw new InvalidOperationException($"{what} didn't show whole after scrolling 15 times.");
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
    /// Waits until the comment "<paramref name="text"/>" shows the link "<paramref name="link"/>" on a line of its own:
    /// "Embed comment images" swaps a bare YouTube link for its title once YouTube answers, a spinner after the link until
    /// then.
    /// </summary>
    public Task WaitUntilLinkShownAsync(string text, string link) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment
                && (Media.In(comment, Text).FirstOrDefault()?.Text ?? "").Split('\n').Contains(link),
            TimeSpan.FromSeconds(30),
            $"The link \"{link}\" in the comment \"{text}\"");

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" shows no spinner after a link: YouTube answered for each of its
    /// bare YouTube links, with a title or with none.
    /// </summary>
    public Task WaitUntilLinkTitlesLoadedAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment
                && !(Media.In(comment, Text).FirstOrDefault()?.Text ?? "").Contains(" \uFFFC", StringComparison.Ordinal),
            TimeSpan.FromSeconds(30),
            $"The links of the comment \"{text}\" loading");

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" shows a thumbnail on a line of its own, drawn in its text:
    /// Android's object replacement character on that line.
    /// </summary>
    public Task WaitUntilThumbnailInTextShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment
                && (Media.In(comment, Text).FirstOrDefault()?.Text ?? "").Split('\n').Contains("\uFFFC"),
            TimeSpan.FromSeconds(30),
            $"A thumbnail in the comment \"{text}\"");

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" shows a GIF, an image or a video under it,
    /// loaded: an image's view is empty, and so hidden, until then.
    /// </summary>
    public Task WaitUntilMediaShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment && Media.Count(comment) > 0,
            TimeSpan.FromSeconds(30),
            $"A GIF, an image or a video under the comment \"{text}\" loading");

    /// <summary>Waits until the comment by u/<paramref name="author"/> shows a GIF, an image or a video, loaded.</summary>
    public Task WaitUntilMediaShownByAsync(string author) =>
        Waiting.UntilAsync(
            () => FindCommentBy(author) is { } comment && Media.Count(comment) > 0,
            TimeSpan.FromSeconds(30),
            $"A GIF, an image or a video in the comment by u/{author} loading");

    /// <summary>What the comment "<paramref name="text"/>" shows: its text, its GIFs, images and videos, and its award icons.</summary>
    public Task<CommentSnapshot> ReadAsync(string text) =>
        OnScreen.ReadAsync(driver, () => Read(FindCommentOrFail(text)) with
        {
            Awards = driver.FindElements(Content)
                .Where(content => Media.In(content, Text).Any(shown => shown.Text.Trim() == text))
                .SelectMany(content => content.FindElements(AwardIcons))
                .Sum(icons => icons.FindElements(By.ClassName("android.widget.ImageView")).Count),
        });

    /// <summary>What the comment by u/<paramref name="author"/> shows: its text, the text under its media, and its GIFs, images and videos.</summary>
    public Task<CommentSnapshot> ReadByAsync(string author) =>
        OnScreen.ReadAsync(driver, () => Read(FindCommentByOrFail(author)) with { Name = $"by u/{author}" });

    /// <summary>
    /// The pictures the GIFs and images of the comment "<paramref name="text"/>" show, to tell whether one shows twice.
    /// The views don't say which picture they show, so this reads a screenshot (E2E-TEST-CODE-RULES.md, rule d).
    /// </summary>
    public Task<PicturesSnapshot> ReadPicturesAsync(string text) =>
        OnScreen.ReadAsync(driver, () => ReadPictures(FindCommentOrFail(text), $"The comment \"{text}\""));

    /// <summary>The pictures the GIFs and images of the comment by u/<paramref name="author"/> show (<see cref="ReadPicturesAsync"/>).</summary>
    public Task<PicturesSnapshot> ReadPicturesByAsync(string author) =>
        OnScreen.ReadAsync(driver, () => ReadPictures(FindCommentByOrFail(author), $"The comment by u/{author}"));

    private CommentSnapshot Read(IWebElement comment)
    {
        var media = Media.In(comment, Media.Image).Concat(Media.In(comment, Media.Gif)).Concat(Media.In(comment, Media.Video))
            .Select(Media.BoundsOf)
            .ToList();
        var mediaBottom = media.Count == 0 ? int.MaxValue : media.Min(bounds => bounds.Bottom);
        return new CommentSnapshot(
            Media.In(comment, Text).FirstOrDefault()?.Text.Trim() ?? "",
            Media.Gifs(comment).Count,
            Media.Images(Media.In(comment, Media.Image)).Count,
            Media.Videos(comment).Count)
        {
            AlbumCounter = Media.In(comment, Media.AlbumCounter).FirstOrDefault(counter => counter.Displayed)?.Text.Trim(),
            TextsUnderMedia = [.. Media.In(comment, Media.TextAfterMedia)
                .Where(text => Media.BoundsOf(text).Top >= mediaBottom)
                .Select(text => text.Text.Trim())],
        };
    }

    private PicturesSnapshot ReadPictures(IWebElement comment, string shownBy)
    {
        var views = Media.Images(Media.In(comment, Media.Image)).Concat(Media.Gifs(comment)).Select(Media.BoundsOf).ToList();
        return new PicturesSnapshot(shownBy, Screenshots.Pictures(driver.GetScreenshot().AsByteArray, views));
    }

    /// <summary>
    /// Swipes the comment "<paramref name="text"/>" to the left, from three quarters of its width to near its left
    /// edge: it turns into its action bar.
    /// </summary>
    public Task SwipeToActionBarAsync(string text) =>
        OnScreen.TouchAsync(driver, () => FindCommentOrFail(text), comment =>
        {
            var bounds = Bounds(comment);
            var y = bounds.Top + (bounds.Height / 2);
            var finger = new PointerInputDevice(PointerKind.Touch, "finger");
            var swipe = new ActionSequence(finger, 0);
            swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, bounds.Left + (bounds.Width * 3 / 4), y, TimeSpan.Zero));
            swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
            swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, bounds.Left + (bounds.Width / 8), y, TimeSpan.FromMilliseconds(300)));
            swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
            driver.PerformActions([swipe]);
        });

    /// <summary>
    /// Swipes the Imgur album of the comment "<paramref name="text"/>" to the left, from three quarters of its width to
    /// a quarter, in ten moves: it shows its next image. The album takes a drag only once it has seen it move sideways,
    /// so a swipe of one move, Appium's own, leaves it where it was.
    /// </summary>
    public Task SwipeAlbumAsync(string text) =>
        OnScreen.TouchAsync(driver, () => Media.In(FindCommentOrFail(text), Media.Album).First(), album =>
        {
            var bounds = Bounds(album);
            var y = bounds.Top + (bounds.Height / 2);
            var from = bounds.Left + (bounds.Width * 3 / 4);
            var to = bounds.Left + (bounds.Width / 4);
            var finger = new PointerInputDevice(PointerKind.Touch, "finger");
            var swipe = new ActionSequence(finger, 0);
            swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, from, y, TimeSpan.Zero));
            swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
            for (var step = 1; step <= 10; step++)
            {
                swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, from + ((to - from) * step / 10), y, TimeSpan.FromMilliseconds(20)));
            }

            swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
            driver.PerformActions([swipe]);
        });

    /// <summary>Waits until the Imgur album of the comment "<paramref name="text"/>" shows the counter <paramref name="counter"/>.</summary>
    public Task WaitUntilAlbumCounterShownAsync(string text, string counter) =>
        Waiting.UntilAsync(
            () => FindComment(text) is { } comment && Media.In(comment, Media.AlbumCounter).Any(shown => shown.Displayed && shown.Text.Trim() == counter),
            TimeSpan.FromSeconds(10),
            $"The album of the comment \"{text}\" showing \"{counter}\"");

    /// <summary>Taps "Comment" in the action bar a comment shows, which opens the reply screen.</summary>
    public Task ClickActionBarCommentAsync() =>
        OnScreen.PressAsync(driver, () => driver.FindElements(List).SelectMany(list => list.FindElements(ActionBarComment)).FirstOrDefault(button => button.Displayed)
            ?? throw new InvalidOperationException("No comment shows its action bar."));

    /// <summary>
    /// The author line of the comment "<paramref name="text"/>": its text ("avatar_user 1 points moments ago"; "Show user
    /// avatars" puts its avatar first, an object replacement character, "￼ ") and its height, in pixels.
    /// </summary>
    public Task<CommentAuthorLineSnapshot> ReadAuthorLineAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var line = AuthorLineOf(text);
            return new CommentAuthorLineSnapshot(text, line.Text, line.Size.Height);
        });

    /// <summary>
    /// Whether anything is drawn where the comment "<paramref name="text"/>" shows its avatar, at the start of its author
    /// line, a square as tall as the line. The avatar isn't a view of its own, so this reads a screenshot: only that
    /// square, and only whether it differs from the plain background around it (E2E-TEST-CODE-RULES.md, rule d).
    /// </summary>
    public Task<AvatarSpotSnapshot> ReadAvatarSpotAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var line = AuthorLineOf(text);
            var bounds = new Rectangle(line.Location, line.Size);
            var spot = new Rectangle(bounds.Left, bounds.Top, bounds.Height, bounds.Height);
            return new AvatarSpotSnapshot(text, Screenshots.Differs(driver.GetScreenshot().AsByteArray, spot));
        });

    // The author line of the comment whose text is the given text.
    private IWebElement AuthorLineOf(string text) =>
        driver.FindElements(Content)
            .Where(content => Media.In(content, Text).Any(shown => shown.Text.Trim() == text))
            .SelectMany(content => content.FindElements(Header))
            .FirstOrDefault()
        ?? throw new InvalidOperationException($"The comment \"{text}\" isn't on the screen.");

    /// <summary>Waits until a comment shows its action bar: its "More options".</summary>
    public Task WaitUntilActionBarShownAsync() =>
        Waiting.UntilAsync(() => ActionBarMoreOptionsOrNull() is not null, TimeSpan.FromSeconds(10), "The action bar of a comment");

    /// <summary>Taps "More options" in the action bar a comment shows, which opens the comment's menu.</summary>
    public Task ClickActionBarMoreOptionsAsync() =>
        OnScreen.PressAsync(driver, () => ActionBarMoreOptionsOrNull() ?? throw new InvalidOperationException("No comment shows its action bar."));

    // The "More options" of a comment's action bar: inside the list of comments.
    private IWebElement? ActionBarMoreOptionsOrNull() =>
        driver.FindElements(List).SelectMany(list => list.FindElements(ActionBarMoreOptions)).FirstOrDefault(button => button.Displayed);

    /// <summary>
    /// Where the comment "<paramref name="text"/>" and its image are on the screen, in pixels, and the
    /// screen's pixels per dp.
    /// </summary>
    public Task<CommentLayoutSnapshot> ReadLayoutAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comment = FindCommentOrFail(text);
            var image = Media.Images(Media.In(comment, Media.Image)).Concat(Media.Gifs(comment)).FirstOrDefault();
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
        OnScreen.PressAsync(driver, () => Media.In(FindCommentOrFail(text), Media.Video).First());

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

    /// <summary>Taps the link "<paramref name="link"/>", a comment whose whole text is that link, at its start.</summary>
    public Task ClickLinkAsync(string link) => ClickTextAsync(link);

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
            () => FindComment(text) is { } comment && string.IsNullOrEmpty(Media.In(comment, Text).FirstOrDefault()?.GetAttribute("content-desc")),
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
        Media.In(FindCommentOrFail(text), Text).FirstOrDefault() ?? throw new InvalidOperationException($"The comment \"{text}\" shows no text.");

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
    // videos off, a comment shows the link under its text, and an emote follows its text on its line. Its text is the one
    // inside it: a comment that shows only media has none, and a search from it finds the next comment's.
    private IWebElement? FindComment(string text)
    {
        var shown = driver.FindElements(Comment).Select(comment => (comment, text: Media.In(comment, Text).FirstOrDefault()?.Text.Trim() ?? "")).ToList();
        return shown.FirstOrDefault(found => found.text == text).comment
            ?? shown.FirstOrDefault(found => found.text.StartsWith(text + "\n", StringComparison.Ordinal)).comment
            ?? shown.FirstOrDefault(found => found.text.StartsWith(text + " ￼", StringComparison.Ordinal)).comment;
    }

    // The comment whose author line starts with the author's name: a comment that shows only media, or media first.
    private IWebElement? FindCommentBy(string author) =>
        driver.FindElements(Content)
            .Where(content => content.FindElements(Header).FirstOrDefault()?.Text.StartsWith(author + " ", StringComparison.Ordinal) == true)
            .SelectMany(content => content.FindElements(Comment))
            .FirstOrDefault();

    private IWebElement FindCommentByOrFail(string author) =>
        FindCommentBy(author) ?? throw new InvalidOperationException($"The comment by u/{author} isn't on the screen.");

    private IWebElement FindCommentOrFail(string text) =>
        FindComment(text) ?? throw new InvalidOperationException($"The comment \"{text}\" isn't on the screen.");

    private IWebElement ImageOf(string text) =>
        Media.Images(Media.In(FindCommentOrFail(text), Media.Image)).FirstOrDefault()
        ?? throw new InvalidOperationException($"The comment \"{text}\" shows no image.");

    // Null when the comment shows whole; else the way to scroll: "down" while it's below or cut at the bottom (Android
    // gives a view only the bounds of its part on the screen), "up" while it's cut at the top.
    private string? WhereIs(Func<IWebElement?> find)
    {
        var list = Bounds(driver.FindElement(List));
        if (find() is not { } comment)
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
public sealed record CommentSnapshot(string Text, int Gifs, int Images, int Videos)
{
    /// <summary>The counter over an Imgur album's image, "1 / 3", or null without one (an album of one image shows none).</summary>
    public string? AlbumCounter { get; init; }

    /// <summary>How many award icons it shows, by its author's name.</summary>
    public int Awards { get; init; }

    /// <summary>How a test names it: its text, quoted, or "by u/&lt;author&gt;" when it shows no text before its media.</summary>
    public string Name { get; init; } = $"\"{Text}\"";

    /// <summary>The texts it shows under its first GIF, image or video, in order: what follows a media link that starts it.</summary>
    public ImmutableArray<string> TextsUnderMedia { get; init; } = [];
}

/// <summary>
/// The pictures the GIFs and images of a comment or a post's text show, top to bottom, and how a test names what shows
/// them ("The comment "Two pictures"", "The post's text").
/// </summary>
public sealed record PicturesSnapshot(string ShownBy, ImmutableArray<Screenshots.Picture> Pictures);

/// <summary>A comment's author line: its text, and its height in pixels.</summary>
public sealed record CommentAuthorLineSnapshot(string Comment, string Text, int Height);

/// <summary>Whether anything is drawn at the start of a comment's author line, where its avatar shows.</summary>
public sealed record AvatarSpotSnapshot(string Comment, bool Drawn);

/// <summary>What the post shows over its comments: its title, and how many award icons.</summary>
public sealed record DetailPostSnapshot(string Title, int Awards);

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
    public static readonly By Album = Locate.AppId("baconreader_patches_comment_album");
    public static readonly By AlbumCounter = Locate.AppId("baconreader_patches_album_counter");

    // The copies of a text that show what follows each of its media links.
    public static readonly By TextAfterMedia = Locate.AppId("baconreader_patches_text_after_media");

    /// <summary>How many GIFs, images and videos <paramref name="comment"/> shows, loaded.</summary>
    public static int Count(IWebElement comment) =>
        Gifs(comment).Count + Images(In(comment, Image)).Count + Videos(comment).Count;

    public static IReadOnlyCollection<IWebElement> Gifs(IWebElement comment) =>
        [.. In(comment, Gif).Where(Loaded)];

    public static IReadOnlyCollection<IWebElement> Images(IEnumerable<IWebElement> images) =>
        [.. images.Where(Loaded)];

    public static IReadOnlyCollection<IWebElement> Videos(IWebElement comment) =>
        [.. In(comment, Video).Where(Loaded)];

    /// <summary>
    /// The views <paramref name="by"/> finds inside <paramref name="comment"/>. UiAutomator2's search from a comment's
    /// view also returns views of the comments after it in the list (an Imgur album's image under the next comment):
    /// only those within the comment's bounds are its own.
    /// </summary>
    public static IReadOnlyCollection<IWebElement> In(IWebElement comment, By by)
    {
        var found = comment.FindElements(by);
        if (found.Count == 0)
        {
            return [];
        }

        // One round trip a view: UiAutomator2's bounds, "[left,top][right,bottom]".
        var bounds = BoundsOf(comment);
        return [.. found.Where(view => bounds.Contains(BoundsOf(view)))];
    }

    /// <summary>Where <paramref name="view"/> is on the screen, in pixels, in one round trip: UiAutomator2's bounds.</summary>
    public static Rectangle BoundsOf(IWebElement view)
    {
        var edges = (view.GetAttribute("bounds") ?? "").Split(['[', ']', ','], StringSplitOptions.RemoveEmptyEntries)
            .Select(edge => int.Parse(edge, System.Globalization.CultureInfo.InvariantCulture))
            .ToArray();
        return Rectangle.FromLTRB(edges[0], edges[1], edges[2], edges[3]);
    }

    // An image's view is empty, 0 high, until its image loads.
    private static bool Loaded(IWebElement view) => view.Displayed && view.Size.Height > 0;
}
