// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Comments;

/// <summary>
/// "Show user avatars": with its setting on, the author's avatar shows before the name in comments, on the reply screen
/// and in the inbox, from Reddit's <c>api/user_data_by_account_ids</c>, and, whatever the setting, each account's
/// avatar before its name in the left menu: its header and its accounts list; "Avatar size" makes it, and its line, bigger;
/// "Avatar background" draws a faint disc behind it, which shows through a see-through avatar (without the setting, a
/// faint disc only keeps an avatar's place while it loads, or when a user has none). The avatar is drawn in the
/// text, over an object replacement character ("￼ "), so the screen's tree shows where it is; whether the disc is drawn
/// is read from a screenshot, in that spot only (E2E-TEST-CODE-RULES.md, rule d).
/// </summary>
public sealed class ShowUserAvatarsTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Show user avatars puts the author's avatar before the name in comments, the reply screen and the inbox, and each account's in the left menu
          Given Reddit has a post "Introductions" in r/e2e
          And the post "Introductions" has a comment "With an avatar" by u/avatar_user
          And the post "Introductions" has a comment "With a see-through avatar" by u/glass_user
          And the user "avatar_user" has an avatar
          And the user "glass_user" has a see-through avatar
          And the test account has an unread message "Hello" saying "A private message"
          # The fake Reddit's messages come from u/e2e_sender.
          And the user "e2e_sender" has an avatar
          And the user "e2e_user" has an avatar
          And Reddit has a second account "e2e_second"
          And the user "e2e_second" has an avatar
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I select the "e2e" feed
          And I tap the post "Introductions"
          # "Show user avatars" is off by default.
          Then the comment "With an avatar" shows no avatar
          When I go back to the posts
          And I open the left menu
          # The drawer's avatars don't depend on "Show user avatars", which is still off.
          Then the left menu shows "e2e_user" with the avatar of "e2e_user" before the name
          When I tap the arrow next to "e2e_user"
          Then the accounts list shows "e2e_user" with the avatar of "e2e_user" before the name
          And "Add account" in the accounts list shows no avatar
          When I tap the arrow next to "e2e_user"
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Avatar background"
          Then the settings show "Show user avatars", "Avatar size" and "Avatar background", in this order
          When I tap "Show user avatars"
          And I go back to the posts
          And I tap the post "Introductions"
          Then the comment "With an avatar" shows the avatar of "avatar_user" before the name
          # "Avatar background" is on by default: a faint disc behind the avatar shows through u/glass_user's.
          And the comment "With a see-through avatar" shows a faint disc before the name
          When I swipe the comment "With an avatar" to its action bar
          And I tap "Comment" in the comment's action bar
          Then the reply screen shows "Reply to avatar_user in r/e2e as e2e_user" with the avatar of "avatar_user" before the name
          When I tap Back
          And I go back to the posts
          And I open the left menu
          And I tap "Inbox"
          Then the message "Hello" shows "Hello: from e2e_sender" with the avatar of "e2e_sender" before the name
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Avatar background"
          And I tap "Avatar size"
          And I select "Medium"
          And I go back to the posts
          And I tap the post "Introductions"
          # Normal is as tall as the text; each bigger size makes the author line taller.
          Then the author line of "With an avatar" is taller than with "Normal"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Avatar background"
          And I tap "Avatar size"
          And I select "Large"
          And I go back to the posts
          And I tap the post "Introductions"
          Then the author line of "With an avatar" is taller than with "Medium"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Avatar background"
          And I tap "Avatar size"
          And I select "Extra large"
          And I go back to the posts
          And I tap the post "Introductions"
          Then the author line of "With an avatar" is taller than with "Large"
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Avatar background"
          And I tap "Avatar background"
          And I go back to the posts
          And I tap the post "Introductions"
          # The see-through avatar's place is kept, but nothing is drawn behind it.
          Then the comment "With a see-through avatar" shows nothing before the name
          And the comment "With an avatar" shows the avatar of "avatar_user" before the name
          When I go back to the posts
          And I open the left menu
          And I tap the arrow next to "e2e_user"
          And I tap "Add account"
          And I type "e2e_second" in "Email or username"
          And I type the password of "e2e_second" in "Password"
          And I tap "Log In"
          And I tap "Accept"
          # BaconReader comes back from the login with the left menu open, on the account just added.
          Then the left menu shows "e2e_second" with the avatar of "e2e_second" before the name
          When I tap the arrow next to "e2e_second"
          Then the accounts list shows "e2e_second" with the avatar of "e2e_second" before the name
          And the accounts list shows "e2e_user" with the avatar of "e2e_user" before the name
        """)]
    public async Task ShowUserAvatarsPutsTheAuthorsAvatarBeforeTheNameInCommentsTheReplyScreenAndTheInboxAndEachAccountsInTheLeftMenu(Screen screen)
    {
        // Given
        Reddit.HasAPost("Introductions", "e2e");
        Reddit.ThePost("Introductions").HasACommentBy("With an avatar", "avatar_user");
        Reddit.ThePost("Introductions").HasACommentBy("With a see-through avatar", "glass_user");
        Reddit.TheUserHasAnAvatar("avatar_user");
        Reddit.TheUserHasASeeThroughAvatar("glass_user");
        Reddit.TheTestAccountHasAnUnreadMessage("Hello", "A private message");
        // The fake Reddit's messages come from u/e2e_sender.
        Reddit.TheUserHasAnAvatar("e2e_sender");
        Reddit.TheUserHasAnAvatar("e2e_user");
        Reddit.HasASecondAccount("e2e_second");
        Reddit.TheUserHasAnAvatar("e2e_second");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.Toolbar.SelectFeedAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Toolbar.WaitUntilFeedShownAsync(new Feed.Subreddit("e2e"));
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Introductions");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("With a see-through avatar");

        // Then
        // "Show user avatars" is off by default.
        var off = await Phone.BaconReader.Detail.Comments.ReadAuthorLineAsync("With an avatar");
        Asserting.That(off).ShowsNoAvatar();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Reddit.WaitUntilTheAvatarOfTheUserIsServedAsync("e2e_user");

        // Then
        // The drawer's avatars don't depend on "Show user avatars", which is still off.
        // The wait above failed unless Reddit served the avatar.
        var header = await Phone.BaconReader.Main.LeftMenu.ReadAccountsAsync();
        Asserting.That(header).ShowsWithAnAvatarBefore("e2e_user", "e2e_user");

        // When
        await Phone.BaconReader.Main.LeftMenu.ClickArrowNextToAsync("e2e_user");
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();

        // Then
        var accounts = await Phone.BaconReader.Main.LeftMenu.ReadAccountsAsync();
        Asserting.That(accounts)
            .ShowsInTheAccountsListWithAnAvatarBefore("e2e_user", "e2e_user")
            .ShowsInTheAccountsListWithNoAvatar(new MenuEntry.AddAccount());

        // When
        await Phone.BaconReader.Main.LeftMenu.ClickArrowNextToAsync("e2e_user");
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsClosedAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AvatarBackground());

        // Then
        var settings = await Phone.BaconReader.PatchesSettings.ReadAsync();
        Asserting.That(settings).ShowsTheSettings(new PatchSetting.ShowUserAvatars(), new PatchSetting.AvatarSize(), new PatchSetting.AvatarBackground());

        // When
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowUserAvatars());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Introductions");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("With a see-through avatar");
        await Reddit.WaitUntilTheAvatarOfTheUserIsServedAsync("avatar_user");
        await Reddit.WaitUntilTheAvatarOfTheUserIsServedAsync("glass_user");

        // Then
        // The waits above failed unless Reddit served the avatars.
        var normal = await Phone.BaconReader.Detail.Comments.ReadAuthorLineAsync("With an avatar");
        // "Avatar background" is on by default: a faint disc behind the avatar shows through u/glass_user's.
        var disc = await Phone.BaconReader.Detail.Comments.ReadAvatarSpotAsync("With a see-through avatar");
        Asserting.That(normal).ShowsAnAvatarBefore("avatar_user");
        Asserting.That(disc).ShowsAFaintDisc();

        // When
        await Phone.BaconReader.Detail.Comments.SwipeToActionBarAsync("With an avatar");
        await Phone.BaconReader.Detail.Comments.WaitUntilActionBarShownAsync();
        await Phone.BaconReader.Detail.Comments.ClickActionBarCommentAsync();
        await Phone.BaconReader.ReplyScreen.WaitUntilShownAsync();

        // Then
        var reply = await Phone.BaconReader.ReplyScreen.ReadAsync();
        Asserting.That(reply).ShowsWithAnAvatarBefore("Reply to avatar_user in r/e2e as e2e_user", "avatar_user");

        // When
        await Phone.GoBackAsync();
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Inbox());
        await Phone.BaconReader.Inbox.WaitUntilShownAsync();
        await Reddit.WaitUntilTheAvatarOfTheUserIsServedAsync("e2e_sender");

        // Then
        // The wait above failed unless Reddit served the avatar.
        var message = await Phone.BaconReader.Inbox.ReadMessageAsync("Hello");
        Asserting.That(message).ShowsWithAnAvatarBefore("Hello: from e2e_sender", "e2e_sender");

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AvatarBackground());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.AvatarSize());
        await Phone.BaconReader.PatchesSettings.WaitUntilChoiceShownAsync(new AvatarSize.Medium());
        await Phone.BaconReader.PatchesSettings.SelectAsync(new AvatarSize.Medium());
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.AvatarSize());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Introductions");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("With a see-through avatar");

        // Then
        // Normal is as tall as the text; each bigger size makes the author line taller.
        var medium = await Phone.BaconReader.Detail.Comments.ReadAuthorLineAsync("With an avatar");
        Asserting.That(medium).IsTallerThanWith(new AvatarSize.Normal(), normal);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AvatarBackground());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.AvatarSize());
        await Phone.BaconReader.PatchesSettings.WaitUntilChoiceShownAsync(new AvatarSize.Large());
        await Phone.BaconReader.PatchesSettings.SelectAsync(new AvatarSize.Large());
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.AvatarSize());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Introductions");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("With a see-through avatar");

        // Then
        var large = await Phone.BaconReader.Detail.Comments.ReadAuthorLineAsync("With an avatar");
        Asserting.That(large).IsTallerThanWith(new AvatarSize.Medium(), medium);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AvatarBackground());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchSetting.AvatarSize());
        await Phone.BaconReader.PatchesSettings.WaitUntilChoiceShownAsync(new AvatarSize.ExtraLarge());
        await Phone.BaconReader.PatchesSettings.SelectAsync(new AvatarSize.ExtraLarge());
        await Phone.BaconReader.PatchesSettings.WaitUntilDialogClosedAsync(new PatchSetting.AvatarSize());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Introductions");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("With a see-through avatar");

        // Then
        var extraLarge = await Phone.BaconReader.Detail.Comments.ReadAuthorLineAsync("With an avatar");
        Asserting.That(extraLarge).IsTallerThanWith(new AvatarSize.Large(), large);

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AvatarBackground());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.AvatarBackground());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Introductions");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();
        await Phone.BaconReader.Detail.Comments.WaitUntilCommentShownAsync("With a see-through avatar");

        // Then
        // The see-through avatar's place is kept, but nothing is drawn behind it.
        var noDisc = await Phone.BaconReader.Detail.Comments.ReadAvatarSpotAsync("With a see-through avatar");
        var stillShown = await Phone.BaconReader.Detail.Comments.ReadAuthorLineAsync("With an avatar");
        Asserting.That(noDisc).ShowsNothing();
        Asserting.That(stillShown).ShowsAnAvatarBefore("avatar_user");

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickArrowNextToAsync("e2e_user");
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.AddAccount());
        await Phone.BaconReader.LogIn.WaitUntilShownAsync();
        await Phone.BaconReader.LogIn.TypeUserNameAsync("e2e_second");
        await Phone.BaconReader.LogIn.TypePasswordOfAsync("e2e_second");
        await Phone.BaconReader.LogIn.ClickLogInAsync();
        await Phone.BaconReader.LogIn.WaitUntilConnectShownAsync();
        await Phone.BaconReader.LogIn.ClickAcceptAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Reddit.WaitUntilTheAvatarOfTheUserIsServedAsync("e2e_second");

        // Then
        // BaconReader comes back from the login with the left menu open, on the account just added.
        // The wait above failed unless Reddit served the avatar.
        var second = await Phone.BaconReader.Main.LeftMenu.ReadAccountsAsync();
        Asserting.That(second).ShowsWithAnAvatarBefore("e2e_second", "e2e_second");

        // When
        await Phone.BaconReader.Main.LeftMenu.ClickArrowNextToAsync("e2e_second");
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();

        // Then
        var both = await Phone.BaconReader.Main.LeftMenu.ReadAccountsAsync();
        Asserting.That(both)
            .ShowsInTheAccountsListWithAnAvatarBefore("e2e_second", "e2e_second")
            .ShowsInTheAccountsListWithAnAvatarBefore("e2e_user", "e2e_user");
    }
}
