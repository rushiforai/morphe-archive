// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks on the menu of the toolbar's "More options".</summary>
public static class OverflowMenuSnapshotAssertions
{
    /// <summary>The menu shows <paramref name="entry"/> greyed out: it can't be tapped.</summary>
    public static AssertingThat<OverflowMenuSnapshot> IsGreyedOut(this AssertingThat<OverflowMenuSnapshot> that, OverflowMenuEntry entry)
    {
        var item = Find(that.InstanceToAssert, entry);
        Assert.False(item.Enabled, $"The menu shows \"{entry.ToShownText()}\" enabled, but greyed out was expected.");
        return that;
    }

    /// <summary>The menu shows <paramref name="entry"/> enabled: it can be tapped.</summary>
    public static AssertingThat<OverflowMenuSnapshot> IsEnabled(this AssertingThat<OverflowMenuSnapshot> that, OverflowMenuEntry entry)
    {
        var item = Find(that.InstanceToAssert, entry);
        Assert.True(item.Enabled, $"The menu shows \"{entry.ToShownText()}\" greyed out, but enabled was expected.");
        return that;
    }

    private static OverflowMenuItem Find(OverflowMenuSnapshot menu, OverflowMenuEntry entry)
    {
        var item = menu.Items.FirstOrDefault(item => item.Entry == entry);
        Assert.True(
            item is not null,
            $"The menu shows {string.Join(", ", menu.Items.Select(shown => $"\"{shown.Entry.ToShownText()}\""))}, but \"{entry.ToShownText()}\" was expected.");
        return item;
    }
}
