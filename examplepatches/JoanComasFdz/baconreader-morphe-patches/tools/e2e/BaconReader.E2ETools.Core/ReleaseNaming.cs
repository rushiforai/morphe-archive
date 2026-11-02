// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace BaconReader.E2ETools.Core;

/// <summary>The parts of an asset name <c>pr-&lt;n&gt;-v&lt;version&gt;-&lt;run&gt;</c> the cleanup needs: its PR and its version.</summary>
public sealed record AssetName(int Pr, int Version);

/// <summary>
/// Where a run's recordings go, the <c>prs-resources</c> pre-release, and what they are called there:
/// <c>pr-&lt;n&gt;-v&lt;version&gt;-&lt;GIF name&gt;.gif</c> and <c>.mp4</c> (site/e2e-player.html reads the same names).
/// </summary>
public static partial class ReleaseNaming
{
    public const string PrsRelease = "prs-resources";

    /// <summary>The longest asset name the workflow writes; a longer one keeps its start and ends with a hash.</summary>
    public const int MaxName = 200;

    [GeneratedRegex(@"^pr-([0-9]+)-v([0-9]+)-(.+)$")]
    private static partial Regex CreateAssetPattern();

    /// <summary>
    /// <c>pr-&lt;n&gt;-v&lt;version&gt;-&lt;GIF name&gt;&lt;extension&gt;</c>; past 200 characters, its start plus a hash of the GIF's path, so
    /// it stays unique and the same on every push. A run's .gif and .mp4 share their stem.
    /// </summary>
    public static string NameAsset(int pr, int version, string gif, string extension)
    {
        var stem = $"pr-{pr}-v{version}-{RemoveExtension(gif.Split('/')[^1])}";
        if (stem.Length + extension.Length <= MaxName)
        {
            return stem + extension;
        }

        var digest = Convert.ToHexStringLower(SHA256.HashData(Encoding.UTF8.GetBytes(gif)))[..8];
        var keep = MaxName - $"-{digest}{extension}".Length;
        return $"{stem[..keep].TrimEnd('-')}-{digest}{extension}";
    }

    /// <summary>The PR and version of a name <c>pr-&lt;n&gt;-v&lt;version&gt;-…</c>; none for any other name.</summary>
    public static Optional<AssetName> ReadAsset(string name)
    {
        var found = CreateAssetPattern().Match(name);
        return found.Success && int.TryParse(found.Groups[1].Value, out var pr) && int.TryParse(found.Groups[2].Value, out var version)
            ? Optional.Some(new AssetName(pr, version))
            : Optional.None<AssetName>();
    }

    /// <summary>A file name without its last extension ("opens-phone.gif" → "opens-phone"); a leading dot is no extension.</summary>
    private static string RemoveExtension(string file)
    {
        var dot = file.LastIndexOf('.');
        return dot > 0 && file[..dot].TrimStart('.').Length > 0 ? file[..dot] : file;
    }
}
