// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Inbox;

/// <summary>
/// "Fix unread messages": "Mark read" on the last unread message turns the orange inbox envelope back to normal, and
/// clears the new messages notification; "Mark unread", which Reddit answers with 404, is gone. The notification isn't
/// played: the tests deny BaconReader's notifications, and BaconReader's own background check posts it.
/// </summary>
public sealed class FixUnreadMessagesTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Fix unread messages turns the inbox envelope back to normal once every message is read
          Given the test account has an unread message "First subject" saying "First message"
          And the test account has an unread message "Second subject" saying "Second message"
          And Reddit has a post "Hello from r/e2e" in r/e2e
          And BaconReader is patched with every patch
          And BaconReader is open
          And the test account is logged in
          When I open the left menu
          And I tap "Inbox"
          And I tap the message "Second message"
          Then the message's menu offers "Reply", "Mark read", "Open profile" and "Block user", in this order
          When I tap "Mark read"
          And I go back to the posts
          # "First subject" is still unread.
          Then the left menu's button shows the orange envelope
          When I open the left menu
          And I tap "Inbox"
          And I tap the message "Second message"
          # A read message: the patch removed "Mark unread", which Reddit answers with 404.
          Then the message's menu offers "Reply", "Open profile" and "Block user", in this order
          When I tap Back
          And I tap the message "First message"
          And I tap "Mark read"
          And I go back to the posts
          Then the left menu's button shows no orange envelope
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit got "First subject" and "Second subject" marked as read
        """)]
    public async Task FixUnreadMessagesTurnsTheInboxEnvelopeBackToNormalOnceEveryMessageIsRead(Screen screen)
    {
        // Given
        Reddit.TheTestAccountHasAnUnreadMessage("First subject", "First message");
        Reddit.TheTestAccountHasAnUnreadMessage("Second subject", "Second message");
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        await Phone.BaconReader.OpenAsync();
        await Phone.BaconReader.LogInWithTheTestAccountAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Inbox());
        await Phone.BaconReader.Inbox.WaitUntilShownAsync();
        await Phone.BaconReader.Inbox.ClickMessageAsync("Second message");
        await Phone.BaconReader.MessageMenu.WaitUntilShownAsync();

        // Then
        var unreadMenu = await Phone.BaconReader.MessageMenu.ReadAsync();
        Asserting.That(unreadMenu).OffersInThisOrder(
            new MessageMenuEntry.Reply(),
            new MessageMenuEntry.MarkRead(),
            new MessageMenuEntry.OpenProfile(),
            new MessageMenuEntry.BlockUser());

        // When
        await Phone.BaconReader.MessageMenu.ClickAsync(new MessageMenuEntry.MarkRead());
        await Phone.BaconReader.GoBackToThePostsAsync();

        // Then
        // "First subject" is still unread.
        var oneUnread = await Phone.BaconReader.Main.LeftMenu.ReadButtonAsync();
        Asserting.That(oneUnread).ShowsTheOrangeEnvelope();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Inbox());
        await Phone.BaconReader.Inbox.WaitUntilShownAsync();
        await Phone.BaconReader.Inbox.ClickMessageAsync("Second message");
        await Phone.BaconReader.MessageMenu.WaitUntilShownAsync();

        // Then
        // A read message: the patch removed "Mark unread", which Reddit answers with 404.
        var readMenu = await Phone.BaconReader.MessageMenu.ReadAsync();
        Asserting.That(readMenu).OffersInThisOrder(
            new MessageMenuEntry.Reply(),
            new MessageMenuEntry.OpenProfile(),
            new MessageMenuEntry.BlockUser());

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.Inbox.ClickMessageAsync("First message");
        await Phone.BaconReader.MessageMenu.WaitUntilShownAsync();
        await Phone.BaconReader.MessageMenu.ClickAsync(new MessageMenuEntry.MarkRead());
        await Phone.BaconReader.GoBackToThePostsAsync();

        // Then
        var noneUnread = await Phone.BaconReader.Main.LeftMenu.ReadButtonAsync();
        // Not on the screen: the fake Reddit records what BaconReader sent.
        var read = Reddit.ReadMessagesMarkedAsRead();
        Asserting.That(noneUnread).ShowsNoOrangeEnvelope();
        Asserting.That(read).MarkedAsRead("First subject", "Second subject");
    }
}
