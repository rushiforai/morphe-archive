// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the toolbar's button that opens the left menu.</summary>
public static class LeftMenuButtonSnapshotAssertions
{
    /// <summary>The button shows the orange envelope: there are unread messages.</summary>
    public static AssertingThat<LeftMenuButtonSnapshot> ShowsTheOrangeEnvelope(this AssertingThat<LeftMenuButtonSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.ShowsTheOrangeEnvelope, "The left menu's button shows the menu icon, but the orange envelope was expected.");
        return that;
    }

    /// <summary>The button shows the menu icon, no orange envelope: no message is unread.</summary>
    public static AssertingThat<LeftMenuButtonSnapshot> ShowsNoOrangeEnvelope(this AssertingThat<LeftMenuButtonSnapshot> that)
    {
        Assert.False(that.InstanceToAssert.ShowsTheOrangeEnvelope, "The left menu's button shows the orange envelope, but the menu icon was expected.");
        return that;
    }
}
