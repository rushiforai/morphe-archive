// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Text.RegularExpressions;

namespace BaconReader.E2ETools.Core;

/// <summary>
/// The post's "What changed": the text a session gave push-gifs.sh <c>--message</c> (<c>what-changed.md</c>) as it is, or
/// else the body of the GIFs' commit message without its trailers, or its subject.
/// </summary>
public static partial class CommitDescribing
{
    [GeneratedRegex(@"\n[ \t]*\n")]
    private static partial Regex CreateParagraphBreakPattern();

    [GeneratedRegex(@"^[A-Za-z][A-Za-z0-9-]*: \S")]
    private static partial Regex CreateTrailerPattern();

    /// <summary>The message's body without its trailers (Co-Authored-By: …), or its subject when there is no body.</summary>
    public static string DescribeCommit(string message)
    {
        var paragraphs = CreateParagraphBreakPattern().Split(message.Trim())
            .Where(paragraph => paragraph.Trim().Length > 0)
            .Select(paragraph => paragraph.Trim('\n'))
            .ToList();
        if (paragraphs.Count == 0)
        {
            return "_No commit message._";
        }

        var body = paragraphs.Skip(1).ToList();
        var trailers = body.Count > 0 && body[^1].Split('\n').All(line => CreateTrailerPattern().IsMatch(line));
        var kept = trailers ? body[..^1] : body;
        return kept.Count > 0 ? string.Join("\n\n", kept) : paragraphs[0];
    }
}
