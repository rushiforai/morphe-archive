// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Microsoft.Playwright;

[assembly: AssemblyFixture(typeof(BaconReader.VsCodeExtension.E2E.Infrastructure.BrowserRun))]

namespace BaconReader.VsCodeExtension.E2E.Infrastructure;

/// <summary>
/// One browser for the whole run (the Chromium the cloud image ships, found through <c>PLAYWRIGHT_BROWSERS_PATH</c>),
/// started on first use, so a run without <c>E2E_VSCODE_URL</c> starts none; each scenario opens its own context in it.
/// </summary>
public sealed class BrowserRun : IAsyncLifetime
{
    private IPlaywright? playwright;
    private IBrowser? browser;
    private readonly SemaphoreSlim gate = new(1, 1);

    /// <summary>The run's browser: started on first use.</summary>
    public async Task<IBrowser> OpenBrowserAsync()
    {
        await gate.WaitAsync();
        try
        {
            playwright ??= await Playwright.CreateAsync();
            browser ??= await playwright.Chromium.LaunchAsync(new() { Headless = true });
            return browser;
        }
        finally
        {
            gate.Release();
        }
    }

    public ValueTask InitializeAsync() => ValueTask.CompletedTask;

    public async ValueTask DisposeAsync()
    {
        if (browser is not null)
        {
            await browser.CloseAsync();
        }

        playwright?.Dispose();
        gate.Dispose();
    }
}
