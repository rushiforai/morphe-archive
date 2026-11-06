// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Reddit;

/// <summary>What a test checks of the requests for a Snoomoji's GIF.</summary>
public static class SnoomojiRequestsSnapshotAssertions
{
    /// <summary>Reddit served the Snoomoji's GIF: it answered 200 to a request for it.</summary>
    public static AssertingThat<SnoomojiRequestsSnapshot> WasServed(this AssertingThat<SnoomojiRequestsSnapshot> that)
    {
        var snapshot = that.InstanceToAssert;
        Assert.True(
            snapshot.Statuses.Contains(200),
            $"Reddit didn't serve the Snoomoji \"{snapshot.Name}\"; it was asked {(snapshot.Statuses.IsEmpty ? "nothing" : string.Join(", ", snapshot.Statuses))}.");
        return that;
    }
}
