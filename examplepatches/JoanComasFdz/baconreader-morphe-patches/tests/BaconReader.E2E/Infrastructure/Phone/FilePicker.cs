// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>Android's file picker (Files), which an app opens to be given a file: it starts in Downloads.</summary>
public sealed class FilePicker(AndroidDriver driver)
{
    /// <summary>Waits until the picker shows <paramref name="file"/>.</summary>
    public Task WaitUntilFileShownAsync(string file) =>
        Waiting.UntilShownAsync(driver, Locate.Text(file), TimeSpan.FromSeconds(10), $"\"{file}\" in Android's file picker");

    /// <summary>Taps <paramref name="file"/>, which gives it to the app.</summary>
    public Task ClickFileAsync(string file) => OnScreen.PressAsync(driver, Locate.Text(file));
}
