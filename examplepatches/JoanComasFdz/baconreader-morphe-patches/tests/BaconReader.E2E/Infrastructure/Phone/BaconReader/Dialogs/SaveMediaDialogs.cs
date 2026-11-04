// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>"Where do you want to save?", which "Save" in the media viewer's "More options" opens.</summary>
public sealed class WhereToSave(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.Text("Where do you want to save?");
    private static readonly OpenQA.Selenium.By SaveToDevice = Locate.ButtonWithText("SAVE TO DEVICE");

    /// <summary>Waits until the dialog is shown.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "The \"Where do you want to save?\" dialog");

    /// <summary>Taps "SAVE TO DEVICE": BaconReader saves the media in the folder chosen for it, or asks for one first.</summary>
    public Task ClickSaveToDeviceAsync() => OnScreen.PressAsync(driver, SaveToDevice);
}

/// <summary>
/// "Image storage location", which BaconReader shows the first time it saves to the device: "Please select a save
/// location to download." with "OPEN", which opens Android's folder picker.
/// </summary>
public sealed class ImageStorageLocation(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.Text("Image storage location");
    private static readonly OpenQA.Selenium.By Open = Locate.ButtonWithText("OPEN");

    /// <summary>Waits until the dialog is shown.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "The \"Image storage location\" dialog");

    /// <summary>Taps "OPEN", which opens Android's folder picker.</summary>
    public Task ClickOpenAsync() => OnScreen.PressAsync(driver, Open);
}
