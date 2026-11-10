package com.google.common.collect;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * Compile-time stub for Guava's ImmutableList used by ExoPlayer's Tracks.
 */
public abstract class ImmutableList<E> extends AbstractList<E> implements List<E> {

    public static <E> ImmutableList<E> of() {
        return copyOf(Collections.<E>emptyList());
    }

    @SafeVarargs
    public static <E> ImmutableList<E> of(E... elements) {
        return copyOf(Arrays.asList(elements));
    }

    public static <E> ImmutableList<E> copyOf(Collection<? extends E> elements) {
        final List<E> list = new java.util.ArrayList<>(elements);
        return new ImmutableList<E>() {
            @Override
            public E get(int index) {
                return list.get(index);
            }

            @Override
            public int size() {
                return list.size();
            }
        };
    }
}
