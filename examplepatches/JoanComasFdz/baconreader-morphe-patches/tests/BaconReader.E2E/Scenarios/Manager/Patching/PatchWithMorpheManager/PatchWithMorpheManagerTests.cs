// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Phone.MorpheManager.Screens;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.Manager.Patching;

/// <summary>
/// How a user patches BaconReader the first time, with Morphe Manager, as the README's "Install" says: the repository's
/// "➕ Add to Morphe Manager" adds the source, then Morphe Manager patches their APK with the source's newest release,
/// and Android installs it once Morphe Manager may install apps: allowed, Android asks "Install this app?" right away,
/// over its settings, and once installed, goes back to them, whose back arrow leads back to Morphe Manager. The user guide starts with its recording.
/// </summary>
public sealed class PatchWithMorpheManagerTests : BaseE2E
{
    private const string Repository = "https://github.com/JoanComasFdz/baconreader-morphe-patches";
    private const string Source = "JoanComasFdz BaconReader Patches";
    private const string App = "BaconReader Premium";
    private const string Apk = "BaconReaderPremium-6.1.4.apk";

    [Theory, PlayOnPhone]
    [PatchedByTheManager]
    [TestDescription("""
        @phone
        Scenario: Morphe Manager patches BaconReader Premium with the BaconReader patches for the first time
          Given Morphe Manager is installed
          And the BaconReader Premium 6.1.4 APK is in Downloads
          When I open "https://github.com/JoanComasFdz/baconreader-morphe-patches" in Chrome
          And I tap "➕ Add to Morphe Manager"
          And I tap "Open in Morphe"
          And I tap "Add" on "Do you want to add this patch source to Morphe?"
          And I tap "BaconReader Premium"
          And I tap "No, I already have it"
          And I tap "BaconReaderPremium-6.1.4.apk"
          Then Morphe Manager shows "Patched", with the source "JoanComasFdz BaconReader Patches" and its version
          When I tap "Install"
          And I tap "Settings" on "Permission required"
          And I turn on "Allow from this source"
          And I tap "Install" on "Install this app?"
          And I tap the back arrow on "Install unknown apps"
          And I tap "Cancel" on "Would you like to be notified when updates are available?"
          And I tap "Skip" on "Quick feature tour"
          And I open BaconReader
          And I tap "Don’t allow" on "Allow BaconReader Premium to send you notifications?"
          And I tap "Not now" on "Open Reddit links with BaconReader?"
          And I open the left menu
          Then the bottom of the left menu shows "Patches <that version> (Morphe)"
        """)]
    public async Task MorpheManagerPatchesBaconReaderPremiumWithTheBaconReaderPatchesForTheFirstTime(Screen screen)
    {
        // Given

        // When
        await Phone.Chrome.OpenAsync(Repository);
        await Phone.Chrome.GitHubRepository.WaitUntilShownAsync();
        await Phone.Chrome.GitHubRepository.ClickAddToMorpheManagerAsync();
        await Phone.Chrome.MorpheAddSource.WaitUntilShownAsync();
        await Phone.Chrome.MorpheAddSource.ClickOpenInMorpheAsync();
        await Phone.MorpheManager.AddSource.WaitUntilShownAsync();
        await Phone.MorpheManager.AddSource.ClickAddAsync();
        await Phone.MorpheManager.Apps.WaitUntilAppShownAsync(App);
        await Phone.MorpheManager.Apps.ClickAppAsync(App);
        await Phone.MorpheManager.ApkNeeded.WaitUntilShownAsync();
        await Phone.MorpheManager.ApkNeeded.ClickNoIAlreadyHaveItAsync();
        await Phone.FilePicker.WaitUntilFileShownAsync(Apk);
        await Phone.FilePicker.ClickFileAsync(Apk);
        await Phone.MorpheManager.Patched.WaitUntilShownAsync();

        // Then
        var patched = await Phone.MorpheManager.Patched.ReadAsync();
        Asserting.That(patched).SaysPatchedWithTheSource(Source);

        // When
        await Phone.MorpheManager.Patched.ClickInstallAsync();
        await Phone.InstallUnknownApps.WaitUntilPermissionRequiredShownAsync();
        await Phone.InstallUnknownApps.ClickSettingsAsync();
        await Phone.InstallUnknownApps.WaitUntilShownAsync();
        await Phone.InstallUnknownApps.TickAllowFromThisSourceAsync();
        await Phone.PackageInstaller.WaitUntilShownAsync();
        await Phone.PackageInstaller.ClickInstallAsync();
        await Phone.InstallUnknownApps.WaitUntilShownAsync();
        await Phone.InstallUnknownApps.ClickBackArrowAsync();
        await Phone.MorpheManager.UpdatesNotificationPrompt.WaitUntilShownAsync();
        await Phone.MorpheManager.UpdatesNotificationPrompt.ClickCancelAsync();
        await Phone.MorpheManager.FeatureTour.WaitUntilShownAsync();
        await Phone.MorpheManager.FeatureTour.ClickSkipAsync();
        await Phone.Launcher.OpenBaconReaderAsync();
        await Phone.NotificationPermission.WaitUntilShownAsync();
        await Phone.NotificationPermission.ClickDontAllowAsync();
        await Phone.BaconReader.OpenRedditLinksPrompt.WaitUntilShownAsync();
        await Phone.BaconReader.OpenRedditLinksPrompt.ClickNotNowAsync();
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();

        // Then
        var footer = await Phone.BaconReader.Main.LeftMenu.ReadFooterAsync();
        Asserting.That(footer).ShowsThePatches(patched.Version);
    }
}
