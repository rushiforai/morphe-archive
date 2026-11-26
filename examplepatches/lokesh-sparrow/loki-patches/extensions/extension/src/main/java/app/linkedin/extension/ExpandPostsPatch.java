/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

/**
 * The server driven ExpandableTextState starts from an ExpansionBehaviorState (COLLAPSED / EXPANDED). When the
 * setting is on the initial value is swapped for EXPANDED; a tap on the text still collapses the post.
 */
@SuppressWarnings({"unused", "unchecked", "rawtypes"})
public final class ExpandPostsPatch {

    /** Injected as the initial-state argument of the ExpandableTextState constructor. */
    public static Object initialState(Object state) {
        if (state == null || !Settings.expandPosts() || !(state instanceof Enum)) return state;
        try {
            return Enum.valueOf(((Enum) state).getDeclaringClass(), "EXPANDED");
        } catch (Throwable t) {
            return state;
        }
    }
}
