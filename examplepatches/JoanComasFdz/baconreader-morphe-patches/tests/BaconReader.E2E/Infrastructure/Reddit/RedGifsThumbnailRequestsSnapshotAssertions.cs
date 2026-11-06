// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests for a RedGIFs video's thumbnail.</summary>
public static class RedGifsThumbnailRequestsSnapshotAssertions
{
    /// <summary>RedGIFs served the thumbnail: it answered a request for it 200.</summary>
    public static AssertingThat<RedGifsThumbnailRequestsSnapshot> Served(this AssertingThat<RedGifsThumbnailRequestsSnapshot> that)
    {
        var snapshot = that.InstanceToAssert;
        Assert.True(
            snapshot.Statuses.Contains(200),
            $"RedGIFs didn't serve the thumbnail of \"{snapshot.Title}\"; it answered: {(snapshot.Statuses.IsEmpty ? "no request" : string.Join(", ", snapshot.Statuses))}.");
        return that;
    }
}
