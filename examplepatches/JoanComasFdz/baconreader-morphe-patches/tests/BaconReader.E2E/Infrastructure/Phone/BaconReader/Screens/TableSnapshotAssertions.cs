// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>What a test checks of what a text's tables show.</summary>
public static class TableSnapshotAssertions
{
    /// <summary>
    /// The table shows <paramref name="rows"/>, top to bottom, each its cells left to right, separated by ", " as the
    /// Gherkin writes them ("Player, Score").
    /// </summary>
    public static AssertingThat<TableSnapshot> ShowsTheRows(this AssertingThat<TableSnapshot> that, params string[] rows)
    {
        var shown = that.InstanceToAssert.Rows.Select(row => string.Join(", ", row)).ToList();
        Assert.True(
            shown.SequenceEqual(rows),
            $"The table shows the rows {Quoted(shown)}, but {Quoted(rows)} were expected.");
        return that;
    }

    /// <summary>The table doesn't show <paramref name="button"/>: it fits the text's width.</summary>
    public static AssertingThat<TableSnapshot> ShowsNoButton(this AssertingThat<TableSnapshot> that, TableButton button)
    {
        var buttons = that.InstanceToAssert.Buttons;
        Assert.True(
            !buttons.Contains(button),
            $"The table shows \"{button.ToShownText()}\", but no \"{button.ToShownText()}\" was expected.");
        return that;
    }

    private static string Quoted(IEnumerable<string> rows) =>
        rows.Any() ? string.Join(", ", rows.Select(row => $"\"{row}\"")) : "no row";
}
