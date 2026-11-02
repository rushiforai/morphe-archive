// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>An entry of the menu a message of the inbox opens when tapped, as it names it. A case is added when a test needs it.</summary>
[Union]
public partial record MessageMenuEntry
{
    public partial record Reply;

    /// <summary>Only for an unread message.</summary>
    public partial record MarkRead;

    /// <summary>Only for a read message; "Fix unread messages" removes it.</summary>
    public partial record MarkUnread;

    public partial record OpenProfile;

    public partial record BlockUser;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

public static class MessageMenuEntryShowing
{
    private static readonly MessageMenuEntry[] Listed = [new MessageMenuEntry.Reply(), new MessageMenuEntry.MarkRead(), new MessageMenuEntry.MarkUnread(), new MessageMenuEntry.OpenProfile(), new MessageMenuEntry.BlockUser()];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this MessageMenuEntry value) =>
        value.Match(
            reply => "Reply",
            markRead => "Mark read",
            markUnread => "Mark unread",
            openProfile => "Open profile",
            blockUser => "Block user",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> text names, or <see cref="MessageMenuEntry.Unlisted"/>.</summary>
    public static MessageMenuEntry ReadMessageMenuEntry(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new MessageMenuEntry.Unlisted(shown);
}
