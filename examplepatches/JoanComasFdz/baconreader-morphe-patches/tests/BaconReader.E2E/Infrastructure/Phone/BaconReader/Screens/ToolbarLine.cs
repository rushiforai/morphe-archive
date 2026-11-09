// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Drawing;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The line "Account colors" draws along the bottom of a screen's toolbar, in the color of the account in use. It has no
/// view of its own, so whether it is drawn is read from a screenshot (E2E-TEST-CODE-RULES.md, rule d).
/// </summary>
internal static class ToolbarLine
{
    private const string ToolbarView = "toolbar";

    // The spot: a little of the toolbar's bottom, a bit right of its middle, where neither the title nor the buttons
    // reach. Twice as tall as the line (3 dp, 11 px on the Pixel 6 Pro), so its top-left pixel is the toolbar's own color.
    private const int SpotWidth = 40;
    private const int SpotHeight = 24;

    /// <summary>Whether the toolbar on the screen shows the line along its bottom.</summary>
    public static Task<ToolbarLineSnapshot> ReadAsync(AndroidDriver driver) =>
        OnScreen.ReadAsync(driver, () =>
        {
            var bounds = ScreenSnapshot.Take(driver).WithAppId(ToolbarView).First(shown => shown.Displayed).Bounds;
            var spot = new Rectangle(bounds.Left + (bounds.Width * 55 / 100), bounds.Bottom - SpotHeight, SpotWidth, SpotHeight);
            return new ToolbarLineSnapshot(Screenshots.Differs(driver.GetScreenshot().AsByteArray, spot));
        });
}

/// <summary>Whether a toolbar shows "Account colors"' line along its bottom.</summary>
public sealed record ToolbarLineSnapshot(bool Drawn);
