// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// What a test checks of where a table's cells show, from their bounds: each cell's bounds are its text's, and a cell cut
/// at the table's right edge ends at the edge of the text holding the table.
/// </summary>
public static class TableLayoutSnapshotAssertions
{
    /// <summary>No two cells overlap.</summary>
    public static AssertingThat<TableLayoutSnapshot> ColumnsDontOverlap(this AssertingThat<TableLayoutSnapshot> that)
    {
        var cells = that.InstanceToAssert.Cells;
        Assert.True(!cells.IsEmpty, "The table shows no cell, but its cells were expected.");
        var overlap = cells.SelectMany((cell, index) => cells.Skip(index + 1).Where(other => other.Bounds.IntersectsWith(cell.Bounds)).Select(other => (cell, other))).FirstOrDefault();
        Assert.True(
            overlap == default,
            $"The cell \"{overlap.cell?.Text}\" at {overlap.cell?.Bounds} overlaps the cell \"{overlap.other?.Text}\" at {overlap.other?.Bounds}, but no cells were expected to overlap.");
        return that;
    }

    /// <summary>Every cell shows whole inside the screen: none is cut at the table's right edge or out of the screen.</summary>
    public static AssertingThat<TableLayoutSnapshot> FitsInsideTheScreen(this AssertingThat<TableLayoutSnapshot> that)
    {
        var layout = that.InstanceToAssert;
        Assert.True(!layout.Cells.IsEmpty, "The table shows no cell, but its cells were expected.");
        var outside = layout.Cells.FirstOrDefault(cell => cell.Bounds.Left < 0 || cell.Bounds.Right > layout.ScreenWidth || IsCut(layout, cell));
        Assert.True(
            outside is null,
            $"The cell \"{outside?.Text}\" at {outside?.Bounds} is cut by the table's edge at {layout.Text.Right} or the screen's at {layout.ScreenWidth}, but the table was expected to fit inside the screen.");
        return that;
    }

    /// <summary>
    /// The table hides the column headed "<paramref name="header"/>" past its right edge: that cell isn't shown, and a
    /// cell is cut at the table's right edge.
    /// </summary>
    public static AssertingThat<TableLayoutSnapshot> HidesTheColumnPastItsRightEdge(this AssertingThat<TableLayoutSnapshot> that, string header)
    {
        var layout = that.InstanceToAssert;
        var shown = layout.Cells.FirstOrDefault(cell => cell.Text == header);
        Assert.True(
            shown is null,
            $"The table shows the cell \"{header}\" at {shown?.Bounds}, but its column was expected past the table's right edge, at {layout.Text.Right}.");
        Assert.True(
            layout.Cells.Any(cell => IsCut(layout, cell)),
            $"The table shows no cell cut at its right edge, at {layout.Text.Right}, but it was expected wider than the screen.");
        return that;
    }

    /// <summary>The table shows the cell "<paramref name="text"/>" whole, inside the screen.</summary>
    public static AssertingThat<TableLayoutSnapshot> ShowsTheCellInsideTheScreen(this AssertingThat<TableLayoutSnapshot> that, string text)
    {
        var layout = that.InstanceToAssert;
        var cell = layout.Cells.FirstOrDefault(found => found.Text == text);
        Assert.True(cell is not null, $"The table doesn't show the cell \"{text}\", but it was expected inside the screen.");
        Assert.True(
            cell.Bounds.Left >= 0 && cell.Bounds.Right <= layout.ScreenWidth && !IsCut(layout, cell),
            $"The cell \"{text}\" is at {cell.Bounds}, cut by the table's edge at {layout.Text.Right} or the screen's at {layout.ScreenWidth}, but it was expected whole inside the screen.");
        return that;
    }

    // A cell's text ends a few pixels before its cell's right border; one cut by the table's edge ends at it.
    private static bool IsCut(TableLayoutSnapshot layout, TableCell cell) => cell.Bounds.Right >= layout.Text.Right - 1;
}
