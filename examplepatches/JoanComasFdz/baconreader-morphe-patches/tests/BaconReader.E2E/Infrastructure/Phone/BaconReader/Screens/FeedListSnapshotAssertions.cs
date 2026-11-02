// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the toolbar's list of feeds.</summary>
public static class FeedListSnapshotAssertions
{
    /// <summary>The list shows exactly <paramref name="feeds"/>, in this order.</summary>
    public static AssertingThat<FeedListSnapshot> ShowsTheFeedsInThisOrder(this AssertingThat<FeedListSnapshot> that, params Feed[] feeds)
    {
        var shown = that.InstanceToAssert.Feeds.Select(feed => feed.ToShownText()).ToArray();
        var expected = feeds.Select(feed => feed.ToShownText()).ToArray();
        Assert.True(shown.SequenceEqual(expected), $"The feed list shows {Listed(shown)}, but {Listed(expected)} was expected, in this order.");
        return that;
    }

    /// <summary>The list shows none of <paramref name="feeds"/>.</summary>
    public static AssertingThat<FeedListSnapshot> ShowsNoneOf(this AssertingThat<FeedListSnapshot> that, params Feed[] feeds)
    {
        var shown = that.InstanceToAssert.Feeds.Select(feed => feed.ToShownText()).ToArray();
        var found = feeds.Select(feed => feed.ToShownText()).Where(shown.Contains).ToArray();
        Assert.True(found.Length == 0, $"The feed list shows {Listed(found)}, but neither was expected.");
        return that;
    }

    private static string Listed(IEnumerable<string> feeds) =>
        feeds.Any() ? string.Join(", ", feeds.Select(feed => $"\"{feed}\"")) : "no feed";
}
