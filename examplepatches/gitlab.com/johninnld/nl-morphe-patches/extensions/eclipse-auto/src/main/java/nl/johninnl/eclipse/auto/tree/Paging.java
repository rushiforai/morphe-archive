package nl.johninnl.eclipse.auto.tree;

import java.util.ArrayList;
import java.util.List;

/**
 * Cuts a child list to the page size the host asked for, so the app's result check (which throws
 * when a list is longer than the page) can never trip. When something is left over the last slot
 * becomes a "More…" folder that opens the remainder, so nothing is lost.
 */
public final class Paging {
    public static final String MORE_TITLE = "More…";
    public static final String MORE_GROUP = "More";

    /**
     * @param nodes the children, in order
     * @param parent the id {@code More…} must point back at (the real parent, not an earlier More)
     * @param baseOffset where {@code nodes} starts inside that parent's full list
     * @param pageSize the host's page size; {@code Integer.MAX_VALUE} means "everything"
     */
    public static List<Node> cut(List<Node> nodes, String parent, int baseOffset, int pageSize) {
        if (pageSize <= 0) return new ArrayList<>();
        if (nodes.size() <= pageSize) return new ArrayList<>(nodes);
        // One slot is for More…; with a page of one there is no room for it, and an item beats a loop.
        int taken = pageSize == 1 ? 1 : pageSize - 1;
        List<Node> page = new ArrayList<>(nodes.subList(0, taken));
        if (pageSize > 1) {
            int remaining = nodes.size() - taken;
            page.add(Node.folder(MediaIds.more(parent, baseOffset + taken), Node.TYPE_FOLDER, MORE_TITLE,
                remaining + (remaining == 1 ? " more item" : " more items"), null).inGroup(MORE_GROUP));
        }
        return page;
    }

    private Paging() { }
}
