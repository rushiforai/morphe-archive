package app.template.extension.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;

public class RedditContentFilterHelperTest {

    @Test
    public void dropsAutoModFromAllThreeTreeViews() {
        FakeComment autoMod = new FakeComment("AutoModerator", "t1_auto");
        FakeComment user = new FakeComment("regular_user", "t1_user");
        Map<Object, Object> comments = new LinkedHashMap<>();
        comments.put("t1_auto", autoMod);
        comments.put("t1_user", user);

        Map<Object, Object> treeItems = new LinkedHashMap<>();
        treeItems.put("t1_auto", new FakeTreeItem("t1_auto"));
        treeItems.put("t1_user", new FakeTreeItem("t1_user"));

        List<Object> ids = new ArrayList<>(Arrays.asList("t1_auto", "t1_user"));

        List<?> filteredIds =
                RedditContentFilterHelper.hideAutoModTreeIds(ids, comments, treeItems);
        assertEquals(Arrays.asList("t1_user"), filteredIds);

        Map<?, ?> filteredComments =
                RedditContentFilterHelper.hideAutoModTreeComments(comments);
        assertFalse(filteredComments.containsKey("t1_auto"));
        assertTrue(filteredComments.containsKey("t1_user"));

        Map<?, ?> filteredItems =
                RedditContentFilterHelper.hideAutoModTreeItems(comments, treeItems);
        assertFalse(filteredItems.containsKey("t1_auto"));
        assertTrue(filteredItems.containsKey("t1_user"));
    }

    @Test
    public void leavesNonAutoModTreeUntouched() {
        FakeComment user = new FakeComment("regular_user", "t1_user");
        Map<Object, Object> comments = new LinkedHashMap<>();
        comments.put("t1_user", user);
        Map<Object, Object> treeItems = new LinkedHashMap<>();
        treeItems.put("t1_user", new FakeTreeItem("t1_user"));
        List<Object> ids = new ArrayList<>(Arrays.asList("t1_user"));

        assertSame(ids,
                RedditContentFilterHelper.hideAutoModTreeIds(ids, comments, treeItems));
        assertSame(comments,
                RedditContentFilterHelper.hideAutoModTreeComments(comments));
        assertSame(treeItems,
                RedditContentFilterHelper.hideAutoModTreeItems(comments, treeItems));
    }

    public static final class FakeComment {
        private final String author;
        private final String kindWithId;

        FakeComment(String author, String kindWithId) {
            this.author = author;
            this.kindWithId = kindWithId;
        }

        public String getAuthor() {
            return author;
        }

        public String getKindWithId() {
            return kindWithId;
        }
    }

    public static final class FakeTreeItem {
        public final String a;

        FakeTreeItem(String a) {
            this.a = a;
        }
    }
}
