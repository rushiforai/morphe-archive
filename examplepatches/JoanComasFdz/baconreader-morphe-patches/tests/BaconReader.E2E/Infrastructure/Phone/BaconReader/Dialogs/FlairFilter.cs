// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium.Appium.Android;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Dialogs;

/// <summary>
/// "Show posts with flair", the dialog "Flair filter"'s button in the sort bar opens: the subreddit's flairs, each with
/// a tick, and "CLEAR", "CANCEL" and "APPLY"; or, without a flair to offer, a message and "OK".
/// </summary>
public sealed class FlairFilter(AndroidDriver driver)
{
    private static readonly OpenQA.Selenium.By Title = Locate.Text("Show posts with flair");
    private static readonly OpenQA.Selenium.By Flair = Locate.AndroidId("text1");
    private static readonly OpenQA.Selenium.By Message = Locate.AndroidId("message");

    /// <summary>Waits until the dialog shows: Reddit's list of the subreddit's flairs takes a moment.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Title, TimeSpan.FromSeconds(10), "\"Show posts with flair\"");

    /// <summary>Ticks the flair <paramref name="flair"/>, or takes its tick away.</summary>
    public Task TickAsync(string flair) => OnScreen.PressAsync(driver, Locate.AndroidIdWithText("text1", flair));

    /// <summary>Taps <paramref name="button"/>, which closes the dialog.</summary>
    public Task ClickAsync(FlairFilterButton button) => OnScreen.PressAsync(driver, Locate.ButtonWithText(button.ToShownText()));

    /// <summary>What the dialog shows: the flairs it offers, top to bottom, each ticked or not, or its message.</summary>
    public Task<FlairFilterSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new FlairFilterSnapshot(
            [.. driver.FindElements(Flair).Select(flair => new FlairChoice(flair.Text.Trim(), flair.GetAttribute("checked") == "true"))],
            driver.FindElements(Message).FirstOrDefault()?.Text.Trim()));
}

/// <summary>A flair "Show posts with flair" offers, and whether it is ticked.</summary>
public sealed record FlairChoice(string Flair, bool Ticked);

/// <summary>What "Show posts with flair" shows: the flairs it offers, top to bottom, or its message (null without one).</summary>
public sealed record FlairFilterSnapshot(ImmutableArray<FlairChoice> Flairs, string? Message);
