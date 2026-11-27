package com.facebook.auth.usersession;

/** Stands in for Messenger's signed-in account, which a contact menu keeps and hands to the removal it starts. */
public final class FbUserSession {
    public final String A00;

    public FbUserSession(String userId) {
        A00 = userId;
    }
}
