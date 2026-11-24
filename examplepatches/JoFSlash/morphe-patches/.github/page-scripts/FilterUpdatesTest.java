package app.jofslash.extension.quora;

/** Checks which selectors Filter updates accepts. Run by run.sh. */
public final class FilterUpdatesTest {

    private static int failures;

    private static void check(String selector, boolean expected) {
        if (FilterUpdates.valid(selector) != expected) {
            failures++;
            System.err.println("FAIL FilterUpdates: " + selector + " should be " + (expected ? "accepted" : "refused"));
        }
    }

    public static void main(String[] args) {
        // Like the built-in ones.
        check("[class*=\"dom_annotate_multifeed_bundle_AdBundle\"]", true);
        check(".qu-mt--small:has(> [class*=\"dom_annotate_related_questions\"])", true);
        check("[class^='q-box dom_annotate_question_answer_item_'] .qu-borderTop", true);
        check(".a + .b ~ .c, #id:not(.x)", true);
        check("img[src*=\"poe.multibot\"]", true);
        // Anything that could do more than hide.
        check(".a{display:block}", false);
        check(".a;}body{background:red", false);
        check("@import 'x'", false);
        check(".a[style*=\"url(https://example.com)\"]", false);
        check(".a /* comment */", false);
        check(".a\\{", false);
        check("<style>", false);
        check(".café", false);
        check("", false);
        check("   ", false);
        check(null, false);
        check(".a" + " .b".repeat(150), false);
        // Too wide: they would hide the whole page or every element of a kind.
        check("*", false);
        check("div", false);
        check("body", false);
        check(".feed > *", false);
        check(".feed div", false);
        check("div:has(.ad)", false);
        check(".a, div", false);
        check(".a,", false);
        check("[class*=\"ad\"", false);
        check(".a:not(.b", false);
        check("[title=\"a]\"", false);
        // Narrow enough.
        check(".feed > [class*=ad]", true);
        check("div.ad", true);
        check("#ad", true);
        check("[data-x=\"a,b > c\"]", true);
        check("a[href*=\"poe.com\"]:not(.x)", true);
        if (failures > 0) System.exit(1);
        System.out.println("FilterUpdates: ok");
    }
}
