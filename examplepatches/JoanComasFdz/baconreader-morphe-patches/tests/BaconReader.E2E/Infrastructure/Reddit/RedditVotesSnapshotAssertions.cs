// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks on the votes Reddit got.</summary>
public static class RedditVotesSnapshotAssertions
{
    /// <summary>Reddit got an upvote on the post titled <paramref name="post"/>.</summary>
    public static AssertingThat<RedditVotesSnapshot> GotAnUpvoteOn(this AssertingThat<RedditVotesSnapshot> that, string post)
    {
        var votes = that.InstanceToAssert.Votes;
        Assert.True(
            votes.Contains(new RedditVote(post, 1)),
            $"Reddit got {(votes.IsEmpty ? "no vote" : string.Join(", ", votes.Select(vote => $"{vote.Direction} on \"{vote.Post}\"")))}, but an upvote on \"{post}\" was expected.");
        return that;
    }
}
