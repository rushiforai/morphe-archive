package app.jofslash.extension.quora;

import java.util.Arrays;
import java.util.List;

/** Checks Hide what you pick and the author lists without a phone. Run by run.sh. */
public final class FeedToolsTest {

    private static int failures;

    private static void check(boolean ok, String what) {
        if (!ok) {
            failures++;
            System.err.println("FAIL FeedTools: " + what);
        }
    }

    public static void main(String[] args) {
        // Picker: only Quora's marked class names become selectors.
        check(".dom_annotate_multifeed_bundle_AdBundle".equals(Picker.selector("dom_annotate_multifeed_bundle_AdBundle")), "marked class");
        check(".puppeteer_test_question_title".equals(Picker.selector("puppeteer_test_question_title")), "puppeteer class");
        check(Picker.selector("q-box") == null, "plain class refused");
        check(Picker.selector("dom_annotate_x{}") == null, "braces refused");
        check(Picker.selector(null) == null, "null refused");
        // The list keeps valid, distinct lines only.
        List<String> list = Picker.parse(".dom_annotate_a\n\n div \n.dom_annotate_a\n[class*=\"x\"]\n*{color:red}");
        check(list.equals(Arrays.asList(".dom_annotate_a", "[class*=\"x\"]")), "parse " + list);
        check(Picker.css(list).equals(".dom_annotate_a{display:none !important;}\n[class*=\"x\"]{display:none !important;}\n"), "css");

        // Author lists: https links only, at most five.
        List<String> urls = AuthorLists.urls("Https://example.com/a.txt\nhttp://example.com/b.txt, https://x.org/c "
                + "javascript:alert(1) https://a.io/1 https://a.io/2 https://a.io/3 https://a.io/4");
        check(urls.equals(Arrays.asList("https://example.com/a.txt", "https://x.org/c", "https://a.io/1", "https://a.io/2",
                "https://a.io/3")), "urls " + urls);
        // Names: lines or commas, # comments, no repeats.
        List<String> names = AuthorLists.names("# spam accounts\nJane Doe\nJohn  Roe, Cats of Quora # a Space\n\nJane Doe\n");
        check(names.equals(Arrays.asList("Jane Doe", "John Roe", "Cats of Quora")), "names " + names);

        if (failures > 0) System.exit(1);
        System.out.println("FeedTools: ok");
    }
}
