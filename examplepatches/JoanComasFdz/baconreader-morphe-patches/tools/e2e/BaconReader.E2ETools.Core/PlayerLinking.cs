// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Globalization;
using System.Text;
using System.Text.Json.Nodes;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// What the site's player (site/e2e-player.html) shows next to a run's video, carried in its link's fragment,
/// <c>#s=&lt;data&gt;</c>, since the page can't read a file from the release (GitHub's downloads allow no other site to):
/// the scenario's Gherkin and when each of its lines played, as <c>{"g": "&lt;Gherkin&gt;", "m": [[line, seconds, 1
/// when it failed there], …]}</c>, deflated (raw, the browser's "deflate-raw") by the host, in base64url. Deflated, the
/// longest Gherkin (~20 KB) takes ~4.5 KB of a link: a post holds each link twice and GitHub takes 65,536 characters.
/// </summary>
public static class PlayerLinking
{
    /// <summary>The data to deflate, UTF-8; none for a run without a Gherkin.</summary>
    public static Optional<byte[]> WriteData(ScenarioEntry entry) =>
        entry.Gherkin.Map(gherkin => Encoding.UTF8.GetBytes(new JsonObject
        {
            ["g"] = gherkin,
            ["m"] = new JsonArray([.. entry.Marks.Select(mark => new JsonArray(
                mark.Line,
                JsonValue.Create(Math.Round(mark.Seconds, 2)),
                mark.Failed ? 1 : 0))]),
        }.ToJsonString()));

    /// <summary>The deflated data as the fragment takes it: base64url, without padding.</summary>
    public static string WriteFragment(byte[] deflated) =>
        Convert.ToBase64String(deflated).TrimEnd('=').Replace('+', '-').Replace('/', '_');

    /// <summary>The fragment of a player link: <c>#s=&lt;data&gt;</c>; nothing without data.</summary>
    public static string LinkFragment(string data) =>
        data.Length == 0 ? "" : string.Create(CultureInfo.InvariantCulture, $"#s={data}");
}
