// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests Reddit got for share links.</summary>
public static class RedditShareLinkRequestsSnapshotAssertions
{
    /// <summary>Reddit answered a share link of the post "<paramref name="title"/>" with its redirect, a 301 to the post.</summary>
    public static AssertingThat<RedditShareLinkRequestsSnapshot> AnsweredTheShareLinkWithTheAddressOf(
        this AssertingThat<RedditShareLinkRequestsSnapshot> that, string title)
    {
        var requests = that.InstanceToAssert.Requests;
        Assert.True(
            requests.Any(request => request.Post == title && request.Status == 301),
            $"Reddit answered no share link of the post \"{title}\" with a 301 to it; it got: {(requests.IsEmpty ? "no share link" : string.Join(", ", requests.Select(request => $"{request.Path} ({request.Status})")))}.");
        return that;
    }
}
