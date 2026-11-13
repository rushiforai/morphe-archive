/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;

/**
 * Delete account (#71): deletes the account the app is showing with account.deleteAccount, the
 * request my.telegram.org sends, so nobody has to leave the app for it. An account with a cloud
 * password isn't deleted on the spot: Telegram answers 2FA_CONFIRM_WAIT_ with the seconds it waits
 * first, and sends the account a message about it. A deleted account is signed out here the way
 * Telegram signs out one the server dropped.
 */
public final class DeleteAccount {
    private DeleteAccount() {}

    /** Telegram's answer for an account with a cloud password, followed by the seconds it waits. */
    static final String CONFIRM_WAIT = "2FA_CONFIRM_WAIT_";
    private static final String FLOOD_WAIT = "FLOOD_WAIT_";
    private static final String DELETED = "org.telegram.tgnet.TLRPC$TL_boolTrue";
    private static final long DAY_SECONDS = 24 * 60 * 60;

    /** Telegram's answer to a sent deletion, on the main thread. */
    public interface Answer {
        /** The account is deleted, or will be on the day Telegram set: [said] is which, to show. */
        void done(String said);

        void refused(String refused);
    }

    /** What deleting an account needs from Telegram; a test swaps it. */
    interface Telegram {
        /** The account the app is showing, or null when none is signed in. */
        Accounts.Entry account();

        /** A new account.deleteAccount with [reason]. */
        Object request(String reason);

        /** Telegram's request callback type. */
        Class<?> requestDelegate();

        /** Sends [request] from [account], [callback] getting the answer; false when this build can't. */
        boolean send(int account, Object request, Object callback);

        /** The text of Telegram's error [error], like FLOOD_WAIT_30. */
        String errorText(Object error);

        /** Whether [response] says the account is gone. */
        boolean deleted(Object response);

        /** Clears [account] off the phone, as Telegram does when the server drops it. */
        void signOut(int account) throws ReflectiveOperationException;
    }

    static volatile Telegram telegram = new Telegram() {
        @Override public Accounts.Entry account() {
            int selected = Accounts.selected();
            for (Accounts.Entry each : Accounts.signedIn()) if (each.index == selected) return each;
            return null;
        }

        @Override public Object request(String reason) { return DeleteAccount.request(reason); }
        @Override public Class<?> requestDelegate() { return DeleteAccount.requestDelegate(); }
        @Override public boolean send(int account, Object request, Object callback) { return sendRequest(account, request, callback); }
        @Override public String errorText(Object error) { return DeleteAccount.errorText(error); }

        @Override public boolean deleted(Object response) {
            return response != null && DELETED.equals(response.getClass().getName());
        }

        @Override public void signOut(int account) throws ReflectiveOperationException {
            Class<?> controller = Class.forName("org.telegram.messenger.MessagesController");
            Object instance = HostNames.method(controller, "getInstance", int.class).invoke(null, account);
            Method logout = HostNames.method(controller, "performLogout", int.class);
            logout.invoke(instance, 0);
        }
    };

    /** The account a deletion would take, or null when none is signed in. */
    public static Accounts.Entry account() {
        try {
            return telegram.account();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "delete account lookup", failure);
            return null;
        }
    }

    /**
     * Deletes [account]. Null when the request went, else the refusal to show; [answer] hears
     * Telegram's reply on the main thread.
     */
    public static String send(int account, Answer answer) {
        try {
            Telegram host = telegram;
            Object request = host.request("");
            if (request == null || !host.send(account, request, callback(host.requestDelegate(), account, answer))) return refusal(null);
            HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "account deletion sent");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "delete account", failure);
            return refusal(null);
        }
    }

    /** Telegram's request callback, answering on the main thread. */
    static Object callback(Class<?> delegate, int account, Answer answer) {
        if (delegate == null) throw new IllegalStateException("Telegram's request callback isn't patched in");
        return Proxy.newProxyInstance(delegate.getClassLoader(), new Class<?>[]{delegate}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals": return proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    default: return "HushTelegram account deletion";
                }
            }
            Object response = args != null && args.length > 0 ? args[0] : null;
            Object error = args != null && args.length > 1 ? args[1] : null;
            String code = error == null ? null : telegram.errorText(error);
            Utils.runOnMainThread(() -> answered(account, response, code, answer));
            return null;
        });
    }

    /** Telegram's answer, on the main thread. */
    static void answered(int account, Object response, String code, Answer answer) {
        try {
            Telegram host = telegram;
            if (code == null && host.deleted(response)) {
                answer.done(L10n.t("Account deleted."));
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "account deleted");
                try {
                    host.signOut(account);
                } catch (ReflectiveOperationException | RuntimeException unreachable) {
                    // Telegram signs it out itself on its next request, which the server refuses.
                    HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "sign out a deleted account", unreachable);
                }
                return;
            }
            long wait = code == null || !code.startsWith(CONFIRM_WAIT) ? -1 : seconds(code.substring(CONFIRM_WAIT.length()));
            if (wait >= 0) {
                long days = Math.max(1, (wait + DAY_SECONDS - 1) / DAY_SECONDS);
                answer.done(L10n.quantity(days, "Telegram deletes the account in %1$d day.",
                        "Telegram deletes the account in %1$d days.", days));
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "account deletion waiting on the cloud password");
                return;
            }
            answer.refused(refusal(code));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "account deletion answer", failure);
        }
    }

    private static long seconds(String digits) {
        try {
            return Long.parseLong(digits);
        } catch (NumberFormatException notANumber) {
            return -1;
        }
    }

    /** The toast for Telegram's error [code], or for no answer at all when it's null. */
    static String refusal(String code) {
        if (code == null || code.isEmpty()) return L10n.t("Telegram didn't delete the account.");
        if (AccountGuard.POWERED_OFF_TEXT.equals(code)) return L10n.t("This account is powered off.");
        if (AccountGuard.RECEIVE_ONLY_TEXT.equals(code)) return L10n.t("Receive only mode is on.");
        if (code.startsWith(FLOOD_WAIT)) return L10n.f("Wait %1$s seconds, then try again.", code.substring(FLOOD_WAIT.length()));
        return L10n.f("Telegram refused it: %1$s", code.length() > BotSignIn.MAX_CODE ? code.substring(0, BotSignIn.MAX_CODE) : code);
    }

    // Stubs: the patch writes each body for this build of Telegram.

    /** {@code new TL_account.deleteAccount()} with its reason set to [reason]. */
    public static Object request(String reason) { return null; }

    /** {@code org.telegram.tgnet.RequestDelegate}. */
    public static Class<?> requestDelegate() { return null; }

    /** {@code ConnectionsManager.getInstance(account).sendRequest(request, callback, 0)}, true once it's sent. */
    public static boolean sendRequest(int account, Object request, Object callback) { return false; }

    /** {@code ((TLRPC.TL_error) error).text}. */
    public static String errorText(Object error) { return null; }
}
