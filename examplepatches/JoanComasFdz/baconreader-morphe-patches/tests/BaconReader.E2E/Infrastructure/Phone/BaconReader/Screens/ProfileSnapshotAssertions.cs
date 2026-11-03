// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of a user's profile.</summary>
public static class ProfileSnapshotAssertions
{
    /// <summary>BaconReader doesn't show a user's profile.</summary>
    public static AssertingThat<ProfileSnapshot> IsNotShown(this AssertingThat<ProfileSnapshot> that)
    {
        Assert.False(that.InstanceToAssert.Shown, "BaconReader shows a user's profile, but it wasn't expected.");
        return that;
    }
}
