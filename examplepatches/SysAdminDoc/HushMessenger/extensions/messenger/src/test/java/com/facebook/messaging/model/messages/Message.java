package com.facebook.messaging.model.messages;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * An incoming message the way the notification constructor hands it over: several lists on it, one of which holds the
 * attachments, under a name that says nothing. Nothing here is named the way the extension looks for it.
 */
public final class Message {
    /** Another list entirely, so a walk that takes the first one it finds is caught. */
    public List<String> A19 = new ArrayList<>(Arrays.asList("tag", "other"));
    public List<Object> A1D = new ArrayList<>();
    public List<Object> A1L = new ArrayList<>();
    public String A1m = "offline-id";

    public static Message with(Object... attachments) {
        Message message = new Message();
        message.A1D.addAll(Arrays.asList(attachments));
        return message;
    }
}
