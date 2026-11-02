// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using Microsoft.Playwright;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Workbench;

/// <summary>
/// The extension's panel beside the code (a webview: its page sits in two frames, drawn over its editor group): a
/// scenario's recording, a tab per screen, the video or GIF, and "Recorded in" with every version.
/// </summary>
public sealed class RecordingPanel(IPage page)
{
    private static readonly TimeSpan MediaTimeout = TimeSpan.FromSeconds(30);

    private IFrameLocator Content => page.FrameLocator(VsCodeDom.Webview).FrameLocator(VsCodeDom.WebviewContent);

    private ILocator Media => Content.Locator("[data-testid=media]");

    /// <summary>Waits until the panel shows its recording, the video playing (or the GIF loaded).</summary>
    public async Task WaitUntilPlayingAsync()
    {
        await Content.Locator("[data-testid=title]:not(:empty)").WaitForAsync();
        var until = DateTime.UtcNow + MediaTimeout;
        while (!await Media.EvaluateAsync<bool>(PlayingScript) && DateTime.UtcNow < until)
        {
            await Task.Delay(200);
        }
    }

    /// <summary>Clicks the screen's tab ("Phone").</summary>
    public Task ClickTabAsync(string tab) =>
        OnScreen.ClickAsync(page, Content.GetByRole(AriaRole.Tab, new() { Name = tab, Exact = true }), inPanel: true);

    /// <summary>Clicks a version of "Recorded in" ("PR #104 · V1").</summary>
    public Task ClickVersionAsync(string version) =>
        OnScreen.ClickAsync(page, Content.Locator("[data-action=version]").Filter(new() { HasText = version }), inPanel: true);

    /// <summary>What the panel shows: its editor tab, its title and line, its tabs, its video or GIF, its links and versions.</summary>
    public Task<RecordingPanelSnapshot> ReadAsync() => OnScreen.ReadAsync(page, ReadShownAsync);

    /// <summary>Where the panel and the scenario file's editor are on the screen.</summary>
    public Task<RecordingPanelLayout> ReadLayoutAsync() => OnScreen.ReadAsync(page, ReadLayoutShownAsync);

    private async Task<RecordingPanelSnapshot> ReadShownAsync()
    {
        var tab = await page.Locator(VsCodeDom.ActiveEditorTab).Filter(new() { HasText = "Recording" }).Last.InnerTextAsync();
        var shown = ShownJson.Read<RecordingPanelShown>(await Content.Locator("[data-testid=panel]").EvaluateAsync<string>(ReadScript));
        return new RecordingPanelSnapshot(tab.Trim(), shown.Title, shown.About, shown.Tabs, shown.Video, shown.Gif, shown.Note, shown.PlayerLink, shown.Versions, shown.Source);
    }

    private async Task<RecordingPanelLayout> ReadLayoutShownAsync()
    {
        var code = await page.Locator(VsCodeDom.CodeEditor).First.BoundingBoxAsync();
        var panel = await page.Locator(VsCodeDom.Webview).BoundingBoxAsync();
        return new RecordingPanelLayout(ToBox(code), ToBox(panel));
    }

    private static ShownBox? ToBox(LocatorBoundingBoxResult? box) =>
        box is null ? null : new ShownBox(box.X, box.Y, box.X + box.Width, box.Y + box.Height);

    // The video plays once it has its first frame and no error; a GIF once it has decoded.
    private const string PlayingScript = """
        media => {
          const video = media.querySelector('video');
          if (video) return video.readyState >= 2 && !video.error;
          const gif = media.querySelector('img');
          return gif !== null && gif.complete && gif.naturalWidth > 0;
        }
        """;

    private const string ReadScript = """
        main => {
          const find = id => main.querySelector(`[data-testid="${id}"]`);
          const asset = src => decodeURIComponent((src ?? '').split('/').pop());
          const release = src => decodeURIComponent((src ?? '').split('/').slice(-2, -1)[0] ?? '');
          const video = main.querySelector('[data-testid=video]');
          const gif = main.querySelector('[data-testid=gif]');
          const link = find('player-link');
          return JSON.stringify({
            title: find('title').textContent.trim(),
            about: find('about').textContent.trim(),
            tabs: [...main.querySelectorAll('[role=tab]')].map(tab => ({ text: tab.textContent.trim(), selected: tab.getAttribute('aria-selected') === 'true' })),
            video: video ? { asset: asset(video.currentSrc || video.getAttribute('src')), release: release(video.currentSrc || video.getAttribute('src')), plays: video.readyState >= 2 && !video.error && !video.paused, controls: video.controls } : null,
            gif: gif ? asset(gif.getAttribute('src')) : null,
            note: find('note').hidden ? null : find('note').textContent.trim(),
            playerLink: link.hidden ? null : link.getAttribute('href'),
            versions: [...main.querySelectorAll('[data-action=version]')].map(v => ({ text: v.textContent.trim(), picked: v.getAttribute('aria-pressed') === 'true' })),
            source: find('source').textContent.trim(),
          });
        }
        """;

    private sealed record RecordingPanelShown(
        string Title,
        string About,
        ImmutableArray<PanelTab> Tabs,
        PanelVideo? Video,
        string? Gif,
        string? Note,
        string? PlayerLink,
        ImmutableArray<PanelVersion> Versions,
        string Source);
}

/// <summary>What the panel shows.</summary>
public sealed record RecordingPanelSnapshot(
    string EditorTab,
    string Title,
    string About,
    ImmutableArray<PanelTab> Tabs,
    PanelVideo? Video,
    string? Gif,
    string? Note,
    string? PlayerLink,
    ImmutableArray<PanelVersion> Versions,
    string Source);

/// <summary>A screen's tab: its label and whether it is selected.</summary>
public sealed record PanelTab(string Text, bool Selected);

/// <summary>
/// The panel's video: its MP4's asset name, the release it comes from, whether it plays (has its frames, no error, not
/// paused) and whether it shows the browser's controls (play and pause, seeking, fullscreen).
/// </summary>
public sealed record PanelVideo(string Asset, string Release, bool Plays, bool Controls);

/// <summary>A version of "Recorded in": its label and whether it is the one picked.</summary>
public sealed record PanelVersion(string Text, bool Picked);

/// <summary>Where the scenario file's editor and the panel are (CSS pixels), or null for one not shown.</summary>
public sealed record RecordingPanelLayout(ShownBox? Code, ShownBox? Panel);

/// <summary>Where a part is on the screen, in CSS pixels.</summary>
public sealed record ShownBox(double Left, double Top, double Right, double Bottom);
