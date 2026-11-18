package app.revanced.extension.rif;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** JVM tests for {@link BrokenLinks#find}, the matcher; the span editing needs Android. */
public class BrokenLinksTest {

    private static final List<int[]> NONE = Collections.emptyList();

    private static List<int[]> ranges(int... startEnd) {
        List<int[]> r = new ArrayList<>();
        for (int i = 0; i < startEnd.length; i += 2) r.add(new int[]{startEnd[i], startEnd[i + 1]});
        return r;
    }

    /** Range of the n-th occurrence of {@code s} in {@code text}, as {start, end}. */
    private static int[] at(String text, String s, int n) {
        int from = -1;
        for (int i = 0; i <= n; i++) from = text.indexOf(s, from + 1);
        return new int[]{from, from + s.length()};
    }

    @Test
    public void realCommentFromReddit() {
        // body_html gave: "[" + link(u/spez) + "_ab](" + link(u/spez_ab) + ")"
        String t = "Sorry [u/spez_ab](u/spez_ab), I know it was a joke";
        int[] a = at(t, "u/spez", 0);
        int[] b = at(t, "u/spez_ab", 1);
        List<BrokenLinks.Fix> f = BrokenLinks.find(t, ranges(a[0], a[1], b[0], b[1]), NONE);
        assertEquals(1, f.size());
        assertEquals(6, f.get(0).start);
        assertEquals(t.indexOf(']'), f.get(0).labelEnd);
        assertEquals(t.indexOf(')') + 1, f.get(0).end);
        assertEquals("/u/spez_ab", f.get(0).href);
    }

    @Test
    public void anyLabelText() {
        String t = "hi [my friend](u/some-name) there";
        int[] u = at(t, "u/some-name", 0);
        List<BrokenLinks.Fix> f = BrokenLinks.find(t, ranges(u[0], u[1]), NONE);
        assertEquals(1, f.size());
        assertEquals("/u/some-name", f.get(0).href);
        assertEquals("my friend", t.substring(f.get(0).start + 1, f.get(0).labelEnd));
    }

    @Test
    public void subredditAndSlashes() {
        String t = "[a](r/AskReddit) [b](/r/Foo/) [c](u/x/)";
        int[] r1 = at(t, "r/AskReddit", 0);
        int[] r2 = at(t, "r/Foo", 0);
        int[] u3 = at(t, "u/x", 0);
        List<BrokenLinks.Fix> f = BrokenLinks.find(t, ranges(r1[0], r1[1], r2[0], r2[1], u3[0], u3[1]), NONE);
        assertEquals(3, f.size());
        assertEquals("/r/AskReddit", f.get(0).href);
        assertEquals("/r/Foo", f.get(1).href);
        assertEquals("/u/x", f.get(2).href);
    }

    @Test
    public void notAutolinkedIsLeftAlone() {
        // Code span: Reddit autolinks nothing there.
        String t = "[u/x](u/x)";
        assertTrue(BrokenLinks.find(t, NONE, NONE).isEmpty());
    }

    @Test
    public void monospaceIsLeftAlone() {
        String t = "[u/x](u/x)";
        assertTrue(BrokenLinks.find(t, ranges(6, 9), ranges(0, t.length())).isEmpty());
    }

    @Test
    public void otherTargetsAreLeftAlone() {
        for (String t : new String[]{
                "[x](example.com)", "[x](https://example.com/u/foo)", "[x](/user/foo)",
                "[x](u/foo/bar)", "[x](u/)", "[](u/foo)", "[a]b](u/foo)", "[x] (u/foo)"}) {
            int i = t.indexOf("u/");
            List<int[]> urls = i < 0 ? NONE : ranges(i, Math.min(t.length(), i + 5));
            assertTrue(t, BrokenLinks.find(t, urls, NONE).isEmpty());
        }
    }

    @Test
    public void labelWithNewlineOrBracketsIsLeftAlone() {
        String t = "[a\nb](u/foo) [a[b](u/foo)";
        List<int[]> urls = ranges(at(t, "u/foo", 0)[0], at(t, "u/foo", 0)[1],
                at(t, "u/foo", 1)[0], at(t, "u/foo", 1)[1]);
        // "[a[b](u/foo)" holds a valid "[b](u/foo)" after the stray '[': that one is fixed.
        List<BrokenLinks.Fix> f = BrokenLinks.find(t, urls, NONE);
        assertEquals(1, f.size());
        assertEquals(t.lastIndexOf("[b]"), f.get(0).start);
    }

    @Test
    public void autolinkOutsideTheMatchDoesNotCount() {
        String t = "see u/foo[a](u/foo)";
        // One link running from "u/foo" over "[a](u/foo)" would not be a plain autolink.
        assertTrue(BrokenLinks.find(t, ranges(4, t.length()), NONE).isEmpty());
    }

    @Test
    public void severalInOneBody() {
        String t = "[a](u/aa) and [b](u/bb)";
        List<BrokenLinks.Fix> f = BrokenLinks.find(t,
                ranges(at(t, "u/aa", 0)[0], at(t, "u/aa", 0)[1], at(t, "u/bb", 0)[0], at(t, "u/bb", 0)[1]), NONE);
        assertEquals(Arrays.asList("/u/aa", "/u/bb"), Arrays.asList(f.get(0).href, f.get(1).href));
    }
}
