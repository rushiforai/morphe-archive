// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>An entry of the menu a post's or a comment's ⋮ opens (on its card, its action bar, or the post's screen), as it names it. A case is added when a test needs it.</summary>
[Union]
public partial record PostMenuEntry
{
    public partial record BlockUser;

    /// <summary>Offered after "Block User"; "Remove awards" removes it.</summary>
    public partial record GiveAward;

    /// <summary>Offered after "Give Award"; "Remove awards" removes it.</summary>
    public partial record ViewAwardDetails;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="PostMenuEntry"/>: the only place those strings live.</summary>
public static class PostMenuEntryShowing
{
    private static readonly PostMenuEntry[] Listed = [new PostMenuEntry.BlockUser(), new PostMenuEntry.GiveAward(), new PostMenuEntry.ViewAwardDetails()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this PostMenuEntry value) =>
        value.Match(
            blockUser => "Block User",
            giveAward => "Give Award",
            viewAwardDetails => "View Award Details",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="PostMenuEntry.Unlisted"/>.</summary>
    public static PostMenuEntry ReadPostMenuEntry(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new PostMenuEntry.Unlisted(shown);
}
