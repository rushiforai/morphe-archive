// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using BaconReader.FakeReddit.World;

namespace BaconReader.FakeReddit.Json;

/// <summary>
/// Turns Markdown into the HTML Reddit sends in <c>body_html</c> and <c>selftext_html</c>, only as far as the scenarios
/// use it: paragraphs, quotes, lists, headings, code, tables, links (also bare URLs and r/ u/ names), bold, italics,
/// strikethrough, inline code, spoilers (<c>&gt;!…!&lt;</c>), and GIFs uploaded in comments (<c>![gif](id)</c>).
/// Reddit sends that HTML entity-escaped (<c>&amp;lt;div class="md"&amp;gt;…</c>), and so does <see cref="ToEscapedHtml"/>.
/// </summary>
public static partial class RedditMarkdown
{
    /// <summary>Reddit's <c>body_html</c> for <paramref name="markdown"/>: <c>&lt;div class="md"&gt;…&lt;/div&gt;</c>, entity-escaped.</summary>
    public static string ToEscapedHtml(string markdown, string baseUrl, IReadOnlyDictionary<string, UploadedMedia>? media = null) =>
        Escape($"<div class=\"md\">{ToHtml(markdown, baseUrl, media)}</div>");

    /// <summary>
    /// Reddit's <c>selftext_html</c> for a text post's <paramref name="markdown"/>: the same, inside Reddit's
    /// <c>&lt;!-- SC_OFF --&gt;</c> comments; null for an empty text, as Reddit sends it.
    /// </summary>
    public static string? ToEscapedSelfTextHtml(string? markdown, string baseUrl, IReadOnlyDictionary<string, UploadedMedia>? media = null) =>
        string.IsNullOrEmpty(markdown)
            ? null
            : Escape($"<!-- SC_OFF --><div class=\"md\">{ToHtml(markdown, baseUrl, media)}</div><!-- SC_ON -->");

    /// <summary>
    /// The URL Reddit gives an uploaded image, in the Markdown (on a line of its own, which Reddit's HTML makes a bare
    /// link) and in <c>media_metadata</c>: its preview, at its full width
    /// (<c>preview.redd.it/&lt;id&gt;.png?width=320&amp;format=png&amp;auto=webp&amp;s=…</c>; a JPEG's format is
    /// <c>pjpg</c>), as real comments in Reddit's API show it.
    /// </summary>
    public static string UploadedImageUrl(string baseUrl, UploadedMedia image)
    {
        var extension = image.Path[(image.Path.LastIndexOf('.') + 1)..];
        var format = extension is "jpg" or "jpeg" ? "pjpg" : extension;
        return $"{baseUrl}/_media/{image.Path}?width={image.Width}&format={format}&auto=webp&s=e2e";
    }

    /// <summary>The HTML inside Reddit's <c>&lt;div class="md"&gt;</c>, unescaped.</summary>
    public static string ToHtml(string markdown, string baseUrl, IReadOnlyDictionary<string, UploadedMedia>? media)
    {
        var html = new StringBuilder();
        foreach (var block in Blocks().Split(markdown.Replace("\r\n", "\n").Trim('\n')).Where(block => block.Trim().Length > 0))
        {
            html.Append(ToBlock(block, baseUrl, media)).Append('\n');
        }

        return html.ToString();
    }

    // Reddit escapes &, < and > in its HTML fields, and leaves quotes alone.
    private static string Escape(string html) => html.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;");

    private static string ToBlock(string block, string baseUrl, IReadOnlyDictionary<string, UploadedMedia>? media)
    {
        var lines = block.Split('\n');
        string Inline(string text) => ToInline(text, baseUrl, media);

        if (lines.All(line => line.StartsWith("    ", StringComparison.Ordinal)))
        {
            return $"<pre><code>{WebUtility.HtmlEncode(string.Join('\n', lines.Select(line => line[4..])))}\n</code></pre>";
        }

        if (IsTable(lines))
        {
            return ToTable(lines, Inline);
        }

        // ">!" starts a spoiler, not a quote.
        if (lines.All(line => line.StartsWith('>') && !line.StartsWith(">!", StringComparison.Ordinal)))
        {
            var quoted = string.Join('\n', lines.Select(line => line.TrimStart('>').TrimStart()));
            return $"<blockquote>\n{ToHtml(quoted, baseUrl, media)}</blockquote>";
        }

        if (Heading().Match(block) is { Success: true } heading)
        {
            var level = heading.Groups[1].Length;
            return $"<h{level}>{Inline(heading.Groups[2].Value.Trim())}</h{level}>";
        }

        if (lines.All(line => Bullet().IsMatch(line)))
        {
            return "<ul>\n" + string.Concat(lines.Select(line => $"<li>{Inline(Bullet().Replace(line, ""))}</li>\n")) + "</ul>";
        }

        if (lines.All(line => Numbered().IsMatch(line)))
        {
            return "<ol>\n" + string.Concat(lines.Select(line => $"<li>{Inline(Numbered().Replace(line, ""))}</li>\n")) + "</ol>";
        }

        return $"<p>{Inline(block)}</p>";
    }

    // A table: a header row, then a row of dashes that sets each column's alignment, then its rows, each "| a | b |".
    private static bool IsTable(string[] lines) =>
        lines.Length >= 2 && lines.All(line => line.Contains('|', StringComparison.Ordinal)) && TableDelimiter().IsMatch(lines[1]);

    // As Reddit's HTML has it: <table><thead>, a line per tag, align="left|center|right" on each cell of an aligned
    // column.
    private static string ToTable(string[] lines, Func<string, string> inline)
    {
        var alignments = Cells(lines[1]).Select(cell => (cell.StartsWith(':'), cell.EndsWith(':')) switch
        {
            (true, true) => " align=\"center\"",
            (true, false) => " align=\"left\"",
            (false, true) => " align=\"right\"",
            _ => "",
        }).ToList();
        string Row(string line, string tag)
        {
            var cells = Cells(line);
            var row = new StringBuilder("<tr>\n");
            for (var column = 0; column < alignments.Count; column++)
            {
                var text = column < cells.Count ? inline(cells[column]) : "";
                row.Append($"<{tag}{alignments[column]}>{text}</{tag}>\n");
            }

            return row.Append("</tr>\n").ToString();
        }

        return "<table><thead>\n" + Row(lines[0], "th") + "</thead><tbody>\n"
            + string.Concat(lines.Skip(2).Select(line => Row(line, "td"))) + "</tbody></table>";
    }

    private static List<string> Cells(string line)
    {
        var trimmed = line.Trim();
        trimmed = trimmed.StartsWith('|') ? trimmed[1..] : trimmed;
        trimmed = trimmed.EndsWith('|') ? trimmed[..^1] : trimmed;
        return [.. trimmed.Split('|').Select(cell => cell.Trim())];
    }

    private static string ToInline(string text, string baseUrl, IReadOnlyDictionary<string, UploadedMedia>? media)
    {
        var html = new StringBuilder();
        var at = 0;
        foreach (Match match in InlineToken().Matches(text))
        {
            html.Append(WebUtility.HtmlEncode(text[at..match.Index]));
            html.Append(ToInlineToken(match, baseUrl, media));
            at = match.Index + match.Length;
        }

        html.Append(WebUtility.HtmlEncode(text[at..]));
        return html.ToString();
    }

    private static string ToInlineToken(Match match, string baseUrl, IReadOnlyDictionary<string, UploadedMedia>? media)
    {
        string Inline(string inner) => ToInline(inner, baseUrl, media);
        var groups = match.Groups;
        if (groups["media"].Success)
        {
            if (media is null || !media.TryGetValue(groups["media"].Value, out var found))
            {
                return WebUtility.HtmlEncode(match.Value);
            }

            // An uploaded GIF: the link is the file, around a preview of its size. (An uploaded image is its preview's
            // URL in the Markdown, a bare link.)
            var file = $"{baseUrl}/_media/{found.Path}";
            return $"<a href=\"{file}\" target=\"_blank\"><img src=\"{file}\" width=\"{found.Width}\" height=\"{found.Height}\"></a>";
        }

        if (groups["spoiler"].Success)
        {
            return $"<span class=\"md-spoiler-text\">{Inline(groups["spoiler"].Value)}</span>";
        }

        if (groups["linkText"].Success)
        {
            return $"<a href=\"{WebUtility.HtmlEncode(groups["linkUrl"].Value)}\">{Inline(groups["linkText"].Value)}</a>";
        }

        if (groups["url"].Success)
        {
            var url = WebUtility.HtmlEncode(groups["url"].Value);
            return $"<a href=\"{url}\">{url}</a>";
        }

        if (groups["bold"].Success)
        {
            return $"<strong>{Inline(groups["bold"].Value)}</strong>";
        }

        if (groups["strike"].Success)
        {
            return $"<del>{Inline(groups["strike"].Value)}</del>";
        }

        if (groups["italic"].Success)
        {
            return $"<em>{Inline(groups["italic"].Value)}</em>";
        }

        if (groups["code"].Success)
        {
            return $"<code>{WebUtility.HtmlEncode(groups["code"].Value)}</code>";
        }

        // r/name and u/name, which Reddit links relative to itself.
        var name = groups["name"].Value;
        return $"<a href=\"/{name.TrimStart('/')}\">{name}</a>";
    }

    [GeneratedRegex(@"\n[ \t]*\n+")]
    private static partial Regex Blocks();

    [GeneratedRegex(@"^\|?\s*:?-+:?\s*(\|\s*:?-+:?\s*)*\|?\s*$")]
    private static partial Regex TableDelimiter();

    [GeneratedRegex(@"^(#{1,6})\s+(.*)$", RegexOptions.Singleline)]
    private static partial Regex Heading();

    [GeneratedRegex(@"^[*+-]\s+")]
    private static partial Regex Bullet();

    [GeneratedRegex(@"^\d+\.\s+")]
    private static partial Regex Numbered();

    [GeneratedRegex(
        @"!\[gif\]\((?<media>[^)|\s]+)\)"
        + @"|>!(?<spoiler>.+?)!<"
        + @"|\[(?<linkText>[^\]]+)\]\((?<linkUrl>[^)\s]+)\)"
        + @"|(?<![\w/])(?<url>https?://[^\s<>()]+)"
        + @"|\*\*(?<bold>.+?)\*\*"
        + @"|~~(?<strike>.+?)~~"
        + @"|(?<![\w*])\*(?<italic>[^*\s][^*]*?)\*"
        + @"|`(?<code>[^`]+)`"
        + @"|(?<![\w/])(?<name>/?[ru]/[A-Za-z0-9_]+)")]
    private static partial Regex InlineToken();
}
