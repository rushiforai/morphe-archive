// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Collections.Immutable;
using System.Text.RegularExpressions;

namespace BaconReader.E2ETools.Core;

/// <summary>A comment of the PR, as GitHub gives it: its REST id, its GraphQL node id, its author's login and its body.</summary>
public sealed record PrComment(long Id, string NodeId, string Author, string Body);

/// <summary>A new body for one of the workflow's comments.</summary>
public sealed record CommentEdit(PrComment Comment, string Body);

/// <summary>
/// The workflow's posts on a PR, one per version (<c>## ✅ Scenarios (V&lt;N&gt;)</c>), and what becomes of the earlier ones:
/// once a new post is up, each earlier post still open is collapsed into a closed <c>&lt;details&gt;</c> ("Scenarios (V1) ·
/// 12 scenarios · replaced by V2") and hidden as Outdated; when the PR closes, every post but the newest shrinks to that
/// line plus "· recordings deleted when the PR closed" (docs/hosting.md, "E2E videos on pull requests").
/// </summary>
public static partial class PostVersioning
{
    public const string Footer = "_Recorded by the e2e workflow · Claude Code_";
    public const string Bot = "github-actions[bot]";
    private const string Collapsed = "<details>";
    private const int MaxHiddenReads = 100;

    [GeneratedRegex(@"^## (?:✅ |❌ )?Scenarios \(V([0-9]+)\)(?: · [^\n]*)?[ \t]*$", RegexOptions.Multiline)]
    private static partial Regex CreateHeadingPattern();

    /// <summary>A shrunk post has no heading left: its version is in its one line.</summary>
    [GeneratedRegex(@"\A\*\*Scenarios \(V([0-9]+)\)\*\*")]
    private static partial Regex CreateShrunkPattern();

    /// <summary>
    /// A scenario is a closed &lt;details&gt; whose summary is its bold title; an earlier version's collapse is one too, around
    /// the whole post, told apart by its summary.
    /// </summary>
    [GeneratedRegex(@"^<details><summary><b>(?!Scenarios \(V[0-9]+\)</b>)", RegexOptions.Multiline)]
    private static partial Regex CreateScenarioPattern();

    /// <summary>The workflow's own comments: written by its bot and ending with its footer.</summary>
    public static ImmutableArray<PrComment> PickWorkflowComments(ImmutableArray<PrComment> comments) =>
        [.. comments.Where(comment => comment.Author == Bot && comment.Body.Contains(Footer, StringComparison.Ordinal))];

    /// <summary>
    /// The post's version: its <c>## Scenarios (V&lt;N&gt;)</c> heading, open or collapsed, or its shrunk line; none for
    /// another comment of the workflow.
    /// </summary>
    public static Optional<int> ReadVersion(PrComment comment)
    {
        var heading = CreateHeadingPattern().Match(comment.Body);
        var found = heading.Success ? heading : CreateShrunkPattern().Match(comment.Body);
        return found.Success && int.TryParse(found.Groups[1].Value, out var version) ? Optional.Some(version) : Optional.None<int>();
    }

    public static int FindLastVersion(IEnumerable<PrComment> comments) =>
        ReadVersions(comments).DefaultIfEmpty(0).Max();

    public static bool IsShrunk(PrComment comment) => CreateShrunkPattern().IsMatch(comment.Body);

    public static bool IsCollapsed(PrComment comment) => comment.Body.StartsWith(Collapsed, StringComparison.Ordinal);

    public static int CountScenarios(string body) => CreateScenarioPattern().Count(body);

    public static string DescribeVersion(int version, int count, int replacedBy) =>
        $"Scenarios (V{version}) · {DescribeCount(count)} · replaced by V{replacedBy}";

    /// <summary>(comment, new body) for each earlier post still open: a closed &lt;details&gt; holding it as it was.</summary>
    public static ImmutableArray<CommentEdit> PlanCollapses(ImmutableArray<PrComment> comments, int newest)
    {
        var versions = ReadVersions(comments).Append(newest).ToImmutableArray();
        return [.. comments
            .Select(comment => (Comment: comment, Version: ReadVersion(comment)))
            .Where(post => post.Version is Optional<int>.Some some && some.Value < newest && !IsCollapsed(post.Comment) && !IsShrunk(post.Comment))
            .Select(post => CollapsePost(post.Comment, ((Optional<int>.Some)post.Version).Value, versions))];
    }

    /// <summary>Each earlier post, open or collapsed, not hidden yet (its node id not in <paramref name="hidden"/>) and not shrunk: to hide as Outdated.</summary>
    public static ImmutableArray<PrComment> PlanHides(ImmutableArray<PrComment> comments, int newest, IReadOnlySet<string> hidden) =>
        [.. comments.Where(comment =>
            ReadVersion(comment) is Optional<int>.Some version && version.Value < newest && !IsShrunk(comment) && !hidden.Contains(comment.NodeId))];

    /// <summary>
    /// (comment, new body) for each post but the newest not shrunk yet, open or collapsed: its one line, with the footer
    /// kept out of sight so the post still reads as the workflow's (PickWorkflowComments). The newest keeps its recordings.
    /// </summary>
    public static ImmutableArray<CommentEdit> PlanShrinks(ImmutableArray<PrComment> comments)
    {
        var versions = ReadVersions(comments).ToImmutableArray();
        var newest = versions.DefaultIfEmpty(0).Max();
        return [.. comments
            .Select(comment => (Comment: comment, Version: ReadVersion(comment)))
            .Where(post => post.Version is Optional<int>.Some some && some.Value < newest && !IsShrunk(post.Comment))
            .Select(post => ShrinkPost(post.Comment, ((Optional<int>.Some)post.Version).Value, versions))];
    }

    private static CommentEdit CollapsePost(PrComment comment, int version, ImmutableArray<int> versions)
    {
        var summary = DescribeVersion(version, CountScenarios(comment.Body), FindNextVersion(version, versions));
        var bold = ReplaceFirst(summary, $"Scenarios (V{version})", $"<b>Scenarios (V{version})</b>");
        return new CommentEdit(comment, $"{Collapsed}<summary>{bold}</summary>\n\n{comment.Body.TrimEnd()}\n\n</details>\n");
    }

    private static CommentEdit ShrinkPost(PrComment comment, int version, ImmutableArray<int> versions)
    {
        var line = ReplaceFirst(DescribeVersion(version, CountScenarios(comment.Body), FindNextVersion(version, versions)), $"Scenarios (V{version})", $"**Scenarios (V{version})**")
            + " · recordings deleted when the PR closed";
        return new CommentEdit(comment, $"{line}\n\n<!-- {Footer} -->\n");
    }

    /// <summary>The node ids whose hidden state to read: GraphQL's nodes takes at most 100.</summary>
    public static ImmutableArray<string> PlanHiddenReads(ImmutableArray<PrComment> comments) =>
        [.. comments.Select(comment => comment.NodeId).Take(MaxHiddenReads)];

    /// <summary>A body's first line, which names its version in the log.</summary>
    public static string ReadFirstLine(string body) => body.Split('\n')[0].TrimEnd('\r');

    private static IEnumerable<int> ReadVersions(IEnumerable<PrComment> comments) =>
        comments.Select(ReadVersion).OfType<Optional<int>.Some>().Select(some => some.Value);

    /// <summary>The next version after this one; the one after it when there is none yet (never, for an earlier post).</summary>
    private static int FindNextVersion(int version, ImmutableArray<int> versions) =>
        versions.Where(next => next > version).DefaultIfEmpty(version + 1).Min();

    public static string DescribeCount(int count) => $"{count} scenario{(count == 1 ? "" : "s")}";

    private static string ReplaceFirst(string text, string old, string replacement)
    {
        var at = text.IndexOf(old, StringComparison.Ordinal);
        return at < 0 ? text : string.Concat(text.AsSpan(0, at), replacement, text.AsSpan(at + old.Length));
    }
}
