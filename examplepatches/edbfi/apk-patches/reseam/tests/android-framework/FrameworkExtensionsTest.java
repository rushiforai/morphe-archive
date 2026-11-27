// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.tests.reseam;

import android.net.Uri;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.TypefaceSpan;
import android.text.style.URLSpan;

import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public final class FrameworkExtensionsTest {
    public static void main(String[] args) throws ReflectiveOperationException {
        markdownLinks();
        mediaLinks();
        commentRequest();
        System.out.println("All three Android framework checks passed.");
    }

    private static void markdownLinks() throws ReflectiveOperationException {
        Method linkify = method("rifisfun.reading.MarkdownLinks", "linkify", Spannable.class);
        String escaped = "\\[escaped](/u/Escape)";
        String code = "[code](/u/Literal)";
        String original = "[linked](/r/Already)";
        var text = new SpannableStringBuilder(
                "[Alice](/u/Alice) + [thread](r/example/) " + escaped + " " + code + " " + original);
        int codeStart = text.toString().indexOf(code);
        int linkStart = text.toString().indexOf(original);
        text.setSpan(new TypefaceSpan("monospace"), codeStart, codeStart + code.length(),
                Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        var existing = new URLSpan("https://www.reddit.com/r/Already");
        text.setSpan(existing, linkStart, linkStart + original.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        linkify.invoke(null, text);
        String expected = "Alice + thread " + escaped + " " + code + " " + original;
        equal(expected, text.toString());
        equal(3, text.getSpans(0, text.length(), URLSpan.class).length);
        requireSpan(text, "Alice", "https://www.reddit.com/u/Alice");
        requireSpan(text, "thread", "https://www.reddit.com/r/example/");
        equal(expected.indexOf(original), text.getSpanStart(existing));
        linkify.invoke(null, text);
        equal(expected, text.toString());
        equal(3, text.getSpans(0, text.length(), URLSpan.class).length);
        System.out.println("rif MarkdownLinks: relative labels and exact span ranges; escaped, code and existing spans preserved.");
    }

    private static void requireSpan(SpannableStringBuilder text, String label, String target) {
        for (URLSpan span : text.getSpans(0, text.length(), URLSpan.class)) {
            if (span.getURL().equals(target)) {
                int start = text.toString().indexOf(label);
                equal(start, text.getSpanStart(span));
                equal(start + label.length(), text.getSpanEnd(span));
                return;
            }
        }
        throw new AssertionError("Missing span for " + label);
    }

    private static void mediaLinks() throws ReflectiveOperationException {
        Method parse = method("rifisfun.reading.MediaLinks", "parseLink", String.class);
        String prefix = "https://www.reddit.com/media?url=";
        for (String host : List.of("i.redd.it", "preview.redd.it", "external-preview.redd.it")) {
            String target = "https://" + host + "/image.png?width=640&format=png";
            equal(target, parse.invoke(null, prefix + Uri.encode(target)).toString());
        }
        String image = Uri.encode("https://i.redd.it/image.png");
        for (String original : List.of(
                prefix + image + "&url=" + image, prefix + Uri.encode("https://i.redd.it.evil.test/image.png"),
                prefix + Uri.encode("http://i.redd.it/image.png"), prefix + Uri.encode("https://i.redd.it:443/image.png"),
                prefix + Uri.encode("https://user@i.redd.it/image.png"), prefix + Uri.encode("https://i.redd.it/image.png#x"),
                "https://www.reddit.com/media/?" + "url=" + image,
                "https://www.reddit.com.evil.test/media?url=" + image, "https://i.redd.it/image.png")) {
            equal(original, parse.invoke(null, original).toString());
        }
        System.out.println("rif MediaLinks: permitted image hosts unwrap; malformed and out-of-scope wrappers stay intact.");
    }

    private static void commentRequest() throws ReflectiveOperationException {
        Method withQuery = method("syncforreddit.comments.CommentRequest", "withQuery", String.class, Map.class);
        String input = "https://oauth.reddit.com/api/morechildren.json?existing=a%2Bb#thread";
        equal(input, withQuery.invoke(null, input, null));
        equal(input, withQuery.invoke(null, input, Map.of()));
        Map<String, String> params = new LinkedHashMap<>();
        params.put("children", "first,second");
        params.put("sort key", "é +?#&=");
        params.put("existing", "");
        String output = (String) withQuery.invoke(null, input, params);
        Uri uri = Uri.parse(output);
        equal("https://oauth.reddit.com/api/morechildren.json?existing=a%2Bb&children=first%2Csecond"
                + "&sort%20key=%C3%A9%20%2B%3F%23%26%3D&existing=#thread", output);
        equal("first,second", uri.getQueryParameter("children"));
        equal("é +?#&=", uri.getQueryParameter("sort key"));
        equal(List.of("a+b", ""), uri.getQueryParameters("existing"));
        equal("thread", uri.getFragment());
        System.out.println("Sync CommentRequest: null and empty maps are unchanged; query, UTF-8 escaping and fragment verified.");
    }

    private static Method method(String qualifiedName, String name, Class<?>... types)
            throws ReflectiveOperationException {
        return Class.forName("app.edbfi.extension." + qualifiedName).getMethod(name, types);
    }

    private static void equal(Object expected, Object actual) {
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError("Expected " + expected + ", got " + actual);
        }
    }
}
