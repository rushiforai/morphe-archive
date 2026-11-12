// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.MorpheManager.Screens;

/// <summary>Morphe Manager's home screen, "What app do you want to patch?": a card for each app its sources patch.</summary>
public sealed class Apps(AndroidDriver driver)
{
    /// <summary>Waits until the card of <paramref name="app"/> shows: once the source that patches it loaded.</summary>
    public Task WaitUntilAppShownAsync(string app) =>
        Waiting.UntilShownAsync(driver, Card(app), TimeSpan.FromSeconds(60), $"Morphe Manager's card of \"{app}\"");

    /// <summary>Taps the card of <paramref name="app"/>.</summary>
    public Task ClickAppAsync(string app) => OnScreen.PressAsync(driver, Card(app));

    // A card's description: the app's name, then its state ("BaconReader Premium, Not patched yet").
    private static OpenQA.Selenium.By Card(string app) => Locate.DescriptionStartingWith(app + ",");
}
