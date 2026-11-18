package app.afterglow.extension.litho;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/**
 * Several filter groups searched in one pass over the same content, for a
 * filter that tells many related things apart, such as the action buttons by
 * their accessibility id or the menu items by their icon bytes.
 *
 * <p>Add every group in the filter's constructor; the list is only read once
 * the filter is registered.
 */
public abstract class FilterGroupList<T, G extends FilterGroup<T>> implements Iterable<G> {
    private final List<G> groups = new ArrayList<>();
    private final TrieSearch<T> search;

    FilterGroupList(TrieSearch<T> search) {
        this.search = search;
    }

    @SafeVarargs
    public final void addAll(G... newGroups) {
        for (G group : newGroups) {
            groups.add(group);
            for (T pattern : group.patterns) {
                search.addPattern(pattern, (startIndex, length, parameter) -> {
                    if (!group.isEnabled()) return false;
                    ((Object[]) parameter)[0] = group;
                    return true;
                });
            }
        }
    }

    /** The first group that is on and has a pattern in the content, or null. */
    public G find(T content) {
        if (content == null) return null;
        Object[] found = new Object[1];
        search.matches(content, found);
        @SuppressWarnings("unchecked")
        G group = (G) found[0];
        return group;
    }

    /** True if a group that is on has a pattern in the content. */
    public boolean matches(T content) {
        return find(content) != null;
    }

    @Override
    public Iterator<G> iterator() {
        return Collections.unmodifiableList(groups).iterator();
    }
}
