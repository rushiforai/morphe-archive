/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;
import java.util.List;

import org.telegram.tgnet.RequestDelegate;
import org.telegram.tgnet.TLRPC;

/**
 * Lets tests sign an account in for Delete account, see what it sends and answer it the way
 * Telegram would, through the test stand-in for Telegram's request callback.
 */
public final class DeleteAccountForTests {
    private DeleteAccountForTests() {}

    private static DeleteAccount.Telegram saved;
    private static final List<String> SENT = new ArrayList<>();
    private static final List<Integer> SIGNED_OUT = new ArrayList<>();
    private static RequestDelegate callback;
    private static boolean sends;
    private static boolean signOutFails;

    /** Account [index] called [name] in use, or none signed in when [name] is null. */
    public static void signedIn(int index, String name) {
        if (saved == null) saved = DeleteAccount.telegram;
        DeleteAccount.Telegram real = saved;
        SENT.clear();
        SIGNED_OUT.clear();
        callback = null;
        sends = true;
        signOutFails = false;
        DeleteAccount.telegram = new DeleteAccount.Telegram() {
            @Override public Accounts.Entry account() { return name == null ? null : new Accounts.Entry(index, name); }

            @Override public Object request(String reason) { return "deleteAccount reason=\"" + reason + "\""; }

            @Override public Class<?> requestDelegate() { return RequestDelegate.class; }

            @Override public boolean send(int account, Object request, Object answer) {
                if (!sends) return false;
                SENT.add(account + ": " + request);
                callback = (RequestDelegate) answer;
                return true;
            }

            @Override public String errorText(Object error) { return ((TLRPC.TL_error) error).text; }

            @Override public boolean deleted(Object response) { return real.deleted(response); }

            @Override public void signOut(int account) {
                if (signOutFails) throw new IllegalStateException("performLogout moved");
                SIGNED_OUT.add(account);
            }
        };
    }

    /** This build can't send the request. */
    public static void refuseSends() { sends = false; }

    /** Signing the deleted account out throws, as on a build whose sign-out moved. */
    public static void failSignOut() { signOutFails = true; }

    /** Each request sent, as "account: request". */
    public static List<String> sent() { return new ArrayList<>(SENT); }

    /** The accounts signed out after their deletion. */
    public static List<Integer> signedOut() { return new ArrayList<>(SIGNED_OUT); }

    /** Telegram answers the last request: deleted. */
    public static void deleted() { callback.run(new TLRPC.TL_boolTrue(), null); }

    /** Telegram answers the last request with the error [text]. */
    public static void refused(String text) { callback.run(null, new TLRPC.TL_error(400, text)); }

    /** Telegram answers the last request with Bool false. */
    public static void notDeleted() { callback.run(new TLRPC.TL_boolFalse(), null); }

    /** Back to the stubs. */
    public static void restore() {
        if (saved != null) DeleteAccount.telegram = saved;
        saved = null;
        callback = null;
    }
}
