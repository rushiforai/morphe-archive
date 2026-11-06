// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of BaconReader's lookups of a RedGIFs video.</summary>
public static class RedGifsLookupsSnapshotAssertions
{
    /// <summary>
    /// RedGIFs answered the video, 200, to a lookup with a temporary token it gave and BaconReader's User-Agent,
    /// "BaconReader", which the token was given to.
    /// </summary>
    public static AssertingThat<RedGifsLookupsSnapshot> AnsweredToBaconReadersTemporaryTokenAndUserAgent(this AssertingThat<RedGifsLookupsSnapshot> that)
    {
        var snapshot = that.InstanceToAssert;
        Assert.True(
            snapshot.Lookups.Any(lookup => lookup.Status == 200 && lookup.WithAToken && lookup.UserAgent == "BaconReader"),
            $"RedGIFs didn't answer the video of \"{snapshot.Title}\" to a temporary token and the User-Agent \"BaconReader\"; it was asked: {Asked(snapshot)}.");
        return that;
    }

    private static string Asked(RedGifsLookupsSnapshot snapshot) =>
        snapshot.Lookups.IsEmpty
            ? "nothing"
            : string.Join(", ", snapshot.Lookups.Select(lookup => $"{lookup.Status} ({(lookup.WithAToken ? "with a token" : "no token")}, User-Agent \"{lookup.UserAgent}\")"));
}
