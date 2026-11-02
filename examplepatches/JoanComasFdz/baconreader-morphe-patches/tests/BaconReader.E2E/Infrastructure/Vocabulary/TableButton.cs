// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>The button under a table wider than the text ("Show tables"), which expands it or fits it again.</summary>
[Union]
public partial record TableButton
{
    public partial record Expand;
    public partial record FitToScreen;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

public static class TableButtonShowing
{
    private static readonly TableButton[] Listed = [new TableButton.Expand(), new TableButton.FitToScreen()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this TableButton value) =>
        value.Match(
            expand => "↔ Expand",
            fitToScreen => "Fit to screen",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="TableButton.Unlisted"/>.</summary>
    public static TableButton ReadTableButton(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new TableButton.Unlisted(shown);
}
