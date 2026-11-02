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
