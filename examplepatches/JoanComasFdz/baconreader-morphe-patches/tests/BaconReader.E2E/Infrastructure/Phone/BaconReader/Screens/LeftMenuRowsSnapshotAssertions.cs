// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of the left menu's rows: "Account colors"' circles on the accounts' rows.</summary>
public static class LeftMenuRowsSnapshotAssertions
{
    /// <summary>The menu shows the circle <paramref name="circle"/>, such as "Color of e2e_user".</summary>
    public static AssertingThat<LeftMenuRowsSnapshot> ShowsTheCircle(this AssertingThat<LeftMenuRowsSnapshot> that, string circle)
    {
        Assert.True(
            that.InstanceToAssert.Rows.Any(row => row.Circle == circle),
            $"The left menu shows {Circles(that.InstanceToAssert)}, but not \"{circle}\".");
        return that;
    }

    /// <summary>The menu shows no circle <paramref name="circle"/>.</summary>
    public static AssertingThat<LeftMenuRowsSnapshot> ShowsNoCircle(this AssertingThat<LeftMenuRowsSnapshot> that, string circle)
    {
        Assert.False(
            that.InstanceToAssert.Rows.Any(row => row.Circle == circle),
            $"The left menu shows the circle \"{circle}\", but none was expected.");
        return that;
    }

    /// <summary>
    /// The circle <paramref name="circle"/> is on the row of <paramref name="userName"/>, right of the name and left of the
    /// row's ✕, without overlapping either.
    /// </summary>
    public static AssertingThat<LeftMenuRowsSnapshot> ShowsTheCircleBetweenTheNameAndItsX(this AssertingThat<LeftMenuRowsSnapshot> that, string circle, string userName)
    {
        var row = RowOf(that.InstanceToAssert, circle);
        // "Show user avatars" draws an account's avatar over an object replacement character before its name.
        Assert.True(row.Text == userName || row.Text == "\uFFFC " + userName, $"The circle \"{circle}\" is on the row \"{row.Text}\", but on \"{userName}\"'s was expected.");
        Assert.True(row.IconBounds is not null, $"The row \"{userName}\" shows no ✕.");
        var bounds = row.CircleBounds!.Value;
        Assert.True(
            bounds.Left >= row.TextBounds.Right && bounds.Right <= row.IconBounds!.Value.Left,
            $"The circle \"{circle}\" is at {bounds.Left}–{bounds.Right} px, but between the name (ending at {row.TextBounds.Right} px) and its ✕ (starting at {row.IconBounds!.Value.Left} px) was expected.");
        return that;
    }

    /// <summary>The circle <paramref name="circle"/> is only an outline: the account has no color.</summary>
    public static AssertingThat<LeftMenuRowsSnapshot> ShowsTheCircleAsAnOutline(this AssertingThat<LeftMenuRowsSnapshot> that, string circle)
    {
        Assert.True(RowOf(that.InstanceToAssert, circle).CircleFilled == false, $"The circle \"{circle}\" is filled, but an outline was expected.");
        return that;
    }

    /// <summary>The circle <paramref name="circle"/> is filled: the account has a color.</summary>
    public static AssertingThat<LeftMenuRowsSnapshot> ShowsTheCircleFilled(this AssertingThat<LeftMenuRowsSnapshot> that, string circle)
    {
        Assert.True(RowOf(that.InstanceToAssert, circle).CircleFilled == true, $"The circle \"{circle}\" is an outline, but filled was expected.");
        return that;
    }

    /// <summary>The row <paramref name="entry"/>, such as "Log out", shows no color circle.</summary>
    public static AssertingThat<LeftMenuRowsSnapshot> ShowsNoColorCircleOn(this AssertingThat<LeftMenuRowsSnapshot> that, MenuEntry entry)
    {
        var rows = that.InstanceToAssert.Rows.Where(row => row.Text == entry.ToShownText()).ToList();
        Assert.True(rows.Count > 0, $"The left menu shows no row \"{entry.ToShownText()}\".");
        var circle = rows.Select(row => row.Circle).FirstOrDefault(found => found is not null);
        Assert.True(circle is null, $"The row \"{entry.ToShownText()}\" shows the circle \"{circle}\", but none was expected.");
        return that;
    }

    private static LeftMenuRow RowOf(LeftMenuRowsSnapshot rows, string circle) =>
        rows.Rows.FirstOrDefault(row => row.Circle == circle)
        ?? throw new Xunit.Sdk.XunitException($"The left menu shows {Circles(rows)}, but not \"{circle}\".");

    private static string Circles(LeftMenuRowsSnapshot rows)
    {
        var circles = rows.Rows.Where(row => row.Circle is not null).Select(row => $"\"{row.Circle}\"").ToList();
        return circles.Count == 0 ? "no circle" : $"the circles {string.Join(", ", circles)}";
    }
}
