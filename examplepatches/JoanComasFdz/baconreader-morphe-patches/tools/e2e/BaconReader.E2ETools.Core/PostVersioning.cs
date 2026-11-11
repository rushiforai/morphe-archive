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
/// 12 scenarios · replaced by V2") and hidden as Outdated. "replaced by" when later posts recorded all its runs again,
/// "partly replaced by" when some, "followed by" when none (a run of other scenarios: a batch). When the PR closes, each
/// post whose runs were all recorded again later shrinks to that line plus "· recordings deleted when the PR closed",
/// since prs-resources keeps only each run's newest recording (ReleaseCleaning); the others keep theirs, and stay
/// (docs/hosting.md, "E2E videos on pull requests").
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

    /// <summary>A run's GIF in a post: …/releases/download/&lt;release&gt;/pr-&lt;n&gt;-v&lt;k&gt;-&lt;run&gt;.gif).</summary>
    [GeneratedRegex(@"/releases/download/[^/\s)]+/pr-[0-9]+-v[0-9]+-([^/\s)]+)\.gif\)")]
    private static partial Regex CreateRecordingPattern();

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

    public static string DescribeVersion(int version, int count, int next, Replacement replacement) =>
        $"Scenarios (V{version}) · {DescribeCount(count)} · " + replacement switch
        {
            Replacement.All => $"replaced by V{next}",
            Replacement.Some => $"partly replaced by V{next}",
            _ => $"followed by V{next}",
        };

    /// <summary>
    /// The runs a post shows recordings of: each GIF's name without its PR and version (<c>pr-&lt;n&gt;-v&lt;k&gt;-&lt;run&gt;.gif</c>),
    /// the same in every version.
    /// </summary>
    public static ImmutableHashSet<string> ReadRuns(string body) =>
        [.. CreateRecordingPattern().Matches(body).Select(found => found.Groups[1].Value)];

    /// <summary>
    /// (comment, new body) for each earlier post still open: a closed &lt;details&gt; holding it as it was. The newest post
    /// isn't among <paramref name="comments"/> yet: <paramref name="newestRuns"/> are the runs it records.
    /// </summary>
    public static ImmutableArray<CommentEdit> PlanCollapses(ImmutableArray<PrComment> comments, int newest, ImmutableHashSet<string> newestRuns)
    {
        var versions = ReadVersions(comments).Append(newest).ToImmutableArray();
        return [.. comments
            .Select(comment => (Comment: comment, Version: ReadVersion(comment)))
            .Where(post => post.Version is Optional<int>.Some some && some.Value < newest && !IsCollapsed(post.Comment) && !IsShrunk(post.Comment))
            .Select(post =>
            {
                var version = ((Optional<int>.Some)post.Version).Value;
                return CollapsePost(post.Comment, version, versions, FindReplacement(post.Comment.Body, ReadLaterRuns(comments, version).Union(newestRuns)));
            })];
    }

    /// <summary>Each earlier post, open or collapsed, not hidden yet (its node id not in <paramref name="hidden"/>) and not shrunk: to hide as Outdated.</summary>
    public static ImmutableArray<PrComment> PlanHides(ImmutableArray<PrComment> comments, int newest, IReadOnlySet<string> hidden) =>
        [.. comments.Where(comment =>
            ReadVersion(comment) is Optional<int>.Some version && version.Value < newest && !IsShrunk(comment) && !hidden.Contains(comment.NodeId))];

    /// <summary>
    /// (comment, new body) for each post not shrunk yet, open or collapsed, whose runs later posts all recorded again: its
    /// one line, with the footer kept out of sight so the post still reads as the workflow's (PickWorkflowComments). The
    /// others keep their recordings (ReleaseCleaning), and so their posts.
    /// </summary>
    public static ImmutableArray<CommentEdit> PlanShrinks(ImmutableArray<PrComment> comments)
    {
        var versions = ReadVersions(comments).ToImmutableArray();
        return [.. comments
            .Select(comment => (Comment: comment, Version: ReadVersion(comment)))
            .Where(post => post.Version is Optional<int>.Some some && !IsShrunk(post.Comment)
                && versions.Any(later => later > some.Value)
                && FindReplacement(post.Comment.Body, ReadLaterRuns(comments, some.Value)) == Replacement.All)
            .Select(post => ShrinkPost(post.Comment, ((Optional<int>.Some)post.Version).Value, versions))];
    }

    // How much of a post's runs the later posts recorded again: all (none to record is all), some or none.
    private static Replacement FindReplacement(string body, ImmutableHashSet<string> later)
    {
        var own = ReadRuns(body);
        var again = own.Count(later.Contains);
        return again == own.Count ? Replacement.All : again == 0 ? Replacement.None : Replacement.Some;
    }

    private static ImmutableHashSet<string> ReadLaterRuns(ImmutableArray<PrComment> comments, int version) =>
        [.. comments.Where(comment => ReadVersion(comment) is Optional<int>.Some later && later.Value > version).SelectMany(comment => ReadRuns(comment.Body))];

    private static CommentEdit CollapsePost(PrComment comment, int version, ImmutableArray<int> versions, Replacement replacement)
    {
        var summary = DescribeVersion(version, CountScenarios(comment.Body), FindNextVersion(version, versions), replacement);
        var bold = ReplaceFirst(summary, $"Scenarios (V{version})", $"<b>Scenarios (V{version})</b>");
        return new CommentEdit(comment, $"{Collapsed}<summary>{bold}</summary>\n\n{comment.Body.TrimEnd()}\n\n</details>\n");
    }

    private static CommentEdit ShrinkPost(PrComment comment, int version, ImmutableArray<int> versions)
    {
        var line = ReplaceFirst(DescribeVersion(version, CountScenarios(comment.Body), FindNextVersion(version, versions), Replacement.All), $"Scenarios (V{version})", $"**Scenarios (V{version})**")
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

/// <summary>How much of an earlier post's runs later posts recorded again.</summary>
public enum Replacement
{
    All,
    Some,
    None,
}
