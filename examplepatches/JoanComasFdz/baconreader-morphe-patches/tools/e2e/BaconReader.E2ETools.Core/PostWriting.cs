// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// The post of a PR's recorded scenarios. Its heading counts the scenarios and the failed ones, and it starts with what
/// changed; each scenario shows once, as a closed &lt;details&gt; whose summary is its bold title after ✅ or ❌ (so the
/// owner opens only the ones to look at), holding its Gherkin, the patches its app was patched with, then a "📱 Phone"
/// subtitle (the app's scenarios; "🖥️ Desktop" for the VS Code extension's) with that screen's GIF and, below it, "▶ Play MP4": both link to the site's player page, since GitHub shows
/// no player for a video it didn't store itself (a tap on a bare GIF would only download it).
/// </summary>
public static class PostWriting
{
    private static readonly ImmutableArray<(string Screen, string Label)> Screens = [("phone", "📱 Phone"), ("desktop", "🖥️ Desktop")];

    /// <summary>
    /// The post. The scenarios the PR added or changed come first, then those only re-recorded because a fixture file they
    /// use changed, each naming its changed fixtures, under ### headings. With only the first kind there are no section
    /// headings.
    /// </summary>
    public static string WritePost(string repo, int version, ImmutableArray<PlannedRun> runs, string changed)
    {
        var groups = GroupByScenario(runs);
        var own = groups.Where(group => !IsRerecorded(group[0])).ToImmutableArray();
        var rerecorded = groups.Where(group => IsRerecorded(group[0])).ToImmutableArray();
        IEnumerable<string> lines = [WriteHeading(version, groups), "", "**What changed**", "", changed, ""];
        if (rerecorded.IsEmpty)
        {
            lines = lines.Concat(own.SelectMany(group => WriteScenario(repo, group, "")));
        }
        else
        {
            if (!own.IsEmpty)
            {
                lines = lines.Concat(["### Added or changed by this PR", ""]).Concat(own.SelectMany(group => WriteScenario(repo, group, "")));
            }

            lines = lines
                .Concat(["### Re-recorded: their fixtures changed", "", "Their code didn't change, a fixture file they use did: they should behave as before.", ""])
                .Concat(rerecorded.SelectMany(group => WriteScenario(repo, group, DescribeFixtures(group[0]))));
        }

        return string.Join('\n', lines.Concat(["---", PostVersioning.Footer, ""]));
    }

    /// <summary>
    /// "## ✅ Scenarios (V2) · 12 scenarios" when every scenario passed; "## ❌ Scenarios (V2) · 12 scenarios · 1 failed"
    /// when any failed, so the count and the failures show before a scenario is opened.
    /// </summary>
    private static string WriteHeading(int version, ImmutableArray<ImmutableArray<PlannedRun>> groups)
    {
        var failed = groups.Count(group => !HasPassed(group));
        var heading = $"## {MarkResult(failed == 0)} Scenarios (V{version}) · {PostVersioning.DescribeCount(groups.Length)}";
        return failed == 0 ? heading : $"{heading} · {failed} failed";
    }

    private static bool HasPassed(ImmutableArray<PlannedRun> runs) => runs.All(run => run.Entry.Passed);

    private static string MarkResult(bool passed) => passed ? "✅" : "❌";

    /// <summary>The site's player page: GitHub Pages serves &lt;owner&gt;/&lt;repo&gt; at https://&lt;owner, lowercase&gt;.github.io/&lt;repo&gt;/.</summary>
    public static string FindPlayer(string repo)
    {
        var parts = repo.Split('/', 2);
        return $"https://{parts[0].ToLowerInvariant()}.github.io/{parts[1]}/e2e-player.html";
    }

    /// <summary>The player page on an MP4 of prs-resources: ?v=&lt;its name&gt;.</summary>
    public static string LinkPlayer(string repo, string mp4Asset) => $"{FindPlayer(repo)}?v={mp4Asset}";

    /// <summary>The runs of each scenario (its class and method), in the order the scenarios first appear, in the screens' order.</summary>
    private static ImmutableArray<ImmutableArray<PlannedRun>> GroupByScenario(ImmutableArray<PlannedRun> runs) =>
        [.. runs
            .GroupBy(run => (run.Entry.Class, run.Entry.Method))
            .Select(group => group.OrderBy(run => OrderScreen(run.Entry.Screen)).ToImmutableArray())];

    private static int OrderScreen(Optional<string> screen)
    {
        var at = Screens.Select(known => known.Screen).ToList().IndexOf(screen.UnwrapOr(""));
        return at < 0 ? Screens.Length : at;
    }

    private static bool IsRerecorded(PlannedRun run) => run.Entry.Selection is RunSelection.Fixtures;

    private static string DescribeFixtures(PlannedRun run)
    {
        var paths = run.Entry.Selection is RunSelection.Fixtures fixtures ? fixtures.Paths : [];
        return paths.IsEmpty ? "" : $"_{string.Join(", ", paths.Select(path => $"`{path}`"))} changed._";
    }

    /// <summary>
    /// A closed &lt;details&gt; whose summary is the scenario's title, holding why it is there, its Gherkin, the patches its
    /// app was patched with, then each screen as a #### subtitle with its GIF.
    /// </summary>
    private static IEnumerable<string> WriteScenario(string repo, ImmutableArray<PlannedRun> runs, string why)
    {
        var first = runs[0];
        IEnumerable<string> lines = [$"<details><summary><b>{MarkResult(HasPassed(runs))} {EscapeHtml(first.Entry.Title)}</b></summary>", ""];
        if (why.Length > 0)
        {
            lines = lines.Concat([why, ""]);
        }

        if (first.Entry.Gherkin is Optional<string>.Some gherkin && gherkin.Value.Length > 0)
        {
            lines = lines.Concat(["```gherkin", gherkin.Value, "```", ""]);
        }

        if (!first.Entry.Patches.IsEmpty)
        {
            lines = lines.Concat([$"Patched with: {string.Join(", ", first.Entry.Patches)}", ""]);
        }

        return lines.Concat(runs.SelectMany(run => WriteScreen(repo, first.Entry.Title, run))).Concat(["</details>", ""]);
    }

    private static IEnumerable<string> WriteScreen(string repo, string title, PlannedRun run)
    {
        var screen = DescribeScreen(run.Entry.Screen);
        var heading = $"#### {(run.Entry.Passed ? "" : "❌ ")}{screen}".TrimEnd();
        if (!run.Files.HasGif)
        {
            return [heading, "", "_No recording._", ""];
        }

        var url = $"https://github.com/{repo}/releases/download/{ReleaseNaming.PrsRelease}/{run.GifAsset}";
        var image = $"![{title} · {screen}]({url})";
        if (!run.Files.HasMp4)
        {
            return [heading, "", image, ""];
        }

        var player = LinkPlayer(repo, run.Mp4Asset);
        return [heading, "", $"[{image}]({player})", "", $"[▶ Play MP4]({player})", ""];
    }

    private static string DescribeScreen(Optional<string> screen)
    {
        var name = screen.UnwrapOr("");
        return Screens.Where(entry => entry.Screen == name).Select(entry => entry.Label).DefaultIfEmpty(name).First();
    }

    /// <summary>A title as text inside the summary's HTML: &amp;, &lt; and &gt; escaped, quotes left as they are.</summary>
    private static string EscapeHtml(string text) =>
        text.Replace("&", "&amp;", StringComparison.Ordinal).Replace("<", "&lt;", StringComparison.Ordinal).Replace(">", "&gt;", StringComparison.Ordinal);
}
