// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone;

/// <summary>Android's clipboard: what an app copied last. Not on the screen.</summary>
public sealed class Clipboard(AndroidDriver driver)
{
    /// <summary>The text the clipboard holds.</summary>
    public Task<ClipboardSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new ClipboardSnapshot(driver.GetClipboardText() ?? ""));
}

/// <summary>The text Android's clipboard holds.</summary>
public sealed record ClipboardSnapshot(string Text);
