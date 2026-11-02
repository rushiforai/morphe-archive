// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests Reddit got for "load more comments".</summary>
public static class RedditLoadMoreCommentsRequestsSnapshotAssertions
{
    /// <summary>BaconReader asked Reddit for "load more comments", and Reddit refused every request with 403.</summary>
    public static AssertingThat<RedditLoadMoreCommentsRequestsSnapshot> WereAllRefused(this AssertingThat<RedditLoadMoreCommentsRequestsSnapshot> that)
    {
        var statuses = that.InstanceToAssert.Statuses;
        Assert.True(!statuses.IsEmpty, "BaconReader didn't ask Reddit for \"load more comments\", but it was expected to ask first.");
        Assert.True(
            statuses.All(status => status == 403),
            $"Reddit answered \"load more comments\" with {string.Join(", ", statuses)}, but 403 to every request was expected.");
        return that;
    }
}
