// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Diagnostics;
using System.Runtime.CompilerServices;
using Microsoft.Playwright;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>
/// Every Act and Read member of a page object goes through here (E2E-TEST-CODE-RULES.md, rule c), so the video shows what
/// the scenario does, one step at a time: when the run records, a step starts no sooner than
/// <see cref="E2EVsCode.ActionGap"/> after the previous one ended, and the drawn mouse pointer glides to the element an
/// action uses before the action. An element inside the panel (a webview's iframe) gets its pointer and click ring drawn
/// by the page itself (RecordingOverlay's hooks), since the iframe keeps its mouse events from the page. VS Code's
/// workbench doesn't scroll, so nothing is scrolled into view. Without a recording it goes on at once.
/// </summary>
public static class OnScreen
{
    // As long as the drawn pointer's glide (RecordingOverlay), and a moment to see it arrive.
    private static readonly TimeSpan PointerGlide = TimeSpan.FromMilliseconds(800);

    // Long enough for the page to have had the mouse's last moves (they come at its next frames).
    private static readonly TimeSpan MovesDelivered = TimeSpan.FromMilliseconds(150);

    // When each page's last step ended (one page per scenario, its steps one after another).
    private static readonly ConditionalWeakTable<IPage, Stopwatch> SinceLastStep = [];

    private static bool Recording => E2EVsCode.VideoDirectory is not null;

    /// <summary>Glides the pointer to <paramref name="target"/> on <paramref name="page"/> and clicks it.</summary>
    public static Task ClickAsync(IPage page, ILocator target, bool inPanel = false) =>
        ActAsync(page, target, inPanel, async () =>
        {
            if (Recording && inPanel && await target.BoundingBoxAsync() is { } bounds)
            {
                await page.EvaluateAsync("([x, y]) => window.__e2eRing?.(x, y)", new[] { (double)(bounds.X + bounds.Width / 2), (double)(bounds.Y + bounds.Height / 2) });
            }

            await target.ClickAsync();
        });

    /// <summary>Presses keys on the page with <paramref name="press"/> (or types): no pointer moves.</summary>
    public static async Task KeyAsync(IPage page, Func<Task> press)
    {
        await WaitForActionGapAsync(page);
        await press();
        NoteStepEnded(page);
    }

    /// <summary>Reads with <paramref name="read"/>, a step of its own.</summary>
    public static async Task<T> ReadAsync<T>(IPage page, Func<Task<T>> read)
    {
        await WaitForActionGapAsync(page);
        var shown = await read();
        NoteStepEnded(page);
        return shown;
    }

    private static async Task ActAsync(IPage page, ILocator target, bool inPanel, Func<Task> act)
    {
        await WaitForActionGapAsync(page);
        if (Recording && await target.BoundingBoxAsync() is { } bounds)
        {
            var (x, y) = (bounds.X + bounds.Width / 2, bounds.Y + bounds.Height / 2);
            await page.Mouse.MoveAsync(x, y, new() { Steps = 8 });
            if (inPanel)
            {
                // The page saw the mouse only up to the panel's edge: the drawn pointer goes the rest of the way, once
                // those moves have reached the page (Chromium hands it mouse moves at its next frame).
                await Task.Delay(MovesDelivered);
                await page.EvaluateAsync("([x, y]) => window.__e2eMovePointer?.(x, y)", new[] { (double)x, (double)y });
            }

            await Task.Delay(PointerGlide);
        }

        await act();
        NoteStepEnded(page);
    }

    private static async Task WaitForActionGapAsync(IPage page)
    {
        if (Recording && SinceLastStep.TryGetValue(page, out var since) && since.Elapsed < E2EVsCode.ActionGap)
        {
            await Task.Delay(E2EVsCode.ActionGap - since.Elapsed);
        }
    }

    private static void NoteStepEnded(IPage page) => SinceLastStep.AddOrUpdate(page, Stopwatch.StartNew());
}
