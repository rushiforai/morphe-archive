// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Reddit;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>What a test checks on Downloads/BaconReader.</summary>
public static class DownloadsSnapshotAssertions
{
    /// <summary>The folder holds <paramref name="image"/>, and nothing else: its file name, as many bytes as Reddit serves.</summary>
    public static AssertingThat<DownloadsSnapshot> HoldsTheImage(this AssertingThat<DownloadsSnapshot> that, RedditImageSnapshot image)
    {
        var files = that.InstanceToAssert.Files;
        Assert.True(
            files is [var file] && file.Name == image.FileName && file.Size == image.Size,
            $"Downloads/BaconReader holds {Listed(files)}, but only \"{image.FileName}\" ({image.Size} bytes) was expected.");
        return that;
    }

    /// <summary>The folder holds exactly the files <paramref name="names"/>, none of them empty.</summary>
    public static AssertingThat<DownloadsSnapshot> HoldsOnly(this AssertingThat<DownloadsSnapshot> that, params string[] names)
    {
        var files = that.InstanceToAssert.Files;
        Assert.True(
            files.Select(file => file.Name).Order().SequenceEqual(names.Order()) && files.All(file => file.Size > 0),
            $"Downloads/BaconReader holds {Listed(files)}, but only {string.Join(" and ", names.Select(name => $"\"{name}\""))}, none of them empty, was expected.");
        return that;
    }

    /// <summary>The folder holds the file <paramref name="name"/>, not empty.</summary>
    public static AssertingThat<DownloadsSnapshot> Holds(this AssertingThat<DownloadsSnapshot> that, string name)
    {
        var files = that.InstanceToAssert.Files;
        Assert.True(
            files.Any(file => file.Name == name && file.Size > 0),
            $"Downloads/BaconReader holds {Listed(files)}, but \"{name}\", not empty, was expected.");
        return that;
    }

    /// <summary>The video has a video track and a sound track.</summary>
    public static AssertingThat<SavedVideoSnapshot> HasAVideoTrackAndASoundTrack(this AssertingThat<SavedVideoSnapshot> that) =>
        HasTracks(that, video: true, sound: true);

    /// <summary>The video has a video track and no sound track.</summary>
    public static AssertingThat<SavedVideoSnapshot> HasAVideoTrackAndNoSoundTrack(this AssertingThat<SavedVideoSnapshot> that) =>
        HasTracks(that, video: true, sound: false);

    private static AssertingThat<SavedVideoSnapshot> HasTracks(AssertingThat<SavedVideoSnapshot> that, bool video, bool sound)
    {
        var saved = that.InstanceToAssert;
        Assert.True(
            saved.HasVideo == video && saved.HasSound == sound,
            $"\"{saved.Name}\" has {Tracks(saved.HasVideo, saved.HasSound)}, but {Tracks(video, sound)} was expected.");
        return that;
    }

    private static string Tracks(bool video, bool sound) =>
        $"{(video ? "a video track" : "no video track")} and {(sound ? "a sound track" : "no sound track")}";

    /// <summary>The folder holds no image.</summary>
    public static AssertingThat<DownloadsSnapshot> HoldsNoImage(this AssertingThat<DownloadsSnapshot> that)
    {
        var files = that.InstanceToAssert.Files;
        Assert.True(files.IsEmpty, $"Downloads/BaconReader holds {Listed(files)}, but nothing was expected.");
        return that;
    }

    private static string Listed(IReadOnlyCollection<SavedFile> files) =>
        files.Count == 0 ? "nothing" : string.Join(", ", files.Select(file => $"\"{file.Name}\" ({file.Size} bytes)"));
}
