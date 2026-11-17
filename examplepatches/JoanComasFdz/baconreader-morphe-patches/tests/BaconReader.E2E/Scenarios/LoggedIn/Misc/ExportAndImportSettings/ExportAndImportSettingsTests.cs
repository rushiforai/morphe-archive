// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.LoggedIn.Misc;

/// <summary>
/// "Export and import settings": the patches' settings get a "Backup" section, whose "Export settings" saves
/// BaconReader's settings, the patches' settings and the accounts' colors to a YAML file in Downloads, and whose
/// "Import settings" brings them back from it and restarts BaconReader.
/// </summary>
public sealed class ExportAndImportSettingsTests : BaseE2E
{
    private const string Circle = "Color of e2e_user";
    private const string Notes = "notes.yaml";

    [Theory, PlayOnPhone]
    [PatchedWithEveryPatch]
    [TestDescription("""
        @phone
        Scenario: Export and import settings saves the settings to a file and brings them back from it
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And Downloads holds a file "notes.yaml" that isn't a settings file
          And BaconReader is patched with every patch
          And the test account is logged in
          And BaconReader is open
          When I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Import settings"
          Then the "Backup" section offers "Export settings" and "Import settings"
          # One setting of BaconReader, one of the patches and one account's color: one of each part of the file.
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Detail View"
          And I tap "Show large image"
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Show user avatars"
          And I tap "Show user avatars"
          And I go back to the posts
          And I open the left menu
          And I open the list of accounts
          And I tap "Color of e2e_user"
          And I tap "Green"
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Export settings"
          And I tap "Export settings"
          Then Android's file picker shows "baconreader-settings-<today's date>.yaml" in "Downloads"
          When I tap "SAVE"
          Then a toast says "Settings exported to baconreader-settings-<today's date>.yaml"
          # Not on the screen: the test reads the phone's files.
          And Downloads holds "baconreader-settings-<today's date>.yaml", with "Show large image" on, "Show user avatars" on and e2e_user's color Green
          # Undoing all three, so the import has something to bring back.
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Detail View"
          And I tap "Show large image"
          And I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Show user avatars"
          And I tap "Show user avatars"
          And I go back to the posts
          And I open the left menu
          And I open the list of accounts
          And I tap "Color of e2e_user"
          And I tap "NO COLOR"
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Import settings"
          And I tap "Import settings"
          And I tap "baconreader-settings-<today's date>.yaml"
          Then "Import settings?" says "baconreader-settings-<today's date>.yaml has 32 settings. They replace BaconReader's settings, the patches' settings and the accounts' colors: a setting the file doesn't list goes back to its default. BaconReader then restarts."
          When I tap "CANCEL"
          And I scroll to "Show user avatars"
          Then the setting "Show user avatars" is off
          When I scroll to "Import settings"
          And I tap "Import settings"
          And I tap "baconreader-settings-<today's date>.yaml"
          And I tap "IMPORT AND RESTART"
          # BaconReader restarts on its main screen, still logged in.
          Then the toolbar shows the "Front Page" feed
          When I open the left menu
          And I tap "Settings"
          And I tap "Detail View"
          Then "Show large image" is ticked
          When I go back to the posts
          And I open the left menu
          And I tap "Settings"
          And I tap "Patches"
          And I scroll to "Show user avatars"
          Then the setting "Show user avatars" is on
          When I go back to the posts
          And I open the left menu
          And I open the list of accounts
          Then the circle "Color of e2e_user" is filled
          When I tap "Settings"
          And I tap "Patches"
          And I scroll to "Import settings"
          And I tap "Import settings"
          And I tap "notes.yaml"
          Then "Could not import the settings" says "This file has no BaconReader settings. Pick a file made by "Export settings"."
          When I tap "CLOSE"
          And I scroll to "Show user avatars"
          Then the setting "Show user avatars" is on
        """)]
    public async Task ExportAndImportSettingsSavesTheSettingsToAFileAndBringsThemBackFromIt(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        await Phone.Downloads.HoldsAFileThatIsntASettingsFileAsync(Notes);
        var settingsFile = await Phone.Downloads.ReadTodaysSettingsFileNameAsync();
        Reddit.TheTestAccountIsLoggedIn();
        await Phone.BaconReader.OpenAsync();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchesAction.ImportSettings());

        // Then
        var backup = await Phone.BaconReader.PatchesSettings.ReadActionsAsync(new PatchesSection.Backup());
        Asserting.That(backup).Offers(new PatchesAction.ExportSettings(), new PatchesAction.ImportSettings());

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.TickAsync(new BaconReaderSetting.ShowLargeImage());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowUserAvatars());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowUserAvatars());
        await Phone.BaconReader.GoBackToThePostsAsync();
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
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchesAction.ExportSettings());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchesAction.ExportSettings());
        await Phone.FilePicker.WaitUntilSaveShownAsync();

        // Then
        var save = await Phone.FilePicker.ReadSaveAsync();
        Asserting.That(save).Shows(settingsFile, "Downloads");

        // When
        await Phone.FilePicker.ClickSaveAsync();
        await Phone.Toast.WaitUntilShownAsync();

        // Then
        var exported = await Phone.Toast.ReadAsync();
        // Not on the screen: the test reads the phone's files.
        var file = await Phone.Downloads.ReadSettingsFileAsync(settingsFile);
        Asserting.That(exported).Says($"Settings exported to {settingsFile}");
        Asserting.That(file).IsThere().HasOn(new BaconReaderSetting.ShowLargeImage()).HasOn(new PatchSetting.ShowUserAvatars()).HasTheColor("e2e_user", new AccountColorChoice.Green());

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.TickAsync(new BaconReaderSetting.ShowLargeImage());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowUserAvatars());
        await Phone.BaconReader.PatchesSettings.TickAsync(new PatchSetting.ShowUserAvatars());
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickTheCircleAsync(Circle);
        await Phone.BaconReader.AccountColorPicker.WaitUntilShownAsync();
        await Phone.BaconReader.AccountColorPicker.ClickAsync(new AccountColorChoice.NoColor());
        await Phone.BaconReader.AccountColorPicker.WaitUntilClosedAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchesAction.ImportSettings());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchesAction.ImportSettings());
        await Phone.FilePicker.WaitUntilFileShownAsync(settingsFile);
        await Phone.FilePicker.ClickFileAsync(settingsFile);
        await Phone.BaconReader.ImportSettings.WaitUntilShownAsync();

        // Then
        var import = await Phone.BaconReader.ImportSettings.ReadAsync();
        Asserting.That(import).Says(
            "Import settings?",
            $"{settingsFile} has 32 settings. They replace BaconReader's settings, the patches' settings and the accounts' colors: a setting the file doesn't list goes back to its default. BaconReader then restarts.");

        // When
        await Phone.BaconReader.ImportSettings.ClickCancelAsync();
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync(new PatchesAction.ImportSettings());
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowUserAvatars());

        // Then
        var cancelled = await Phone.BaconReader.PatchesSettings.ReadSwitchAsync(new PatchSetting.ShowUserAvatars());
        Asserting.That(cancelled).IsOff();

        // When
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchesAction.ImportSettings());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchesAction.ImportSettings());
        await Phone.FilePicker.WaitUntilFileShownAsync(settingsFile);
        await Phone.FilePicker.ClickFileAsync(settingsFile);
        await Phone.BaconReader.ImportSettings.WaitUntilShownAsync();
        await Phone.BaconReader.ImportSettings.ClickImportAndRestartAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        // BaconReader restarts on its main screen, still logged in.
        var restarted = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        Asserting.That(restarted).ShowsFeed(new Feed.FrontPage());

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.DetailView());
        await Phone.BaconReader.Settings.WaitUntilSectionShownAsync(new SettingsSection.DetailView());

        // Then
        var largeImage = await Phone.BaconReader.Settings.ReadCheckboxAsync(new BaconReaderSetting.ShowLargeImage());
        Asserting.That(largeImage).IsTicked();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowUserAvatars());

        // Then
        var avatars = await Phone.BaconReader.PatchesSettings.ReadSwitchAsync(new PatchSetting.ShowUserAvatars());
        Asserting.That(avatars).IsOn();

        // When
        await Phone.BaconReader.GoBackToThePostsAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenTheAccountsAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilAccountsShownAsync();

        // Then
        var rows = await Phone.BaconReader.Main.LeftMenu.ReadRowsAsync();
        Asserting.That(rows).ShowsTheCircleFilled(Circle);

        // When
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.Settings());
        await Phone.BaconReader.Settings.WaitUntilShownAsync(new SettingsSection.Patches());
        await Phone.BaconReader.Settings.ClickAsync(new SettingsSection.Patches());
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync();
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchesAction.ImportSettings());
        await Phone.BaconReader.PatchesSettings.ClickAsync(new PatchesAction.ImportSettings());
        await Phone.FilePicker.WaitUntilFileShownAsync(Notes);
        await Phone.FilePicker.ClickFileAsync(Notes);
        await Phone.BaconReader.ImportSettings.WaitUntilFailedShownAsync();

        // Then
        var failed = await Phone.BaconReader.ImportSettings.ReadAsync();
        Asserting.That(failed).Says("Could not import the settings", "This file has no BaconReader settings. Pick a file made by \"Export settings\".");

        // When
        await Phone.BaconReader.ImportSettings.ClickCloseAsync();
        await Phone.BaconReader.PatchesSettings.WaitUntilShownAsync(new PatchesAction.ImportSettings());
        await Phone.BaconReader.PatchesSettings.ScrollToAsync(new PatchSetting.ShowUserAvatars());

        // Then
        var unchanged = await Phone.BaconReader.PatchesSettings.ReadSwitchAsync(new PatchSetting.ShowUserAvatars());
        Asserting.That(unchanged).IsOn();
    }
}
