package app.morphe.extension.syncforreddit.http;

import java.lang.reflect.Method;
import java.util.List;

/**
 * Offline regression checks for the request parsing the two Reddit endpoint patches do.
 *
 * <p>Both read what the app sends before anything is fetched on its behalf: a path, a list of
 * fullnames, and a form body. Each has a rule that is not obvious from the call site and is easy
 * to lose in a refactor, so each is pinned here. No Android runtime or network access is needed;
 * none of the methods below touch okhttp or org.json, which is why compile-only stubs suffice.
 */
public final class RequestParsingTest {
    private static int checks;

    public static void main(String[] args) throws Exception {
        isLookup();
        linkIds();
        formValue();
        idOf();
        named();

        System.out.println("Passed " + checks + " request parsing checks; nothing was fetched.");
    }

    /** Only the two spellings Sync uses, and only those. */
    private static void isLookup() throws Exception {
        Method isLookup = method("http.posts.FixPostLookupPatch", "isLookup", String.class);

        for (String path : new String[]{"/api/info", "/api/info/", "/api/info.json", "/api/info.json/"}) {
            check((Boolean) isLookup.invoke(null, path), "Did not recognise the lookup " + path);
        }
        for (String path : new String[]{
                "", "/", "/api", "/api/", "/api/information", "/api/info.jsonx", "/api/infojson",
                "/api/info//", "/api/info/extra", "/api/morechildren", "/comments/abc.json",
                "/API/INFO", " /api/info"}) {
            check(!(Boolean) isLookup.invoke(null, path), "Took " + path + " for the lookup");
        }
    }

    /**
     * All of them or none: a part answer would leave Sync believing the rest do not exist, and
     * the cap is what keeps one ask from becoming a burst of requests.
     */
    private static void linkIds() throws Exception {
        Method linkIds = method("http.posts.FixPostLookupPatch", "linkIds", String.class);

        check(ids(linkIds, "t3_abc").equals(List.of("abc")), "Lost a single id");
        check(ids(linkIds, "t3_abc,t3_def").equals(List.of("abc", "def")), "Lost one of two ids");
        check(ids(linkIds, " t3_abc , t3_def ").equals(List.of("abc", "def")), "Did not trim ids");
        check(ids(linkIds, "t3_a,t3_b,t3_c,t3_d,t3_e,t3_f,t3_g,t3_h").size() == 8,
                "Refused the largest ask that is allowed");
        // A trailing separator is not an empty name: Java drops the empty strings on the end of
        // a split, so this is one id and is answered as one rather than refused as a bad ask.
        check(ids(linkIds, "t3_abc,").equals(List.of("abc")), "Refused a trailing separator");

        // Anything that is not a post, anywhere in the list, takes the whole ask with it.
        for (String asked : new String[]{
                null, "", "abc", "t1_abc", "t5_abc", "t3_", "t3_abc,t1_def", "t1_abc,t3_def",
                ",", "t3_abc,,t3_def", ",t3_abc",
                "t3_a,t3_b,t3_c,t3_d,t3_e,t3_f,t3_g,t3_h,t3_i"}) {
            check(ids(linkIds, asked).isEmpty(), "Answered part of the ask " + asked);
        }
    }

    /** The key is matched whole, so a longer name that merely ends the same is not mistaken. */
    private static void formValue() throws Exception {
        Method formValue = method("http.comments.FixMoreCommentsPatch", "formValue",
                String.class, String.class);

        check("t3_abc".equals(formValue.invoke(null, "link_id=t3_abc&children=x", "link_id")),
                "Did not read the first field");
        check("x,y".equals(formValue.invoke(null, "link_id=t3_abc&children=x,y", "children")),
                "Did not read a later field");
        check("a b".equals(formValue.invoke(null, "children=a%20b", "children")),
                "Did not decode what was sent");
        check("".equals(formValue.invoke(null, "children=&link_id=t3_abc", "children")),
                "Did not read an empty field as empty");
        check(formValue.invoke(null, "xlink_id=t3_abc", "link_id") == null,
                "Read a field whose name only ends the same");
        check(formValue.invoke(null, "link_idx=t3_abc", "link_id") == null,
                "Read a field whose name only starts the same");
        check(formValue.invoke(null, "", "link_id") == null, "Invented a field from nothing");
        check(formValue.invoke(null, "link_id", "link_id") == null, "Read a field with no value");
    }

    /** A thread is named without its kind. */
    private static void idOf() throws Exception {
        Method idOf = method("http.comments.FixMoreCommentsPatch", "idOf", String.class);

        check("abc".equals(idOf.invoke(null, "t3_abc")), "Did not drop the kind");
        check("abc".equals(idOf.invoke(null, "abc")), "Did not keep a bare id");
        check("b_c".equals(idOf.invoke(null, "t3_b_c")), "Dropped more than the first kind");
        check(idOf.invoke(null, (Object) null) == null, "Invented an id from nothing");
        check(idOf.invoke(null, "") == null, "Invented an id from an empty name");
        check(idOf.invoke(null, "t3_") == null, "Invented an id from a kind alone");
    }

    /** What was asked for, with the empties dropped rather than carried as blanks. */
    private static void named() throws Exception {
        Method named = method("http.comments.FixMoreCommentsPatch", "named", String.class);

        check(ids(named, "a,b,c").equals(List.of("a", "b", "c")), "Lost one of the names");
        check(ids(named, " a , b ").equals(List.of("a", "b")), "Did not trim the names");
        check(ids(named, "a,,b").equals(List.of("a", "b")), "Kept an empty name");
        check(ids(named, "a").equals(List.of("a")), "Lost a single name");
        check(ids(named, null).isEmpty(), "Invented names from nothing");
        check(ids(named, "").isEmpty(), "Invented names from an empty list");
        check(ids(named, ",,,").isEmpty(), "Invented names from separators alone");
    }

    @SuppressWarnings("unchecked")
    private static List<String> ids(Method method, String asked) throws Exception {
        return (List<String>) method.invoke(null, asked);
    }

    private static Method method(String name, String called, Class<?>... parameters)
            throws Exception {
        Method method = Class.forName("app.morphe.extension.syncforreddit." + name)
                .getDeclaredMethod(called, parameters);
        method.setAccessible(true);
        return method;
    }

    private static void check(boolean passed, String failure) {
        if (!passed) {
            throw new AssertionError(failure);
        }
        checks++;
    }
}
