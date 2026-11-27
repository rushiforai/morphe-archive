package com.facebook.messaging.model.messages;

import com.facebook.messaging.model.threadkey.ThreadKey;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Stands in for the messages a chat view has loaded: the chat's key and one list of messages, newest first. */
public final class MessagesCollection {
    public final ThreadKey A00;
    public final List<Message> A01;

    public MessagesCollection(ThreadKey key, Message... messages) {
        A00 = key;
        A01 = new ArrayList<>(Arrays.asList(messages));
    }
}
