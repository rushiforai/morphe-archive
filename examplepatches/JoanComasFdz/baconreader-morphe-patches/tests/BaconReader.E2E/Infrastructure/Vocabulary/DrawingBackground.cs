// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>Where the drawing screen's "Camera" takes a background from, as its "Choose" dialog names it. A case is added when a test needs it.</summary>
[Union]
public partial record DrawingBackground
{
    /// <summary>The meme templates' grid.</summary>
    public partial record Memes;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="DrawingBackground"/>: the only place those strings live.</summary>
public static class DrawingBackgroundShowing
{
    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this DrawingBackground value) =>
        value.Match(
            memes => "Memes",
            unlisted => unlisted.Shown);
}
