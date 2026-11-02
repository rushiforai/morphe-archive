// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using Microsoft.Playwright;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>The Explorer view: the workspace's folders and files, as a tree.</summary>
public sealed class Explorer(IPage page)
{
    /// <summary>
    /// Opens <paramref name="file"/> in the editor: a click on each folder of its path that isn't open yet (a click on an
    /// open one would close it), then on the file.
    /// </summary>
    public async Task OpenAsync(ScenarioFile file)
    {
        var names = file.ToPath().Split('/');
        foreach (var folder in names[..^1])
        {
            var open = page.GetByRole(AriaRole.Treeitem, new() { Name = folder, Exact = true, Expanded = true });
            if (await open.CountAsync() == 0)
            {
                await OnScreen.ClickAsync(page, page.GetByRole(AriaRole.Treeitem, new() { Name = folder, Exact = true }));
            }
        }

        await OnScreen.ClickAsync(page, page.GetByRole(AriaRole.Treeitem, new() { Name = names[^1], Exact = true }));

        await page.Locator(VsCodeDom.EditorTab, new() { HasText = file.ToFileName() }).WaitForAsync();
        await page.Locator(VsCodeDom.CodeEditor).Locator(VsCodeDom.Lines).WaitForAsync();
    }
}
