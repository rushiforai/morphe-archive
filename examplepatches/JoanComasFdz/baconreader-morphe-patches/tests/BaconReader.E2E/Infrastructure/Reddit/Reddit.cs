// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Text.RegularExpressions;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>
/// The fake Reddit a scenario's app talks to, in the Gherkin's words: a Given line that says what "Reddit has" is a call
/// here, which builds exactly that data (<c>Reddit.HasAPost("Weekly thread", "e2e")</c>), and a Then line about what
/// Reddit saw reads it here. BaseE2E empties it before each scenario and creates the test account.
/// </summary>
public sealed partial class Reddit(RedditWorld world)
{
    /// <summary>"Reddit has a post "&lt;title&gt;" in r/&lt;subreddit&gt;": a text post, made now.</summary>
    public void HasAPost(string title, string subreddit) => world.AddPost(subreddit, title);

    /// <summary>
    /// "Reddit has a post "&lt;title&gt;" in r/&lt;subreddit&gt; with the text "&lt;text&gt;" and an image": a text post
    /// whose text is <paramref name="text"/> and then an image uploaded in it.
    /// </summary>
    public void HasAPostWithTheTextAndAnImage(string title, string subreddit, string text) =>
        world.AddPost(subreddit, title, post => post.WithTextAndImage(text));

    /// <summary>
    /// "Reddit has a post "&lt;title&gt;" in r/&lt;subreddit&gt; with the text "&lt;text&gt;"": a text post whose text is
    /// the Markdown <paramref name="markdown"/>.
    /// </summary>
    public void HasAPostWithTheText(string title, string subreddit, string markdown) =>
        world.AddPost(subreddit, title, post => post.WithText(markdown));

    /// <summary>
    /// "Reddit has a post "&lt;title&gt;" in r/&lt;subreddit&gt; with the text "&lt;text&gt;" and the table:" and its rows,
    /// the first one its header: a text post whose text is <paramref name="text"/>, then the table.
    /// </summary>
    public void HasAPostWithTheTextAndTheTable(string title, string subreddit, string text, string[][] rows) =>
        world.AddPost(subreddit, title, post => post.WithText($"{text}\n\n{RedditTable.ToMarkdown(rows)}"));

    /// <summary>
    /// The requests Reddit got for the comments of the post "<paramref name="title"/>", oldest first: the <c>limit</c>
    /// each asked for, null without one.
    /// </summary>
    public RedditCommentsRequestsSnapshot ReadRequestsForTheCommentsOf(string title)
    {
        var asked = RedditWorld.CommentsOf(PostTitled(title));
        return new([.. world.Requests
            .Where(request => asked(request.Method, request.Path))
            .Select(request => Microsoft.AspNetCore.WebUtilities.QueryHelpers.ParseQuery(request.Query).TryGetValue("limit", out var limit)
                && int.TryParse(limit, out var number) ? number : (int?)null)]);
    }

    /// <summary>The media files Reddit served, oldest first: the paths asked for under <c>/_media/</c> and answered.</summary>
    public RedditMediaRequestsSnapshot ReadMediaServed() =>
        new([.. world.Requests.Where(request => request is { Method: "GET", Status: 200 } && request.Path.StartsWith("/_media/", StringComparison.Ordinal)).Select(request => request.Path)]);

    /// <summary>"the post "&lt;title&gt;" …": a post this scenario's Given made.</summary>
    public RedditPost ThePost(string title) => new(world, PostTitled(title));

    /// <summary>
    /// "the test account has an unread message "&lt;subject&gt;" saying "&lt;body&gt;"": a private message, the newest
    /// of its inbox.
    /// </summary>
    public void TheTestAccountHasAnUnreadMessage(string subject, string body) =>
        world.AddMessage(TestAccountOf(world), subject, body);

    /// <summary>
    /// "Reddit answers the comments of the post "&lt;title&gt;" &lt;seconds&gt; seconds late": with the post as it was
    /// when the app asked, so a vote made meanwhile isn't in it.
    /// </summary>
    public void AnswersTheCommentsOfThePostLate(string title, int seconds) =>
        world.AddTrouble(new RequestTrouble(RedditWorld.CommentsOf(PostTitled(title)), TimeSpan.FromSeconds(seconds)));

    /// <summary>
    /// "Reddit answers the posts of r/&lt;subreddit&gt; with "&lt;status&gt;"" (<c>"500 Internal Server Error"</c>): an
    /// error, with Reddit's error JSON.
    /// </summary>
    public void AnswersThePostsWith(string subreddit, string status) =>
        world.AddTrouble(new RequestTrouble(RedditWorld.PostsOf(subreddit), TimeSpan.Zero, StatusCode(status)));

    /// <summary>
    /// "Reddit refuses the posts of r/&lt;subreddit&gt; with "&lt;status&gt;", explaining "&lt;explanation&gt;"": an
    /// error whose JSON explains it, as Reddit explains a refused request.
    /// </summary>
    public void RefusesThePostsWith(string subreddit, string status, string explanation) =>
        world.AddTrouble(new RequestTrouble(RedditWorld.PostsOf(subreddit), TimeSpan.Zero, StatusCode(status), explanation));

    /// <summary>"Reddit drops the connection when asked for the posts of r/&lt;subreddit&gt;": no answer at all.</summary>
    public void DropsTheConnectionForThePosts(string subreddit) =>
        world.AddTrouble(new RequestTrouble(RedditWorld.PostsOf(subreddit), TimeSpan.Zero, Drops: true));

    /// <summary>
    /// "Reddit refuses "load more comments" with "403 Blocked", as it does to apps since October 2026":
    /// <c>api/morechildren</c> answers 403 Blocked and Reddit's network security page; threads still answer.
    /// </summary>
    public void RefusesLoadMoreComments() => world.BlocksMoreChildren = true;

    /// <summary>The requests Reddit got for "load more comments" (<c>api/morechildren</c>), oldest first: the status each got.</summary>
    public RedditLoadMoreCommentsRequestsSnapshot ReadRequestsForLoadMoreComments() =>
        new([.. world.Requests.Where(request => request is { Method: "POST", Path: "/api/morechildren" }).Select(request => request.Status)]);

    /// <summary>The votes Reddit got, oldest first: on which post, by its title, and which way.</summary>
    public RedditVotesSnapshot ReadVotes() =>
        new([.. world.Actions.Where(action => action.Name == "vote").Select(action => new RedditVote(
            world.Posts.FirstOrDefault(post => post.FullName == action.Form.GetValueOrDefault("id"))?.Title ?? action.Form.GetValueOrDefault("id") ?? "",
            int.TryParse(action.Form.GetValueOrDefault("dir"), out var direction) ? direction : 0))]);

    /// <summary>The messages Reddit got marked as read (<c>api/read_message</c>), oldest first, by their subjects.</summary>
    public RedditReadMessagesSnapshot ReadMessagesMarkedAsRead()
    {
        var messages = TestAccountOf(world).Inbox;
        return new([.. world.Actions
            .Where(action => action.Name == "read_message")
            .SelectMany(action => (action.Form.GetValueOrDefault("id") ?? "").Split(',', StringSplitOptions.RemoveEmptyEntries))
            .Select(id => messages.FirstOrDefault(message => message.FullName == id)?.Subject ?? id)]);
    }

    /// <summary>"the test account is subscribed to r/&lt;subreddit&gt;".</summary>
    public void TheTestAccountIsSubscribedTo(string subreddit) =>
        world.Subscribe(world.Accounts.Single(account => account.Name == TestAccount.UserName), subreddit);

    /// <summary>
    /// The image uploaded in the comment "<paramref name="text"/>" (its text, before the image), as Reddit serves it: the file name its
    /// URL ends with, and its size.
    /// </summary>
    public RedditImageSnapshot ReadTheImageOfTheComment(string text)
    {
        var comments = world.Posts.SelectMany(post => post.Comments).Where(comment => comment.Body == text || comment.Body.StartsWith(text + "\n\n", StringComparison.Ordinal)).ToList();
        var comment = comments.Count == 1
            ? comments[0]
            : throw new InvalidOperationException($"The scenario's Reddit has {comments.Count} comments \"{text}\", but one was expected.");
        var image = comment.Media.Values.Single(media => !media.IsVideo);
        var file = world.Media(image.Path) ?? throw new InvalidOperationException($"The fake doesn't serve the image of the comment \"{text}\".");
        return new RedditImageSnapshot(image.Path[(image.Path.LastIndexOf('/') + 1)..], file.Bytes.Length);
    }

    /// <summary>What Reddit's login saw of the app: each step's client ID, redirect URI and User-Agent.</summary>
    public RedditLoginSnapshot ReadLogin() => new([.. world.Logins]);

    /// <summary>
    /// The requests Reddit got for posts while logged in, oldest first: every feed's (the Front Page, r/&lt;subreddit&gt;,
    /// in any sort), with the User-Agent each carried.
    /// </summary>
    public RedditPostsRequestsSnapshot ReadRequestsForPosts() =>
        new([.. world.Requests.Where(request => request is { Method: "GET", Account: not null } && IsFeed(request.Path))]);

    private static bool IsFeed(string path) => FeedPath().IsMatch(path);

    private static Account TestAccountOf(RedditWorld world) => world.Accounts.Single(account => account.Name == TestAccount.UserName);

    private Post PostTitled(string title) =>
        world.Posts.SingleOrDefault(post => post.Title == title)
            ?? throw new InvalidOperationException($"The scenario's Reddit has no post \"{title}\": a Given line makes it first.");

    // "500 Internal Server Error": the status, checked against its reason phrase, so the Gherkin's text is what the app gets.
    private static int StatusCode(string status)
    {
        var code = int.Parse(status.Split(' ', 2)[0], System.Globalization.CultureInfo.InvariantCulture);
        var expected = $"{code} {Microsoft.AspNetCore.WebUtilities.ReasonPhrases.GetReasonPhrase(code)}";
        return status == expected ? code : throw new ArgumentException($"\"{status}\" isn't a status Reddit answers: \"{expected}\" is.", nameof(status));
    }

    // "/", "/.json", "/hot.json", "/r/e2e/new/": a feed, as the app asks for it.
    [GeneratedRegex("^/(r/[^/]+/?)?(best|hot|new|top|rising|controversial)?(\\.json)?/?$")]
    private static partial Regex FeedPath();
}

/// <summary>A post of the scenario's Reddit, which a Given line adds to.</summary>
public sealed class RedditPost(RedditWorld world, Post post)
{
    /// <summary>"… has a comment "&lt;text&gt;"": a comment that says only <paramref name="text"/>.</summary>
    public void HasAComment(string text) => world.AddComment(post, text);

    /// <summary>"… has a comment "&lt;text&gt;" by u/&lt;author&gt;".</summary>
    public void HasACommentBy(string text, string author) => world.AddComment(post, text, comment => comment.By(author));

    /// <summary>"… has a comment "&lt;text&gt;" with the table:" and its rows, the first one its header.</summary>
    public void HasACommentWithTheTable(string text, string[][] rows) =>
        world.AddComment(post, $"{text}\n\n{RedditTable.ToMarkdown(rows)}");

    /// <summary>
    /// "… has a comment "&lt;text&gt;" with a table whose cell "&lt;link&gt;" links to an image": a one-column table,
    /// "Link", whose one cell is a link to an image the fake serves.
    /// </summary>
    public void HasACommentWithATableWhoseCellLinksToAnImage(string text, string link) =>
        world.AddComment(post, $"{text}\n\n{RedditTable.ToMarkdown([["Link"], [$"[{link}]({ImageUrl(link)})"]])}");

    /// <summary>
    /// "… has a comment that is a spoiler "&lt;spoiler&gt;" linking to an image": a comment that is only a spoiler
    /// (<c>&gt;!…!&lt;</c>), whose text is a link to an image the fake serves.
    /// </summary>
    public void HasACommentThatIsASpoilerLinkingToAnImage(string spoiler) =>
        world.AddComment(post, $">![{spoiler}]({ImageUrl(spoiler)})!<");

    // An image the fake serves, named after the link's text.
    private string ImageUrl(string link) =>
        world.AddMedia(RedditMediaRequestsSnapshot.ImageLinkedBy(link), MediaAsset.Jpeg.ContentType, MediaAsset.Jpeg.Bytes);

    /// <summary>"… has &lt;count&gt; comments, "Comment 1" to "Comment &lt;count&gt;"": that many comments, oldest first.</summary>
    public void HasComments(int count)
    {
        for (var number = 1; number <= count; number++)
        {
            world.AddComment(post, $"Comment {number}");
        }
    }

    /// <summary>"… the comment "&lt;text&gt;" …": a comment of this post a Given line made.</summary>
    public RedditComment TheComment(string text) =>
        new(world, Flatten(post.Comments).SingleOrDefault(comment => comment.Body == text)
            ?? throw new InvalidOperationException($"The post \"{post.Title}\" has no comment \"{text}\": a Given line makes it first."));

    private static IEnumerable<Comment> Flatten(IEnumerable<Comment> comments) =>
        comments.SelectMany(comment => Flatten(comment.Replies).Prepend(comment));

    /// <summary>"… has a comment "&lt;text&gt;" with an image": <paramref name="text"/>, then an image uploaded in it.</summary>
    public void HasACommentWithAnImage(string text) => world.AddComment(post, text, comment => comment.WithImage());

    /// <summary>"… has a comment "&lt;text&gt;" with a GIF": <paramref name="text"/>, then a GIF uploaded in it.</summary>
    public void HasACommentWithAGif(string text) => world.AddComment(post, text, comment => comment.WithGif());

    /// <summary>"… has a comment "&lt;text&gt;" with a link to an image": <paramref name="text"/>, then a bare link to a JPEG.</summary>
    public void HasACommentWithALinkToAnImage(string text) => world.AddComment(post, text, comment => comment.LinkingToAnImage());

    /// <summary>"… has a comment "&lt;text&gt;" with a video": <paramref name="text"/>, then a video uploaded in it, ten seconds long.</summary>
    public void HasACommentWithAVideo(string text) => world.AddComment(post, text, comment => comment.WithVideo());

    /// <summary>
    /// "… has a comment "&lt;text&gt;" with a link to a video": <paramref name="text"/>, then a bare link to an MP4, ten
    /// seconds long.
    /// </summary>
    public void HasACommentWithALinkToAVideo(string text) => world.AddComment(post, text, comment => comment.LinkingToAVideo());
}

/// <summary>A comment of the scenario's Reddit, which a Given line adds replies to.</summary>
public sealed class RedditComment(RedditWorld world, Comment comment)
{
    /// <summary>"… has a reply "&lt;text&gt;"".</summary>
    public void HasAReply(string text) => world.AddReply(comment, text);

    /// <summary>"… has the replies "&lt;first&gt;", "&lt;second&gt;" and "&lt;third&gt;"", in that order.</summary>
    public void HasTheReplies(params string[] texts)
    {
        foreach (var text in texts)
        {
            world.AddReply(comment, text);
        }
    }
}

/// <summary>A Gherkin's data table as a Markdown table: its first row the header, every column left as Reddit's default.</summary>
internal static class RedditTable
{
    public static string ToMarkdown(string[][] rows) =>
        string.Join("\n", rows.Take(1).Concat([[.. rows[0].Select(_ => "---")]]).Concat(rows.Skip(1)).Select(row => $"| {string.Join(" | ", row)} |"));
}

/// <summary>The media files Reddit served, oldest first: their paths under <c>/_media/</c>.</summary>
public sealed record RedditMediaRequestsSnapshot(ImmutableArray<string> Paths)
{
    /// <summary>Where the fake serves the image a link "<paramref name="link"/>" links to: named after its text.</summary>
    public static string ImageLinkedBy(string link) =>
        $"example.com/{new string([.. link.ToLowerInvariant().Select(c => char.IsLetterOrDigit(c) ? c : '-')])}.jpg";
}

/// <summary>The requests Reddit got for a post's comments, oldest first: the <c>limit</c> each asked for, null without one.</summary>
public sealed record RedditCommentsRequestsSnapshot(ImmutableArray<int?> Limits);

/// <summary>The requests Reddit got for "load more comments", oldest first: the HTTP status each got.</summary>
public sealed record RedditLoadMoreCommentsRequestsSnapshot(ImmutableArray<int> Statuses);

/// <summary>An image uploaded to Reddit, as Reddit serves it: the file name its URL ends with, and its size in bytes.</summary>
public sealed record RedditImageSnapshot(string FileName, long Size);

/// <summary>What Reddit's login saw of the app, step by step (the login page, logging in, Accept, the token).</summary>
public sealed record RedditLoginSnapshot(ImmutableArray<LoginSeen> Steps);

/// <summary>A vote Reddit got: on the post titled <paramref name="Post"/>, 1 up, -1 down, 0 taken back.</summary>
public sealed record RedditVote(string Post, int Direction);

/// <summary>The votes Reddit got, oldest first.</summary>
public sealed record RedditVotesSnapshot(ImmutableArray<RedditVote> Votes);

/// <summary>The messages Reddit got marked as read, oldest first, by their subjects.</summary>
public sealed record RedditReadMessagesSnapshot(ImmutableArray<string> Subjects);

/// <summary>The requests Reddit got for posts while logged in, oldest first.</summary>
public sealed record RedditPostsRequestsSnapshot(ImmutableArray<RecordedRequest> Requests);
