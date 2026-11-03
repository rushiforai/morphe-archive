// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>A button of "Show posts with flair", the dialog of "Flair filter", as it names it. A case is added when a test needs it.</summary>
[Union]
public partial record FlairFilterButton
{
    public partial record Apply;

    public partial record Clear;

    public partial record Cancel;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="FlairFilterButton"/>: the only place those strings live.</summary>
public static class FlairFilterButtonShowing
{
    private static readonly FlairFilterButton[] Listed = [new FlairFilterButton.Apply(), new FlairFilterButton.Clear(), new FlairFilterButton.Cancel()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this FlairFilterButton value) =>
        value.Match(
            apply => "APPLY",
            clear => "CLEAR",
            cancel => "CANCEL",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="FlairFilterButton.Unlisted"/>.</summary>
    public static FlairFilterButton ReadFlairFilterButton(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new FlairFilterButton.Unlisted(shown);
}
