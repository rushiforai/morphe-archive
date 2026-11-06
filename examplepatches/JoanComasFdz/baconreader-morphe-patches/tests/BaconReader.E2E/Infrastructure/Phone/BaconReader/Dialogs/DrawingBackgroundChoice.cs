// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>The "Choose" dialog the drawing screen's "Camera" opens: "Camera", "Gallery" and "Memes".</summary>
public sealed class DrawingBackgroundChoice(AndroidDriver driver)
{
    /// <summary>Waits until the dialog shows its choices.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Choice(new DrawingBackground.Memes()), TimeSpan.FromSeconds(10), "The \"Choose\" dialog");

    /// <summary>Taps <paramref name="background"/>, which opens it.</summary>
    public Task ClickAsync(DrawingBackground background) => OnScreen.PressAsync(driver, Choice(background));

    private static OpenQA.Selenium.By Choice(DrawingBackground background) => Locate.AndroidIdWithText("text1", background.ToShownText());
}
