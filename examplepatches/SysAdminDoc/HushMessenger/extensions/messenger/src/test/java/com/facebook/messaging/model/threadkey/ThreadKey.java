package com.facebook.messaging.model.threadkey;

/** Messenger's thread key, cut down to the type it holds in an obfuscated enum of its own. */
public final class ThreadKey {
    public final Enum<?> A06;
    public final long A01;

    public ThreadKey(Enum<?> type, long id) {
        A06 = type;
        A01 = id;
    }
}
