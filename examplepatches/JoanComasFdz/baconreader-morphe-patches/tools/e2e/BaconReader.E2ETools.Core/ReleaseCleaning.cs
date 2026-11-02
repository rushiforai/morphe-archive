// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.E2ETools.Core;

/// <summary>A release the workflow keeps recordings in: its id and its tag.</summary>
public sealed record Release(long Id, string Tag);

/// <summary>A file of a release: its id and its name.</summary>
public sealed record ReleaseAsset(long Id, string Name);

/// <summary>
/// What <c>prs-resources</c> keeps when a PR closes: the PR's newest version, so its last post keeps showing and playing
/// it. Only names <c>pr-&lt;n&gt;-v&lt;version&gt;-…</c> of that PR are ever deleted.
/// </summary>
public static class ReleaseCleaning
{
    public const int MaxAssets = 1000;
    public const int WarnAssets = 900;

    public static Optional<Release> FindPrsRelease(ImmutableArray<Release> releases) =>
        releases.Where(release => release.Tag == ReleaseNaming.PrsRelease).Select(Optional.Some).DefaultIfEmpty(Optional.None<Release>()).First();

    /// <summary>The PR's assets to delete when it closes: every version older than its newest.</summary>
    public static ImmutableArray<ReleaseAsset> PlanPrDeletions(ImmutableArray<ReleaseAsset> assets, int pr)
    {
        var own = ReadOwn(assets).Where(asset => asset.Name.Pr == pr).ToImmutableArray();
        var newest = own.Select(asset => asset.Name.Version).DefaultIfEmpty(0).Max();
        return [.. own.Where(asset => asset.Name.Version < newest).Select(asset => asset.Asset)];
    }

    /// <summary>The release's lines once cleaned: how many of the PR's assets it kept, how many it holds, and a warning near its limit.</summary>
    public static ImmutableArray<string> DescribeCleaned(string tag, ImmutableArray<ReleaseAsset> assets, ImmutableArray<ReleaseAsset> deleted, int pr)
    {
        var left = assets.Length - deleted.Length;
        var kept = assets.Count(asset => !deleted.Contains(asset) && ReleaseNaming.ReadAsset(asset.Name) is Optional<AssetName>.Some name && name.Value.Pr == pr);
        var line = $"{tag}: kept {kept} asset(s) of PR #{pr}; it holds {left} of at most {MaxAssets:N0} assets.";
        return left > WarnAssets
            ? [line, $"::warning::{tag} holds {left} of at most {MaxAssets:N0} assets (docs/hosting.md, \"The release's limit\")."]
            : [line];
    }

    private static IEnumerable<(ReleaseAsset Asset, AssetName Name)> ReadOwn(ImmutableArray<ReleaseAsset> assets) =>
        assets
            .Select(asset => (Asset: asset, Name: ReleaseNaming.ReadAsset(asset.Name)))
            .Where(asset => asset.Name is Optional<AssetName>.Some)
            .Select(asset => (asset.Asset, ((Optional<AssetName>.Some)asset.Name).Value));
}
