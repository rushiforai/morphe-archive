// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// The dialogs "Import settings" shows once a file is picked, over the patches' settings: "Import settings?", which
/// says what the file holds and asks to import it, and "Could not import the settings", when the file isn't a settings
/// file. Android's AlertDialogs, in BaconReader's theme, which shows their buttons in capitals; found by their texts.
/// </summary>
public sealed class ImportSettings(AndroidDriver driver)
{
    private const string Title = "Import settings?";
    private const string FailedTitle = "Could not import the settings";

    /// <summary>Waits until "Import settings?" shows.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.Text(Title), TimeSpan.FromSeconds(10), $"The \"{Title}\" dialog");

    /// <summary>Waits until "Could not import the settings" shows.</summary>
    public Task WaitUntilFailedShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.Text(FailedTitle), TimeSpan.FromSeconds(10), $"The \"{FailedTitle}\" dialog");

    /// <summary>Taps "IMPORT AND RESTART", which imports the file's settings and restarts BaconReader.</summary>
    public Task ClickImportAndRestartAsync() => OnScreen.PressAsync(driver, Locate.Text("IMPORT AND RESTART"));

    /// <summary>Taps "CANCEL", which closes "Import settings?" and imports nothing.</summary>
    public Task ClickCancelAsync() => OnScreen.PressAsync(driver, Locate.Text("CANCEL"));

    /// <summary>Taps "CLOSE", which closes "Could not import the settings".</summary>
    public Task ClickCloseAsync() => OnScreen.PressAsync(driver, Locate.Text("CLOSE"));

    /// <summary>What the dialog on top says: its title and its message, the text right after the title.</summary>
    public Task<DialogSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var texts = ScreenSnapshot.Take(driver).Root.Descendants().Where(view => view.Displayed && view.Text.Length > 0).ToList();
            var title = texts.FindIndex(view => view.Text is Title or FailedTitle);
            return title < 0
                ? new DialogSnapshot("", "")
                : new DialogSnapshot(texts[title].Text, title + 1 < texts.Count ? texts[title + 1].Text : "");
        });
}

/// <summary>What a dialog says: its title and its message.</summary>
public sealed record DialogSnapshot(string Title, string Message);
