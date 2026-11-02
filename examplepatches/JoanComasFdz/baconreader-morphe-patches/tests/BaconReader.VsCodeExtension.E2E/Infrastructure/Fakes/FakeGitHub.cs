// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Text.Json;
using BaconReader.VsCodeExtension.E2E.Infrastructure.Vocabulary;
using Microsoft.Playwright;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure.Fakes;

/// <summary>
/// GitHub as the extension sees it, faked per scenario: no scenario reaches GitHub. It answers the context's requests for
/// the release (api.github.com: prs-resources by its tag, then its assets) with the recordings the scenario put in it
/// (<see cref="Release"/>), and their downloads (github.com/…/releases/download/prs-resources/…) with the fake
/// recordings of Media/ (a "Phone" or "Desktop" card). Anything else answers 404. Every answer allows any origin, as
/// GitHub's API does: VS Code for the web runs on another origin.
/// </summary>
public sealed class FakeGitHub
{
    private const string Repository = "JoanComasFdz/baconreader-morphe-patches";
    private const string Tag = "prs-resources";
    private static readonly string Downloads = $"https://github.com/{Repository}/releases/download/";
    private static readonly string Media = Path.Combine(AppContext.BaseDirectory, "Infrastructure", "Fakes", "Media");

    private static readonly Dictionary<string, string> Cors = new()
    {
        ["access-control-allow-origin"] = "*",
        ["access-control-allow-headers"] = "*",
        ["access-control-expose-headers"] = "x-ratelimit-remaining",
    };

    /// <summary>The prs-resources release, as the scenario fills it.</summary>
    public FakeRelease Release { get; } = new(1);

    /// <summary>Answers the context's GitHub requests from <see cref="Release"/>.</summary>
    public async Task RouteAsync(IBrowserContext context)
    {
        await context.RouteAsync("https://api.github.com/**", AnswerApiAsync);
        await context.RouteAsync("https://github.com/**", AnswerDownloadAsync);
    }

    private async Task AnswerApiAsync(IRoute route)
    {
        if (route.Request.Method == "OPTIONS")
        {
            await route.FulfillAsync(new() { Status = 204, Headers = Cors });
            return;
        }

        var url = new Uri(route.Request.Url);
        var path = url.AbsolutePath;
        object? answer = path == $"/repos/{Repository}/releases/tags/{Tag}"
            ? new { id = Release.Id, tag_name = Tag }
            : path == $"/repos/{Repository}/releases/{Release.Id}/assets"
                ? ReadPage(Release.Assets, url.Query)
                : null;
        await route.FulfillAsync(new()
        {
            Status = answer is null ? 404 : 200,
            Headers = Cors,
            ContentType = "application/json",
            Body = JsonSerializer.Serialize(answer ?? new { message = "Not Found" }),
        });
    }

    // One page of the assets, 100 a page as the extension asks (?per_page=100&page=<n>).
    private static object[] ReadPage(ImmutableDictionary<string, string> assets, string query)
    {
        var page = System.Web.HttpUtility.ParseQueryString(query)["page"] is { } asked && int.TryParse(asked, out var number) ? number : 1;
        return [.. assets.Keys.Order(StringComparer.Ordinal).Skip((page - 1) * 100).Take(100)
            .Select(name => new { name, browser_download_url = $"{Downloads}{Tag}/{name}" })];
    }

    private async Task AnswerDownloadAsync(IRoute route)
    {
        var url = route.Request.Url;
        var download = url.StartsWith(Downloads, StringComparison.Ordinal) ? url[Downloads.Length..].Split('/', 2) : [];
        var media = "";
        if (download.Length != 2
            || Uri.UnescapeDataString(download[0]) != Tag
            || !Release.Assets.TryGetValue(Uri.UnescapeDataString(download[1]), out media))
        {
            await route.FulfillAsync(new() { Status = 404, Headers = Cors, Body = "Not Found" });
            return;
        }

        await route.FulfillAsync(new()
        {
            Status = 200,
            Headers = Cors,
            ContentType = media.EndsWith(".gif", StringComparison.Ordinal) ? "image/gif" : "video/mp4",
            BodyBytes = await File.ReadAllBytesAsync(Path.Combine(Media, media)),
        });
    }
}

/// <summary>
/// A release's assets: each recording of a scenario is a GIF (and an MP4) per screen it is played on, named as the
/// workflow names them (<see cref="AssetNaming"/>).
/// </summary>
public sealed class FakeRelease(int id)
{
    /// <summary>Its id in GitHub's API (the URL of its assets names it).</summary>
    public int Id { get; } = id;

    private ImmutableDictionary<string, string> assets = ImmutableDictionary<string, string>.Empty;

    /// <summary>Each asset's name, and the file of Media/ its download answers with.</summary>
    public ImmutableDictionary<string, string> Assets => Volatile.Read(ref assets);

    /// <summary>Adds each recording of <paramref name="file"/>'s scenario to the release.</summary>
    public void AddRecordingsOf(ScenarioFile file, params Recording[] recordings)
    {
        var added = recordings
            .SelectMany(recording => file.ToScreens().SelectMany(screen => NameRuns(file, recording, screen)))
            .ToImmutableArray();
        ImmutableInterlocked.Update(ref assets, held => held.SetItems(added));
    }

    /// <summary>
    /// The release holds no recording of <paramref name="file"/>'s scenario. A scenario's release starts empty and only
    /// <see cref="AddRecordingsOf"/> adds to it, so there is nothing to do: the Given reads as its Gherkin line.
    /// </summary>
    public void HasNoRecordingOf(ScenarioFile file)
    {
    }

    private static IEnumerable<KeyValuePair<string, string>> NameRuns(ScenarioFile file, Recording recording, Screen screen)
    {
        var gif = ScenarioNaming.ToGifName(file.ToMethod(), screen);
        var media = screen.ToString().ToLowerInvariant();
        yield return new(AssetNaming.NameAsset(recording.Pr, recording.Version, file.ToDomain(), gif, ".gif"), $"{media}.gif");
        if (recording.HasMp4s)
        {
            yield return new(AssetNaming.NameAsset(recording.Pr, recording.Version, file.ToDomain(), gif, ".mp4"), $"{media}.mp4");
        }
    }
}
