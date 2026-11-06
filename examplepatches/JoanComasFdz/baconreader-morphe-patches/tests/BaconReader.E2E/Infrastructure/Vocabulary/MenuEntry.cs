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

    /// <summary>"Reddit chat"'s Chat, with the count of its unread chat messages: "Chat (2)", or "Chat" with none.</summary>
    public partial record Chat(int Unread);

    /// <summary>The app's settings: BaconReader's sections, then the patches' "Patches".</summary>
    public partial record Settings;

    /// <summary>The form for a new post: a text, image or link post, its title, text and subreddit.</summary>
    public partial record SubmitPost;

    /// <summary>What the app shows that no case names yet (a user name): a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="MenuEntry"/>: the only place those strings live.</summary>
public static partial class MenuEntryShowing
{
    private static readonly MenuEntry[] Listed = [new MenuEntry.AddAccount(), new MenuEntry.Inbox(), new MenuEntry.Settings(), new MenuEntry.SubmitPost()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this MenuEntry value) =>
        value.Match(
            addAccount => "Add account",
            inbox => "Inbox",
            chat => chat.Unread > 0 ? $"Chat ({chat.Unread})" : "Chat",
            settings => "Settings",
            submitPost => "Submit post",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="MenuEntry.Unlisted"/>.</summary>
    public static MenuEntry ReadMenuEntry(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown)
        ?? (shown == "Chat" ? new MenuEntry.Chat(0) : (MenuEntry?)null)
        ?? (ChatWithUnread().Match(shown) is { Success: true } chat ? new MenuEntry.Chat(int.Parse(chat.Groups[1].Value, System.Globalization.CultureInfo.InvariantCulture)) : (MenuEntry?)null)
        ?? new MenuEntry.Unlisted(shown);

    [System.Text.RegularExpressions.GeneratedRegex(@"^Chat \((\d+)\)$")]
    private static partial System.Text.RegularExpressions.Regex ChatWithUnread();
}
