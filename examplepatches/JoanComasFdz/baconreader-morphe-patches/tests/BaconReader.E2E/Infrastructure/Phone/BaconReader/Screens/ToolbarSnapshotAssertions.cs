// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the main screen's toolbar.</summary>
public static class ToolbarSnapshotAssertions
{
    /// <summary>The toolbar names <paramref name="feed"/>.</summary>
    public static AssertingThat<ToolbarSnapshot> ShowsFeed(this AssertingThat<ToolbarSnapshot> that, Feed feed)
    {
        var shown = that.InstanceToAssert.Feed;
        Assert.True(
            shown == feed,
            $"The toolbar shows the \"{shown.ToShownText()}\" feed, but \"{feed.ToShownText()}\" was expected.");
        return that;
    }
}
