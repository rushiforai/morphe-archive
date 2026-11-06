// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>Where "Attach media" in the reply screen takes an image from, as its dialog names it. A case is added when a test needs it.</summary>
[Union]
public partial record MediaSource
{
    /// <summary>BaconReader's drawing screen (DrawChat).</summary>
    public partial record Draw;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="MediaSource"/>: the only place those strings live.</summary>
public static class MediaSourceShowing
{
    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this MediaSource value) =>
        value.Match(
            draw => "Draw",
            unlisted => unlisted.Shown);
}
