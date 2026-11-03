// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the main screen's sort bar.</summary>
public static class FeedSortBarSnapshotAssertions
{
    /// <summary>The button of "Flair filter" shows <paramref name="shown"/>: "Flair" with no flair chosen, else the flairs chosen.</summary>
    public static AssertingThat<FeedSortBarSnapshot> ShowsFlairFilter(this AssertingThat<FeedSortBarSnapshot> that, string shown)
    {
        var button = that.InstanceToAssert.FlairFilter;
        Assert.True(
            button == shown,
            button is null ? $"The sort bar shows no \"{shown}\": it has no button of \"Flair filter\"." : $"The sort bar shows \"{button}\", but \"{shown}\" was expected.");
        return that;
    }

    /// <summary>The bar has no button of "Flair filter".</summary>
    public static AssertingThat<FeedSortBarSnapshot> ShowsNoFlairFilter(this AssertingThat<FeedSortBarSnapshot> that)
    {
        var button = that.InstanceToAssert.FlairFilter;
        Assert.True(button is null, $"The sort bar shows \"{button}\", the button of \"Flair filter\", but none was expected.");
        return that;
    }
}
