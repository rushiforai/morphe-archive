// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the drawing screen.</summary>
public static class DrawChatSnapshotAssertions
{
    /// <summary>The drawing screen shows, with its brushes.</summary>
    public static AssertingThat<DrawChatSnapshot> IsShown(this AssertingThat<DrawChatSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.Shown, "The drawing screen doesn't show, but it was expected.");
        return that;
    }
}
