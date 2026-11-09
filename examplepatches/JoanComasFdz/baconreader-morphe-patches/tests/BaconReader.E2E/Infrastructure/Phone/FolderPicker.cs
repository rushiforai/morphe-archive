// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// Android's folder picker (Files), which an app opens to be given a folder: it starts at "Files on Pixel 6 Pro", and
/// "Use this folder" then "Allow" give the folder shown to the app. Android won't give an app the Download folder
/// itself, only a folder in it: BaseE2E empties Downloads/BaconReader before each scenario, so it's made here when
/// missing.
/// </summary>
public sealed class FolderPicker(AndroidDriver driver)
{
    private const string Download = "Download";
    private const string BaconReaderFolder = "BaconReader";
    private static readonly OpenQA.Selenium.By UseThisFolder = Locate.ButtonWithText("Use this folder");
    private static readonly OpenQA.Selenium.By Allow = Locate.AndroidIdWithText("button1", "Allow");
    private static readonly OpenQA.Selenium.By NewFolderName = Locate.AndroidId("text1");
    private static readonly OpenQA.Selenium.By Ok = Locate.AndroidIdWithText("button1", "OK");
    private static readonly OpenQA.Selenium.By CreateNewFolder = Locate.ButtonWithText("Create new folder");

    /// <summary>Waits until the picker shows "Use this folder".</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, UseThisFolder, TimeSpan.FromSeconds(10), "Android's folder picker");

    /// <summary>
    /// Chooses Downloads/BaconReader: opens "Download", then "BaconReader", making it when missing ("Create new folder"),
    /// taps "Use this folder" and "Allow", and waits until the picker is gone.
    /// </summary>
    public async Task ChooseDownloadsBaconReaderAsync()
    {
        await OnScreen.PressAsync(driver, Locate.Text(Download));
        await Waiting.UntilShownAsync(driver, Locate.Text("Files in Download"), TimeSpan.FromSeconds(10), "The Download folder in the picker");
        if (driver.FindElements(Locate.Text(BaconReaderFolder)).Count > 0)
        {
            await OnScreen.PressAsync(driver, Locate.Text(BaconReaderFolder));
        }
        else
        {
            await CreateNewFolderAsync();
            await OnScreen.ActAsync(driver, NewFolderName, field => field.SendKeys(BaconReaderFolder));
            await OnScreen.PressAsync(driver, Ok);
        }

        await Waiting.UntilShownAsync(driver, Locate.Text("Files in BaconReader"), TimeSpan.FromSeconds(10), "The BaconReader folder in the picker");
        await OnScreen.PressAsync(driver, UseThisFolder);
        await Waiting.UntilShownAsync(driver, Allow, TimeSpan.FromSeconds(10), "\"Allow BaconReader Premium to access folder?\"");
        await OnScreen.PressAsync(driver, Allow);
        await Waiting.UntilAsync(() => driver.FindElements(Allow).Count == 0, TimeSpan.FromSeconds(10), "The folder picker closing");
    }

    // Taps "Create new folder" until the picker shows its "New folder" dialog. Next to the phone (the NAS's runner, ~0.1 s
    // a command, unpaced) the picker ignored the tap made right after the Download folder showed, and no dialog came in
    // 10 s, twice (2026-11-08); from a cloud session, or paced for a recording, the first tap always opened it.
    private async Task CreateNewFolderAsync()
    {
        const int Attempts = 3;
        for (var attempt = 1; ; attempt++)
        {
            await OnScreen.PressAsync(driver, CreateNewFolder);
            if (attempt == Attempts)
            {
                await Waiting.UntilShownAsync(driver, NewFolderName, TimeSpan.FromSeconds(10), "The picker's \"New folder\" dialog");
                return;
            }

            if (await Waiting.FindWithinAsync(driver, NewFolderName, TimeSpan.FromSeconds(3), "The picker's \"New folder\" dialog") is not null)
            {
                return;
            }

            RunLog.RetryFired("FolderPicker.CreateNewFolderAsync", attempt + 1, "the picker's \"New folder\" dialog didn't show");
        }
    }
}
