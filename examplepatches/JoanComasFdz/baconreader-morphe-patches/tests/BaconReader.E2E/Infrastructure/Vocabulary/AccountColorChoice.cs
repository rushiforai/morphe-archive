// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A choice of "Account colors"' color picker, which a tap on an account's circle in the left menu opens: one of its
/// colors, named as TalkBack reads them, or "NO COLOR".
/// </summary>
[Union]
public partial record AccountColorChoice
{
    public partial record Red;
    public partial record Pink;
    public partial record Purple;
    public partial record Indigo;
    public partial record Blue;
    public partial record Cyan;
    public partial record Teal;
    public partial record Green;
    public partial record Lime;
    public partial record Yellow;
    public partial record Orange;
    public partial record Brown;

    /// <summary>The dialog's button, which takes the account's color away.</summary>
    public partial record NoColor;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="AccountColorChoice"/>: the only place those strings live.</summary>
public static class AccountColorChoiceShowing
{
    /// <summary>Every choice a case names, in the picker's order: its colors, then its button.</summary>
    public static IReadOnlyList<AccountColorChoice> Listed { get; } =
    [
        new AccountColorChoice.Red(),
        new AccountColorChoice.Pink(),
        new AccountColorChoice.Purple(),
        new AccountColorChoice.Indigo(),
        new AccountColorChoice.Blue(),
        new AccountColorChoice.Cyan(),
        new AccountColorChoice.Teal(),
        new AccountColorChoice.Green(),
        new AccountColorChoice.Lime(),
        new AccountColorChoice.Yellow(),
        new AccountColorChoice.Orange(),
        new AccountColorChoice.Brown(),
        new AccountColorChoice.NoColor(),
    ];

    /// <summary>What the app shows for <paramref name="value"/>: a color's description, or the button's text.</summary>
    public static string ToShownText(this AccountColorChoice value) =>
        value.Match(
            red => "Red",
            pink => "Pink",
            purple => "Purple",
            indigo => "Indigo",
            blue => "Blue",
            cyan => "Cyan",
            teal => "Teal",
            green => "Green",
            lime => "Lime",
            yellow => "Yellow",
            orange => "Orange",
            brown => "Brown",
            noColor => "NO COLOR",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="AccountColorChoice.Unlisted"/>.</summary>
    public static AccountColorChoice ReadAccountColorChoice(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new AccountColorChoice.Unlisted(shown);
}
