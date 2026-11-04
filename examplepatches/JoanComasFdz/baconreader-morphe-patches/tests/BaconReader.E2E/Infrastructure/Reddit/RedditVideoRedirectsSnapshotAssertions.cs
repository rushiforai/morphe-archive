// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests Reddit got for the posts of videos.</summary>
public static class RedditVideoRedirectsSnapshotAssertions
{
    /// <summary>Reddit redirected the video of "<paramref name="title"/>" to its post: a 302, given to a browser.</summary>
    public static AssertingThat<RedditVideoRedirectsSnapshot> RedirectedTheVideoToItsPost(
        this AssertingThat<RedditVideoRedirectsSnapshot> that, string title)
    {
        var requests = that.InstanceToAssert.Requests;
        Assert.True(
            requests.Any(request => request.Post == title && request.Status == 302),
            $"Reddit didn't redirect the video of \"{title}\" to its post; it got: {(requests.IsEmpty ? "no request for a video's post" : string.Join(", ", requests.Select(request => $"{request.Post ?? "a video without a post"} ({request.Status})")))}.");
        return that;
    }
}
