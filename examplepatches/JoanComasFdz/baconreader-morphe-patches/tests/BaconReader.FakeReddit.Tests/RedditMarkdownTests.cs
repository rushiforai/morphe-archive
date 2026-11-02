// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

using BaconReader.FakeReddit.Json;

namespace BaconReader.FakeReddit.Tests;

/// <summary>The Markdown the scenarios write, as the HTML Reddit renders it.</summary>
public sealed class RedditMarkdownTests
{
    private const string Base = "http://127.0.0.1:5080";

    [Theory]
    [InlineData("Hello", "<p>Hello</p>\n")]
    [InlineData("One\n\nTwo", "<p>One</p>\n<p>Two</p>\n")]
    [InlineData("**bold** *italic* ~~gone~~ `code`", "<p><strong>bold</strong> <em>italic</em> <del>gone</del> <code>code</code></p>\n")]
    [InlineData("[text](https://example.com/a?b=1&c=2)", "<p><a href=\"https://example.com/a?b=1&amp;c=2\">text</a></p>\n")]
    [InlineData("See https://example.com/x", "<p>See <a href=\"https://example.com/x\">https://example.com/x</a></p>\n")]
    [InlineData("Ask r/e2e or u/someone", "<p>Ask <a href=\"/r/e2e\">r/e2e</a> or <a href=\"/u/someone\">u/someone</a></p>\n")]
    [InlineData("> quoted", "<blockquote>\n<p>quoted</p>\n</blockquote>\n")]
    [InlineData("* one\n* two", "<ul>\n<li>one</li>\n<li>two</li>\n</ul>\n")]
    [InlineData("1. one\n2. two", "<ol>\n<li>one</li>\n<li>two</li>\n</ol>\n")]
    [InlineData("## Heading", "<h2>Heading</h2>\n")]
    [InlineData("I'm <here> & \"there\"", "<p>I&#39;m &lt;here&gt; &amp; &quot;there&quot;</p>\n")]
    [InlineData(">!plain!<", "<p><span class=\"md-spoiler-text\">plain</span></p>\n")]
    [InlineData("A >!**bold** end!< and `x`", "<p>A <span class=\"md-spoiler-text\"><strong>bold</strong> end</span> and <code>x</code></p>\n")]
    [InlineData(">![a link](https://example.com)!<", "<p><span class=\"md-spoiler-text\"><a href=\"https://example.com\">a link</a></span></p>\n")]
    [InlineData(">!`code`!<", "<p><span class=\"md-spoiler-text\"><code>code</code></span></p>\n")]
    public void Markdown_renders_as_Reddits_html(string markdown, string html) =>
        Assert.Equal(html, RedditMarkdown.ToHtml(markdown, Base, null));

    [Fact]
    public void The_html_field_is_wrapped_in_Reddits_div_and_entity_escaped() =>
        Assert.Equal("&lt;div class=\"md\"&gt;&lt;p&gt;a &amp;amp; b&lt;/p&gt;\n&lt;/div&gt;", RedditMarkdown.ToEscapedHtml("a & b", Base));

    [Fact]
    public void A_text_posts_html_is_null_without_text() => Assert.Null(RedditMarkdown.ToEscapedSelfTextHtml("", Base));

    [Fact]
    public void Media_the_comment_doesnt_hold_stays_as_written() =>
        Assert.Equal("<p>![gif](unknown)</p>\n", RedditMarkdown.ToHtml("![gif](unknown)", Base, null));

    [Fact]
    public void A_table_renders_as_Reddits_table_with_each_columns_alignment() =>
        Assert.Equal(
            "<table><thead>\n<tr>\n<th align=\"left\">Name</th>\n<th align=\"center\">Age</th>\n<th align=\"right\">Score</th>\n<th>Note</th>\n</tr>\n"
            + "</thead><tbody>\n<tr>\n<td align=\"left\"><strong>Ann</strong></td>\n<td align=\"center\">30</td>\n<td align=\"right\">5</td>\n<td></td>\n</tr>\n</tbody></table>\n",
            RedditMarkdown.ToHtml("Name|Age|Score|Note\n:--|:-:|--:|---\n| **Ann** | 30 | 5 |", Base, null));

    [Fact]
    public void A_link_in_a_table_cell_is_a_link() =>
        Assert.Contains("<td><a href=\"https://example.com\">site</a></td>", RedditMarkdown.ToHtml("| A |\n|---|\n| [site](https://example.com) |", Base, null));
}
