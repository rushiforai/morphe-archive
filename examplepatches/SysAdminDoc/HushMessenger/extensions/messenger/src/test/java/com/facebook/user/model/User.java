package com.facebook.user.model;

/**
 * Stands in for Messenger's user, cut down to what says it's an AI bot: a flag, the type name the server sent, and the
 * check that reads both. Field and method names are the obfuscated ones 587 has.
 */
public final class User {
    public final boolean A08;
    public final String A1a;
    public final String A1E;

    public User(String name, String typeName, boolean bot) {
        A1E = name;
        A1a = typeName;
        A08 = bot;
    }

    public boolean A0A() {
        return A08 || "AiBot".equals(A1a);
    }

    public boolean A0C() {
        return "InstagramMessagingUser".equals(A1a);
    }

    public static boolean A01() {
        return true;
    }

    public String A0D() {
        return A1E;
    }
}
