// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using Microsoft.Playwright;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>The scenario file's editor: its lines, and the CodeLens rows VS Code draws above them.</summary>
public sealed class CodeEditor(IPage page)
{
    private const string Reading = "Reading the e2e recordings";
    private static readonly TimeSpan Settled = TimeSpan.FromSeconds(2);
    private static readonly TimeSpan SettleTimeout = TimeSpan.FromSeconds(20);

    private ILocator Editor => page.Locator(VsCodeDom.CodeEditor);

    private ILocator CodeLens => Editor.Locator(VsCodeDom.CodeLens);

    /// <summary>Waits until the CodeLens shows the recordings the extension read of the release (no longer "Reading…").</summary>
    public async Task WaitUntilRecordingsShownAsync()
    {
        await CodeLens.First.WaitForAsync();
        await Editor.Locator(VsCodeDom.CodeLens, new() { HasNotText = Reading }).First.WaitForAsync();
        await Editor.Locator(VsCodeDom.CodeLens, new() { HasText = Reading }).WaitForAsync(new() { State = WaitForSelectorState.Detached });
    }

    /// <summary>
    /// Waits until the editor's CodeLens rows stop changing: as many for <see cref="Settled"/> on end (VS Code draws them
    /// a moment after a file opens), so a file that gets none is read only once it would have shown them.
    /// </summary>
    public async Task WaitUntilCodeLensSettledAsync()
    {
        var until = DateTime.UtcNow + SettleTimeout;
        var count = await CodeLens.CountAsync();
        var since = DateTime.UtcNow;
        while (DateTime.UtcNow - since < Settled && DateTime.UtcNow < until)
        {
            await Task.Delay(100);
            var now = await CodeLens.CountAsync();
            (count, since) = now == count ? (count, since) : (now, DateTime.UtcNow);
        }
    }

    /// <summary>Waits until a CodeLens item reads <paramref name="item"/>.</summary>
    public Task WaitUntilCodeLensShowsAsync(string item) =>
        CodeLens.Locator(VsCodeDom.CodeLensItem, new() { HasText = item }).First.WaitForAsync();

    /// <summary>Clicks the CodeLens item <paramref name="item"/> ("Play phone recording").</summary>
    public Task ClickCodeLensAsync(string item) =>
        OnScreen.ClickAsync(page, CodeLens.Locator(VsCodeDom.CodeLensCommand).Filter(new() { HasText = item }).First);

    /// <summary>Clicks the line that shows <paramref name="text"/>, so the cursor is on it.</summary>
    public Task ClickLineAsync(string text) =>
        OnScreen.ClickAsync(page, Editor.Locator(VsCodeDom.Line).Filter(new() { HasText = text }).First);

    /// <summary>Clicks the button <paramref name="title"/> in the editor's title bar (by its tooltip: the button shows an icon).</summary>
    public Task ClickTitleBarButtonAsync(string title) =>
        OnScreen.ClickAsync(page, page.Locator(VsCodeDom.EditorTitleBar).GetByRole(AriaRole.Button, new() { Name = title, Exact = true }));

    /// <summary>Each CodeLens row the editor shows, with its items and the line right below it.</summary>
    public Task<CodeLensSnapshot> ReadCodeLensAsync() => OnScreen.ReadAsync(page, ReadShownAsync);

    private async Task<CodeLensSnapshot> ReadShownAsync()
    {
        var json = await Editor.EvaluateAsync<string>(ReadScript, new { codeLens = VsCodeDom.CodeLens, lines = VsCodeDom.Line });
        return new CodeLensSnapshot([.. ShownJson.Read<CodeLensRow[]>(json)]);
    }

    // Each row's items (VS Code draws each as a link, or a span when it runs no command; their icons hold no text; the
    // "|" between them is a span of its own), and the text of the first line drawn below the row.
    private const string ReadScript = """
        (editor, { codeLens, lines }) => {
          const drawn = [...editor.querySelectorAll(lines)].map(line => ({ top: line.getBoundingClientRect().top, text: line.textContent.replace(/ /g, ' ').trim() }));
          return JSON.stringify([...editor.querySelectorAll(codeLens)].map(row => {
            const bottom = row.getBoundingClientRect().bottom;
            const below = drawn.filter(line => line.top >= bottom - 2).sort((a, b) => a.top - b.top)[0];
            return {
              items: [...row.children].map(item => item.textContent.replace(/ /g, ' ').trim()).filter(text => text.length > 0 && text !== '|'),
              lineBelow: below ? below.text : '',
            };
          }));
        }
        """;
}

/// <summary>The CodeLens rows the editor shows.</summary>
public sealed record CodeLensSnapshot(ImmutableArray<CodeLensRow> Rows);

/// <summary>One CodeLens row: its items, in order, and the line right below it.</summary>
public sealed record CodeLensRow(ImmutableArray<string> Items, string LineBelow);
