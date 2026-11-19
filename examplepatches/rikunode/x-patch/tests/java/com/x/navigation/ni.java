package com.x.navigation;

/** Synthetic JVM fixture matching X 12.31's verified FromId default-mask constructor. */
public final class ni {
    public enum IntentAction { None, Unknown }
    public final long postId;
    public final IntentAction action;

    public ni(long id, boolean ignored, IntentAction enumArg, int defaultMask) {
        postId = id;
        action = (defaultMask & 4) != 0 ? IntentAction.None : enumArg;
        if (action == null) throw new NullPointerException("No intent action");
    }
}
