package com.facebook.messaging.model.threads;

import com.facebook.messaging.model.threadkey.ThreadKey;

/**
 * Stands in for Messenger's chat summary, cut down to its keys: the chat's own, and before it the key of the chat or
 * community it sits under, which most chats leave empty. Nothing but the field names says which is which.
 */
public final class ThreadSummary {
    public final String A1x;
    public final ThreadKey A0c;
    public final ThreadKey A0e;

    public ThreadSummary(String name, ThreadKey key) {
        this(name, null, key);
    }

    public ThreadSummary(String name, ThreadKey under, ThreadKey key) {
        A1x = name;
        A0c = under;
        A0e = key;
    }
}
