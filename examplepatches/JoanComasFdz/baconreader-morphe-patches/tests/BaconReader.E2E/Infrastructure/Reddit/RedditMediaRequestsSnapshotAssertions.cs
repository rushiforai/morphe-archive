// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the media files Reddit served.</summary>
public static class RedditMediaRequestsSnapshotAssertions
{
    /// <summary>Reddit served the image the link "<paramref name="link"/>" links to.</summary>
    public static AssertingThat<RedditMediaRequestsSnapshot> ServedTheImageOf(this AssertingThat<RedditMediaRequestsSnapshot> that, string link)
    {
        var path = "/_media/" + RedditMediaRequestsSnapshot.ImageLinkedBy(link);
        var served = that.InstanceToAssert.Paths;
        Assert.True(
            served.Contains(path),
            $"Reddit served {(served.IsEmpty ? "no media" : string.Join(", ", served))}, but the image \"{link}\" links to, {path}, was expected.");
        return that;
    }
}
