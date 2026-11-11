// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Drawing;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Interactions;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The main screen's list of the feed's posts, under the toolbar and the sort bar: cards (the card view, BaconReader's
/// first) or rows (the list view). A post's flair shows before its title, in its title's view: " &lt;flair&gt;  &lt;title&gt;".
/// A swipe to the left turns a row of the list view into its action bar, whose buttons "Remove awards" names after
/// their actions ("Upvote", "More options"…). With "Text post icon", a text post's button that opens its text under
/// the post is described "Show post text", or "Hide post text" while the text is open.
/// </summary>
public sealed class PostList(AndroidDriver driver)
{
    private const string ListId = "rv_links";
    private static readonly OpenQA.Selenium.By List = Locate.AppId(ListId);
    private const string TitleId = "title";
    private static readonly OpenQA.Selenium.By Title = Locate.AppId(TitleId);
    private const string Message = "errorText";
    private static readonly OpenQA.Selenium.By NoData = Locate.AppIdWithText("text", "No data");
    private const string Card = "card";
    private const string Row = "post";
    private const string Points = "points";
    private const string MoreButton = "more_button";
    private const string TextButton = "next";
    private const string Text = "quickSelfText";
    private const string AwardIcons = "award_layout";
    private const string ActionBarMoreOptions = "More options";
    private const string Thumbnail = "thumbnail";
    private const string ThumbnailClicker = "thumbnailClicker";
    private const string GalleryIndicator = "thumbnail_album";
    private const string CardImage = "preview";

    // "Fix list thumbnails" describes a thumbnail it blurs.
    private const string BlurredThumbnail = "Blurred thumbnail";

    // The message the list showed when last read: another feed's error stays shown while the next one loads.
    private string? messageBefore;

    /// <summary>Waits until the list shows a post (Reddit takes a moment to answer).</summary>
    public Task WaitUntilPostsShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "A post in the main screen's list");

    /// <summary>
    /// Waits until the list shows a post, or "No data" when the feed has none, and tells whether it shows a post.
    /// </summary>
    public async Task<bool> WaitUntilPostsOrNoDataShownAsync()
    {
        var showsPosts = false;
        await Waiting.UntilAsync(
            () => (showsPosts = driver.FindElements(Title).Count > 0) || driver.FindElements(NoData).Count > 0,
            TimeSpan.FromSeconds(10),
            "A post, or \"No data\", in the main screen's list");
        return showsPosts;
    }

    /// <summary>
    /// Waits until the list shows BaconReader's message instead of posts, when the feed failed to load: "Greetings! …
    /// BaconReader is no longer operational", or with "Show request errors" the request's error. A message the list
    /// showed when last read, another feed's, doesn't count.
    /// </summary>
    public Task WaitUntilMessageShownAsync() =>
        Waiting.UntilAsync(
            () => ShownMessage(Screen()) is { } shown && shown != messageBefore,
            TimeSpan.FromSeconds(10),
            "BaconReader's message instead of the feed's posts");

    /// <summary>
    /// Taps the post titled <paramref name="title"/>, which opens it with its comments, scrolling to it first: the list
    /// may have moved since it was last seen (the Front Page jumps back to its top right after the login).
    /// </summary>
    public async Task ClickPostAsync(string title)
    {
        await WaitUntilPostShownAsync(title);
        await OnScreen.PressAsync(driver, Locate.AppIdWithText("title", title));
    }

    /// <summary>
    /// What the list shows: the posts on the screen, top to bottom, each with its flair, or the message it shows instead of
    /// posts.
    /// </summary>
    public Task<PostListSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            messageBefore = ShownMessage(screen);
            var posts = ShownPosts(screen);
            return new PostListSnapshot([.. posts.Select(post => post.Title)], messageBefore) { Posts = [.. posts] };
        });

    /// <summary>Waits until the list shows its posts as rows, the list view, instead of cards.</summary>
    public Task WaitUntilShownAsRowsAsync() =>
        Waiting.UntilAsync(
            () => Screen().WithAppId(ListId).Any(list => list.WithAppId(Row).Any() && !list.WithAppId(Card).Any()),
            TimeSpan.FromSeconds(10),
            "The main screen's posts as rows");

    /// <summary>
    /// Waits until the list shows exactly the posts <paramref name="titles"/>: a feed opened again shows the posts before
    /// until its new ones load.
    /// </summary>
    public Task WaitUntilOnlyPostsShownAsync(params string[] titles) =>
        Waiting.UntilAsync(
            () => ShownPosts(Screen()).Select(post => post.Title).Order().SequenceEqual(titles.Order()),
            TimeSpan.FromSeconds(10),
            $"Only the posts {string.Join(", ", titles.Select(title => $"\"{title}\""))} in the main screen's list");

    /// <summary>
    /// Waits until the list shows the post titled <paramref name="title"/>, as after a refresh that brings it, scrolling
    /// down to it when it's below the screen.
    /// </summary>
    public async Task WaitUntilPostShownAsync(string title)
    {
        await WaitUntilPostsShownAsync();
        // An NSFW post's title is tagged "<title> NSFW".
        await OnScreen.ScrollToAsync(driver, List, Locate.AppIdWithTextStartingWith("title", title), $"The post \"{title}\"");
    }

    /// <summary>Waits until the post titled <paramref name="title"/> shows <paramref name="thumbnail"/>.</summary>
    public Task WaitUntilThumbnailShownAsync(string title, PostThumbnail thumbnail) =>
        Waiting.UntilAsync(
            () => FindPost(Screen(), title)?.WithAppId(Thumbnail).FirstOrDefault(shown => shown.Displayed) is { } shown
                && (shown.Description == BlurredThumbnail ? PostThumbnail.Blurred : PostThumbnail.Shown) == thumbnail,
            TimeSpan.FromSeconds(10),
            $"The post \"{title}\" with {(thumbnail == PostThumbnail.Blurred ? "a blurred thumbnail" : "a thumbnail that isn't blurred")}");

    /// <summary>Waits until the card of the post titled <paramref name="title"/> shows an image, scrolling to it.</summary>
    public async Task WaitUntilCardImageShownAsync(string title)
    {
        await WaitUntilPostShownAsync(title);
        // The scroll stops once the title is on the screen, and a card's image is under its title: further down, a bit
        // at a time, until the image is on the screen too (the list's end shows the last card whole).
        for (var scrolls = 0; scrolls < 5 && await Task.Run(() => FindPost(Screen(), title)?.WithAppId(CardImage).Any(image => image.Displayed) != true); scrolls++)
        {
            object? canScrollMore = null;
            await OnScreen.DoAsync(driver, () => canScrollMore = OnScreen.ScrollGesture(driver, driver.FindElement(List), "down", 0.3));
            if (canScrollMore is false)
            {
                break;
            }
        }

        await Waiting.UntilAsync(
            () => FindPost(Screen(), title)?.WithAppId(CardImage).Any(image => image.Displayed) == true,
            TimeSpan.FromSeconds(10),
            $"The image in the card of the post \"{title}\"");
    }

    /// <summary>Taps the thumbnail of the post titled <paramref name="title"/>, in the list view: it opens its media.</summary>
    public Task ClickThumbnailAsync(string title) =>
        OnScreen.PressAtAsync(driver, () => PostOrFail(Screen(), title).WithAppId(ThumbnailClicker).First().Center);

    /// <summary>
    /// What the post titled <paramref name="title"/> shows in the list: its points, between its vote arrows, its award
    /// icons, the description of its button that opens its text, its text under it, its thumbnail and whether the
    /// gallery indicator shows over it.
    /// </summary>
    public Task<PostSnapshot> ReadPostAsync(string title) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var screen = Screen();
            var post = PostOrFail(screen, title);
            // A card shows its points apart from the post's view, after it.
            return new PostSnapshot(title, screen.FirstWithAppIdFrom(post, Points)?.Text.Trim() ?? "")
            {
                Awards = post.WithAppId(AwardIcons).Sum(icons => icons.Descendants().Count(icon => icon.ClassName == "android.widget.ImageView")),
                TextButton = post.WithAppId(TextButton).FirstOrDefault()?.Description is { Length: > 0 } description
                    ? TextPostButtonShowing.ReadTextPostButton(description)
                    : null,
                Text = TextOf(screen, title)?.Text.Trim(),
                Thumbnail = post.WithAppId(Thumbnail).FirstOrDefault(thumbnail => thumbnail.Displayed) is not { } thumbnail
                    ? PostThumbnail.None
                    : thumbnail.Description == BlurredThumbnail ? PostThumbnail.Blurred : PostThumbnail.Shown,
                ShowsGalleryIndicator = post.WithAppId(GalleryIndicator).Any(indicator => indicator.Displayed),
                ShowsCardImage = post.WithAppId(CardImage).Any(image => image.Displayed),
            };
        });

    /// <summary>Taps the ⋮ of the card of the post titled <paramref name="title"/>, which opens its menu.</summary>
    public Task ClickMenuButtonAsync(string title) =>
        OnScreen.PressAtAsync(driver, () => PostOrFail(Screen(), title).WithAppId(MoreButton).First().Center);

    /// <summary>Taps <paramref name="button"/> on the post titled <paramref name="title"/>, which opens or closes its text.</summary>
    public Task ClickTextButtonAsync(string title, TextPostButton button) =>
        OnScreen.PressAtAsync(driver, () => PostOrFail(Screen(), title).Descendants().First(view => view.Description == button.ToShownText()).Center);

    /// <summary>Waits until the post titled <paramref name="title"/> shows its text under it.</summary>
    public Task WaitUntilPostTextShownAsync(string title) =>
        Waiting.UntilAsync(() => TextOf(Screen(), title) is not null, TimeSpan.FromSeconds(10), $"The text of the post \"{title}\"");

    /// <summary>Waits until the post titled <paramref name="title"/> shows no text under it.</summary>
    public Task WaitUntilPostTextHiddenAsync(string title) =>
        Waiting.UntilAsync(
            () =>
            {
                var screen = Screen();
                return FindPost(screen, title) is not null && TextOf(screen, title) is null;
            },
            TimeSpan.FromSeconds(10),
            $"The post \"{title}\" without its text");

    /// <summary>
    /// Swipes the row of the post titled <paramref name="title"/> to the left, from three quarters of its width, clear of
    /// its thumbnail, to near its left edge: in the list view, the row turns into its action bar.
    /// </summary>
    public Task SwipeToActionBarAsync(string title)
    {
        var bounds = Rectangle.Empty;
        return OnScreen.TouchAtAsync(
            driver,
            () =>
            {
                bounds = PostOrFail(Screen(), title).Bounds;
                return new Point(bounds.Left + (bounds.Width * 3 / 4), bounds.Top + (bounds.Height / 2));
            },
            from =>
            {
                var finger = new PointerInputDevice(PointerKind.Touch, "finger");
                var swipe = new ActionSequence(finger, 0);
                swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, from.X, from.Y, TimeSpan.Zero));
                swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
                swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, bounds.Left + (bounds.Width / 8), from.Y, TimeSpan.FromMilliseconds(300)));
                swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
                OnScreen.PerformSwipe(driver, swipe, from, new Point(bounds.Left + (bounds.Width / 8), from.Y));
            });
    }

    /// <summary>Waits until a row of the list shows its action bar: its "More options".</summary>
    public Task WaitUntilActionBarShownAsync() =>
        Waiting.UntilAsync(() => ActionBarMoreOptionsOrNull(Screen()) is not null, TimeSpan.FromSeconds(10), "The action bar of a post's row");

    /// <summary>Taps "More options" in the action bar a row shows, which opens the post's menu.</summary>
    public Task ClickActionBarMoreOptionsAsync() =>
        OnScreen.PressAtAsync(driver, () => (ActionBarMoreOptionsOrNull(Screen()) ?? throw new InvalidOperationException("No row of the list shows its action bar.")).Center);

    // The "More options" of a row's action bar: inside the list, unlike the toolbar's.
    private static ScreenNode? ActionBarMoreOptionsOrNull(ScreenSnapshot screen) =>
        screen.WithAppId(ListId).SelectMany(list => list.Descendants()).FirstOrDefault(button => button.Displayed && button.Description == ActionBarMoreOptions);

    private ScreenSnapshot Screen() => ScreenSnapshot.Take(driver);

    // The message the list shows instead of posts, or null.
    private static string? ShownMessage(ScreenSnapshot screen) =>
        screen.WithAppId(Message).FirstOrDefault(message => message.Displayed)?.Text.Trim();

    // Each post's card or row on the screen, top to bottom, with its title and its flair.
    private static List<ShownPost> ShownPosts(ScreenSnapshot screen) => [.. Posts(screen).Select(post => post.Shown)];

    private static List<(ScreenNode View, ShownPost Shown)> Posts(ScreenSnapshot screen) =>
        [.. screen.WithAppId(ListId)
            .SelectMany(list => list.WithAppId(Card).Concat(list.WithAppId(Row)))
            .Where(post => post.Displayed)
            .Select(post => (View: post, Title: post.WithAppId(TitleId).FirstOrDefault(title => title.Displayed)))
            .Where(post => post.Title is not null)
            .Select(post => (post.View, Shown: ShownPost.Read(post.Title!.Text)))
            .OrderBy(post => post.View.Bounds.Y)];

    private static ScreenNode? FindPost(ScreenSnapshot screen, string title) => Posts(screen).FirstOrDefault(post => post.Shown.Title == title).View;

    private static ScreenNode PostOrFail(ScreenSnapshot screen, string title) =>
        FindPost(screen, title) ?? throw new InvalidOperationException($"The post \"{title}\" isn't on the screen.");

    // The text a post shows under it: in the list view it is under the post's row, before the next post.
    private static ScreenNode? TextOf(ScreenSnapshot screen, string title)
    {
        var posts = Posts(screen);
        var index = posts.FindIndex(post => post.Shown.Title == title);
        if (index < 0)
        {
            return null;
        }

        var top = posts[index].View.Bounds.Y;
        var bottom = index + 1 < posts.Count ? posts[index + 1].View.Bounds.Y : int.MaxValue;
        return screen.WithAppId(ListId)
            .SelectMany(list => list.WithAppId(Text))
            .FirstOrDefault(text => text.Displayed && text.Bounds.Y > top && text.Bounds.Y < bottom && text.Text.Trim().Length > 0);
    }
}

/// <summary>
/// What the list of posts shows: the titles of the posts on the screen, top to bottom, or the message it shows
/// instead of posts (null when it shows none); and each post with its flair.
/// </summary>
public sealed record PostListSnapshot(ImmutableArray<string> Titles, string? Message)
{
    /// <summary>The posts on the screen, top to bottom, each with its flair.</summary>
    public ImmutableArray<ShownPost> Posts { get; init; } = [];
}

/// <summary>A post of the list as it shows: its title, and its flair before it (null without one).</summary>
public sealed record ShownPost(string Title, string? Flair)
{
    // BaconReader tags an NSFW post's title, in the same view: "<title> NSFW".
    private const string NsfwTag = " NSFW";

    /// <summary>
    /// The post a title's view shows: " &lt;flair&gt;  &lt;title&gt;" with a flair, else the title; an NSFW post's title
    /// without the tag BaconReader puts after it, " NSFW".
    /// </summary>
    public static ShownPost Read(string shown)
    {
        shown = shown.TrimEnd();
        if (shown.EndsWith(NsfwTag, StringComparison.Ordinal))
        {
            shown = shown[..^NsfwTag.Length];
        }

        var split = shown.StartsWith(' ') ? shown.IndexOf("  ", 1, StringComparison.Ordinal) : -1;
        return split < 0 ? new(shown.Trim(), null) : new(shown[(split + 2)..].Trim(), shown[1..split].Trim());
    }
}

/// <summary>
/// A post of the list: its title, its points, as shown, how many award icons it shows, the description of its button
/// that opens its text (null without one) and its text under it (null when closed).
/// </summary>
public sealed record PostSnapshot(string Title, string Points)
{
    public int Awards { get; init; }

    public TextPostButton? TextButton { get; init; }

    public string? Text { get; init; }

    public PostThumbnail Thumbnail { get; init; }

    /// <summary>Whether BaconReader's gallery indicator, the lines above the thumbnail, shows.</summary>
    public bool ShowsGalleryIndicator { get; init; }

    /// <summary>Whether the post's card, in the card list, shows an image under its title.</summary>
    public bool ShowsCardImage { get; init; }
}

/// <summary>A post's thumbnail in the list: none, one, or one "Fix list thumbnails" blurred.</summary>
public enum PostThumbnail
{
    None,
    Shown,
    Blurred,
}
