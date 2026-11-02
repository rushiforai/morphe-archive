// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests Reddit got for a post's comments.</summary>
public static class RedditCommentsRequestsSnapshotAssertions
{
    /// <summary>The last request for the post's comments asked for <paramref name="limit"/> comments.</summary>
    public static AssertingThat<RedditCommentsRequestsSnapshot> LastAskedForTheLimit(this AssertingThat<RedditCommentsRequestsSnapshot> that, int limit)
    {
        var limits = that.InstanceToAssert.Limits;
        Assert.True(!limits.IsEmpty, $"Reddit got no request for the post's comments, but one with the limit {limit} was expected.");
        Assert.True(
            limits[^1] == limit,
            $"Reddit got the request for the post's comments with {(limits[^1] is { } asked ? $"the limit {asked}" : "no limit")}, but the limit {limit} was expected.");
        return that;
    }
}
