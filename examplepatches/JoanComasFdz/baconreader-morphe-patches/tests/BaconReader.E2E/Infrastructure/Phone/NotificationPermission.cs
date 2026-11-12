// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>
/// Android's "Allow BaconReader Premium to send you notifications?", with "Allow" and "Don’t allow", which a newly
/// installed BaconReader asks when it opens. A scenario's app installed by BaseE2E has its notifications denied
/// already; one a manager installed asks.
/// </summary>
public sealed class NotificationPermission(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Question = Locate.Text("Allow BaconReader Premium to send you notifications?");
    private static readonly OpenQA.Selenium.By DontAllow = Locate.Text("Don’t allow");

    /// <summary>Waits until Android asks.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Question, TimeSpan.FromSeconds(30), "Android's \"Allow BaconReader Premium to send you notifications?\"");

    /// <summary>Taps "Don’t allow".</summary>
    public Task ClickDontAllowAsync() => OnScreen.PressAsync(driver, DontAllow);
}
