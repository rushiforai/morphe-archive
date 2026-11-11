package app.template.extension.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import org.junit.Test;

public class RedditDeletedCommentHelperTest {

    @Test
    public void detectsPlaceholderFromTombstoneWhenBodyIsEmpty() throws Exception {
        FakeComment comment = new FakeComment("", "",
                new FakeTombstone("[deleted]", null));

        assertEquals("[deleted]", bodyText(comment));
    }

    @Test
    public void detectsPlaceholderFromBodyPreview() throws Exception {
        FakeComment comment = new FakeComment("", "[removed]", null);

        assertEquals("[removed]", bodyText(comment));
    }

    @Test
    public void restoresBodyAndNestedTombstone() throws Exception {
        FakeComment comment = new FakeComment("[deleted]", "[deleted]",
                new FakeTombstone("[deleted]", "{\"text\":\"[deleted]\"}"));

        assertTrue(replaceBody(comment, "[deleted]", "restored text"));

        assertEquals("restored text", comment.body);
        assertEquals("restored text", comment.bodyPreview);
        assertEquals("restored text", comment.commentTombstone.markdown);
        assertNull(comment.commentTombstone.richtext);
    }

    @Test
    public void restoresTombstoneOnlyComment() throws Exception {
        FakeComment comment = new FakeComment("", "",
                new FakeTombstone("[deleted]", null));

        assertTrue(replaceBody(comment, "[deleted]", "restored text"));

        assertEquals("restored text", comment.body);
        assertEquals("restored text", comment.bodyPreview);
        assertEquals("restored text", comment.commentTombstone.markdown);
    }

    @Test
    public void restoresTreeCommentFromUndoPayloadWithoutNetwork() {
        FakeComment original = new FakeComment("original text", null, null);
        FakeComment deleted = new FakeComment("[deleted]", null, null, original);
        Map<Object, Object> comments = new LinkedHashMap<>();
        comments.put("t1_abc", deleted);

        Map<?, ?> result = RedditDeletedCommentHelper.undeleteTreeComments(comments);

        assertSame(comments, result);
        assertEquals("[archived] original text", deleted.body);
    }

    private static String bodyText(Object model) throws Exception {
        return (String) method("bodyText", Object.class).invoke(null, model);
    }

    private static boolean replaceBody(Object model, String sentinel, String replacement)
            throws Exception {
        return (Boolean) method("replaceBody", Object.class, String.class, String.class)
                .invoke(null, model, sentinel, replacement);
    }

    private static Method method(String name, Class<?>... parameterTypes) throws Exception {
        Method method = RedditDeletedCommentHelper.class.getDeclaredMethod(name, parameterTypes);
        method.setAccessible(true);
        return method;
    }

    public static final class FakeComment {
        private String body;
        private String bodyPreview;
        private final FakeTombstone commentTombstone;
        private final FakeComment commentToRestore;

        FakeComment(String body, String bodyPreview, FakeTombstone commentTombstone) {
            this(body, bodyPreview, commentTombstone, null);
        }

        FakeComment(
                String body,
                String bodyPreview,
                FakeTombstone commentTombstone,
                FakeComment commentToRestore
        ) {
            this.body = body;
            this.bodyPreview = bodyPreview;
            this.commentTombstone = commentTombstone;
            this.commentToRestore = commentToRestore;
        }

        public String getBody() {
            return body;
        }

        public String getBodyPreview() {
            return bodyPreview;
        }

        public FakeTombstone getCommentTombstone() {
            return commentTombstone;
        }

        public FakeComment getCommentToRestore() {
            return commentToRestore;
        }
    }

    public static final class FakeTombstone {
        private String markdown;
        private String richtext;

        FakeTombstone(String markdown, String richtext) {
            this.markdown = markdown;
            this.richtext = richtext;
        }

        public String getMarkdown() {
            return markdown;
        }

        public String getRichtext() {
            return richtext;
        }
    }
}
