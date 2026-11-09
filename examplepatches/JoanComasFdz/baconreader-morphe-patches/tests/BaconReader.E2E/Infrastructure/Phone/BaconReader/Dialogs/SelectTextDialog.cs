// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Appium.Android.Enums;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// The dialog "Select text" opens from a post's or a comment's menu: the post's title and text, or the comment's text,
/// which a long press selects, and "CLOSE".
/// </summary>
public sealed class SelectTextDialog(AndroidDriver driver)
{
    // The dialog's text is made in code; "Select text" gives it this id.
    private static readonly By Text = Locate.AppId("baconreader_patches_selected_text");
    private static readonly By Close = Locate.AndroidIdWithText("button1", "CLOSE");

    // The dialog's text starts 24 dp in from its view's left and top edges.
    private const int PaddingDp = 24;

    private double? density;

    /// <summary>Waits until the dialog shows its text.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Text, TimeSpan.FromSeconds(10), "The dialog of \"Select text\"");

    /// <summary>Waits until the dialog is gone.</summary>
    public Task WaitUntilClosedAsync() =>
        Waiting.UntilAsync(() => driver.FindElements(Text).Count == 0, TimeSpan.FromSeconds(10), "The dialog of \"Select text\" closing");

    /// <summary>The dialog's text, by its paragraphs: the parts between its blank lines.</summary>
    public Task<SelectTextDialogSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new SelectTextDialogSnapshot(
            [.. driver.FindElement(Text).Text.Split("\n\n").Select(paragraph => paragraph.Trim()).Where(paragraph => paragraph.Length > 0)]));

    /// <summary>
    /// Long presses the first word of the dialog's text, which selects it and shows Android's selection toolbar: a point
    /// a little inside the text's first character.
    /// </summary>
    public Task LongClickFirstWordAsync() =>
        OnScreen.TouchAsync(driver, () => driver.FindElement(Text), text =>
        {
            var inset = (int)Math.Round((PaddingDp + 4) * Density());
            driver.ExecuteScript("mobile: longClickGesture", new Dictionary<string, object>
            {
                ["x"] = text.Location.X + inset,
                ["y"] = text.Location.Y + inset,
            });
        });

    /// <summary>
    /// Copies the selection to the clipboard with Ctrl+C, which a selectable text handles as its toolbar's "Copy" does.
    /// Android's selection toolbar floats in a window of its own, whose "Copy" UiAutomator doesn't find.
    /// </summary>
    public Task CopySelectionAsync() =>
        OnScreen.DoAsync(driver, () => driver.PressKeyCode(new KeyEvent(AndroidKeyCode.Keycode_C).WithMetaKeyModifier(AndroidKeyMetastate.Meta_Ctrl_On)));

    /// <summary>Taps "CLOSE", which closes the dialog.</summary>
    public Task ClickCloseAsync() => OnScreen.PressAsync(driver, Close);

    private double Density() =>
        density ??= driver.ExecuteScript("mobile: deviceInfo") is IDictionary<string, object> info
            ? Convert.ToDouble(info["displayDensity"], System.Globalization.CultureInfo.InvariantCulture) / 160
            : throw new InvalidOperationException("Appium's mobile: deviceInfo didn't answer the screen's density.");
}

/// <summary>The text the dialog of "Select text" shows, by its paragraphs.</summary>
public sealed record SelectTextDialogSnapshot(ImmutableArray<string> Paragraphs);
