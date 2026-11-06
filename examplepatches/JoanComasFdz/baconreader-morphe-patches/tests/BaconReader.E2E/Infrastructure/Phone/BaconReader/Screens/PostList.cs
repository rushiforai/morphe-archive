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
    private static readonly OpenQA.Selenium.By List = Locate.AppId("rv_links");
    private static readonly OpenQA.Selenium.By Title = Locate.AppId("title");
    private static readonly OpenQA.Selenium.By Message = Locate.AppId("errorText");
    private static readonly OpenQA.Selenium.By NoData = Locate.AppIdWithText("text", "No data");
    private static readonly OpenQA.Selenium.By Card = Locate.AppId("card");
    private static readonly OpenQA.Selenium.By Row = Locate.AppId("post");
    private static readonly OpenQA.Selenium.By Points = Locate.AppId("points");
    private static readonly OpenQA.Selenium.By MoreButton = Locate.AppId("more_button");
    private static readonly OpenQA.Selenium.By TextButton = Locate.AppId("next");
    private static readonly OpenQA.Selenium.By Text = Locate.AppId("quickSelfText");
    private static readonly OpenQA.Selenium.By AwardIcons = Locate.AppId("award_layout");
    private static readonly OpenQA.Selenium.By ActionBarMoreOptions = Locate.Description("More options");
    private static readonly OpenQA.Selenium.By Thumbnail = Locate.AppId("thumbnail");
    private static readonly OpenQA.Selenium.By ThumbnailClicker = Locate.AppId("thumbnailClicker");
    private static readonly OpenQA.Selenium.By GalleryIndicator = Locate.AppId("thumbnail_album");
    private static readonly OpenQA.Selenium.By CardImage = Locate.AppId("preview");

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
            () => driver.FindElements(Message).FirstOrDefault(message => message.Displayed) is { } shown && shown.Text.Trim() != messageBefore,
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
            messageBefore = driver.FindElements(Message).FirstOrDefault(message => message.Displayed)?.Text.Trim();
            var posts = ShownPosts();
            return new PostListSnapshot([.. posts.Select(post => post.Title)], messageBefore) { Posts = [.. posts] };
        });

    /// <summary>Waits until the list shows its posts as rows, the list view, instead of cards.</summary>
    public Task WaitUntilShownAsRowsAsync() =>
        Waiting.UntilAsync(
            () => driver.FindElements(List).Any(list => list.FindElements(Row).Count > 0 && list.FindElements(Card).Count == 0),
            TimeSpan.FromSeconds(10),
            "The main screen's posts as rows");

    /// <summary>
    /// Waits until the list shows exactly the posts <paramref name="titles"/>: a feed opened again shows the posts before
    /// until its new ones load.
    /// </summary>
    public Task WaitUntilOnlyPostsShownAsync(params string[] titles) =>
        Waiting.UntilAsync(
            () => ShownPosts().Select(post => post.Title).Order().SequenceEqual(titles.Order()),
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
            () => FindPost(title)?.FindElements(Thumbnail).FirstOrDefault(shown => shown.Displayed) is { } shown
                && (shown.GetAttribute("content-desc") == BlurredThumbnail ? PostThumbnail.Blurred : PostThumbnail.Shown) == thumbnail,
            TimeSpan.FromSeconds(10),
            $"The post \"{title}\" with {(thumbnail == PostThumbnail.Blurred ? "a blurred thumbnail" : "a thumbnail that isn't blurred")}");

    /// <summary>Waits until the card of the post titled <paramref name="title"/> shows an image, scrolling to it.</summary>
    public async Task WaitUntilCardImageShownAsync(string title)
    {
        await WaitUntilPostShownAsync(title);
        // The scroll stops once the title is on the screen, and a card's image is under its title: further down, a bit
        // at a time, until the image is on the screen too (the list's end shows the last card whole).
        for (var scrolls = 0; scrolls < 5 && await Task.Run(() => FindPost(title)?.FindElements(CardImage).Any(image => image.Displayed) != true); scrolls++)
        {
            object? canScrollMore = null;
            await OnScreen.DoAsync(driver, () => canScrollMore = driver.ExecuteScript("mobile: scrollGesture", new Dictionary<string, object>
            {
                ["elementId"] = ((OpenQA.Selenium.Appium.AppiumElement)driver.FindElement(List)).Id,
                ["direction"] = "down",
                ["percent"] = 0.3,
            }));
            if (canScrollMore is false)
            {
                break;
            }
        }

        await Waiting.UntilAsync(
            () => FindPost(title)?.FindElements(CardImage).Any(image => image.Displayed) == true,
            TimeSpan.FromSeconds(10),
            $"The image in the card of the post \"{title}\"");
    }

    /// <summary>Taps the thumbnail of the post titled <paramref name="title"/>, in the list view: it opens its media.</summary>
    public Task ClickThumbnailAsync(string title) =>
        OnScreen.PressAsync(driver, () => PostOrFail(title).FindElement(ThumbnailClicker));

    /// <summary>
    /// What the post titled <paramref name="title"/> shows in the list: its points, between its vote arrows, its award
    /// icons, the description of its button that opens its text, its text under it, its thumbnail and whether the
    /// gallery indicator shows over it.
    /// </summary>
    public Task<PostSnapshot> ReadPostAsync(string title) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var post = PostOrFail(title);
            // A card shows its points apart from the post's view.
            return new PostSnapshot(title, post.FindElements(Points).FirstOrDefault()?.Text.Trim() ?? "")
            {
                Awards = post.FindElements(AwardIcons).Sum(icons => icons.FindElements(By.ClassName("android.widget.ImageView")).Count),
                TextButton = post.FindElements(TextButton).FirstOrDefault()?.GetAttribute("content-desc") is { Length: > 0 } description
                    ? TextPostButtonShowing.ReadTextPostButton(description)
                    : null,
                Text = TextOf(title)?.Text.Trim(),
                Thumbnail = post.FindElements(Thumbnail).FirstOrDefault(thumbnail => thumbnail.Displayed) is not { } thumbnail
                    ? PostThumbnail.None
                    : thumbnail.GetAttribute("content-desc") == BlurredThumbnail ? PostThumbnail.Blurred : PostThumbnail.Shown,
                ShowsGalleryIndicator = post.FindElements(GalleryIndicator).Any(indicator => indicator.Displayed),
                ShowsCardImage = post.FindElements(CardImage).Any(image => image.Displayed),
            };
        });

    /// <summary>Taps the ⋮ of the card of the post titled <paramref name="title"/>, which opens its menu.</summary>
    public Task ClickMenuButtonAsync(string title) =>
        OnScreen.PressAsync(driver, () => PostOrFail(title).FindElement(MoreButton));

    /// <summary>Taps <paramref name="button"/> on the post titled <paramref name="title"/>, which opens or closes its text.</summary>
    public Task ClickTextButtonAsync(string title, TextPostButton button) =>
        OnScreen.PressAsync(driver, () => PostOrFail(title).FindElement(Locate.Description(button.ToShownText())));

    /// <summary>Waits until the post titled <paramref name="title"/> shows its text under it.</summary>
    public Task WaitUntilPostTextShownAsync(string title) =>
        Waiting.UntilAsync(() => TextOf(title) is not null, TimeSpan.FromSeconds(10), $"The text of the post \"{title}\"");

    /// <summary>Waits until the post titled <paramref name="title"/> shows no text under it.</summary>
    public Task WaitUntilPostTextHiddenAsync(string title) =>
        Waiting.UntilAsync(() => FindPost(title) is not null && TextOf(title) is null, TimeSpan.FromSeconds(10), $"The post \"{title}\" without its text");

    /// <summary>
    /// Swipes the row of the post titled <paramref name="title"/> to the left, from three quarters of its width, clear of
    /// its thumbnail, to near its left edge: in the list view, the row turns into its action bar.
    /// </summary>
    public Task SwipeToActionBarAsync(string title) =>
        OnScreen.TouchAsync(driver, () => PostOrFail(title), post =>
        {
            var bounds = Bounds(post);
            var y = bounds.Top + (bounds.Height / 2);
            var finger = new PointerInputDevice(PointerKind.Touch, "finger");
            var swipe = new ActionSequence(finger, 0);
            swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, bounds.Left + (bounds.Width * 3 / 4), y, TimeSpan.Zero));
            swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
            swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, bounds.Left + (bounds.Width / 8), y, TimeSpan.FromMilliseconds(300)));
            swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
            driver.PerformActions([swipe]);
        });

    /// <summary>Waits until a row of the list shows its action bar: its "More options".</summary>
    public Task WaitUntilActionBarShownAsync() =>
        Waiting.UntilAsync(() => ActionBarMoreOptionsOrNull() is not null, TimeSpan.FromSeconds(10), "The action bar of a post's row");

    /// <summary>Taps "More options" in the action bar a row shows, which opens the post's menu.</summary>
    public Task ClickActionBarMoreOptionsAsync() =>
        OnScreen.PressAsync(driver, () => ActionBarMoreOptionsOrNull() ?? throw new InvalidOperationException("No row of the list shows its action bar."));

    // The "More options" of a row's action bar: inside the list, unlike the toolbar's.
    private IWebElement? ActionBarMoreOptionsOrNull() =>
        driver.FindElements(List).SelectMany(list => list.FindElements(ActionBarMoreOptions)).FirstOrDefault(button => button.Displayed);

    // Each post's card or row on the screen, top to bottom, with its title and its flair.
    private List<ShownPost> ShownPosts() =>
        [.. Posts().Select(post => post.Shown)];

    private List<(IWebElement View, ShownPost Shown)> Posts() =>
        [.. driver.FindElements(List)
            .SelectMany(list => list.FindElements(Card).Concat(list.FindElements(Row)))
            .Select(post => (View: post, Title: post.FindElements(Title).FirstOrDefault()))
            .Where(post => post.Title is not null)
            .Select(post => (post.View, Shown: ShownPost.Read(post.Title!.Text)))
            .OrderBy(post => post.View.Location.Y)];

    private IWebElement? FindPost(string title) => Posts().FirstOrDefault(post => post.Shown.Title == title).View;

    private IWebElement PostOrFail(string title) =>
        FindPost(title) ?? throw new InvalidOperationException($"The post \"{title}\" isn't on the screen.");

    // The text a post shows under it: in the list view it is under the post's row, before the next post.
    private IWebElement? TextOf(string title)
    {
        var posts = Posts();
        var index = posts.FindIndex(post => post.Shown.Title == title);
        if (index < 0)
        {
            return null;
        }

        var top = posts[index].View.Location.Y;
        var bottom = index + 1 < posts.Count ? posts[index + 1].View.Location.Y : int.MaxValue;
        return driver.FindElements(List)
            .SelectMany(list => list.FindElements(Text))
            .FirstOrDefault(text => text.Displayed && text.Location.Y > top && text.Location.Y < bottom && text.Text.Trim().Length > 0);
    }

    private static Rectangle Bounds(IWebElement element) => new(element.Location, element.Size);
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
