// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>What a test checks on a post's or a comment's menu.</summary>
public static class PostMenuSnapshotAssertions
{
    /// <summary>The menu offers <paramref name="entry"/>.</summary>
    public static AssertingThat<PostMenuSnapshot> Offers(this AssertingThat<PostMenuSnapshot> that, PostMenuEntry entry)
    {
        var shown = that.InstanceToAssert.Entries;
        Assert.True(shown.Contains(entry), $"The menu offers {Listed(shown)}, but \"{entry.ToShownText()}\" was expected too.");
        return that;
    }

    /// <summary>The menu offers none of <paramref name="entries"/>.</summary>
    public static AssertingThat<PostMenuSnapshot> DoesntOffer(this AssertingThat<PostMenuSnapshot> that, params PostMenuEntry[] entries)
    {
        var shown = that.InstanceToAssert.Entries;
        var offered = entries.Where(shown.Contains).ToArray();
        Assert.True(offered.Length == 0, $"The menu offers {Listed(shown)}, but {Listed(offered)} wasn't expected.");
        return that;
    }

    private static string Listed(IEnumerable<PostMenuEntry> entries) =>
        string.Join(", ", entries.Select(entry => $"\"{entry.ToShownText()}\""));
}
