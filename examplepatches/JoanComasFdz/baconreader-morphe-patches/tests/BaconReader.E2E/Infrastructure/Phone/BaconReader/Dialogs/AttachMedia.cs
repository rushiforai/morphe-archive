// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>The dialog "Attach media" opens in the reply screen: "Camera", "Gallery" and "Draw".</summary>
public sealed class AttachMedia(AndroidDriver driver)
{
    /// <summary>Waits until the dialog shows its choices.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Choice(new MediaSource.Draw()), TimeSpan.FromSeconds(10), "The \"Attach media\" dialog");

    /// <summary>Taps <paramref name="source"/>, which opens it.</summary>
    public Task ClickAsync(MediaSource source) => OnScreen.PressAsync(driver, Choice(source));

    private static OpenQA.Selenium.By Choice(MediaSource source) => Locate.AppIdWithText("textView", source.ToShownText());
}
