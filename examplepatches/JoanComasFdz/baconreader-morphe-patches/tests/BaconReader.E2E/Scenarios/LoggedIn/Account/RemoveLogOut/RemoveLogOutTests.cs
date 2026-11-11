// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Account;

/// <summary>
/// "Remove Log out": the left menu's accounts no longer offer "Log out", which logs out of every account at once. Each
/// account's ✕ still removes that account.
/// </summary>
public sealed class RemoveLogOutTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Remove Log out leaves Log out out of the left menu's accounts
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I open the left menu
          And I tap the test account's user name at the top of the left menu
          Then the left menu's accounts show the test account's user name and "Add account", in this order
          And the left menu's accounts don't show "Log out"
        """)]
    public async Task RemoveLogOutLeavesLogOutOutOfTheLeftMenusAccounts(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickTheTestAccountsUserNameAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();

        // Then
        var accounts = await Phone.BaconReader.Main.LeftMenu.ReadAccountsAsync();
        Asserting.That(accounts)
            .ShowsTheTestAccountsUserNameThen(new MenuEntry.AddAccount())
            .DoesNotShow(new MenuEntry.LogOut());
    }
}
