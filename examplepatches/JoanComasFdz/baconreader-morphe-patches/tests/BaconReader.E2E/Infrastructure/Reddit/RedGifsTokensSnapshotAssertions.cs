// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the temporary tokens BaconReader asked RedGIFs for.</summary>
public static class RedGifsTokensSnapshotAssertions
{
    /// <summary>BaconReader asked RedGIFs for a temporary token since the phone joined another network.</summary>
    public static AssertingThat<RedGifsTokensSnapshot> AskedForANewTemporaryToken(this AssertingThat<RedGifsTokensSnapshot> that)
    {
        var snapshot = that.InstanceToAssert;
        Assert.True(
            snapshot.Since > 0,
            $"BaconReader asked RedGIFs for no temporary token since the phone joined another network; it asked for {snapshot.Before} before.");
        return that;
    }
}
