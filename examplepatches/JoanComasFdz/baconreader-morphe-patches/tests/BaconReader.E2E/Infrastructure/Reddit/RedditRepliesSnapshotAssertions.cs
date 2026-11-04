// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks on the replies Reddit got.</summary>
public static class RedditRepliesSnapshotAssertions
{
    /// <summary>Reddit got exactly one reply, "<paramref name="text"/>".</summary>
    public static AssertingThat<RedditRepliesSnapshot> GotTheReply(this AssertingThat<RedditRepliesSnapshot> that, string text)
    {
        var replies = that.InstanceToAssert;
        Assert.True(
            replies.Texts is [var only] && only == text,
            replies.Texts.IsEmpty
                ? $"Reddit got no reply to {replies.To}, but \"{text}\" was expected."
                : $"Reddit got the replies {string.Join(", ", replies.Texts.Select(reply => $"\"{reply}\""))} to {replies.To}, but only \"{text}\" was expected.");
        return that;
    }

    /// <summary>Reddit got exactly one comment in reply, "<paramref name="text"/>": what a Gherkin calls a reply to a comment written on its screen.</summary>
    public static AssertingThat<RedditRepliesSnapshot> GotTheComment(this AssertingThat<RedditRepliesSnapshot> that, string text) => that.GotTheReply(text);
}
