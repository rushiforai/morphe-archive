// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using BaconReader.E2ETools.Core;

namespace BaconReader.E2ETools.Tests.Support;

/// <summary>The runs, posts, comments and assets the tests are made of.</summary>
internal static class Posts
{
    public const string Repo = "Owner/repo";

    /// <summary>A run of PR 1's V1 on the phone, with its GIF on disk, no MP4 and no patches.</summary>
    public static PlannedRun RunOf(string cls, string method, bool passed = true) =>
        RunOf(cls, method, new RunSelection.Changed(), passed);

    public static PlannedRun RunOf(string cls, string method, RunSelection selection, bool passed = true) =>
        new(
            new ScenarioEntry(
                cls, method, $"{method} title", Optional.Some($"Scenario: {method}"), Optional.Some("phone"),
                $"Account/{method}-phone.gif", Optional.Some($"Account/{method}-phone.mp4"), [], passed, selection),
            new RecordedFiles(HasGif: true, HasMp4: false),
            $"pr-1-v1-{method}-phone.gif",
            $"pr-1-v1-{method}-phone.mp4");

    public static RunSelection Fixtures(params string[] paths) => new RunSelection.Fixtures([.. paths]);

    public static PlannedRun WithMp4(PlannedRun run) => run with { Files = run.Files with { HasMp4 = true } };

    public static string WritePost(params PlannedRun[] runs) => PostWriting.WritePost(Repo, 1, [.. runs], "Text.");

    /// <summary>A workflow post as PostWriting writes it: each title a closed &lt;details&gt;, its screen ####.</summary>
    public static string PostOf(int version, string[] titles, bool sections = false)
    {
        IEnumerable<string> lines = [$"## ✅ Scenarios (V{version}) · {PostVersioning.DescribeCount(titles.Length)}", "", "**What changed**", "", "Text.", ""];
        if (sections)
        {
            lines = lines.Concat(["### Added or changed by this PR", ""]);
        }

        foreach (var title in titles)
        {
            lines = lines.Concat([$"<details><summary><b>✅ {title}</b></summary>", "", "```gherkin", "Scenario: x", "```", "",
                "#### 📱 Phone", "", "![gif](u)", "", "</details>", ""]);
        }

        return string.Join('\n', lines.Concat(["---", PostVersioning.Footer, ""]));
    }

    public static PrComment CommentOf(long id, string body) => new(id, $"IC_{id}", PostVersioning.Bot, body);

    /// <summary>The post as the next version collapses it.</summary>
    public static PrComment CollapsedOf(long id, int version, params string[] titles) =>
        CommentOf(id, PostVersioning.PlanCollapses([CommentOf(id, PostOf(version, titles))], version + 1)[0].Body);

    /// <summary>The post as closing the PR shrinks it, a later version being the newest.</summary>
    public static PrComment ShrunkOf(long id, int version) =>
        CommentOf(id, PostVersioning.PlanShrinks([CommentOf(id, PostOf(version, ["A"])), CommentOf(id + 1, PostOf(version + 1, ["A"]))])[0].Body);

    public static ImmutableArray<ReleaseAsset> AssetsOf(params string[] names) =>
        [.. names.Select((name, at) => new ReleaseAsset(at, name))];

    public static ImmutableArray<string> ReadNames(ImmutableArray<ReleaseAsset> assets) =>
        [.. assets.Select(asset => asset.Name).Order(StringComparer.Ordinal)];

    public static int CountOf(string text, string part)
    {
        var count = 0;
        for (var at = text.IndexOf(part, StringComparison.Ordinal); at >= 0; at = text.IndexOf(part, at + part.Length, StringComparison.Ordinal))
        {
            count++;
        }

        return count;
    }
}
