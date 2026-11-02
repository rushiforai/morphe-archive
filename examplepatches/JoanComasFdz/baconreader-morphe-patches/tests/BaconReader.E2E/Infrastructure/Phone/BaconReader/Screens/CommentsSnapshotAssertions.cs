// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of the comments on the screen, top to bottom, and the "load more comments" among them.</summary>
public static class CommentsSnapshotAssertions
{
    /// <summary>The comment "<paramref name="text"/>" is on the screen.</summary>
    public static AssertingThat<CommentsSnapshot> ShowsTheComment(this AssertingThat<CommentsSnapshot> that, string text)
    {
        var comments = Texts(that.InstanceToAssert);
        Assert.True(comments.Contains(text), $"The screen shows the comments {Quoted(comments)}, but \"{text}\" was expected among them.");
        return that;
    }

    /// <summary>The screen shows exactly the comments <paramref name="texts"/>, in this order.</summary>
    public static AssertingThat<CommentsSnapshot> ShowsTheComments(this AssertingThat<CommentsSnapshot> that, params string[] texts)
    {
        var comments = Texts(that.InstanceToAssert);
        Assert.True(comments.SequenceEqual(texts), $"The screen shows the comments {Quoted(comments)}, but {Quoted(texts)} were expected, in this order.");
        return that;
    }

    /// <summary>Right under the comment "<paramref name="text"/>", indented under it, show its replies <paramref name="replies"/>, in this order.</summary>
    public static AssertingThat<CommentsSnapshot> ShowsTheReplies(this AssertingThat<CommentsSnapshot> that, string text, params string[] replies)
    {
        var (comment, under) = Under(that.InstanceToAssert, text, replies.Length);
        Assert.True(
            under.Select(reply => reply.Text).SequenceEqual(replies) && under.All(reply => !reply.IsLoadMore && reply.Left > comment.Left),
            $"The comment \"{text}\" shows {Quoted(under.Select(reply => reply.Text))} under it, but the replies {Quoted(replies)} were expected.");
        return that;
    }

    /// <summary>
    /// Right under the comment "<paramref name="text"/>" shows <paramref name="loadMore"/> ("load more comments (3
    /// replies)"): BaconReader indents it less than the comment's text.
    /// </summary>
    public static AssertingThat<CommentsSnapshot> ShowsLoadMore(this AssertingThat<CommentsSnapshot> that, string text, string loadMore)
    {
        var (comment, under) = Under(that.InstanceToAssert, text, 1);
        Assert.True(
            under is [{ IsLoadMore: true } row] && row.Text == loadMore,
            $"The comment \"{text}\" shows {Quoted(under.Select(reply => reply.Text))} under it, but \"{loadMore}\" was expected.");
        return that;
    }

    /// <summary>The last comment on the screen is "<paramref name="text"/>", and no "load more comments" follows it.</summary>
    public static AssertingThat<CommentsSnapshot> EndsWithTheComment(this AssertingThat<CommentsSnapshot> that, string text)
    {
        var last = that.InstanceToAssert.Comments.LastOrDefault();
        Assert.True(
            last is { IsLoadMore: false } && last.Text == text,
            $"The comments end with \"{last?.Text}\", but \"{text}\" was expected last.");
        return that;
    }

    private static (ShownComment Comment, List<ShownComment> Under) Under(CommentsSnapshot snapshot, string text, int count)
    {
        var comments = snapshot.Comments;
        var index = comments.ToList().FindIndex(comment => !comment.IsLoadMore && comment.Text == text);
        Assert.True(index >= 0, $"The screen shows the comments {Quoted(Texts(snapshot))}, but \"{text}\" was expected among them.");
        return (comments[index], [.. comments.Skip(index + 1).Take(count)]);
    }

    private static List<string> Texts(CommentsSnapshot snapshot) =>
        [.. snapshot.Comments.Where(comment => !comment.IsLoadMore).Select(comment => comment.Text)];

    private static string Quoted(IEnumerable<string> texts) =>
        texts.Any() ? string.Join(", ", texts.Select(text => $"\"{text}\"")) : "nothing";
}
