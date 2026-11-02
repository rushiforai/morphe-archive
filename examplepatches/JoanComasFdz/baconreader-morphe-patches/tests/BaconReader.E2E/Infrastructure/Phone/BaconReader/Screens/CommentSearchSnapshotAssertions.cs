// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of the find bar of "Search comments".</summary>
public static class CommentSearchSnapshotAssertions
{
    /// <summary>The find bar counts <paramref name="count"/>: the current match of all ("1/3").</summary>
    public static AssertingThat<CommentSearchSnapshot> ShowsTheCount(this AssertingThat<CommentSearchSnapshot> that, string count)
    {
        var shown = that.InstanceToAssert.Count;
        Assert.True(shown == count, $"The search shows \"{shown}\", but \"{count}\" was expected.");
        return that;
    }

    /// <summary>The find bar offers "SEARCH ALL": comments behind "load more comments" aren't loaded.</summary>
    public static AssertingThat<CommentSearchSnapshot> OffersSearchAll(this AssertingThat<CommentSearchSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.OffersSearchAll, "The search doesn't show \"SEARCH ALL\", but it was expected.");
        return that;
    }
}
