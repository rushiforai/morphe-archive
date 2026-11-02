// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on a message's menu.</summary>
public static class MessageMenuSnapshotAssertions
{
    /// <summary>The menu offers exactly <paramref name="entries"/>, in this order.</summary>
    public static AssertingThat<MessageMenuSnapshot> OffersInThisOrder(this AssertingThat<MessageMenuSnapshot> that, params MessageMenuEntry[] entries)
    {
        var shown = that.InstanceToAssert.Entries;
        Assert.True(
            shown.SequenceEqual(entries),
            $"The message's menu offers {Listed(shown)}, but {Listed(entries)} was expected, in this order.");
        return that;
    }

    private static string Listed(IEnumerable<MessageMenuEntry> entries) =>
        string.Join(", ", entries.Select(entry => $"\"{entry.ToShownText()}\""));
}
