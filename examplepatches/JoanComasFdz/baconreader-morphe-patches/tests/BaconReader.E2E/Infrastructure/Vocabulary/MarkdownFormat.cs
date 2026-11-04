// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using Dunet;

namespace BaconReader.E2E.Infrastructure.Vocabulary;

/// <summary>
/// A format of the bar "Markdown editor" puts above a text box, as its button's description names it. A case is added
/// when a test needs it.
/// </summary>
[Union]
public partial record MarkdownFormat
{
    public partial record Bold;
    public partial record Italic;
    public partial record Strikethrough;
    public partial record Superscript;
    public partial record Spoiler;
    public partial record InlineCode;
    public partial record Link;

    /// <summary>Puts "# " before the line the cursor is on.</summary>
    public partial record Heading;
    public partial record BulletedList;
    public partial record NumberedList;
    public partial record Quote;
    public partial record CodeBlock;
    public partial record Table;
    public partial record HorizontalLine;

    /// <summary>What the app shows that no case names yet: a failing assertion names it as the app shows it.</summary>
    public partial record Unlisted(string Shown);
}

/// <summary>What the app shows for each <see cref="MarkdownFormat"/>: the only place those strings live.</summary>
public static class MarkdownFormatShowing
{
    private static readonly MarkdownFormat[] Listed =
    [
        new MarkdownFormat.Bold(), new MarkdownFormat.Italic(), new MarkdownFormat.Strikethrough(), new MarkdownFormat.Superscript(),
        new MarkdownFormat.Spoiler(), new MarkdownFormat.InlineCode(), new MarkdownFormat.Link(), new MarkdownFormat.Heading(),
        new MarkdownFormat.BulletedList(), new MarkdownFormat.NumberedList(), new MarkdownFormat.Quote(), new MarkdownFormat.CodeBlock(),
        new MarkdownFormat.Table(), new MarkdownFormat.HorizontalLine(),
    ];

    /// <summary>What the app shows for <paramref name="value"/>.</summary>
    public static string ToShownText(this MarkdownFormat value) =>
        value.Match(
            bold => "Bold",
            italic => "Italic",
            strikethrough => "Strikethrough",
            superscript => "Superscript",
            spoiler => "Spoiler",
            inlineCode => "Inline code",
            link => "Link",
            heading => "Heading",
            bulletedList => "Bulleted list",
            numberedList => "Numbered list",
            quote => "Quote",
            codeBlock => "Code block",
            table => "Table",
            horizontalLine => "Horizontal line",
            unlisted => unlisted.Shown);

    /// <summary>The case the app's <paramref name="shown"/> description names, or <see cref="MarkdownFormat.Unlisted"/>.</summary>
    public static MarkdownFormat ReadMarkdownFormat(string shown) =>
        Listed.FirstOrDefault(value => value.ToShownText() == shown) ?? new MarkdownFormat.Unlisted(shown);
}
