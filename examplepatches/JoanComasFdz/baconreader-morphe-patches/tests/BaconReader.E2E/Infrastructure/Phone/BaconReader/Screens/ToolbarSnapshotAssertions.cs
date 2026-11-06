// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the main screen's toolbar.</summary>
public static class ToolbarSnapshotAssertions
{
    /// <summary>The toolbar names <paramref name="feed"/>.</summary>
    /// <summary>The toolbar shows <paramref name="buttons"/> and no other button.</summary>
    public static AssertingThat<ToolbarSnapshot> ShowsOnlyTheButtons(this AssertingThat<ToolbarSnapshot> that, params ToolbarButton[] buttons)
    {
        var shown = that.InstanceToAssert.Buttons;
        Assert.True(
            shown.SequenceEqual(buttons),
            $"The toolbar shows {(shown.IsEmpty ? "no button" : string.Join(", ", shown.Select(button => $"\"{button.ToShownText()}\"")))}, but only {string.Join(", ", buttons.Select(button => $"\"{button.ToShownText()}\""))} was expected.");
        return that;
    }

    public static AssertingThat<ToolbarSnapshot> ShowsFeed(this AssertingThat<ToolbarSnapshot> that, Feed feed)
    {
        var shown = that.InstanceToAssert.Feed;
        Assert.True(
            // A subreddit's feed reads as unlisted (FeedShowing.ReadFeed): it compares by the text shown.
            shown.ToShownText() == feed.ToShownText(),
            $"The toolbar shows the \"{shown.ToShownText()}\" feed, but \"{feed.ToShownText()}\" was expected.");
        return that;
    }
}
