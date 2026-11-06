// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the meme templates' grid.</summary>
public static class MemeTemplatesSnapshotAssertions
{
    /// <summary>The meme templates show: the grid shows thumbnails.</summary>
    public static AssertingThat<MemeTemplatesSnapshot> ShowTheTemplates(this AssertingThat<MemeTemplatesSnapshot> that)
    {
        Assert.True(that.InstanceToAssert.Thumbnails > 0, "The meme templates don't show, but their grid was expected.");
        return that;
    }
}
