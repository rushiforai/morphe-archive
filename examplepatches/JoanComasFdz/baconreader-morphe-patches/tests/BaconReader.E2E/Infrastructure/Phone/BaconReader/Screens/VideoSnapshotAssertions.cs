// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a comment's video player.</summary>
public static class VideoSnapshotAssertions
{
    /// <summary>The player shows <paramref name="position"/> of <paramref name="duration"/>: the video played that far.</summary>
    public static AssertingThat<VideoSnapshot> PlayedTo(this AssertingThat<VideoSnapshot> that, string position, string duration)
    {
        var video = that.InstanceToAssert;
        Assert.True(
            video.Position == position && video.Duration == duration,
            $"The video's player shows \"{video.Position}\" of \"{video.Duration}\", but \"{position}\" of \"{duration}\" was expected.");
        return that;
    }
}
