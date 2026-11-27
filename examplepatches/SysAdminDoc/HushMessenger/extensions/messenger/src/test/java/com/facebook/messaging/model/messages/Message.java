package com.facebook.messaging.model.messages;

import X.Xma;
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
    /** Who it was sent for, which most messages leave empty, and who sent it, as 588 names them. */
    public ParticipantInfo A0T;
    public ParticipantInfo A0U;
    /** The older shares, a list of their own. */
    public List<Object> A1M = new ArrayList<>();
    /** The card a newer share arrives as, typed by one of Messenger's interfaces. */
    public Xma A0F;

    /** A message carrying the older [shares]. */
    public static Message sharing(Object... shares) {
        Message message = new Message();
        message.A1M.addAll(Arrays.asList(shares));
        return message;
    }

    /** A message whose card is [card]. */
    public static Message carding(Xma card) {
        Message message = new Message();
        message.A0F = card;
        return message;
    }

    /** A message from the person with [id]. */
    public static Message from(String id) {
        Message message = new Message();
        message.A0U = new ParticipantInfo(id, "Sender");
        return message;
    }

    public static Message with(Object... attachments) {
        Message message = new Message();
        message.A1D.addAll(Arrays.asList(attachments));
        return message;
    }
}
