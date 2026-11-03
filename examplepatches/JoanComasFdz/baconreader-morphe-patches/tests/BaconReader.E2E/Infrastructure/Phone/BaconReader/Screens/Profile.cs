// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>A user's profile (ProfileActivity): their posts and comments, under a bar to sort them.</summary>
public sealed class Profile(AndroidDriver driver)
{
    private static readonly By SortBar = Locate.AppId("sortLayout");

    /// <summary>Whether the screen shows.</summary>
    public Task<ProfileSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new ProfileSnapshot(driver.FindElements(SortBar).Count > 0));
}

/// <summary>Whether a user's profile shows.</summary>
public sealed record ProfileSnapshot(bool Shown);
