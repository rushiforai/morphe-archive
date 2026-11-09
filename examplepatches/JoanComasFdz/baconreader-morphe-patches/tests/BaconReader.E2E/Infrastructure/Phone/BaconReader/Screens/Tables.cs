// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using System.Drawing;
using OpenQA.Selenium;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The tables "Show tables" draws in a comment's or a post's text. A table is drawn on one character of the text, so the
/// patch shows each cell and the "↔ Expand" / "Fit to screen" button to accessibility as views of the text, named
/// <c>baconreader_patches_table_cell</c> and <c>baconreader_patches_table_button</c>, each where its text shows. A cell
/// scrolled out of the table's width isn't there.
/// </summary>
internal static class Tables
{
    private const string Cell = "baconreader_patches_table_cell";
    private const string Button = "baconreader_patches_table_button";

    /// <summary>What the tables of <paramref name="text"/>, a comment's or a post's text, show.</summary>
    public static TableSnapshot Read(ScreenNode text) =>
        new(
            [.. Rows(Cells(text)).Select(row => row.Select(cell => cell.Text).ToImmutableArray())],
            Buttons(text).Select(button => TableButtonShowing.ReadTableButton(button.Text)).ToImmutableArray());

    /// <summary>Where the cells of the tables of <paramref name="text"/> show, and the text and the screen.</summary>
    public static TableLayoutSnapshot ReadLayout(ScreenNode text, int screenWidth) =>
        new([.. Cells(text)], text.Bounds, screenWidth);

    /// <summary>The cell of the tables of <paramref name="text"/> that shows exactly <paramref name="cell"/>, or null.</summary>
    public static ScreenNode? FindCell(ScreenNode text, string cell) =>
        text.WithAppId(Cell).FirstOrDefault(found => found.Text == cell);

    /// <summary>The buttons under the tables of <paramref name="text"/>.</summary>
    public static IReadOnlyList<ScreenNode> Buttons(ScreenNode text) => [.. text.WithAppId(Button)];

    /// <summary>The top left cell <paramref name="text"/> shows of its tables, or null.</summary>
    public static ScreenNode? FirstCell(ScreenNode text) =>
        text.WithAppId(Cell).OrderBy(cell => cell.Bounds.Y).ThenBy(cell => cell.Bounds.X).FirstOrDefault();

    /// <summary>Whether <paramref name="text"/> shows a table's cells.</summary>
    public static bool HasCells(ScreenNode text) => text.WithAppId(Cell).Any();

    // The cells are views of the text, so they are inside its node of a ScreenSnapshot.
    private static List<TableCell> Cells(ScreenNode text) =>
        [.. text.WithAppId(Cell).Select(cell => new TableCell(cell.Text, cell.Bounds)).OrderBy(cell => cell.Bounds.Top).ThenBy(cell => cell.Bounds.Left)];

    // A row's cells start their text at the same height.
    private static IEnumerable<List<TableCell>> Rows(List<TableCell> cells) =>
        cells.GroupBy(cell => cell.Bounds.Top).Select(row => row.OrderBy(cell => cell.Bounds.Left).ToList());
}

/// <summary>What a text's tables show: their rows, top to bottom, each its cells' texts, and their buttons.</summary>
public sealed record TableSnapshot(ImmutableArray<ImmutableArray<string>> Rows, ImmutableArray<TableButton> Buttons);

/// <summary>A cell of a table: its text, and where it shows on the screen, in pixels.</summary>
public sealed record TableCell(string Text, Rectangle Bounds);

/// <summary>
/// Where a text's table cells show (a cell out of the table's width isn't there), and the text holding them and the
/// screen's width, in pixels: a cell cut at the table's right edge ends at the text's.
/// </summary>
public sealed record TableLayoutSnapshot(ImmutableArray<TableCell> Cells, Rectangle Text, int ScreenWidth);
