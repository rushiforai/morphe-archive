// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Drawing;
using BaconReader.E2E.Infrastructure.Vocabulary;
using OpenQA.Selenium;
using OpenQA.Selenium.Appium.Android;
using OpenQA.Selenium.Interactions;

namespace BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;

/// <summary>
/// The text box of the reply screen and of "Submit a Post", as "Markdown editor" makes it: a bar of Reddit's formats
/// above it, one button each, described by its name ("Bold"), which scrolls sideways, and the counter at its end,
/// described "Character count", "0 / 10,000" ("0 / 40,000" for a post, with a subreddit's own limits, or "No text in
/// r/…").
/// </summary>
public sealed class MarkdownEditor(AndroidDriver driver)
{
    private static readonly By Box = Locate.AppId("replyText");
    private static readonly By Bar = Locate.SidewaysList();
    private static readonly By Counter = Locate.Description("Character count");

    /// <summary>Waits until the bar shows above the text box.</summary>
    public Task WaitUntilShownAsync() =>
        Waiting.UntilShownAsync(driver, Locate.Description(new MarkdownFormat.Bold().ToShownText()), TimeSpan.FromSeconds(10), "The formats above the text box");

    /// <summary>Types <paramref name="text"/> into the text box, which is empty: the cursor ends after it.</summary>
    public Task TypeAsync(string text) => OnScreen.ActAsync(driver, Box, box => box.SendKeys(text));

    /// <summary>Taps <paramref name="format"/>'s button in the bar, scrolling the bar to it first.</summary>
    public async Task ClickAsync(MarkdownFormat format)
    {
        var button = Locate.Description(format.ToShownText());
        for (var swipe = 0; swipe < 4 && !FullyShown(button); swipe++)
        {
            await OnScreen.DoAsync(driver, () => SwipeBar(towardTheEnd: true));
        }

        await OnScreen.PressAsync(driver, button);
    }

    /// <summary>
    /// Waits until the counter shows, and shows the same twice in a row, a second apart: it follows a subreddit's
    /// requirements once Reddit answers them.
    /// </summary>
    public Task WaitUntilCounterSettledAsync()
    {
        string? last = null;
        return Waiting.UntilAsync(
            () =>
            {
                var now = CounterText();
                var settled = now is not null && now == last;
                last = now;
                if (!settled)
                {
                    Thread.Sleep(1000);
                }

                return settled;
            },
            TimeSpan.FromSeconds(15),
            "The counter at the end of the formats settling");
    }

    /// <summary>
    /// The formats the bar offers, in its order: it is scrolled to its end, a screen at a time, and back to its start.
    /// </summary>
    public Task<MarkdownBarSnapshot> ReadFormatsAsync() =>
        OnScreen.ReadAsync(driver, () =>
        {
            var formats = new List<string>();
            for (var screen = 0; screen < 6; screen++)
            {
                var shown = Shown().Where(description => !formats.Contains(description)).ToList();
                if (screen > 0 && shown.Count == 0)
                {
                    break;
                }

                formats.AddRange(shown);
                SwipeBar(towardTheEnd: true);
            }

            for (var screen = 0; screen < 6; screen++)
            {
                SwipeBar(towardTheEnd: false);
            }

            return new MarkdownBarSnapshot([.. formats.Select(MarkdownFormatShowing.ReadMarkdownFormat)]);
        });

    /// <summary>
    /// Waits until the text box holds <paramref name="text"/>: what the app puts in it comes when the screen it opened
    /// closes (a drawing's tag).
    /// </summary>
    public Task WaitUntilTextShownAsync(string text) =>
        Waiting.UntilAsync(() => driver.FindElements(Box).FirstOrDefault()?.Text == text, TimeSpan.FromSeconds(10), $"The text box holding \"{text}\"");

    /// <summary>What the text box holds, and what the counter shows.</summary>
    public Task<MarkdownTextBoxSnapshot> ReadAsync() =>
        OnScreen.ReadAsync(driver, () => new MarkdownTextBoxSnapshot(driver.FindElement(Box).Text, CounterText()));

    // The descriptions of the bar's buttons on the screen, left to right.
    private IEnumerable<string> Shown() =>
        driver.FindElements(Bar).Take(1).SelectMany(bar => bar.FindElements(Locate.Described()))
            .Where(button => button.Displayed)
            .OrderBy(button => button.Location.X)
            .Select(button => button.GetAttribute("content-desc") ?? "")
            .Where(description => description.Length > 0);

    private bool FullyShown(By button)
    {
        var bar = driver.FindElements(Bar).FirstOrDefault();
        var found = driver.FindElements(button).FirstOrDefault(element => element.Displayed);
        return bar is not null && found is not null
            && found.Location.X >= bar.Location.X && found.Location.X + found.Size.Width <= bar.Location.X + bar.Size.Width;
    }

    // A swipe across the bar, from near one end to near the other: it scrolls the bar by about its width.
    private void SwipeBar(bool towardTheEnd)
    {
        var bar = driver.FindElement(Bar);
        var bounds = new Rectangle(bar.Location, bar.Size);
        var y = bounds.Top + (bounds.Height / 2);
        var (from, to) = towardTheEnd
            ? (bounds.Right - (bounds.Width / 8), bounds.Left + (bounds.Width / 8))
            : (bounds.Left + (bounds.Width / 8), bounds.Right - (bounds.Width / 8));
        var finger = new PointerInputDevice(PointerKind.Touch, "finger");
        var swipe = new ActionSequence(finger, 0);
        swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, from, y, TimeSpan.Zero));
        swipe.AddAction(finger.CreatePointerDown(MouseButton.Touch));
        swipe.AddAction(finger.CreatePointerMove(CoordinateOrigin.Viewport, to, y, TimeSpan.FromMilliseconds(400)));
        swipe.AddAction(finger.CreatePointerUp(MouseButton.Touch));
        driver.PerformActions([swipe]);
    }

    private string? CounterText() =>
        driver.FindElements(Counter).Where(counter => counter.Displayed).Select(counter => counter.Text).FirstOrDefault();
}

/// <summary>The formats the bar above a text box offers, in its order.</summary>
public sealed record MarkdownBarSnapshot(ImmutableArray<MarkdownFormat> Formats);

/// <summary>What a text box holds, and what its counter shows ("4 / 10,000"; null when none shows).</summary>
public sealed record MarkdownTextBoxSnapshot(string Text, string? Counter);
