/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.patches.components;

/** A Litho filter that requests bytes only in branches that inspect the current element. */
public abstract class LazyBufferFilter extends Filter {
    @FunctionalInterface
    public interface Buffer {
        /**
         * Returns the bytes for this invocation. Treat them as read-only. Do not retain this
         * accessor outside the callback; obtain the bytes before handing work to another thread.
         */
        byte[] get();
    }

    @Override
    public final boolean isFiltered(String path, String identifier, String allValue, byte[] buffer,
                                    StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        return isFilteredLazy(path, identifier, allValue, () -> buffer, matchedGroup, contentType, contentIndex);
    }

    @Override
    public final boolean isFiltered(Object contextSource, String identifier, String accessibility,
                                    String path, byte[] buffer, StringFilterGroup matchedGroup,
                                    FilterContentType contentType, int contentIndex) {
        return isFilteredLazy(contextSource, identifier, accessibility, path, () -> buffer,
                matchedGroup, contentType, contentIndex);
    }

    protected boolean isFilteredLazy(String path, String identifier, String allValue, Buffer buffer,
                                     StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        return true;
    }

    protected boolean isFilteredLazy(Object contextSource, String identifier, String accessibility,
                                     String path, Buffer buffer, StringFilterGroup matchedGroup,
                                     FilterContentType contentType, int contentIndex) {
        return isFilteredLazy(path, accessibility, "", buffer, matchedGroup, contentType, contentIndex);
    }
}
