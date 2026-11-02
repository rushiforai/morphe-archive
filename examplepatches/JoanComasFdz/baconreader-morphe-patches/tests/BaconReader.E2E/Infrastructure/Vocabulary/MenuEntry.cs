// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>An entry of the main screen's left menu, as it names it. A case is added when a test needs it.</summary>
[Union]
public partial record MenuEntry
{
    /// <summary>The menu's first entry while no account is logged in; once one is, its user name takes its place.</summary>
    public partial record AddAccount;

    /// <summary>The account's inbox: its messages.</summary>
    public partial record Inbox;

    /// <summary>The app's settings: BaconReader's sections, then the patches' "Patches".</summary>
    public partial record Settings;

    /// <summary>What the app shows that no case names yet (a user name): a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="MenuEntry"/>: the only place those strings live.</summary>
public static class MenuEntryShowing
{
    private static readonly MenuEntry[] Listed = [new MenuEntry.AddAccount(), new MenuEntry.Inbox(), new MenuEntry.Settings()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this MenuEntry value) =>
        value.Match(
            addAccount => "Add account",
            inbox => "Inbox",
            settings => "Settings",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="MenuEntry.Unlisted"/>.</summary>
    public static MenuEntry ReadMenuEntry(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new MenuEntry.Unlisted(shown);
}
