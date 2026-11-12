// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A section of the patches' settings that is on the screen itself rather than on a page, as its title names it. A case
/// is added when a test needs it.
/// </summary>
[Union]
public partial record PatchesSection
{
    /// <summary>"Account colors"' section, whose one setting has the same title.</summary>
    public partial record AccountColors;

    /// <summary>The "Links" section: "Open web pages in the browser" first.</summary>
    public partial record Links;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="PatchesSection"/>: the only place those strings live.</summary>
public static class PatchesSectionShowing
{
    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this PatchesSection value) =>
        value.Match(
            accountColors => "Account colors",
            links => "Links",
            unlisted => unlisted.Shown);
}
