// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>The inbox (InboxActivity), which the left menu's "Inbox" opens: the account's messages, newest first.</summary>
public sealed class Inbox(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Body = Locate.AppId("bodyView");

    /// <summary>Waits until the inbox shows a message.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Body, TimeSpan.FromSeconds(10), "A message in the inbox");

    /// <summary>Taps the message saying "<paramref name="body"/>", which opens its menu.</summary>
    public Task ClickMessageAsync(string body) => OnScreen.PressAsync(driver, Locate.AppIdWithText("bodyView", body));
}
