// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of what Imgur's API got: the requests for an album or a gallery post.</summary>
public static class ImgurRequestsSnapshotAssertions
{
    /// <summary>Imgur's API answered a request for it, 200.</summary>
    public static AssertingThat<ImgurRequestsSnapshot> Served(this AssertingThat<ImgurRequestsSnapshot> that)
    {
        var requests = that.InstanceToAssert;
        Assert.True(
            requests.Statuses.Contains(200),
            $"Imgur didn't serve {requests.What}: {(requests.Statuses.IsEmpty ? "BaconReader never asked for it" : $"it answered {string.Join(", ", requests.Statuses)}")}.");
        return that;
    }
}
