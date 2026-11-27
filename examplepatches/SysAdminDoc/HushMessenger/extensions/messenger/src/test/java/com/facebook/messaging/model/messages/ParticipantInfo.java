package com.facebook.messaging.model.messages;

import com.facebook.user.model.UserKey;

/** Stands in for who a message is from: Messenger keeps their user key in one field, under its obfuscated name. */
public final class ParticipantInfo {
    public final UserKey A0F;
    public final String A0J;

    public ParticipantInfo(String id, String name) {
        A0F = new UserKey(id);
        A0J = name;
    }
}
