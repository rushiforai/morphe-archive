import java.util.Arrays;
import java.util.Collections;
import java.util.Objects;
import app.afterglow.extension.menus.LongPressTextPolicy;

public final class LongPressTextPolicyTest {
    private static int checks;
    private static final String TITLE_ID = "video_metadata.eml|watch";
    private static final String TITLE_PATH = "video_metadata.eml|video_metadata_inner.eml|ContainerType|TextType|";
    private static final String DESCRIPTION_ID = "description_rich_text_list.eml|body";
    private static void check(String name, Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError(name + ": " + actual);
    }
    private static LongPressTextPolicy.Match match(LongPressTextPolicy policy, String text) {
        return policy.match(Collections.singletonList(text));
    }
    public static void main(String[] args) {
        check("watch title path", true, LongPressTextPolicy.isTitle(TITLE_ID, TITLE_PATH));
        check("exclude subtitle", false, LongPressTextPolicy.isTitle(TITLE_ID,
                TITLE_PATH.replace("ContainerType", "video_subtitle.eml|ContainerType")));
        check("exclude non-text node", false, LongPressTextPolicy.isTitle(TITLE_ID, "video_metadata_inner.eml|ContainerType|"));
        check("exclude Home title", false, LongPressTextPolicy.isTitle("video_lockup.eml", TITLE_PATH));
        check("exclude null context", false, LongPressTextPolicy.isTitle(null, null));
        check("watch description", true, LongPressTextPolicy.isDescription(DESCRIPTION_ID));
        check("Shorts description", true, LongPressTextPolicy.isDescription("cell_description_body.eml|short"));
        for (String id : new String[] {null, "", "comment.eml", "post.eml", "video_description_label.eml"}) {
            check("exclude unrelated " + id, false, LongPressTextPolicy.isDescription(id));
        }
        LongPressTextPolicy policy = new LongPressTextPolicy();
        check("empty input", null, policy.match(null));
        check("empty items", null, policy.match(Arrays.asList(null, " ", "")));
        String title = "Python tutorial with a sufficiently long title";
        policy.observe(TITLE_ID, TITLE_PATH, title + "\u2060\u2064");
        check("title markers stripped", title, match(policy, title).text);
        check("title copies directly", false, match(policy, title).selectable);
        check("collapsed title returns complete title", title, match(policy, title.substring(0, 25) + "…").text);
        check("fade-only title is not identity", null, match(policy, title.substring(0, 25)));
        check("changed title with a long shared introduction is rejected", null,
                match(policy, "Python tutorial with a sufficiently long replacement"));
        check("short prefix not trusted", null, match(policy, "Python…"));
        check("unrelated text rejected", null, match(policy, "Something entirely unrelated"));
        policy.observe(TITLE_ID, TITLE_PATH.replace("ContainerType", "video_subtitle.eml"), "Channel name");
        check("subtitle does not replace title", title, match(policy, title).text);

        String description = "A complete native description\n\nWith second line\u00a0and link https://example.com";
        policy.observe(DESCRIPTION_ID, "unused", description);
        check("preserves description line breaks", description,
                match(policy, "A complete native description With second line and link https://example.com").text);
        check("description offers selection", true, match(policy, description).selectable);
        check("collapsed description resolves complete observed text", description,
                match(policy, "A complete native description… Read more").text);
        check("ASCII ellipsis with separated label", description,
                match(policy, "A complete native description... See more").text);
        check("ellipsis supports localized label", description,
                match(policy, "A complete native description… Mehr anzeigen").text);
        check("whitespace before ellipsis", description,
                match(policy, "A complete native description … Read more").text);
        check("ellipsis label must be separated", null,
                match(policy, "A complete native description…different"));
        check("long ellipsis suffix is rejected", null,
                match(policy, "A complete native description… a long different sentence instead of a native short label"));
        check("different continuation before an ellipsis is rejected", null,
                match(policy, "A complete native description replaced… Read more"));
        check("format normalization", "A B C", LongPressTextPolicy.normalize("\u2060A\n B\u00a0C\u200e  "));
        String unicode = "这是视频说明\nمرحبا بالعالم\n🎬 Música";
        policy.observe(DESCRIPTION_ID, null, unicode);
        check("multilingual description", unicode, match(policy, unicode).text);
        policy.observe("post.eml", TITLE_PATH, "Not a supported post operation");
        check("post remains unavailable", null, match(policy, "Not a supported post operation"));
        policy.observe("comment.eml", TITLE_PATH, "Not a supported comment operation");
        check("comment remains unavailable", null, match(policy, "Not a supported comment operation"));

        LongPressTextPolicy ambiguous = new LongPressTextPolicy();
        String common = "This long identical introductory paragraph belongs to ";
        ambiguous.observe(DESCRIPTION_ID, null, common + "video A");
        check("uncached new description never copies old common-prefix description", null,
                match(ambiguous, common + "video B"));
        check("unmarked shorter description never expands to cached text", null,
                match(ambiguous, common));
        ambiguous.observe(DESCRIPTION_ID, null, common + "video B");
        check("ambiguous collapsed sources fail closed", null, match(ambiguous, common.substring(0, 30) + "…"));
        check("exact text still wins", common + "video B", match(ambiguous, common + "video B").text);
        check("old exact text still identifies its own source", common + "video A",
                match(ambiguous, common + "video A").text);
        ambiguous.observe(DESCRIPTION_ID, null, common + "… literal punctuation and video A");
        check("shared literal ellipsis is not a truncation boundary", null,
                match(ambiguous, common + "… literal punctuation and video B"));

        LongPressTextPolicy bounded = new LongPressTextPolicy();
        for (int i = 0; i <= 300; i++) bounded.observe(DESCRIPTION_ID, null, "Text " + i);
        check("bounded cache evicts oldest", null, match(bounded, "Text 0"));
        check("bounded cache retains newest", "Text 300", match(bounded, "Text 300").text);
        // A drawn host may contain several content objects; null/blank items must not block its text.
        check("mixed host content", "Text 299", bounded.match(Arrays.asList(null, "", "Text 299")).text);
        System.out.println(checks + " temporary native text-copy policy checks passed");
    }
}
