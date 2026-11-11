// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Account;

/// <summary>
/// "Account colors": a circle between each account's name and its ✕ in the left menu picks a color for the account, and
/// the color of the account in use shows as a line along the bottom of the toolbars.
/// </summary>
public sealed class AccountColorsTests : BaseE2E
{
    private const string Circle = "Color of e2e_user";

    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Account colors shows each account's color in the menu and the account in use's color under the toolbars
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And Reddit has a second account "e2e_second"
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I open the left menu
          And I open the list of accounts
          Then the left menu shows a "Color of e2e_user" circle
          And "Color of e2e_user" sits between "e2e_user" and its ✕
          And the circle "Color of e2e_user" is an outline
          # "Add account" is a row like the accounts' rows, without a color.
          And "Add account" shows no color circle
          When I close the left menu
          # No color yet: no line.
          Then the main screen's toolbar shows no line along its bottom
          When I open the left menu
          And I tap "Color of e2e_user"
          Then "Color for e2e_user" offers "Red", "Pink", "Purple", "Indigo", "Blue", "Cyan", "Teal", "Green", "Lime", "Yellow", "Orange" and "Brown", and "NO COLOR"
          When I tap "Green"
          Then the circle "Color of e2e_user" is filled
          When I close the left menu
          Then the main screen's toolbar shows a line along its bottom
          When I tap the post "Hello from r/e2e"
          Then the post's toolbar shows a line along its bottom
          When I go back to the posts
          And I open the left menu
          And I open the list of accounts
          And I tap "Add account"
          And I type "e2e_second" in "Email or username"
          And I type the password of "e2e_second" in "Password"
          And I tap "Log In"
          And I tap "Accept"
          # BaconReader comes back from the login with the left menu open, on the account just added. It has no color yet.
          Then the left menu shows "e2e_second" at the top
          When I close the left menu
          Then the main screen's toolbar shows no line along its bottom
          When I open the left menu
          And I open the list of accounts
          And I tap "e2e_user"
          And I close the left menu
          Then the main screen's toolbar shows a line along its bottom
          When I open the left menu
          # Switching accounts closed the list of accounts.
          And I open the list of accounts
          And I tap "Color of e2e_user"
          And I tap "NO COLOR"
          Then the circle "Color of e2e_user" is an outline
          When I close the left menu
          Then the main screen's toolbar shows no line along its bottom
          When I open the left menu
          And I open the list of accounts
          And I tap "Color of e2e_user"
          And I tap "Green"
          And I tap "Settings"
          And I tap "Patches"
          # "Account colors" is on by default.
          And I tap "Account colors" in the "Account colors" section
          And I go back to the posts
          Then the main screen's toolbar shows no line along its bottom
          When I open the left menu
          And I open the list of accounts
          Then the left menu shows no "Color of e2e_user" circle
        """)]
    public async Task AccountColorsShowsEachAccountsColorInTheMenuAndTheAccountInUsesColorUnderTheToolbars(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        Reddit.HasASecondAccount("e2e_second");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();

        // Then
        var rows = await Phone.BaconReader.Main.LeftMenu.ReadRowsAsync();
        Asserting.That(rows)
            .ShowsTheCircle(Circle)
            .ShowsTheCircleBetweenTheNameAndItsX(Circle, "e2e_user")
            .ShowsTheCircleAsAnOutline(Circle)
            // "Add account" is a row like the accounts' rows, without a color.
            .ShowsNoColorCircleOn(new MenuEntry.AddAccount());

        // When
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        // No color yet: no line.
        var noColorYet = await Phone.BaconReader.Main.Toolbar.ReadLineAsync();
        Asserting.That(noColorYet).ShowsNoLineAlongItsBottom();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickTheCircleAsync(Circle);
        await Phone.BaconReader.AccountColorPicker.WaitUntilShownAsync();

        // Then
        var picker = await Phone.BaconReader.AccountColorPicker.ReadAsync();
        Asserting.That(picker).Offers(
            "Color for e2e_user",
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
            new AccountColorChoice.NoColor());

        // When
        await Phone.BaconReader.AccountColorPicker.ClickAsync(new AccountColorChoice.Green());
        await Phone.BaconReader.AccountColorPicker.WaitUntilClosedAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilCircleShownAsync(Circle);

        // Then
        var green = await Phone.BaconReader.Main.LeftMenu.ReadRowsAsync();
        Asserting.That(green).ShowsTheCircleFilled(Circle);

        // When
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var mainLine = await Phone.BaconReader.Main.Toolbar.ReadLineAsync();
        Asserting.That(mainLine).ShowsALineAlongItsBottom();

        // When
        await Phone.BaconReader.Main.Posts.ClickPostAsync("Hello from r/e2e");
        await Phone.BaconReader.Detail.WaitUntilShownAsync();

        // Then
        var postLine = await Phone.BaconReader.Detail.ReadToolbarLineAsync();
        Asserting.That(postLine).ShowsALineAlongItsBottom();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
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
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountInUseAsync("e2e_second");

        // Then
        // BaconReader comes back from the login with the left menu open, on the account just added. It has no color yet.
        var second = await Phone.BaconReader.Main.LeftMenu.ReadAccountsAsync();
        Asserting.That(second).ShowsAtTheTop("e2e_second");

        // When
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var secondAccountLine = await Phone.BaconReader.Main.Toolbar.ReadLineAsync();
        Asserting.That(secondAccountLine).ShowsNoLineAlongItsBottom();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickTheAccountAsync("e2e_user");
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountInUseAsync("e2e_user");
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var backLine = await Phone.BaconReader.Main.Toolbar.ReadLineAsync();
        Asserting.That(backLine).ShowsALineAlongItsBottom();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickTheCircleAsync(Circle);
        await Phone.BaconReader.AccountColorPicker.WaitUntilShownAsync();
        await Phone.BaconReader.AccountColorPicker.ClickAsync(new AccountColorChoice.NoColor());
        await Phone.BaconReader.AccountColorPicker.WaitUntilClosedAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilCircleShownAsync(Circle);

        // Then
        var noColor = await Phone.BaconReader.Main.LeftMenu.ReadRowsAsync();
        Asserting.That(noColor).ShowsTheCircleAsAnOutline(Circle);

        // When
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var noColorLine = await Phone.BaconReader.Main.Toolbar.ReadLineAsync();
        Asserting.That(noColorLine).ShowsNoLineAlongItsBottom();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickTheCircleAsync(Circle);
        await Phone.BaconReader.AccountColorPicker.WaitUntilShownAsync();
        await Phone.BaconReader.AccountColorPicker.ClickAsync(new AccountColorChoice.Green());
        await Phone.BaconReader.AccountColorPicker.WaitUntilClosedAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.AccountColors(), new PatchesSection.AccountColors());
        // "Account colors" is on by default.
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.AccountColors(), new PatchesSection.AccountColors());
        await Phone.BaconReader.GoBackToThePostsAsync();

        // Then
        var offLine = await Phone.BaconReader.Main.Toolbar.ReadLineAsync();
        Asserting.That(offLine).ShowsNoLineAlongItsBottom();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();

        // Then
        var off = await Phone.BaconReader.Main.LeftMenu.ReadRowsAsync();
        Asserting.That(off).ShowsNoCircle(Circle);
    }
}
