/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

/**
 * Server driven UI clicks arrive as ClickActions(onClick, onLongClick, onDoubleClick). The double
 * click is the like gesture on posts and photos, so removing that listener is what turns the
 * gesture off; the single click and the long press are passed through untouched.
 */
@SuppressWarnings("unused")
public final class DoubleTapPatch {

    /** Injected as the onDoubleClick argument of the ClickActions constructor. */
    public static Object filterDoubleClick(Object onDoubleClick) {
        if (onDoubleClick == null) return null;
        if (!Settings.disableDoubleTapLike()) return onDoubleClick;
        return null;
    }
}
