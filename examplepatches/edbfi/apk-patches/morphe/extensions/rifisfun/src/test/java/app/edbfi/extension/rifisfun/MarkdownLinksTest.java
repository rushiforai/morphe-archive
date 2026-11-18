// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

public class MarkdownLinksTest {
    private static String fix(String html) {
        return MarkdownLinks.fixLinks(html);
    }

    private static void unchanged(String html) {
        assertSame(html, fix(html));
    }

    @Test
    public void fixesWhatRedditSends() {
        // body_html of a comment in r/pics, Nov 2026, for the markdown "[r/scam](r/scam)[s](r/scam)".
        assertEquals(
                "<div class=\"md\"><p><a href=\"/r/scam\">r/scam</a><a href=\"/r/scam\">s</a></p>\n</div>",
                fix("<div class=\"md\"><p>[<a href=\"/r/scam\">r/scam</a>](<a href=\"/r/scam\">r/scam</a>)"
                        + "[s](<a href=\"/r/scam\">r/scam</a>)</p>\n</div>"));
    }

    @Test
    public void fixesUserSubredditAndWebTargets() {
        assertEquals("<p>ask <a href=\"/u/spez\">the admin</a> now</p>",
                fix("<p>ask [the admin](<a href=\"/u/spez\">u/spez</a>) now</p>"));
        assertEquals("<p><a href=\"/r/android\">sub</a></p>",
                fix("<p>[sub](<a href=\"/r/android\">/r/android</a>)</p>"));
        assertEquals("<p><a href=\"http://www.example.com\">site</a>.</p>",
                fix("<p>[site](<a href=\"http://www.example.com\">www.example.com</a>).</p>"));
    }

    @Test
    public void keepsTheAnchorAsRedditWroteIt() {
        assertEquals("<p><a href=\"/u/a_b\" rel=\"nofollow\">x</a></p>",
                fix("<p>[x](<a href=\"/u/a_b\" rel=\"nofollow\">u/a_b</a>)</p>"));
    }

    @Test
    public void keepsFormattingInTheLabel() {
        assertEquals("<p><a href=\"/r/a\"><strong>bold</strong> and <em>it</em></a></p>",
                fix("<p>[<strong>bold</strong> and <em>it</em>](<a href=\"/r/a\">r/a</a>)</p>"));
        assertEquals("<p><a href=\"/r/a\">run <code>ls [x]</code></a></p>",
                fix("<p>[run <code>ls [x]</code>](<a href=\"/r/a\">r/a</a>)</p>"));
    }

    @Test
    public void balancesBracketsInTheLabel() {
        assertEquals("<p><a href=\"/r/a\">a [b] c</a></p>", fix("<p>[a [b] c](<a href=\"/r/a\">r/a</a>)</p>"));
        // The inner pair alone is the link when the outer one isn't closed.
        assertEquals("<p>[a <a href=\"/r/a\">b</a></p>", fix("<p>[a [b](<a href=\"/r/a\">r/a</a>)</p>"));
    }

    @Test
    public void handlesNeighbouringSuperscriptAndSpoilers() {
        assertEquals("<p><sup><a href=\"/u/x\">tiny</a></sup></p>",
                fix("<p><sup>[tiny](<a href=\"/u/x\">u/x</a>)</sup></p>"));
        assertEquals("<p><span class=\"md-spoiler-text\">see <a href=\"/r/a\">this</a></span></p>",
                fix("<p><span class=\"md-spoiler-text\">see [this](<a href=\"/r/a\">r/a</a>)</span></p>"));
        // A label that starts in one element and ends in another isn't one.
        unchanged("<p><sup>[tiny</sup>](<a href=\"/u/x\">u/x</a>)</p>");
        unchanged("<p>[a<sup>b](<a href=\"/u/x\">u/x</a>)</sup></p>");
    }

    @Test
    public void fixesSeveralInOneBody() {
        assertEquals("<p><a href=\"/u/a\">a</a> and <a href=\"/u/b\">b</a></p>\n<ul><li><a href=\"/r/c\">c</a></li></ul>",
                fix("<p>[a](<a href=\"/u/a\">u/a</a>) and [b](<a href=\"/u/b\">u/b</a>)</p>\n"
                        + "<ul><li>[c](<a href=\"/r/c\">r/c</a>)</li></ul>"));
    }

    @Test
    public void leavesCodeAlone() {
        unchanged("<p><code>[x](<a href=\"/u/x\">u/x</a>)</code></p>");
        unchanged("<pre><code>[x](<a href=\"/u/x\">u/x</a>)\n</code></pre>");
        // The app turns a block's line breaks into <br> before this runs.
        unchanged("<pre><code>a<br>[x](<a href=\"/u/x\">u/x</a>)</code></pre>");
    }

    @Test
    public void leavesLinkedTextAlone() {
        unchanged("<p><a href=\"https://example.com\">[x](<a href=\"/u/x\">u/x</a>)</a></p>");
        // Links that worked.
        unchanged("<p><a href=\"/r/a\">[x]</a>(<a href=\"/r/a\">r/a</a>)</p>");
        unchanged("<p><a href=\"/u/x\">x</a> [y] (z)</p>");
    }

    @Test
    public void leavesWhatIsntTheLeftoverAlone() {
        // No anchor: Reddit didn't autolink the target, so nothing says where it points.
        unchanged("<p>[x](example.com)</p>");
        unchanged("<p>[x](u/)</p>");
        // Something besides the one anchor between the parentheses.
        unchanged("<p>[x](<a href=\"/u/x\">u/x</a> \"title\")</p>");
        unchanged("<p>[x](see <a href=\"/u/x\">u/x</a>)</p>");
        unchanged("<p>[x](<a href=\"/u/x\">u/x</a>/more)</p>");
        unchanged("<p>[x](<a href=\"/u/x\">u/x</a><a href=\"/u/y\">u/y</a>)</p>");
        unchanged("<p>[x](<a href=\"/u/x\"><em>u/x</em></a>)</p>");
        unchanged("<p>[x](<a href=\"/u/x\"></a>)</p>");
        unchanged("<p>[x](<a name=\"x\">u/x</a>)</p>");
        unchanged("<p>[x] (<a href=\"/u/x\">u/x</a>)</p>");
        // No label.
        unchanged("<p>[](<a href=\"/u/x\">u/x</a>)</p>");
        unchanged("<p>[ ](<a href=\"/u/x\">u/x</a>)</p>");
        // A label across paragraphs or lines of a list.
        unchanged("<p>[a</p>\n<p>b](<a href=\"/u/x\">u/x</a>)</p>");
        unchanged("<p>[a<br/>\nb](<a href=\"/u/x\">u/x</a>)</p>");
    }

    @Test
    public void keepsEscapedTextAsItIs() {
        assertEquals("<p><a href=\"/r/a\">&lt;b&gt; &amp; &quot;c&quot;</a></p>",
                fix("<p>[&lt;b&gt; &amp; &quot;c&quot;](<a href=\"/r/a\">r/a</a>)</p>"));
        // A ">" in an attribute doesn't end the tag.
        assertEquals("<p><a href=\"/r/a\"><span title=\"a>b\">x</span></a></p>",
                fix("<p>[<span title=\"a>b\">x</span>](<a href=\"/r/a\">r/a</a>)</p>"));
    }

    @Test
    public void survivesBrokenHtml() {
        unchanged("<p>[x](<a href=\"/u/x\">u/x");
        unchanged("<p>[x](<a href=\"/u/x");
        unchanged("[x](");
        unchanged("](");
        unchanged("<p>[x]( <");
        unchanged("[[[[[[[[[[[](");
    }

    @Test
    public void staysOffUntilThePatchTurnsItOn() {
        String html = "<p>[x](<a href=\"/u/x\">u/x</a>)</p>";
        assertSame(html, MarkdownLinks.fix(html));
        assertNull(MarkdownLinks.fix(null));
    }
}
