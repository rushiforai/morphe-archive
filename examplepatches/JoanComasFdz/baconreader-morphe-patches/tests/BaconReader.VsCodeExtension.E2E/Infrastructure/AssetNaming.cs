// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Security.Cryptography;
using System.Text;

namespace BaconReader.VsCodeExtension.E2E.Infrastructure;

/// <summary>
/// The name the "E2E videos" workflow gives a run's GIF or MP4 in its release (tools/e2e's
/// ReleaseNaming.NameAsset): pr-&lt;n&gt;-v&lt;version&gt;-&lt;GIF name&gt;, or, past 200 characters, its start and "-&lt;8 hex&gt;", the start
/// of the SHA-256 of the GIF's path (&lt;domain folder&gt;/&lt;GIF name&gt;.gif). The fake release names its assets with it,
/// so a scenario checks that the extension names them the same way.
/// </summary>
public static class AssetNaming
{
    private const int MaxName = 200;

    /// <summary>The asset's name; <paramref name="extension"/> is ".gif" or ".mp4".</summary>
    public static string NameAsset(int pr, int version, string domain, string gifName, string extension)
    {
        var stem = $"pr-{pr}-v{version}-{gifName}";
        if (stem.Length + extension.Length <= MaxName)
        {
            return stem + extension;
        }

        var digest = Convert.ToHexStringLower(SHA256.HashData(Encoding.UTF8.GetBytes($"{domain}/{gifName}.gif")))[..8];
        var keep = MaxName - $"-{digest}{extension}".Length;
        return $"{stem[..keep].TrimEnd('-')}-{digest}{extension}";
    }
}
