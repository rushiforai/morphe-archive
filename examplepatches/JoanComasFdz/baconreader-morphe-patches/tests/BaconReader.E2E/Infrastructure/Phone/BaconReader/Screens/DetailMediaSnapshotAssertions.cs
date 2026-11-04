// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on a post's media in its detail view.</summary>
public static class DetailMediaSnapshotAssertions
{
    /// <summary>The post plays its video, in its player, without "Play video".</summary>
    public static AssertingThat<DetailMediaSnapshot> PlaysItsVideo(this AssertingThat<DetailMediaSnapshot> that)
    {
        var media = that.InstanceToAssert;
        Assert.True(media.PlaysAVideo && !media.ShowsPlayVideo, $"The post {Shows(media)}, but its video playing was expected.");
        return that;
    }

    /// <summary>The post shows "Play video" over its preview, and no video plays.</summary>
    public static AssertingThat<DetailMediaSnapshot> ShowsPlayVideoOverItsPreview(this AssertingThat<DetailMediaSnapshot> that)
    {
        var media = that.InstanceToAssert;
        Assert.True(media.ShowsPlayVideo && !media.PlaysAVideo, $"The post {Shows(media)}, but \"Play video\" over its preview was expected.");
        return that;
    }

    /// <summary>The post shows its media, an image or a GIF: no video player, and no "Play video".</summary>
    public static AssertingThat<DetailMediaSnapshot> ShowsItsMediaWithoutPlayVideo(this AssertingThat<DetailMediaSnapshot> that)
    {
        var media = that.InstanceToAssert;
        Assert.True(media.Shown && !media.ShowsPlayVideo && !media.PlaysAVideo, $"The post {Shows(media)}, but its GIF, without \"Play video\", was expected.");
        return that;
    }

    private static string Shows(DetailMediaSnapshot media) =>
        media switch
        {
            { ShowsPlayVideo: true } => "shows \"Play video\" over its preview",
            { PlaysAVideo: true } => "plays its video",
            { Shown: true } => "shows its media",
            _ => "shows no media",
        };
}
