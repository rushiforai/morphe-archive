// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests for an X post's photo.</summary>
public static class XPhotoRequestsSnapshotAssertions
{
    /// <summary>X served the small photo: it answered 200 to a request that asked for the small one, <c>?name=small</c>.</summary>
    public static AssertingThat<XPhotoRequestsSnapshot> ServedTheSmallPhoto(this AssertingThat<XPhotoRequestsSnapshot> that)
    {
        var snapshot = that.InstanceToAssert;
        Assert.True(
            snapshot.Requests.Any(request => request.Small && request.Status == 200),
            $"X didn't serve the small photo of \"{snapshot.Text}\"; it was asked: {(snapshot.Requests.IsEmpty ? "nothing" : string.Join(", ", snapshot.Requests.Select(request => $"{(request.Small ? "the small photo" : "the photo")} ({request.Status})")))}.");
        return that;
    }
}
