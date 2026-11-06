// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Inbox;

/// <summary>
/// "Reddit chat": Chat in the menu, after the Inbox, shows Reddit's chat website in place of the posts, under the
/// toolbar's "Chat". Reddit also sends each chat message to the inbox, titled "[direct chat room]": with "Chat messages
/// apart from the inbox" on, they're left out of the inbox and counted next to Chat, and showing the chat marks them
/// read. Reddit's chat is a website behind a login, with no API: the fake Reddit answers it with a plain page of its
/// own, so its login, rooms, sending and attachments are left out.
/// </summary>
public sealed class RedditChatTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Reddit chat counts chat messages apart from the inbox and shows the chat
          Given Reddit has a post "Weekly thread" in r/e2e
          And the test account has an unread message "Mod mail" saying "A normal message"
          And the test account has an unread message "[direct chat room]" saying "Hey there"
          And the test account has an unread message "[direct chat room]" saying "Are you around?"
          # Reddit's chat is a website with no API: the fake Reddit answers it with a plain page of its own.
          And Reddit's chat has a link "A post someone shared" to the post "Weekly thread"
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I open the left menu
          # "Chat messages apart from the inbox" is on by default: Reddit's copies of chat messages count for Chat.
          Then the left menu shows "Chat (2)" after "Inbox"
          When I tap "Inbox"
          Then the inbox shows the message "Mod mail" only
          When I go back
          And I open the left menu
          And I tap "Chat (2)"
          Then the toolbar shows "Chat" with only "Refresh"
          And the chat shows "Chats"
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit marked the 2 chat messages read
          When I open the left menu
          Then the left menu shows "Chat" after "Inbox"
          When I close the left menu
          And I tap "A post someone shared" in the chat
          Then the post "Weekly thread" shows
          When I go back
          Then the chat shows "Chats"
          When I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          # Here the patches' settings are one screen: no page to open first.
          And I tap "Chat messages apart from the inbox"
          And I go back to the chat
          And I open the left menu
          And I tap "Inbox"
          Then the inbox shows the messages "Mod mail", "[direct chat room]" and "[direct chat room]"
        """)]
    public async Task RedditChatCountsChatMessagesApartFromTheInboxAndShowsTheChat(Screen screen)
    {
        // Given
        Reddit.HasAPost("Weekly thread", "e2e");
        Reddit.TheTestAccountHasAnUnreadMessage("Mod mail", "A normal message");
        Reddit.TheTestAccountHasAnUnreadMessage("[direct chat room]", "Hey there");
        Reddit.TheTestAccountHasAnUnreadMessage("[direct chat room]", "Are you around?");
        Reddit.TheChatHasALinkToThePost("A post someone shared", "Weekly thread");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();

        // Then
        // "Chat messages apart from the inbox" is on by default: Reddit's copies of chat messages count for Chat.
        var menu = await Phone.BaconReader.Main.LeftMenu.ReadAsync();
        Asserting.That(menu).ShowsAfter(new MenuEntry.Chat(2), new MenuEntry.Inbox());

        // When
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Inbox());
        await Phone.BaconReader.Inbox.WaitUntilShownAsync();

        // Then
        var inbox = await Phone.BaconReader.Inbox.ReadAsync();
        Asserting.That(inbox).ShowsTheMessages("Mod mail");

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Main.Toolbar.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Chat(2));
        await Phone.BaconReader.Main.Chat.WaitUntilShownAsync("Chats");
        await Reddit.WaitUntilMessagesMarkedAsReadAsync(2);

        // Then
        // Not on the screen: the fake Reddit records what BaconReader sent.
        var toolbar = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        var chat = await Phone.BaconReader.Main.Chat.ReadAsync();
        var read = Reddit.ReadMessagesMarkedAsRead();
        Asserting.That(toolbar).ShowsFeed(new Feed.Chat()).ShowsOnlyTheButtons(new ToolbarButton.Refresh());
        Asserting.That(chat).Shows("Chats");
        Asserting.That(read).MarkedAsRead("[direct chat room]", "[direct chat room]");

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();

        // Then
        var menuAfterTheChat = await Phone.BaconReader.Main.LeftMenu.ReadAsync();
        Asserting.That(menuAfterTheChat).ShowsAfter(new MenuEntry.Chat(0), new MenuEntry.Inbox());

        // When
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Chat.WaitUntilShownAsync("A post someone shared");
        await Phone.BaconReader.Main.Chat.ClickLinkAsync("A post someone shared");
        await Phone.BaconReader.Detail.WaitUntilPostShownAsync("Weekly thread");

        // Then
        var post = await Phone.BaconReader.Detail.ReadPostAsync();
        Asserting.That(post).ShowsThePost("Weekly thread");

        // When
        await Phone.BaconReader.Detail.ClickBackAsync();
        await Phone.BaconReader.Main.Chat.WaitUntilShownAsync("Chats");

        // Then
        var chatAgain = await Phone.BaconReader.Main.Chat.ReadAsync();
        Asserting.That(chatAgain).Shows("Chats");

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ChatMessagesApartFromTheInbox());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ChatMessagesApartFromTheInbox());
        await Phone.BaconReader.GoBackToTheChatAsync("Chats");
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Inbox());
        await Phone.BaconReader.Inbox.WaitUntilShownAsync();

        // Then
        var inboxWithChats = await Phone.BaconReader.Inbox.ReadAsync();
        Asserting.That(inboxWithChats).ShowsTheMessages("Mod mail", "[direct chat room]", "[direct chat room]");
    }
}
