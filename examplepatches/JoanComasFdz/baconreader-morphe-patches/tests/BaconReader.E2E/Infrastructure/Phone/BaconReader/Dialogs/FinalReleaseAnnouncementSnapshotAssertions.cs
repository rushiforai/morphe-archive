// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks of "FINAL RELEASE ANNOUNCEMENT!".</summary>
public static class FinalReleaseAnnouncementSnapshotAssertions
{
    /// <summary>"FINAL RELEASE ANNOUNCEMENT!" isn't on the screen.</summary>
    public static AssertingThat<FinalReleaseAnnouncementSnapshot> IsNotShown(this AssertingThat<FinalReleaseAnnouncementSnapshot> that)
    {
        Assert.False(
            that.InstanceToAssert.Shown,
            "BaconReader shows \"FINAL RELEASE ANNOUNCEMENT!\", but it wasn't expected to.");
        return that;
    }
}
