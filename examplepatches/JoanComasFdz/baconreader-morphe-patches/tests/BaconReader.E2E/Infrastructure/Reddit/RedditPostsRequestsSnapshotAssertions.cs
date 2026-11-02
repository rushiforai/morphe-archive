// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests Reddit got for posts.</summary>
public static class RedditPostsRequestsSnapshotAssertions
{
    /// <summary>
    /// Reddit got a request for posts, and every one carried RedReader's User-Agent: "Spoof client" changed it for the
    /// app's own requests, not only for the login.
    /// </summary>
    public static AssertingThat<RedditPostsRequestsSnapshot> CarriedRedReadersUserAgent(this AssertingThat<RedditPostsRequestsSnapshot> that)
    {
        var requests = that.InstanceToAssert.Requests;
        Assert.True(!requests.IsEmpty, "Reddit got no request for posts while logged in, but the app was expected to ask for them.");
        var other = requests.FirstOrDefault(request => request.UserAgent != RedReader.UserAgent);
        Assert.True(
            other is null,
            $"Reddit got the request for the posts at \"{other?.Path}\" with the User-Agent \"{other?.UserAgent}\", but RedReader's, \"{RedReader.UserAgent}\", was expected.");
        return that;
    }
}
