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

    /// <summary>Whether the post's toolbar, over the post, shows "Account colors"' line along its bottom.</summary>
    public Task<ToolbarLineSnapshot> ReadToolbarLineAsync() => ToolbarLine.ReadAsync(driver);

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
/// names <c>baconreader_patches_comment_image</c>, as a comment's). Read from a <see cref="ScreenSnapshot"/>.
/// </summary>
public sealed class PostText(AndroidDriver driver)
{
    private const string Text = "quickSelfText";

    /// <summary>
    /// Waits until the post's text shows an image, loaded: its view is empty, and so hidden, until then. A text that starts
    /// with the image shows no text before it.
    /// </summary>
    public Task WaitUntilMediaShownAsync() =>
        Waiting.UntilAsync(
            () =>
            {
                var screen = ScreenSnapshot.Take(driver);
                return Texts(screen).Count > 0 && Images(screen).Count > 0;
            },
            TimeSpan.FromSeconds(10),
            "An image in the post's text loading");

    /// <summary>
    /// What the post's text shows: its text, the parts after its media included, one per line, and how many images in
    /// it.
    /// </summary>
    public Task<PostTextSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = ScreenSnapshot.Take(driver);
            return new PostTextSnapshot(string.Join('\n', Texts(screen).Select(text => text.Text.Trim())), Images(screen).Count);
        });

    /// <summary>
    /// The pictures the images of the post's text show, to tell whether one shows twice. The views don't say which picture
    /// they show, so this reads a screenshot (E2E-TEST-CODE-RULES.md, rule d).
    /// </summary>
    public Task<PicturesSnapshot> ReadPicturesAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var images = Images(ScreenSnapshot.Take(driver)).Select(image => image.Bounds).ToList();
            return new PicturesSnapshot("The post's text", Screenshots.Pictures(driver.GetScreenshot().AsByteArray, images));
        });

    /// <summary>
    /// Where the post's text and its first image are on the screen, in pixels, and each part of the text: the text before
    /// its first media link, or with none the first part after one, and the parts after its media.
    /// </summary>
    public Task<PostTextLayoutSnapshot> ReadLayoutAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = ScreenSnapshot.Take(driver);
            var texts = Texts(screen);
            var text = texts.FirstOrDefault() ?? throw new InvalidOperationException("The post shows no text.");
            return new PostTextLayoutSnapshot(text.Bounds, Images(screen).FirstOrDefault()?.Bounds)
            {
                Parts = [.. texts.Select(part => new PostTextPart(part.Text.Trim(), part.Bounds))],
            };
        });

    /// <summary>What the tables of the post's text show.</summary>
    public Task<TableSnapshot> ReadTableAsync() => OnScreen.ReadAsync(driver, () => Tables.Read(TextNode(ScreenSnapshot.Take(driver))));

    /// <summary>Where the cells of the post's table show.</summary>
    public Task<TableLayoutSnapshot> ReadTableLayoutAsync() =>
        OnScreen.ReadAsync(driver, () => Tables.ReadLayout(TextNode(ScreenSnapshot.Take(driver)), driver.Manage().Window.Size.Width));

    /// <summary>Waits until the post's text shows a table's cells.</summary>
    public Task WaitUntilTableShownAsync() =>
        Waiting.UntilAsync(
            () => ScreenSnapshot.Take(driver).WithAppId(Text).FirstOrDefault() is { } text && Tables.HasCells(text),
            TimeSpan.FromSeconds(10),
            "A table in the post's text");

    private static ScreenNode TextNode(ScreenSnapshot screen) =>
        screen.WithAppId(Text).FirstOrDefault() ?? throw new InvalidOperationException("The post shows no text.");

    // The post's text, and the parts of it after its media: the post's own view is hidden when its text starts with one.
    private static IReadOnlyList<ScreenNode> Texts(ScreenSnapshot screen) =>
        [.. screen.WithAppId(Text).Concat(PostViews(screen, Media.TextAfterMedia)).Where(text => text.Displayed)];

    private static IReadOnlyList<ScreenNode> Images(ScreenSnapshot screen) => [.. PostViews(screen, Media.Image).Where(Media.Loaded)];

    // The views that aren't in a comment.
    private static IEnumerable<ScreenNode> PostViews(ScreenSnapshot screen, string id) =>
        screen.WithAppId(id).Where(view => !view.Ancestors().Any(ancestor => ancestor.HasAppId(Comments.Comment)));
}

/// <summary>What a post's text shows: its text, and how many images under it.</summary>
public sealed record PostTextSnapshot(string Text, int Images);

/// <summary>Where a post's text and its first image (null without one) are on the screen, in pixels.</summary>
public sealed record PostTextLayoutSnapshot(Rectangle Text, Rectangle? Image)
{
    /// <summary>The parts of the text, in order: what each says, and where it is.</summary>
    public ImmutableArray<PostTextPart> Parts { get; init; } = [];
}

/// <summary>A part of a post's text, before or after its media: what it says, and where it is on the screen.</summary>
public sealed record PostTextPart(string Text, Rectangle Bounds);

/// <summary>
/// The comments of the post shown, each named by its text (what it says before its media, which shows under it), and with "Embed comment images" the GIFs, images and videos
/// under it: views the patch makes and names <c>baconreader_patches_comment_gif</c>, <c>baconreader_patches_comment_image</c>
/// and <c>baconreader_patches_comment_video</c>. A tap on an image switches it between full width and 200×200, a double
/// tap opens it in full screen (<see cref="Dialogs.ImageViewer"/>), a long press saves it; a tap on a video plays it,
/// in ExoPlayer's player, whose controls show when it ends.
/// <para>
/// A comment is found and read in a <see cref="ScreenSnapshot"/>, one round trip for the whole screen, and tapped at
/// the snapshot's coordinates: a table's cells and buttons too, views of the comment's text that are inside its node.
/// </para>
/// </summary>
public sealed class Comments(AndroidDriver driver)
{
    /// <summary>A comment: its text and what the patch shows under it.</summary>
    internal const string Comment = "commentBodyContainer";

    private const string List = "listView";
    private const string Header = "commentSubText";
    private const string Text = "commentBody";
    private const string Position = "exo_position";
    private const string Duration = "exo_duration";
    private const string HiddenComments = "hiddenComments";

    // A comment's header, its award icons and its text; a swipe flips it to its action bar.
    private const string Content = "contentContainer";
    private const string AwardIcons = "award_layout";
    private const string ActionBarMoreOptions = "More options";
    private const string ActionBarComment = "Comment";

    // A "load more comments" row, whose id the main screen's lists use too.
    private const string LoadMore = "text";
    private static readonly By Loading = Locate.Text("Loading...");

    // Where the image of each comment was before a tap, to see it change.
    private readonly Dictionary<string, Rectangle> imageBefore = [];
    private double? density;

    /// <summary>
    /// Waits until a comment shows (Reddit takes a moment to answer): its header, the author and score, which every
    /// comment shows.
    /// </summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.AppId(Header), TimeSpan.FromSeconds(10), "A comment of the post");

    /// <summary>Waits until the comment "<paramref name="text"/>" shows: Reddit's answer can come late.</summary>
    public Task WaitUntilCommentShownAsync(string text) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText(Text, text), TimeSpan.FromSeconds(30), $"The comment \"{text}\"");

    /// <summary>
    /// Scrolls the comments until the comment "<paramref name="text"/>" shows whole, between the sort bar and
    /// the buttons at the bottom.
    /// </summary>
    public Task ScrollToCommentAsync(string text) => ScrollToAsync(screen => FindComment(screen, text), $"The comment \"{text}\"");

    /// <summary>
    /// Scrolls the comments until the comment by u/<paramref name="author"/> shows whole, between the sort bar and the
    /// buttons at the bottom: a comment found by its author, which shows media and no text before it.
    /// </summary>
    public Task ScrollToCommentByAsync(string author) => ScrollToAsync(screen => FindCommentBy(screen, author), $"The comment by u/{author}");

    private async Task ScrollToAsync(Func<ScreenSnapshot, ScreenNode?> find, string what)
    {
        for (var scrolls = 0; ; scrolls++)
        {
            var direction = await Task.Run(() => WhereIs(Screen(), find));
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
                ["elementId"] = ((AppiumElement)driver.FindElement(Locate.AppId(List))).Id,
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
            () => FindComment(Screen(), text) is { } comment && TextIn(comment).Split('\n').Contains(link),
            TimeSpan.FromSeconds(30),
            $"The link \"{link}\" in the comment \"{text}\"");

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" shows no spinner after a link: YouTube answered for each of its
    /// bare YouTube links, with a title or with none.
    /// </summary>
    public Task WaitUntilLinkTitlesLoadedAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(Screen(), text) is { } comment && !TextIn(comment).Contains(" ￼", StringComparison.Ordinal),
            TimeSpan.FromSeconds(30),
            $"The links of the comment \"{text}\" loading");

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" shows a thumbnail on a line of its own, drawn in its text:
    /// Android's object replacement character on that line.
    /// </summary>
    public Task WaitUntilThumbnailInTextShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(Screen(), text) is { } comment && TextIn(comment).Split('\n').Contains("￼"),
            TimeSpan.FromSeconds(30),
            $"A thumbnail in the comment \"{text}\"");

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" shows a GIF, an image or a video under it,
    /// loaded: an image's view is empty, and so hidden, until then.
    /// </summary>
    public Task WaitUntilMediaShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(Screen(), text) is { } comment && Media.Count(comment) > 0,
            TimeSpan.FromSeconds(30),
            $"A GIF, an image or a video under the comment \"{text}\" loading");

    /// <summary>Waits until the comment by u/<paramref name="author"/> shows a GIF, an image or a video, loaded.</summary>
    public Task WaitUntilMediaShownByAsync(string author) =>
        Waiting.UntilAsync(
            () => FindCommentBy(Screen(), author) is { } comment && Media.Count(comment) > 0,
            TimeSpan.FromSeconds(30),
            $"A GIF, an image or a video in the comment by u/{author} loading");

    /// <summary>What the comment "<paramref name="text"/>" shows: its text, its GIFs, images and videos, and its award icons.</summary>
    public Task<CommentSnapshot> ReadAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            return Read(FindCommentOrFail(screen, text)) with
            {
                Awards = screen.WithAppId(Content)
                    .Where(content => content.WithAppId(Text).Any(shown => shown.Text.Trim() == text))
                    .SelectMany(content => content.WithAppId(AwardIcons))
                    .Sum(icons => icons.Descendants().Count(icon => icon.ClassName == "android.widget.ImageView")),
            };
        });

    /// <summary>What the comment by u/<paramref name="author"/> shows: its text, the text under its media, and its GIFs, images and videos.</summary>
    public Task<CommentSnapshot> ReadByAsync(string author) =>
        OnScreen.ReadAsync(driver, () => Read(FindCommentByOrFail(Screen(), author)) with { Name = $"by u/{author}" });

    /// <summary>
    /// The pictures the GIFs and images of the comment "<paramref name="text"/>" show, to tell whether one shows twice.
    /// The views don't say which picture they show, so this reads a screenshot (E2E-TEST-CODE-RULES.md, rule d).
    /// </summary>
    public Task<PicturesSnapshot> ReadPicturesAsync(string text) =>
        OnScreen.ReadAsync(driver, () => ReadPictures(FindCommentOrFail(Screen(), text), $"The comment \"{text}\""));

    /// <summary>The pictures the GIFs and images of the comment by u/<paramref name="author"/> show (<see cref="ReadPicturesAsync"/>).</summary>
    public Task<PicturesSnapshot> ReadPicturesByAsync(string author) =>
        OnScreen.ReadAsync(driver, () => ReadPictures(FindCommentByOrFail(Screen(), author), $"The comment by u/{author}"));

    private static CommentSnapshot Read(ScreenNode comment)
    {
        var media = Media.In(comment, Media.Image).Concat(Media.In(comment, Media.Gif)).Concat(Media.In(comment, Media.Video)).ToList();
        var mediaBottom = media.Count == 0 ? int.MaxValue : media.Min(view => view.Bounds.Bottom);
        return new CommentSnapshot(TextIn(comment).Trim(), Media.Gifs(comment).Count, Media.Images(comment).Count, Media.Videos(comment).Count)
        {
            AlbumCounter = Media.In(comment, Media.AlbumCounter).FirstOrDefault(counter => counter.Displayed)?.Text.Trim(),
            Prompts = [.. Media.Prompts(comment).Select(prompt => MediaPromptShowing.ReadMediaPrompt(prompt.Text.Trim()))],
            TextsUnderMedia = [.. Media.In(comment, Media.TextAfterMedia)
                .Where(text => text.Bounds.Top >= mediaBottom)
                .Select(text => text.Text.Trim())],
        };
    }

    private PicturesSnapshot ReadPictures(ScreenNode comment, string shownBy)
    {
        var views = Media.Images(comment).Concat(Media.Gifs(comment)).Select(view => view.Bounds).ToList();
        return new PicturesSnapshot(shownBy, Screenshots.Pictures(driver.GetScreenshot().AsByteArray, views));
    }

    /// <summary>
    /// Swipes the comment "<paramref name="text"/>" to the left, from three quarters of its width to near its left
    /// edge, along its first line: it turns into its action bar. Lower, a table of "Show tables" would take the drag,
    /// to scroll sideways.
    /// </summary>
    public Task SwipeToActionBarAsync(string text)
    {
        var bounds = Rectangle.Empty;
        return OnScreen.TouchAtAsync(
            driver,
            () =>
            {
                bounds = FindCommentOrFail(Screen(), text).Bounds;
                return new Point(bounds.Left + (bounds.Width * 3 / 4), bounds.Top + Math.Min(bounds.Height / 2, (int)Math.Round(12 * Density())));
            },
            from => Swipe(from, new Point(bounds.Left + (bounds.Width / 8), from.Y), [TimeSpan.FromMilliseconds(300)]));
    }

    /// <summary>
    /// Swipes the Imgur album of the comment "<paramref name="text"/>" to the left, from three quarters of its width to
    /// a quarter, in ten moves: it shows its next image. The album takes a drag only once it has seen it move sideways,
    /// so a swipe of one move, Appium's own, leaves it where it was.
    /// </summary>
    public Task SwipeAlbumAsync(string text)
    {
        var bounds = Rectangle.Empty;
        return OnScreen.TouchAtAsync(
            driver,
            () =>
            {
                bounds = Media.In(FindCommentOrFail(Screen(), text), Media.Album).First().Bounds;
                return new Point(bounds.Left + (bounds.Width * 3 / 4), bounds.Top + (bounds.Height / 2));
            },
            from => Swipe(from, new Point(bounds.Left + (bounds.Width / 4), from.Y), [.. Enumerable.Repeat(TimeSpan.FromMilliseconds(20), 10)]));
    }

    /// <summary>Waits until the Imgur album of the comment "<paramref name="text"/>" shows the counter <paramref name="counter"/>.</summary>
    public Task WaitUntilAlbumCounterShownAsync(string text, string counter) =>
        Waiting.UntilAsync(
            () => FindComment(Screen(), text) is { } comment
                && Media.In(comment, Media.AlbumCounter).Any(shown => shown.Displayed && shown.Text.Trim() == counter),
            TimeSpan.FromSeconds(10),
            $"The album of the comment \"{text}\" showing \"{counter}\"");

    /// <summary>Taps "Comment" in the action bar a comment shows, which opens the reply screen.</summary>
    public Task ClickActionBarCommentAsync() =>
        OnScreen.PressAtAsync(driver, () => (InList(Screen(), ActionBarComment) ?? throw new InvalidOperationException("No comment shows its action bar.")).Center);

    /// <summary>
    /// The author line of the comment "<paramref name="text"/>": its text ("avatar_user 1 points moments ago"; "Show user
    /// avatars" puts its avatar first, an object replacement character, "￼ ") and its height, in pixels.
    /// </summary>
    public Task<CommentAuthorLineSnapshot> ReadAuthorLineAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var line = AuthorLineOf(Screen(), text);
            return new CommentAuthorLineSnapshot(text, line.Text, line.Bounds.Height);
        });

    /// <summary>
    /// Whether anything is drawn where the comment "<paramref name="text"/>" shows its avatar, at the start of its author
    /// line, a square as tall as the line. The avatar isn't a view of its own, so this reads a screenshot: only that
    /// square, and only whether it differs from the plain background around it (E2E-TEST-CODE-RULES.md, rule d).
    /// </summary>
    public Task<AvatarSpotSnapshot> ReadAvatarSpotAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var bounds = AuthorLineOf(Screen(), text).Bounds;
            var spot = new Rectangle(bounds.Left, bounds.Top, bounds.Height, bounds.Height);
            return new AvatarSpotSnapshot(text, Screenshots.Differs(driver.GetScreenshot().AsByteArray, spot));
        });

    // The author line of the comment whose text is the given text.
    private static ScreenNode AuthorLineOf(ScreenSnapshot screen, string text) =>
        screen.WithAppId(Content)
            .Where(content => content.WithAppId(Text).Any(shown => shown.Text.Trim() == text))
            .SelectMany(content => content.WithAppId(Header))
            .FirstOrDefault()
        ?? throw new InvalidOperationException($"The comment \"{text}\" isn't on the screen.");

    /// <summary>Waits until a comment shows its action bar: its "More options".</summary>
    public Task WaitUntilActionBarShownAsync() =>
        Waiting.UntilAsync(() => InList(Screen(), ActionBarMoreOptions) is not null, TimeSpan.FromSeconds(10), "The action bar of a comment");

    /// <summary>Taps "More options" in the action bar a comment shows, which opens the comment's menu.</summary>
    public Task ClickActionBarMoreOptionsAsync() =>
        OnScreen.PressAtAsync(driver, () => (InList(Screen(), ActionBarMoreOptions) ?? throw new InvalidOperationException("No comment shows its action bar.")).Center);

    // A button of a comment's action bar, by what it reads as: inside the list of comments.
    private static ScreenNode? InList(ScreenSnapshot screen, string description) =>
        screen.WithAppId(List).SelectMany(list => list.Descendants()).FirstOrDefault(button => button.Displayed && button.Description == description);

    /// <summary>
    /// Where the comment "<paramref name="text"/>" and its image are on the screen, in pixels, and the
    /// screen's pixels per dp.
    /// </summary>
    public Task<CommentLayoutSnapshot> ReadLayoutAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comment = FindCommentOrFail(Screen(), text);
            var image = Media.Images(comment).Concat(Media.Gifs(comment)).FirstOrDefault();
            return new CommentLayoutSnapshot(comment.Bounds, image?.Bounds, Density());
        });

    /// <summary>Taps the image of the comment "<paramref name="text"/>".</summary>
    public Task ClickImageAsync(string text) =>
        OnScreen.PressAtAsync(driver, () =>
        {
            var image = ImageOf(Screen(), text);
            imageBefore[text] = image.Bounds;
            return image.Center;
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
                var now = ImageOf(Screen(), text).Bounds;
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
        OnScreen.TouchAtAsync(driver, () => ImageOf(Screen(), text).Center, center =>
        {
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
        OnScreen.TouchAtAsync(driver, () => ImageOf(Screen(), text).Center, center => driver.ExecuteScript("mobile: longClickGesture", new Dictionary<string, object>
        {
            ["x"] = center.X,
            ["y"] = center.Y,
        }));

    /// <summary>Taps the video of the comment "<paramref name="text"/>", which plays it.</summary>
    public Task ClickVideoAsync(string text) =>
        OnScreen.PressAtAsync(driver, () => Media.In(FindCommentOrFail(Screen(), text), Media.Video).First().Center);

    /// <summary>
    /// Waits until the video of the comment "<paramref name="text"/>" has ended: its player shows its
    /// controls, with its position at its length.
    /// </summary>
    public Task WaitUntilVideoEndedAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(Screen(), text) is { } comment
                && comment.WithAppId(Position).FirstOrDefault()?.Text is { Length: > 0 } position
                && position == comment.WithAppId(Duration).FirstOrDefault()?.Text,
            // A 10 s video over the phone's slow link: while recording, one run took more than 30 s from the tap
            // to the video's end.
            TimeSpan.FromSeconds(60),
            $"The video of the comment \"{text}\" playing to its end");

    /// <summary>What the player of the comment "<paramref name="text"/>" shows: its position and its length.</summary>
    public Task<VideoSnapshot> ReadVideoAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var comment = FindCommentOrFail(Screen(), text);
            return new VideoSnapshot(
                comment.WithAppId(Position).FirstOrDefault()?.Text.Trim() ?? "",
                comment.WithAppId(Duration).FirstOrDefault()?.Text.Trim() ?? "");
        });

    /// <summary>
    /// What the comments on the screen show, top to bottom: each comment's text and how far it is indented, and each
    /// "load more comments" among them.
    /// </summary>
    public Task<CommentsSnapshot> ReadShownAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            var comments = screen.WithAppId(Text).Select(text => (text.Bounds.Y, Shown: new ShownComment(text.Text.Trim(), text.Bounds.X, IsLoadMore: false)));
            var loadMores = screen.WithAppId(LoadMore)
                .Where(row => row.Text.StartsWith("load more comments", StringComparison.Ordinal))
                .Select(row => (row.Bounds.Y, Shown: new ShownComment(row.Text.Trim(), row.Bounds.X, IsLoadMore: true)));
            return new CommentsSnapshot([.. comments.Concat(loadMores).OrderBy(found => found.Y).Select(found => found.Shown)]);
        });

    /// <summary>
    /// Scrolls the comments to their end, a flick at a time, until they move no more: the list loads the comments it
    /// hasn't yet as it gets there, showing "Loading..." at its end meanwhile, which takes seconds when they come
    /// from their threads.
    /// </summary>
    public Task ScrollToTheEndAsync() =>
        OnScreen.DoAsync(driver, () =>
        {
            var flicks = 0;
            var shown = Screen();
            do
            {
                while (FlickDown(ref shown))
                {
                    if (++flicks == 200)
                    {
                        throw new InvalidOperationException("The comments didn't reach their end after 200 flicks.");
                    }
                }
            }
            while (LoadedItsEnd());
        });

    /// <summary>Taps "<paramref name="loadMore"/>", which loads the comments it hides.</summary>
    public Task ClickLoadMoreAsync(string loadMore) =>
        OnScreen.PressAsync(driver, () => driver.FindElement(Locate.AppIdWithText(LoadMore, loadMore)));

    /// <summary>Waits until the comment "<paramref name="text"/>" shows "<paramref name="loadMore"/>" under it.</summary>
    public Task WaitUntilLoadMoreShownAsync(string loadMore) =>
        Waiting.UntilShownAsync(driver, Locate.AppIdWithText(LoadMore, loadMore), TimeSpan.FromSeconds(10), $"\"{loadMore}\"");

    /// <summary>Waits until the comment "<paramref name="text"/>" shows a table's cells.</summary>
    public Task WaitUntilTableShownAsync(string text) =>
        Waiting.UntilAsync(
            () => TextNodeOrNull(Screen(), text) is { } body && Tables.HasCells(body),
            TimeSpan.FromSeconds(10),
            $"A table in the comment \"{text}\"");

    /// <summary>What the tables of the comment "<paramref name="text"/>" show.</summary>
    public Task<TableSnapshot> ReadTableAsync(string text) =>
        OnScreen.ReadAsync(driver, () => Tables.Read(TextNodeOf(Screen(), text)));

    /// <summary>Where the cells of the table of the comment "<paramref name="text"/>" show.</summary>
    public Task<TableLayoutSnapshot> ReadTableLayoutAsync(string text) =>
        OnScreen.ReadAsync(driver, () => Tables.ReadLayout(TextNodeOf(Screen(), text), driver.Manage().Window.Size.Width));

    /// <summary>Taps <paramref name="button"/> under the table of the comment "<paramref name="text"/>".</summary>
    public Task ClickTableButtonAsync(string text, TableButton button) =>
        OnScreen.PressAtAsync(driver, () =>
            (Tables.Buttons(TextNodeOf(Screen(), text)).FirstOrDefault(found => found.Text == button.ToShownText())
            ?? throw new InvalidOperationException($"The table of the comment \"{text}\" shows no \"{button.ToShownText()}\".")).Center);

    /// <summary>Taps <paramref name="prompt"/> in the media of the comment "<paramref name="text"/>", which loads it.</summary>
    public Task ClickMediaPromptAsync(string text, MediaPrompt prompt) =>
        OnScreen.PressAtAsync(driver, () =>
            (Media.Prompts(FindCommentOrFail(Screen(), text)).FirstOrDefault(found => found.Text.Trim() == prompt.ToShownText())
            ?? throw new InvalidOperationException($"The comment \"{text}\" shows no \"{prompt.ToShownText()}\".")).Center);

    /// <summary>Waits until the media of the comment "<paramref name="text"/>" shows <paramref name="prompt"/>.</summary>
    public Task WaitUntilMediaPromptShownAsync(string text, MediaPrompt prompt) =>
        Waiting.UntilAsync(
            () => FindComment(Screen(), text) is { } comment && Media.Prompts(comment).Any(found => found.Text.Trim() == prompt.ToShownText()),
            TimeSpan.FromSeconds(10),
            $"\"{prompt.ToShownText()}\" in the comment \"{text}\"");

    /// <summary>Waits until the table of the comment "<paramref name="text"/>" shows <paramref name="button"/>.</summary>
    public Task WaitUntilTableButtonShownAsync(string text, TableButton button) =>
        Waiting.UntilAsync(
            () => TextNodeOrNull(Screen(), text) is { } body && Tables.Buttons(body).Any(found => found.Text == button.ToShownText()),
            TimeSpan.FromSeconds(10),
            $"\"{button.ToShownText()}\" under the table of the comment \"{text}\"");

    /// <summary>
    /// Swipes the table of the comment "<paramref name="text"/>" to the left, from near its right edge to near its left
    /// one, along its first row: an expanded table scrolls sideways.
    /// </summary>
    public Task SwipeTableLeftAsync(string text)
    {
        var table = Rectangle.Empty;
        return OnScreen.TouchAtAsync(
            driver,
            () =>
            {
                var body = TextNodeOf(Screen(), text);
                var row = (Tables.FirstCell(body) ?? throw new InvalidOperationException($"The table of the comment \"{text}\" shows no cell.")).Bounds;
                table = body.Bounds;
                return new Point(table.Right - 40, row.Top + (row.Height / 2));
            },
            from => Swipe(from, new Point(table.Left + 40, from.Y), [TimeSpan.FromMilliseconds(600)]));
    }

    /// <summary>Waits until the table of the comment "<paramref name="text"/>" shows the cell "<paramref name="cell"/>" whole.</summary>
    public Task WaitUntilTableCellShownAsync(string text, string cell) =>
        Waiting.UntilAsync(
            () => TextNodeOrNull(Screen(), text) is { } body && Tables.FindCell(body, cell) is { } found && found.Bounds.Right < body.Bounds.Right,
            TimeSpan.FromSeconds(10),
            $"The cell \"{cell}\" of the table of the comment \"{text}\"");

    /// <summary>Taps the link "<paramref name="link"/>" in a cell of the table of the comment "<paramref name="text"/>".</summary>
    public Task ClickTableLinkAsync(string text, string link) =>
        OnScreen.PressAtAsync(driver, () => (Tables.FindCell(TextNodeOf(Screen(), text), link)
            ?? throw new InvalidOperationException($"The table of the comment \"{text}\" has no cell \"{link}\".")).Center);

    /// <summary>Taps the link "<paramref name="link"/>", a comment whose whole text is that link, at its start.</summary>
    public Task ClickLinkAsync(string link) => ClickTextAsync(link);

    /// <summary>Taps the text of the comment "<paramref name="text"/>", at its start: a spoiler there shows, or hides.</summary>
    public Task ClickTextAsync(string text) =>
        OnScreen.PressAtAsync(driver, () =>
        {
            var body = FindCommentOrFail(Screen(), text).WithAppId(Text).First().Bounds;
            return new Point(body.Left + 30, body.Top + (body.Height / 2));
        });

    /// <summary>
    /// Waits until the comment "<paramref name="text"/>" reads its text to accessibility, every spoiler of it shown:
    /// "Hide formatted spoilers" has it read a hidden one as "spoiler".
    /// </summary>
    public Task WaitUntilSpoilersShownAsync(string text) =>
        Waiting.UntilAsync(
            () => FindComment(Screen(), text) is { } comment && string.IsNullOrEmpty(comment.WithAppId(Text).FirstOrDefault()?.Description),
            TimeSpan.FromSeconds(10),
            $"The spoilers of the comment \"{text}\" showing");

    /// <summary>What the comment "<paramref name="text"/>" reads as to accessibility: its text, or with a hidden spoiler "spoiler" in its place.</summary>
    public Task<CommentReadingSnapshot> ReadReadingAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var body = FindCommentOrFail(Screen(), text).WithAppId(Text).First();
            return new CommentReadingSnapshot(body.Text.Trim(), string.IsNullOrEmpty(body.Description) ? body.Text.Trim() : body.Description);
        });

    /// <summary>What the comment "<paramref name="text"/>" shows under it when collapsed: "1 hidden comment", or null.</summary>
    public Task<CollapsedCommentSnapshot> ReadCollapsedAsync(string text) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            return new CollapsedCommentSnapshot(text, HiddenUnder(screen, FindCommentOrFail(screen, text)));
        });

    /// <summary>What the comment by u/<paramref name="author"/> shows under it when collapsed: "1 hidden comment", or null.</summary>
    public Task<CollapsedCommentSnapshot> ReadCollapsedByAsync(string author) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            return new CollapsedCommentSnapshot("", HiddenUnder(screen, FindCommentByOrFail(screen, author))) { Name = $"by u/{author}" };
        });

    /// <summary>Waits until the comment by u/<paramref name="author"/> shows how many comments it hides.</summary>
    public Task WaitUntilCollapsedByAsync(string author) =>
        Waiting.UntilAsync(
            () => FindCommentBy(Screen(), author) is { } comment && HiddenUnder(Screen(), comment) is not null,
            TimeSpan.FromSeconds(10),
            $"The comments the comment by u/{author} hides");

    /// <summary>Waits until the comment by u/<paramref name="author"/> hides no comment.</summary>
    public Task WaitUntilExpandedByAsync(string author) =>
        Waiting.UntilAsync(
            () => FindCommentBy(Screen(), author) is { } comment && HiddenUnder(Screen(), comment) is null,
            TimeSpan.FromSeconds(10),
            $"The comment by u/{author} showing its replies");

    /// <summary>Taps "<paramref name="text"/>", which the comment by u/<paramref name="author"/> shows under its media.</summary>
    public Task ClickTextUnderMediaByAsync(string author, string text) =>
        OnScreen.PressAtAsync(driver, () =>
            Media.In(FindCommentByOrFail(Screen(), author), Media.TextAfterMedia).FirstOrDefault(view => view.Displayed && view.Text.Trim() == text)?.Center
            ?? throw new InvalidOperationException($"The comment by u/{author} shows no \"{text}\" under its media."));

    // The "1 hidden comment" row under the comment, before the next comment's header, or null.
    private static string? HiddenUnder(ScreenSnapshot screen, ScreenNode comment)
    {
        var bounds = comment.Bounds;
        var next = screen.WithAppId(Header).Select(header => header.Bounds.Top).Where(top => top > bounds.Bottom).DefaultIfEmpty(int.MaxValue).Min();
        return screen.WithAppId(HiddenComments).FirstOrDefault(row => row.Bounds.Top >= bounds.Bottom - 10 && row.Bounds.Top < next)?.Text.Trim();
    }

    /// <summary>Waits until the comment "<paramref name="text"/>" shows how many comments it hides.</summary>
    public Task WaitUntilCollapsedAsync(string text) =>
        Waiting.UntilShownAsync(driver, Locate.AppId(HiddenComments), TimeSpan.FromSeconds(10), $"The comments the comment \"{text}\" hides");

    private ScreenSnapshot Screen() => ScreenSnapshot.Take(driver);

    // The text view of the comment "text": "Show tables" draws a table's cells and buttons as views inside it.
    private static ScreenNode TextNodeOf(ScreenSnapshot screen, string text) =>
        TextNodeOrNull(screen, text) ?? throw new InvalidOperationException($"The comment \"{text}\" isn't on the screen.");

    private static ScreenNode? TextNodeOrNull(ScreenSnapshot screen, string text) => FindComment(screen, text)?.WithAppId(Text).FirstOrDefault();

    // How long the end of the list may take to load its next comments: 50 threads, one at a time.
    private static readonly TimeSpan EndLoad = TimeSpan.FromSeconds(60);

    // How long the end of the list may take to start loading ("Loading..."), once the list stops. One look was enough
    // from a cloud session (~0.23 s a command); next to the phone (the NAS's runner, ~0.1 s a command) the scroll
    // ended at "Comment 501", 59 comments short (2026-11-08): the list can stop before "Loading..." shows.
    private static readonly TimeSpan EndStarts = TimeSpan.FromSeconds(3);

    // Whether the list was loading comments at its end ("Loading..."): then it waits until they are in.
    private bool LoadedItsEnd()
    {
        var starts = DateTimeOffset.UtcNow + EndStarts;
        while (driver.FindElements(Loading).Count == 0)
        {
            if (DateTimeOffset.UtcNow > starts)
            {
                return false;
            }

            Thread.Sleep(250);
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

    // Flicks the list up (a quick swipe, which flings it), and whether it moved: false at its end. shown is the screen
    // before, and becomes the screen after. Appium's flingGesture waited ~5.6 s after each fling that didn't reach the
    // end (53 in a run of the LoggedIn scenarios, 2026-11-07); the swipe comes back at once, and the screen tells
    // whether the list moved: the comments and "load more comments" rows shown, and where.
    private bool FlickDown(ref ScreenSnapshot shown)
    {
        var list = shown.WithAppId(List).First(view => view.Displayed).Bounds;
        var x = list.Left + (list.Width / 2);
        Swipe(new Point(x, list.Bottom - (list.Height / 6)), new Point(x, list.Top + (list.Height / 6)), [.. Enumerable.Repeat(TimeSpan.FromMilliseconds(10), 5)]);
        var before = ListedOn(shown);
        shown = Screen();
        return ListedOn(shown) != before;
    }

    private static string ListedOn(ScreenSnapshot screen) =>
        string.Join('\n', screen.WithAppId(Text).Concat(screen.WithAppId(LoadMore)).Select(view => $"{view.Bounds.Y} {view.Text}"));

    // A swipe from a point to another, in moves of the given lengths, all along the same line.
    private void Swipe(Point from, Point to, IReadOnlyList<TimeSpan> moves)
    {
        var finger = new PointerInputDevice(PointerKind.Touch, "finger");
        var swipe = new ActionSequence(finger, 0);
        swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, from.X, from.Y, TimeSpan.Zero));
        swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
        for (var move = 1; move <= moves.Count; move++)
        {
            swipe.AddAction(finger.CreatePointerMove(
                CoordinateOrigin.Viewport, from.X + ((to.X - from.X) * move / moves.Count), from.Y + ((to.Y - from.Y) * move / moves.Count), moves[move - 1]));
        }

        swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
        driver.PerformActions([swipe]);
    }

    // The comment whose text is the given text, or else the one whose text starts with it: with the patch's images or
    // videos off, a comment shows the link under its text, and an emote follows its text on its line. A comment that
    // shows only media has no text of its own.
    private static ScreenNode? FindComment(ScreenSnapshot screen, string text) =>
        Matching(screen.WithAppId(Comment).Select(comment => (comment, TextIn(comment).Trim())).ToList(), text);

    private static T? Matching<T>(List<(T Shown, string Text)> shown, string text)
        where T : class =>
        shown.FirstOrDefault(found => found.Text == text).Shown
        ?? shown.FirstOrDefault(found => found.Text.StartsWith(text + "\n", StringComparison.Ordinal)).Shown
        ?? shown.FirstOrDefault(found => found.Text.StartsWith(text + " ￼", StringComparison.Ordinal)).Shown;

    // The comment whose author line starts with the author's name: a comment that shows only media, or media first.
    private static ScreenNode? FindCommentBy(ScreenSnapshot screen, string author) =>
        screen.WithAppId(Content)
            .Where(content => content.WithAppId(Header).FirstOrDefault()?.Text.StartsWith(author + " ", StringComparison.Ordinal) == true)
            .SelectMany(content => content.WithAppId(Comment))
            .FirstOrDefault();

    private static ScreenNode FindCommentByOrFail(ScreenSnapshot screen, string author) =>
        FindCommentBy(screen, author) ?? throw new InvalidOperationException($"The comment by u/{author} isn't on the screen.");

    private static ScreenNode FindCommentOrFail(ScreenSnapshot screen, string text) =>
        FindComment(screen, text) ?? throw new InvalidOperationException($"The comment \"{text}\" isn't on the screen.");

    // The text a comment shows before its media, or "" when it shows only media.
    private static string TextIn(ScreenNode comment) => comment.WithAppId(Text).FirstOrDefault()?.Text ?? "";

    private static ScreenNode ImageOf(ScreenSnapshot screen, string text) =>
        Media.Images(FindCommentOrFail(screen, text)).FirstOrDefault()
        ?? throw new InvalidOperationException($"The comment \"{text}\" shows no image.");

    // Null when the comment shows whole; else the way to scroll: "down" while it's below or cut at the bottom (Android
    // gives a view only the bounds of its part on the screen), "up" while it's cut at the top.
    private static string? WhereIs(ScreenSnapshot screen, Func<ScreenSnapshot, ScreenNode?> find)
    {
        var list = (screen.WithAppId(List).FirstOrDefault() ?? throw new InvalidOperationException("The comments aren't on the screen.")).Bounds;
        if (find(screen) is not { } comment)
        {
            return "down";
        }

        var bounds = comment.Bounds;
        return bounds.Bottom >= list.Bottom ? "down" : bounds.Top <= list.Top ? "up" : null;
    }

    private double Density() =>
        density ??= driver.ExecuteScript("mobile: deviceInfo") is IDictionary<string, object> info
            ? Convert.ToDouble(info["displayDensity"], System.Globalization.CultureInfo.InvariantCulture) / 160
            : throw new InvalidOperationException("Appium's mobile: deviceInfo didn't answer the screen's density.");
}

/// <summary>A comment on the screen, or a "load more comments" among them: its text, and how far it is indented, in pixels.</summary>
public sealed record ShownComment(string Text, int Left, bool IsLoadMore);

/// <summary>The comments on the screen, top to bottom, and the "load more comments" among them.</summary>
public sealed record CommentsSnapshot(ImmutableArray<ShownComment> Comments);

/// <summary>What a comment reads as to accessibility (<paramref name="ReadAs"/>), and the text it shows.</summary>
public sealed record CommentReadingSnapshot(string Text, string ReadAs);

/// <summary>What the collapsed comment "<paramref name="Text"/>" shows under it: "1 hidden comment", or null.</summary>
public sealed record CollapsedCommentSnapshot(string Text, string? Hidden)
{
    /// <summary>How a test names it: its text, quoted, or "by u/&lt;author&gt;".</summary>
    public string Name { get; init; } = $"\"{Text}\"";
}

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

    /// <summary>What its media show while they wait for a tap to load, such as "Tap to load image".</summary>
    public ImmutableArray<MediaPrompt> Prompts { get; init; } = [];
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

// The views "Embed comment images" makes for media, by their ids, in a comment or a post's text of a ScreenSnapshot.
internal static class Media
{
    public const string Gif = "baconreader_patches_comment_gif";
    public const string Image = "baconreader_patches_comment_image";
    public const string Video = "baconreader_patches_comment_video";
    public const string Album = "baconreader_patches_comment_album";
    public const string AlbumCounter = "baconreader_patches_album_counter";

    // The copies of a text that show what follows each of its media links.
    public const string TextAfterMedia = "baconreader_patches_text_after_media";

    /// <summary>
    /// The prompts <paramref name="comment"/>'s media show while they wait for a tap ("Load images only when tapped"):
    /// texts the patch draws without an id, found by what they say.
    /// </summary>
    public static IReadOnlyList<ScreenNode> Prompts(ScreenNode comment) =>
        [.. comment.Descendants().Where(view => view.Displayed && MediaPromptShowing.Listed.Any(prompt => prompt.ToShownText() == view.Text.Trim()))];

    /// <summary>How many GIFs, images and videos <paramref name="comment"/> shows, loaded.</summary>
    public static int Count(ScreenNode comment) => Gifs(comment).Count + Images(comment).Count + Videos(comment).Count;

    public static IReadOnlyList<ScreenNode> Gifs(ScreenNode comment) => [.. In(comment, Gif).Where(Loaded)];

    public static IReadOnlyList<ScreenNode> Images(ScreenNode comment) => [.. In(comment, Image).Where(Loaded)];

    public static IReadOnlyList<ScreenNode> Videos(ScreenNode comment) => [.. In(comment, Video).Where(Loaded)];

    /// <summary>The views with the id <paramref name="id"/> inside <paramref name="comment"/>.</summary>
    public static IEnumerable<ScreenNode> In(ScreenNode comment, string id) => comment.WithAppId(id);

    /// <summary>Whether the view shows, loaded: an image's view is empty, 0 high, until its image loads.</summary>
    public static bool Loaded(ScreenNode view) => view.Displayed && view.Bounds.Height > 0;
}
