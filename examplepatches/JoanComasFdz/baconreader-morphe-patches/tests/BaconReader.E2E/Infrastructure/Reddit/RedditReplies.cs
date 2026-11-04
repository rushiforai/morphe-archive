// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.FakeReddit.World;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What the scenarios of the text box see of Reddit: what a subreddit asks of a post's text, and the replies sent.</summary>
public sealed partial class Reddit
{
    /// <summary>"r/&lt;subreddit&gt; asks text posts for &lt;min&gt; to &lt;max&gt; characters": its post requirements.</summary>
    public void TheSubredditAsksTextPostsFor(string subreddit, int min, int max) =>
        world.Subreddit(subreddit).PostRequirements = new PostRequirements(MinLength: min, MaxLength: max);

    /// <summary>"r/&lt;subreddit&gt; takes no text in posts": its post requirements allow no text.</summary>
    public void TheSubredditTakesNoTextInPosts(string subreddit) =>
        world.Subreddit(subreddit).PostRequirements = new PostRequirements(TextNotAllowed: true);

    /// <summary>
    /// Waits until Reddit answered what r/&lt;subreddit&gt; asks of a text post's text: "Markdown editor"'s counter asks
    /// when the subreddit is typed.
    /// </summary>
    public Task WaitUntilThePostRequirementsOfTheSubredditAreServedAsync(string subreddit) =>
        WaitUntilAsync(
            () => world.Requests.Any(request => request is { Method: "GET", Status: 200 } && request.Path == $"/api/v1/{subreddit}/post_requirements"),
            TimeSpan.FromSeconds(10),
            $"Reddit didn't serve the post requirements of r/{subreddit} within 10 s.");

    /// <summary>
    /// "Reddit got the reply "…" to the message "&lt;subject&gt;"": the texts BaconReader sent as replies to the test
    /// account's private message (<c>api/comment</c> on its t4), oldest first.
    /// </summary>
    public RedditRepliesSnapshot ReadRepliesToTheMessage(string subject) =>
        new($"the message \"{subject}\"", RepliesTo(MessageWithSubject(subject).FullName));

    /// <summary>
    /// "Reddit got the reply "…" to the comment "&lt;text&gt;"": the texts BaconReader sent as replies to that comment,
    /// oldest first.
    /// </summary>
    public RedditRepliesSnapshot ReadRepliesToTheComment(string text) =>
        new($"the comment \"{text}\"", RepliesTo(CommentWithText(text).FullName));

    /// <summary>Waits until Reddit got a reply to the test account's private message "&lt;subject&gt;".</summary>
    public Task WaitUntilAReplyToTheMessageIsSentAsync(string subject)
    {
        var message = MessageWithSubject(subject).FullName;
        return WaitUntilAsync(() => !RepliesTo(message).IsEmpty, TimeSpan.FromSeconds(10), $"Reddit got no reply to the message \"{subject}\" within 10 s.");
    }

    /// <summary>Waits until Reddit got a reply to the comment "&lt;text&gt;".</summary>
    public Task WaitUntilAReplyToTheCommentIsSentAsync(string text)
    {
        var comment = CommentWithText(text).FullName;
        return WaitUntilAsync(() => !RepliesTo(comment).IsEmpty, TimeSpan.FromSeconds(10), $"Reddit got no reply to the comment \"{text}\" within 10 s.");
    }

    private ImmutableArray<string> RepliesTo(string fullName) =>
        [.. world.Actions
            .Where(action => action.Name == "comment" && action.Form.GetValueOrDefault("thing_id") == fullName)
            .Select(action => action.Form.GetValueOrDefault("text") ?? "")];

    private Message MessageWithSubject(string subject) =>
        TestAccountOf(world).Inbox.FirstOrDefault(message => message.Reply is null && message.Subject == subject)
            ?? throw new InvalidOperationException($"The test account has no message \"{subject}\": a Given line makes it first.");

    private Comment CommentWithText(string text)
    {
        static IEnumerable<Comment> Flat(IEnumerable<Comment> comments) => comments.SelectMany(comment => Flat(comment.Replies).Prepend(comment));
        return world.Posts.SelectMany(post => Flat(post.Comments)).FirstOrDefault(comment => comment.Body == text)
            ?? throw new InvalidOperationException($"Reddit has no comment \"{text}\": a Given line makes it first.");
    }
}

/// <summary>The replies Reddit got to a message or a comment (<see cref="To"/>, as a Gherkin names it), their texts, oldest first.</summary>
public sealed record RedditRepliesSnapshot(string To, ImmutableArray<string> Texts);
