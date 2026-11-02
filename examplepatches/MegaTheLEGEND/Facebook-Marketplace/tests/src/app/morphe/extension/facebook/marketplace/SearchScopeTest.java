package app.morphe.extension.facebook.marketplace;

import java.util.ArrayList;
import java.util.List;

/** Plain-JVM tests for SearchScope (fake views with the same method names as android.view.*). */
public class SearchScopeTest {
    static int failures;

    static void check(String what, boolean ok) {
        if (!ok) { failures++; System.out.println("FAIL: " + what); } else System.out.println("ok: " + what);
    }

    static class FakeView {
        int visibility, height; String text; FakeGroup parent;
        FakeView(int height, String text) { this.height = height; this.text = text; }
        public int getVisibility() { return visibility; }
        public void setVisibility(int v) { visibility = v; }
        public int getHeight() { return height; }
        public Object getParent() { return parent; }
        public CharSequence getText() { return text; }
        public CharSequence getContentDescription() { return null; }
    }
    static class FakeEditText extends FakeView { FakeEditText() { super(50, ""); } }
    static class FakeGroup extends FakeView {
        List<FakeView> kids = new ArrayList<>();
        FakeGroup(int height) { super(height, null); }
        FakeGroup add(FakeView v) { kids.add(v); v.parent = this; return this; }
        public int getChildCount() { return kids.size(); }
        public Object getChildAt(int i) { return kids.get(i); }
    }

    public static void main(String[] a) throws Exception {
        // flag layer
        check("meta ai marketplace flag forced off",
                !SearchScope.filterBoolByName("marketplace_search:enable_meta_ai_search_entry", true));
        check("false stays false", !SearchScope.filterBoolByName("marketplace_search:enable_meta_ai_search_entry", false));
        check("disable_ style name left alone",
                SearchScope.filterBoolByName("mp_search:disable_meta_ai_search", true));
        check("non-marketplace flag untouched", SearchScope.filterBoolByName("feed:meta_ai_search_bar", true));
        check("unrelated flag untouched", SearchScope.filterBoolByName("marketplace:show_price_drop", true));
        check("null name safe", SearchScope.filterBoolByName(null, true));
        check("spec path with empty table untouched", SearchScope.filterBoolBySpec(0x20123456789L, true));

        // phrase matching
        check("phrase", SearchScope.matchesPhrase("Search in all of Facebook"));
        check("phrase w/ nbsp+case", SearchScope.matchesPhrase("  SEARCH WITH   Meta AI "));
        check("phrase w/ query", SearchScope.matchesPhrase("Search all of Facebook for \"couch\""));
        check("normal text no match", !SearchScope.matchesPhrase("Couch - $40"));
        check("long listing text no match",
                !SearchScope.matchesPhrase("Great couch, ask meta ai about it? no. " + "x".repeat(80)));

        // view layer: a typeahead list with a normal suggestion row and two Facebook-wide rows
        FakeGroup root = new FakeGroup(2000);
        FakeGroup list = new FakeGroup(300);                    // 300 > 2000/6: never hidden as a whole
        FakeGroup suggestion = new FakeGroup(60).add(new FakeView(20, "couch"));
        FakeGroup wideRow = new FakeGroup(60).add(new FakeView(20, "icon")).add(new FakeView(20, "Search in all of Facebook"));
        FakeGroup aiRow = new FakeGroup(60).add(new FakeView(20, "Search with Meta AI"));
        list.add(suggestion).add(wideRow).add(aiRow);
        root.add(new FakeEditText()).add(list);
        int n = SearchScope.hideMatches(root);
        check("two rows hidden", n == 2);
        check("wide row hidden", wideRow.visibility == 8);
        check("ai row hidden", aiRow.visibility == 8);
        check("normal suggestion kept", suggestion.visibility == 0);
        check("list kept", list.visibility == 0);
        check("second scan hides nothing new", SearchScope.hideMatches(root) == 0);

        // a label directly inside a short container that also holds the search input must not hide the input
        FakeGroup bar = new FakeGroup(100);
        bar.add(new FakeEditText()).add(new FakeView(20, "Search with Meta AI"));
        FakeGroup root2 = new FakeGroup(2000).add(bar);
        SearchScope.hideMatches(root2);
        check("input container kept", bar.visibility == 0);

        // launcher gate
        StackTraceElement[] profile = {
                new StackTraceElement("X.hQ5", "A01", null, -1),
                new StackTraceElement("X.hQ5", "A00", null, -1),
                new StackTraceElement("X.P9y", "onClick", null, -1)};
        StackTraceElement[] marketplace = {
                new StackTraceElement("X.hQ5", "A01", null, -1),
                new StackTraceElement("com.facebook.fbreact.marketplace.FBReactSearchInputNativeModule", "focusSearchBox", null, -1),
                new StackTraceElement("java.lang.reflect.Method", "invoke", null, -1)};
        check("profile caller blocked", !SearchScope.isAllowedCaller(profile));
        check("marketplace search box allowed", SearchScope.isAllowedCaller(marketplace));
        check("unknown caller allowed", SearchScope.isAllowedCaller(new StackTraceElement[]{
                new StackTraceElement("X.hQ5", "A01", null, -1), new StackTraceElement("X.Bap", "A00", null, -1)}));
        check("profile fragment frame blocked", !SearchScope.isAllowedCaller(new StackTraceElement[]{
                new StackTraceElement("com.facebook.timeline.fragment.ProfileFragment", "x", null, -1)}));
        check("empty stack allowed", SearchScope.isAllowedCaller(new StackTraceElement[0]));
        check("live call allowed", SearchScope.allowSearchLaunch());
        check("search_all flag no longer touched",
                SearchScope.filterBoolByName("marketplace_search:search_all_categories", true));

        System.out.println(failures == 0 ? "ALL OK" : failures + " FAILED");
        System.exit(failures == 0 ? 0 : 1);
    }
}
