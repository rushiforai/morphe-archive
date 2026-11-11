// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Inbox;

/// <summary>
/// "Inbox comment reply screen": "Reply" on a message of the inbox opens the comment reply screen, "Reply to … as …"
/// over the text being answered, instead of BaconReader's "Send message" form; a private message shows as a comment of
/// its sender, without "in r/…", and a comment reply with its subreddit. The reply goes to Reddit as a comment on the
/// message or the comment (<c>api/comment</c>), and the screen goes back to the inbox.
/// </summary>
public sealed class InboxCommentReplyScreenTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Inbox comment reply screen replies to private messages and comment replies on the comment reply screen
          Given Reddit has a post "Introductions" in r/e2e
          And the post "Introductions" has a comment "Welcome" by u/e2e_user
          And the comment "Welcome" has a reply "Thanks for having me" by u/other_user
          And the test account has an unread message "Hello" saying "A private message"
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I open the left menu
          And I tap "Inbox"
          And I tap the message "Hello"
          And I tap "Reply"
          # The fake Reddit's messages come from u/e2e_sender. A private message has no subreddit: no "in r/…".
          Then the reply screen shows "Reply to e2e_sender as e2e_user" over "A private message"
          When I type "Thanks for writing"
          # BaconReader describes the send button "Attach media", as the button before it.
          And I tap the send button
          Then Reddit got the reply "Thanks for writing" to the message "Hello"
          When I tap the comment reply "Thanks for having me"
          And I tap "Reply"
          Then the reply screen shows "Reply to other_user in r/e2e as e2e_user" over "Thanks for having me"
          When I type "You're welcome"
          And I tap the send button
          Then Reddit got the reply "You're welcome" to the comment "Thanks for having me"
        """)]
    public async Task InboxCommentReplyScreenRepliesToPrivateMessagesAndCommentRepliesOnTheCommentReplyScreen(Screen screen)
    {
        // Given
        Reddit.HasAPost("Introductions", "e2e");
        Reddit.ThePost("Introductions").HasACommentBy("Welcome", "e2e_user");
        Reddit.ThePost("Introductions").TheComment("Welcome").HasAReplyBy("Thanks for having me", "other_user");
        Reddit.TheTestAccountHasAnUnreadMessage("Hello", "A private message");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Inbox());
        await Phone.BaconReader.Inbox.WaitUntilShownAsync();
        await Phone.BaconReader.Inbox.ClickTheMessageAsync("Hello");
        await Phone.BaconReader.MessageMenu.WaitUntilShownAsync();
        await Phone.BaconReader.MessageMenu.ClickAsync(new MessageMenuEntry.Reply());
        await Phone.BaconReader.ReplyScreen.WaitUntilShownAsync();

        // Then
        // The fake Reddit's messages come from u/e2e_sender. A private message has no subreddit: no "in r/…".
        var toMessage = await Phone.BaconReader.ReplyScreen.ReadAsync();
        Asserting.That(toMessage).ShowsOver("Reply to e2e_sender as e2e_user", "A private message");

        // When
        await Phone.BaconReader.ReplyScreen.Editor.TypeAsync("Thanks for writing");
        await Phone.BaconReader.ReplyScreen.ClickSendAsync();
        await Reddit.WaitUntilAReplyToTheMessageIsSentAsync("Hello");

        // Then
        var messageReplies = Reddit.ReadRepliesToTheMessage("Hello");
        Asserting.That(messageReplies).GotTheReply("Thanks for writing");

        // When
        await Phone.BaconReader.Inbox.WaitUntilShownAsync();
        await Phone.BaconReader.Inbox.ClickMessageAsync("Thanks for having me");
        await Phone.BaconReader.MessageMenu.WaitUntilShownAsync();
        await Phone.BaconReader.MessageMenu.ClickAsync(new MessageMenuEntry.Reply());
        await Phone.BaconReader.ReplyScreen.WaitUntilShownAsync();

        // Then
        var toComment = await Phone.BaconReader.ReplyScreen.ReadAsync();
        Asserting.That(toComment).ShowsOver("Reply to other_user in r/e2e as e2e_user", "Thanks for having me");

        // When
        await Phone.BaconReader.ReplyScreen.Editor.TypeAsync("You're welcome");
        await Phone.BaconReader.ReplyScreen.ClickSendAsync();
        await Reddit.WaitUntilAReplyToTheCommentIsSentAsync("Thanks for having me");

        // Then
        var commentReplies = Reddit.ReadRepliesToTheComment("Thanks for having me");
        Asserting.That(commentReplies).GotTheReply("You're welcome");
    }
}
