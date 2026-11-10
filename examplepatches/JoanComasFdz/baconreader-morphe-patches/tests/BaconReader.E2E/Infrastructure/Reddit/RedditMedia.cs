// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>The fake Reddit's media posts, thumbnails and avatars, in the Gherkins' words.</summary>
public sealed partial class Reddit
{
    /// <summary>"Reddit has an image post "&lt;title&gt;" in r/&lt;subreddit&gt;": a JPEG uploaded to i.redd.it.</summary>
    public void HasAnImagePost(string title, string subreddit) => world.AddPost(subreddit, title, post => post.WithImage());

    /// <summary>
    /// "Reddit has an image post "&lt;title&gt;" in r/&lt;subreddit&gt; with the text "&lt;text&gt;"": a JPEG uploaded to
    /// i.redd.it, and <paramref name="markdown"/> as its body.
    /// </summary>
    public void HasAnImagePostWithTheText(string title, string subreddit, string markdown) =>
        world.AddPost(subreddit, title, post => post.WithImage().Saying(markdown));

    /// <summary>
    /// "Reddit has an image post "&lt;title&gt;" in r/&lt;subreddit&gt; with &lt;count&gt; paragraphs of text, "Paragraph
    /// 1" to "Paragraph &lt;count&gt;"": a JPEG uploaded to i.redd.it, and a text longer than the screen.
    /// </summary>
    public void HasAnImagePostWithParagraphs(string title, string subreddit, int count) =>
        HasAnImagePostWithTheText(title, subreddit, string.Join("\n\n", Enumerable.Range(1, count).Select(number => $"Paragraph {number}")));

    /// <summary>"Reddit has a GIF post "&lt;title&gt;" in r/&lt;subreddit&gt;": a GIF uploaded to i.redd.it.</summary>
    public void HasAGifPost(string title, string subreddit) => world.AddPost(subreddit, title, post => post.WithGif());

    /// <summary>
    /// "Reddit has an image post "&lt;title&gt;" in r/&lt;subreddit&gt; whose thumbnail is a signed preview": its
    /// thumbnail's URL signed, its "&amp;" HTML-escaped, as Reddit sends it without raw_json.
    /// </summary>
    public void HasAnImagePostWithASignedThumbnail(string title, string subreddit) =>
        world.AddPost(subreddit, title, post =>
        {
            post.WithImage();
            post.WithASignedThumbnail();
        });

    /// <summary>"Reddit has a video post "&lt;title&gt;" in r/&lt;subreddit&gt;": a video uploaded to v.redd.it, with sound.</summary>
    public void HasAVideoPost(string title, string subreddit) => world.AddPost(subreddit, title, post => post.AsVideo());

    /// <summary>"Reddit has a video post "&lt;title&gt;" in r/&lt;subreddit&gt; with sound".</summary>
    public void HasAVideoPostWithSound(string title, string subreddit) => world.AddPost(subreddit, title, post => post.AsVideo());

    /// <summary>"Reddit has a video post "&lt;title&gt;" in r/&lt;subreddit&gt; without sound": its playlists have no sound track.</summary>
    public void HasAVideoPostWithoutSound(string title, string subreddit) => world.AddPost(subreddit, title, post => post.AsVideo(withSound: false));

    /// <summary>
    /// "Reddit has a link post "&lt;title&gt;" in r/&lt;subreddit&gt; to a page that runs JavaScript": a web page whose
    /// script, once it runs, asks Reddit for the page again (<see cref="ReadTheScriptRunsOfThePage"/>).
    /// </summary>
    public void HasALinkPostToAPageThatRunsJavaScript(string title, string subreddit) =>
        world.AddPost(subreddit, title, post => post.LinkingToAPageWithAPreview());

    /// <summary>
    /// "Reddit has a link post "&lt;title&gt;" in r/&lt;subreddit&gt; with a preview and no thumbnail": a link to a web
    /// page, with Reddit's preview of it.
    /// </summary>
    public void HasALinkPostWithAPreviewAndNoThumbnail(string title, string subreddit) =>
        world.AddPost(subreddit, title, post => post.LinkingToAPageWithAPreview());

    /// <summary>"Reddit has an NSFW image post "&lt;title&gt;" in r/&lt;subreddit&gt;".</summary>
    public void HasAnNsfwImagePost(string title, string subreddit) =>
        world.AddPost(subreddit, title, post => post.WithImage().Nsfw());

    /// <summary>"Reddit has a spoiler image post "&lt;title&gt;" in r/&lt;subreddit&gt;".</summary>
    public void HasASpoilerImagePost(string title, string subreddit) =>
        world.AddPost(subreddit, title, post => post.WithImage().Spoiler());

    /// <summary>"Reddit has a gallery post "&lt;title&gt;" in r/&lt;subreddit&gt; of &lt;images&gt; images".</summary>
    public void HasAGalleryPostOf(string title, string subreddit, int images) =>
        world.AddPost(subreddit, title, post => post.AsGallery(images));

    /// <summary>"Reddit has a crosspost "&lt;title&gt;" in r/&lt;subreddit&gt; of the post "&lt;shared&gt;"".</summary>
    public void HasACrosspostOf(string title, string subreddit, string shared)
    {
        var sharedPost = PostTitled(shared);
        world.AddPost(subreddit, title, post => post.CrosspostOf(sharedPost));
    }

    /// <summary>
    /// "Reddit answers the media of the post "&lt;title&gt;" &lt;seconds&gt; seconds late": its image or GIF file comes
    /// that late, as from a slow connection.
    /// </summary>
    public void AnswersTheMediaOfThePostLate(string title, int seconds) =>
        world.AddTrouble(new RequestTrouble(Get(MediaPath(PostTitled(title).Url)), TimeSpan.FromSeconds(seconds)));

    /// <summary>"Reddit answers the media of the post "&lt;title&gt;" with "&lt;status&gt;"": its image or GIF file fails.</summary>
    public void AnswersTheMediaOfThePostWith(string title, string status) =>
        world.AddTrouble(new RequestTrouble(Get(MediaPath(PostTitled(title).Url)), TimeSpan.Zero, StatusCode(status)));

    /// <summary>"Reddit answers the image of "&lt;title&gt;" with an error": its image file fails, 500 Internal Server Error.</summary>
    public void AnswersTheImageOfThePostWithAnError(string title) => AnswersTheMediaOfThePostWith(title, "500 Internal Server Error");

    /// <summary>
    /// "Reddit answers the thumbnail of the post "&lt;title&gt;" with "&lt;status&gt;" the first &lt;times&gt; times": a
    /// network hiccup, after which the thumbnail is served.
    /// </summary>
    public void AnswersTheThumbnailOfThePostWithTheFirstTimes(string title, string status, int times) =>
        world.AddTrouble(new RequestTrouble(Get(MediaPath(PostTitled(title).Thumbnail)), TimeSpan.Zero, StatusCode(status), Times: times));

    /// <summary>"the user "&lt;user&gt;" has an avatar".</summary>
    public void TheUserHasAnAvatar(string user) => avatars[user] = world.GiveAvatar(user);

    /// <summary>"the user "&lt;user&gt;" has a see-through avatar": every pixel of it, so only what's drawn behind it shows.</summary>
    public void TheUserHasASeeThroughAvatar(string user) => avatars[user] = world.GiveAvatar(user, seeThrough: true);

    /// <summary>"Reddit served the thumbnail of "&lt;title&gt;" …": the requests for it, with their query and answer.</summary>
    public RedditMediaFileRequestsSnapshot ReadRequestsForTheThumbnailOf(string title) =>
        RequestsFor($"the thumbnail of \"{title}\"", MediaPath(PostTitled(title).Thumbnail));

    /// <summary>"Reddit served the preview of "&lt;title&gt;"": the requests for the post's preview image.</summary>
    public RedditMediaFileRequestsSnapshot ReadRequestsForThePreviewOf(string title) =>
        RequestsFor($"the preview of \"{title}\"", MediaPath(PostTitled(title).PreviewImages.FirstOrDefault()));

    /// <summary>"Reddit served the avatar of "&lt;user&gt;"": the requests for the avatar the Given gave the user.</summary>
    public RedditMediaFileRequestsSnapshot ReadRequestsForTheAvatarOf(string user) =>
        RequestsFor($"the avatar of \"{user}\"", "/_media/" + avatars[user]);

    /// <summary>
    /// "Reddit served the gallery's thumbnails …": for each image of the gallery post "&lt;title&gt;", in order, the widths
    /// of the previews Reddit served for it, and whether it served the full image.
    /// </summary>
    public RedditGalleryRequestsSnapshot ReadRequestsForTheGalleryOf(string title)
    {
        var post = PostTitled(title);
        var requests = world.Requests;
        return new(title, [.. post.Media.Values.Select(image =>
        {
            var preview = "/_media/" + image.Path;
            var full = $"/_media/i.redd.it/{image.Id}.{image.ContentType["image/".Length..]}";
            return new RedditGalleryImageRequests(
                [.. requests.Where(request => request is { Method: "GET", Status: 200 } && request.Path == preview)
                    .Select(request => PreviewWidth(request.Query)).OfType<int>().Distinct().Order()],
                requests.Any(request => request is { Method: "GET", Status: 200 } && request.Path == full));
        })]);
    }

    /// <summary>
    /// "Reddit served the video of "&lt;title&gt;"", or didn't, since the post last opened: the requests for the files of
    /// the video post's v.redd.it video (its playlists, picture and sound) since BaconReader last asked for the post's
    /// comments, which it does when the post opens.
    /// </summary>
    public RedditMediaFileRequestsSnapshot ReadRequestsForTheVideoOf(string title) =>
        new($"the video of \"{title}\"", [.. VideoRequestsSinceThePostOpened(title).Select(request => new RedditMediaRequest(request.Query, request.Status))]);

    /// <summary>Waits until Reddit served a file of the video of the post "&lt;title&gt;" since the post last opened.</summary>
    public Task WaitUntilTheVideoOfThePostIsServedAsync(string title) =>
        WaitUntilAsync(
            () => VideoRequestsSinceThePostOpened(title).Any(request => request.Status is 200 or 206),
            TimeSpan.FromSeconds(10),
            $"Reddit didn't serve the video of \"{title}\" within 10 s.");

    /// <summary>"Reddit served the GIF of "&lt;title&gt;"": the requests for the GIF post's GIF.</summary>
    public RedditMediaFileRequestsSnapshot ReadRequestsForTheGifOf(string title) =>
        RequestsFor($"the GIF of \"{title}\"", MediaPath(PostTitled(title).Url));

    /// <summary>Waits until Reddit served the GIF of the GIF post "&lt;title&gt;".</summary>
    public Task WaitUntilTheGifOfThePostIsServedAsync(string title)
    {
        var gif = MediaPath(PostTitled(title).Url);
        return WaitUntilAsync(
            () => world.Requests.Any(request => request is { Method: "GET", Status: 200 } && request.Path == gif),
            TimeSpan.FromSeconds(10),
            $"Reddit didn't serve the GIF of \"{title}\" within 10 s.");
    }

    /// <summary>
    /// Waits until Reddit served the thumbnail of the post "&lt;title&gt;": BaconReader asks again, a second later and two,
    /// when it fails.
    /// </summary>
    public Task WaitUntilTheThumbnailOfThePostIsServedAsync(string title)
    {
        var thumbnail = MediaPath(PostTitled(title).Thumbnail);
        return WaitUntilAsync(
            () => world.Requests.Any(request => request is { Method: "GET", Status: 200 } && request.Path == thumbnail),
            TimeSpan.FromSeconds(15),
            $"Reddit didn't serve the thumbnail of \"{title}\" within 15 s.");
    }

    /// <summary>Waits until Reddit served the avatar of "&lt;user&gt;": BaconReader asks for it when it first shows the user.</summary>
    public Task WaitUntilTheAvatarOfTheUserIsServedAsync(string user)
    {
        var avatar = "/_media/" + avatars[user];
        return WaitUntilAsync(
            () => world.Requests.Any(request => request is { Method: "GET", Status: 200 } && request.Path == avatar),
            TimeSpan.FromSeconds(10),
            $"Reddit didn't serve the avatar of \"{user}\" within 10 s.");
    }

    /// <summary>
    /// Waits until Reddit served the page of the link post "&lt;title&gt;" again, since the last time this was asked, and as
    /// long as its script takes to run after that (3 s): what the page's script does shows in Reddit's requests.
    /// </summary>
    public async Task WaitUntilThePageOfThePostIsServedAsync(string title)
    {
        var page = MediaPath(PostTitled(title).Url);
        var until = DateTimeOffset.UtcNow + TimeSpan.FromSeconds(15);
        while (PageLoads(page) <= pagesSeen.GetValueOrDefault(page))
        {
            if (DateTimeOffset.UtcNow > until)
            {
                throw new TimeoutException($"Reddit didn't serve the page of \"{title}\" within 15 s.");
            }

            await Task.Delay(200);
        }

        pagesSeen[page] = PageLoads(page);
        await Task.Delay(TimeSpan.FromSeconds(3));
    }

    /// <summary>
    /// "the page of "&lt;title&gt;" ran its script": whether the page's script asked Reddit for the page again
    /// (<c>?script=ran</c>) since the last time this was read.
    /// </summary>
    public RedditPageScriptSnapshot ReadTheScriptRunsOfThePage(string title)
    {
        var page = MediaPath(PostTitled(title).Url);
        var runs = world.Requests.Count(request => request.Method == "GET" && request.Path == page && request.Query == "?script=ran");
        var before = scriptRunsSeen.GetValueOrDefault(page);
        scriptRunsSeen[page] = runs;
        return new RedditPageScriptSnapshot(title, runs > before);
    }

    private static async Task WaitUntilAsync(Func<bool> done, TimeSpan timeout, string failure)
    {
        var until = DateTimeOffset.UtcNow + timeout;
        while (!done())
        {
            if (DateTimeOffset.UtcNow > until)
            {
                throw new TimeoutException(failure);
            }

            await Task.Delay(200);
        }
    }

    private readonly Dictionary<string, string> avatars = [];
    private readonly Dictionary<string, int> pagesSeen = [];
    private readonly Dictionary<string, int> scriptRunsSeen = [];

    // The page's own loads, not its script's.
    private int PageLoads(string page) =>
        world.Requests.Count(request => request is { Method: "GET", Status: 200 } && request.Path == page && request.Query != "?script=ran");

    // The requests for the video post's video files since BaconReader last asked for its comments, as it does when the
    // post opens, less a second: the post's media can be asked for just before its comments.
    private IEnumerable<RecordedRequest> VideoRequestsSinceThePostOpened(string title)
    {
        var post = PostTitled(title);
        var video = $"/_media/v.redd.it/{post.VideoId ?? throw new InvalidOperationException($"\"{title}\" isn't a video post.")}/";
        var requests = world.Requests;
        var opened = requests.LastOrDefault(request => request.Method == "GET" && request.Path.StartsWith($"/comments/{post.Id}", StringComparison.Ordinal))?.At
            ?? throw new InvalidOperationException($"BaconReader hasn't opened the post \"{title}\".");
        return requests.Where(request => request.Method == "GET" && request.Path.StartsWith(video, StringComparison.Ordinal) && request.At >= opened - TimeSpan.FromSeconds(1));
    }

    private RedditMediaFileRequestsSnapshot RequestsFor(string what, string path) =>
        new(what, [.. world.Requests.Where(request => request.Method == "GET" && request.Path == path).Select(request => new RedditMediaRequest(request.Query, request.Status))]);

    // The width a preview's query asks for: "?width=216&…".
    private static int? PreviewWidth(string query) =>
        System.Text.RegularExpressions.Regex.Match(query, @"[?&]width=(\d+)") is { Success: true } match
            ? int.Parse(match.Groups[1].Value, System.Globalization.CultureInfo.InvariantCulture)
            : null;

    // The path the fake serves a media URL at, without its query: what a trouble matches.
    private static string MediaPath(string? url) =>
        new Uri(url ?? throw new InvalidOperationException("The post has no media URL.")).AbsolutePath;

    private static Func<string, string, bool> Get(string path) => (method, asked) => method == "GET" && asked == path;
}

/// <summary>A request for a media file: its query ("?width=140&amp;…") and the status Reddit answered.</summary>
public sealed record RedditMediaRequest(string Query, int Status);

/// <summary>The requests for one media file, in order, and what it is ("the thumbnail of "Signed thumbnail"").</summary>
public sealed record RedditMediaFileRequestsSnapshot(string What, ImmutableArray<RedditMediaRequest> Requests);

/// <summary>For one image of a gallery: the widths of the previews Reddit served, and whether it served the full image.</summary>
public sealed record RedditGalleryImageRequests(ImmutableArray<int> PreviewWidths, bool FullImage);

/// <summary>What Reddit served for each image of the gallery post titled <c>Title</c>, in order.</summary>
public sealed record RedditGalleryRequestsSnapshot(string Title, ImmutableArray<RedditGalleryImageRequests> Images);

/// <summary>Whether the script of the page of the link post titled <c>Title</c> ran, since the last read.</summary>
public sealed record RedditPageScriptSnapshot(string Title, bool Ran);
