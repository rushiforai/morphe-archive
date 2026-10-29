package io.github.pengusto.patches.extension.readyou;

import be.ceau.opml.entity.Outline;
import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

/** Depth-first traversal for Read You's existing flat outer-group importer. */
public final class OpmlImport {
    private OpmlImport() {}

    public static Iterator<Outline> descendants(List<Outline> children) {
        return new Descendants(children);
    }

    private static final class Descendants implements Iterator<Outline> {
        private final ArrayDeque<Iterator<Outline>> pending = new ArrayDeque<>();

        Descendants(List<Outline> children) {
            pending.addLast(children.iterator());
        }

        @Override public boolean hasNext() {
            while (!pending.isEmpty() && !pending.getLast().hasNext()) {
                pending.removeLast();
            }
            return !pending.isEmpty();
        }

        @Override public Outline next() {
            if (!hasNext()) throw new NoSuchElementException();
            Outline outline = pending.getLast().next();
            if (outline != null && outline.subElements != null) {
                pending.addLast(outline.subElements.iterator());
            }
            return outline;
        }

        @Override public void remove() {
            throw new UnsupportedOperationException();
        }
    }
}
