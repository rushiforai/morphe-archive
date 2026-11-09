// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// What a test checks on the left menu's accounts: the user name at its top and the accounts under it. "Show user
/// avatars" draws each account's avatar before its name, over an object replacement character, "￼ ".
/// </summary>
public static class LeftMenuAccountsSnapshotAssertions
{
    private const string Avatar = "￼ ";

    /// <summary>
    /// The accounts show the test account's user name (<see cref="TestAccount"/>), with or without its avatar before
    /// it, then <paramref name="next"/>, and nothing else.
    /// </summary>
    public static AssertingThat<LeftMenuAccountsSnapshot> ShowsTheTestAccountsUserNameThen(this AssertingThat<LeftMenuAccountsSnapshot> that, MenuEntry next)
    {
        var rows = that.InstanceToAssert.Rows;
        Assert.True(
            rows.Length == 2 && rows[0].ToShownText() is TestAccount.UserName or Avatar + TestAccount.UserName && rows[1] == next,
            $"The left menu's accounts show {Listed(rows)}, but \"{TestAccount.UserName}\", \"{next.ToShownText()}\" was expected.");
        return that;
    }

    /// <summary>The accounts don't show <paramref name="row"/>.</summary>
    public static AssertingThat<LeftMenuAccountsSnapshot> DoesNotShow(this AssertingThat<LeftMenuAccountsSnapshot> that, MenuEntry row)
    {
        var rows = that.InstanceToAssert.Rows;
        Assert.False(
            rows.Contains(row),
            $"The left menu's accounts show {Listed(rows)}, with \"{row.ToShownText()}\", which was expected gone.");
        return that;
    }

    /// <summary>
    /// The top of the menu shows the account <paramref name="user"/>: the account in use, with or without the avatar "Show
    /// user avatars" draws before its name.
    /// </summary>
    public static AssertingThat<LeftMenuAccountsSnapshot> ShowsAtTheTop(this AssertingThat<LeftMenuAccountsSnapshot> that, string user)
    {
        var userName = that.InstanceToAssert.UserName;
        Assert.True(userName == user || userName == Avatar + user, $"The left menu shows \"{userName}\" at the top, but \"{user}\" was expected.");
        return that;
    }

    /// <summary>The top of the menu shows "<paramref name="shown"/>" with the avatar of "<paramref name="user"/>" before the name.</summary>
    public static AssertingThat<LeftMenuAccountsSnapshot> ShowsWithAnAvatarBefore(this AssertingThat<LeftMenuAccountsSnapshot> that, string shown, string user)
    {
        var userName = that.InstanceToAssert.UserName;
        var expected = shown.Replace(user, Avatar + user, StringComparison.Ordinal);
        Assert.True(userName == expected, $"The left menu shows \"{userName}\", but \"{shown}\" with an avatar before \"{user}\" was expected.");
        return that;
    }

    /// <summary>The accounts show "<paramref name="shown"/>" with the avatar of "<paramref name="user"/>" before the name.</summary>
    public static AssertingThat<LeftMenuAccountsSnapshot> ShowsInTheAccountsListWithAnAvatarBefore(this AssertingThat<LeftMenuAccountsSnapshot> that, string shown, string user)
    {
        var rows = that.InstanceToAssert.Rows;
        var expected = shown.Replace(user, Avatar + user, StringComparison.Ordinal);
        Assert.True(
            rows.Any(row => row.ToShownText() == expected),
            $"The left menu's accounts show {Listed(rows)}, but \"{shown}\" with an avatar before \"{user}\" was expected.");
        return that;
    }

    /// <summary>The accounts show <paramref name="row"/>, such as "Add account", with no avatar before it.</summary>
    public static AssertingThat<LeftMenuAccountsSnapshot> ShowsInTheAccountsListWithNoAvatar(this AssertingThat<LeftMenuAccountsSnapshot> that, MenuEntry row)
    {
        var rows = that.InstanceToAssert.Rows;
        Assert.True(
            rows.Contains(row),
            $"The left menu's accounts show {Listed(rows)}, but \"{row.ToShownText()}\" with no avatar was expected.");
        return that;
    }

    private static string Listed(IEnumerable<MenuEntry> rows) =>
        rows.Any() ? string.Join(", ", rows.Select(row => $"\"{row.ToShownText()}\"")) : "nothing";
}
