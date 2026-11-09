// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of "Account colors"' line along the bottom of a toolbar.</summary>
public static class ToolbarLineSnapshotAssertions
{
    /// <summary>The toolbar shows a line along its bottom: the account in use has a color.</summary>
    public static AssertingThat<ToolbarLineSnapshot> ShowsALineAlongItsBottom(this AssertingThat<ToolbarLineSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.Drawn, "The toolbar shows nothing along its bottom, but a line in the account's color was expected.");
        return that;
    }

    /// <summary>The toolbar shows no line along its bottom: the account in use has no color.</summary>
    public static AssertingThat<ToolbarLineSnapshot> ShowsNoLineAlongItsBottom(this AssertingThat<ToolbarLineSnapshot> that)
    {
        Assert.False(that.InstanceToAssert.Drawn, "The toolbar shows a line along its bottom, but none was expected.");
        return that;
    }
}
