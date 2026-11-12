// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager.Dialogs;

/// <summary>Morphe Manager's "Do you want to add this patch source to Morphe?", with "Cancel" and "Add".</summary>
public sealed class AddSource(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Question = Locate.Text("Do you want to add this patch source to Morphe?");
    private static readonly OpenQA.Selenium.By Add = Locate.Text("Add");

    /// <summary>Waits until Morphe Manager asks to add the source.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Add, TimeSpan.FromSeconds(30), "Morphe Manager's \"Do you want to add this patch source to Morphe?\"");

    /// <summary>Taps "Add", which adds the source and loads it.</summary>
    public Task ClickAddAsync() => OnScreen.PressAsync(driver, Add);

    /// <summary>Waits until the dialog is gone.</summary>
    public Task WaitUntilClosedAsync() =>
        Waiting.UntilAsync(() => driver.FindElements(Question).Count == 0, TimeSpan.FromSeconds(30), "Morphe Manager's \"Do you want to add this patch source to Morphe?\" closing");
}
