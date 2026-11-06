// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the main screen's left menu.</summary>
public static class LeftMenuSnapshotAssertions
{
    /// <summary>The menu shows <paramref name="entry"/>.</summary>
    public static AssertingThat<LeftMenuSnapshot> Shows(this AssertingThat<LeftMenuSnapshot> that, MenuEntry entry)
    {
        var entries = that.InstanceToAssert.Entries;
        Assert.True(
            entries.Contains(entry),
            $"The left menu shows {Listed(entries)}, but not \"{entry.ToShownText()}\".");
        return that;
    }

    /// <summary>The menu shows <paramref name="entry"/> right after <paramref name="previous"/>.</summary>
    public static AssertingThat<LeftMenuSnapshot> ShowsAfter(this AssertingThat<LeftMenuSnapshot> that, MenuEntry entry, MenuEntry previous)
    {
        var entries = that.InstanceToAssert.Entries;
        var at = entries.IndexOf(previous);
        Assert.True(
            at >= 0 && at + 1 < entries.Length && entries[at + 1] == entry,
            $"The left menu shows {Listed(entries)}, but \"{entry.ToShownText()}\" was expected right after \"{previous.ToShownText()}\".");
        return that;
    }

    /// <summary>The menu shows the test account's user name (<see cref="TestAccount"/>): the account is logged in.</summary>
    public static AssertingThat<LeftMenuSnapshot> ShowsTheTestAccountsUserName(this AssertingThat<LeftMenuSnapshot> that)
    {
        var entries = that.InstanceToAssert.Entries;
        Assert.True(
            entries.Any(entry => entry.ToShownText() == TestAccount.UserName),
            $"The left menu shows {Listed(entries)}, but not the test account's user name, \"{TestAccount.UserName}\".");
        return that;
    }

    private static string Listed(IEnumerable<MenuEntry> entries) =>
        string.Join(", ", entries.Select(entry => $"\"{entry.ToShownText()}\""));
}
