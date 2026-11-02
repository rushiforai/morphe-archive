// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks of "Open Reddit links with BaconReader?".</summary>
public static class OpenRedditLinksPromptSnapshotAssertions
{
    /// <summary>BaconReader asks "Open Reddit links with BaconReader?".</summary>
    public static AssertingThat<OpenRedditLinksPromptSnapshot> IsShown(this AssertingThat<OpenRedditLinksPromptSnapshot> that)
    {
        Assert.True(
            that.InstanceToAssert.Shown,
            "BaconReader doesn't ask \"Open Reddit links with BaconReader?\", but it was expected to.");
        return that;
    }

    /// <summary>"Open Reddit links with BaconReader?" isn't on the screen.</summary>
    public static AssertingThat<OpenRedditLinksPromptSnapshot> IsNotShown(this AssertingThat<OpenRedditLinksPromptSnapshot> that)
    {
        Assert.False(
            that.InstanceToAssert.Shown,
            "BaconReader asks \"Open Reddit links with BaconReader?\", but it wasn't expected to.");
        return that;
    }

    /// <summary>The dialog offers "Not now" and "Set up", in that order.</summary>
    public static AssertingThat<OpenRedditLinksPromptSnapshot> OffersNotNowAndSetUp(this AssertingThat<OpenRedditLinksPromptSnapshot> that)
    {
        var buttons = that.InstanceToAssert.Buttons;
        Assert.True(
            buttons.SequenceEqual(["Not now", "Set up"]),
            $"\"Open Reddit links with BaconReader?\" offers [{string.Join(", ", buttons.Select(button => $"\"{button}\""))}], but \"Not now\" and \"Set up\" were expected.");
        return that;
    }
}
