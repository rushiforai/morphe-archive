package nl.johninnl.eclipse.auto.tree;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class PagingTest {
    private static List<Node> nodes(int count) {
        List<Node> nodes = new ArrayList<>();
        for (int i = 0; i < count; i++) nodes.add(Node.folder("n" + i, Node.TYPE_FOLDER, "Node " + i, null, null));
        return nodes;
    }

    private static List<String> ids(List<Node> nodes) {
        List<String> ids = new ArrayList<>();
        for (Node node : nodes) ids.add(node.id);
        return ids;
    }

    @Test public void aListThatFitsIsUntouchedAndAnUnlimitedPageNeverCuts() {
        assertEquals(ids(nodes(5)), ids(Paging.cut(nodes(5), "p", 0, 5)));
        assertEquals(ids(nodes(5)), ids(Paging.cut(nodes(5), "p", 0, 50)));
        assertEquals(5000, Paging.cut(nodes(5000), "p", 0, Integer.MAX_VALUE).size());
    }

    @Test public void aLongerListIsCutToExactlyThePageSizeWithMoreAsTheLastItem() {
        List<Node> page = Paging.cut(nodes(30), "eclipse:home", 0, 10);
        assertEquals("never longer than the host asked for", 10, page.size());
        assertEquals(ids(nodes(9)), ids(page.subList(0, 9)));
        Node more = page.get(9);
        assertEquals(MediaIds.more("eclipse:home", 9), more.id);
        assertEquals(Paging.MORE_TITLE, more.title);
        assertEquals("21 more items", more.subtitle);
        assertEquals(Paging.MORE_GROUP, more.group);
        assertEquals(Node.Kind.FOLDER, more.kind);
        MediaIds.Parsed parsed = MediaIds.parse(more.id);
        assertEquals(MediaIds.Kind.MORE, parsed.kind);
        assertEquals("eclipse:home", parsed.a);
        assertEquals(9, parsed.index);
    }

    @Test public void followingMoreWalksTheWholeListWithNothingLostOrRepeated() {
        List<Node> all = nodes(47);
        List<String> seen = new ArrayList<>();
        List<Node> remaining = all;
        int offset = 0;
        int guard = 0;
        while (true) {
            List<Node> page = Paging.cut(remaining, "parent", offset, 10);
            assertTrue(page.size() <= 10);
            Node last = page.get(page.size() - 1);
            boolean hasMore = last.id.startsWith("eclipse:more/");
            for (Node node : hasMore ? page.subList(0, page.size() - 1) : page) seen.add(node.id);
            if (!hasMore) break;
            offset = MediaIds.parse(last.id).index;
            remaining = all.subList(offset, all.size());
            assertTrue("terminates", ++guard < 20);
        }
        assertEquals(ids(all), seen);
    }

    @Test public void theOneRemainingItemIsShownInsteadOfAMoreFolder() {
        List<Node> page = Paging.cut(nodes(11), "p", 0, 11);
        assertEquals(11, page.size());
        assertEquals("n10", page.get(10).id);
    }

    @Test public void aPageOfOneShowsTheFirstItemAndAPageOfNothingShowsNothing() {
        List<Node> one = Paging.cut(nodes(5), "p", 0, 1);
        assertEquals(ids(nodes(1)), ids(one));
        assertTrue(Paging.cut(nodes(5), "p", 0, 0).isEmpty());
        assertTrue(Paging.cut(nodes(5), "p", 0, -3).isEmpty());
        assertTrue(Paging.cut(new ArrayList<Node>(), "p", 0, 10).isEmpty());
    }

    @Test public void moreIsItsOwnGroupSoItDoesNotJoinTheLastRowsGroup() {
        List<Node> grouped = new ArrayList<>();
        for (Node node : nodes(12)) grouped.add(node.inGroup("Songs"));
        List<Node> page = Paging.cut(grouped, "p", 0, 8);
        assertEquals("Songs", page.get(6).group);
        assertEquals("More", page.get(7).group);
    }
}
