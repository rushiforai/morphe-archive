// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Microsoft.Playwright;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>
/// VS Code for the web as the user sees it, opened on Workspace/ with the extension: its explorer, the scenario file's
/// editor (its CodeLens, its title bar's buttons), the extension's recording panel and the Command Palette. Locators stay
/// private to their class (role + accessible name, the panel's data-testid and data-action, VS Code's classes in
/// <see cref="VsCodeDom"/>).
/// </summary>
public sealed class Workbench(IPage page)
{
    /// <summary>The Explorer view: the workspace's folders and files.</summary>
    public Explorer Explorer { get; } = new(page);

    /// <summary>The scenario file's editor: its lines and the CodeLens above them.</summary>
    public CodeEditor Editor { get; } = new(page);

    /// <summary>The extension's panel beside the code: a scenario's recording.</summary>
    public RecordingPanel RecordingPanel { get; } = new(page);

    /// <summary>The Command Palette (F1).</summary>
    public CommandPalette CommandPalette { get; } = new(page);

    /// <summary>Waits until VS Code has drawn its workbench, with the workspace in the explorer.</summary>
    public async Task WaitUntilShownAsync(TimeSpan timeout)
    {
        await page.Locator(VsCodeDom.Workbench).WaitForAsync(new() { Timeout = (float)timeout.TotalMilliseconds });
        await page.GetByRole(AriaRole.Treeitem, new() { Name = "Scenarios", Exact = true })
            .WaitForAsync(new() { Timeout = (float)timeout.TotalMilliseconds });
    }
}
