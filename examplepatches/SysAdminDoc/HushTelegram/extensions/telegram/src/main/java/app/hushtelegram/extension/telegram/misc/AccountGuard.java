/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Power off account and Receive only mode, per account.
 *
 * <p>Every request Telegram sends passes through one private method of its connection manager, the
 * only caller of the native send, and the patch has that method ask here first with the manager,
 * the request and its callback. A powered-off account sends nothing at all. A receive-only account
 * sends what reads: its sign-in, its updates, history, files and config, and the receipts that say
 * a chat was read. Everything that writes (a message, a reaction, a draft, a typing status, a
 * profile change) is refused on the phone. A refused request's callback is answered with an error,
 * the way a server error would, so the screen that asked isn't left waiting or holding a mark that
 * only the answer clears.
 *
 * <p>What this can't stop: the connection Telegram's native layer already holds. It keeps its own
 * pings and reconnects, and the server still pushes updates down an open socket, so a powered-off
 * account can still receive and a Firebase push can still wake the phone. Voice and video calls use
 * their own connection too. Power off also asks the native layer to pause the account, which helps
 * while the app is in the background but is not a promise: coming back to the foreground resumes it.
 */
public final class AccountGuard {
    private AccountGuard() {}

    static final int ERROR_CODE = 400;
    static final String POWERED_OFF_TEXT = "ACCOUNT_POWERED_OFF";
    static final String RECEIVE_ONLY_TEXT = "RECEIVE_ONLY";

    /** How long between two toasts, since a refused sync can ask many times a second. */
    private static final long TOAST_GAP_MS = 8000;

    /** Which account a connection manager belongs to; a test swaps it. */
    interface Lookup {
        int account(Object connectionsManager);
    }

    static volatile Lookup lookup = Accounts::indexOf;
    private static long lastToast;

    private static volatile String parsedFrom = "";
    private static volatile Set<Integer> poweredOff = Collections.emptySet();
    private static volatile String receiveFrom = "";
    private static volatile Set<Integer> receiveOnly = Collections.emptySet();

    /**
     * Asked with every request just before Telegram sends it. True means keep it on the phone, and
     * the callback, when there is one, has been told it failed. Never throws.
     */
    public static boolean drop(Object connectionsManager, Object request, Object callback) {
        if (request == null) return false;
        try {
            if (!Utils.settingsReady()) return false;
            boolean power = Settings.POWER_OFF_ACCOUNTS.get();
            boolean receive = Settings.RECEIVE_ONLY.get();
            if (!power && !receive) return false;
            int account = lookup.account(connectionsManager);
            if (account < 0) return false;
            if (power && poweredOff(account)) return refuse(request, callback, POWERED_OFF_TEXT, "account powered off", false);
            if (receive && receiveOnly(account)) return refuse(request, callback, RECEIVE_ONLY_TEXT, "write refused", true);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "account guard", failure);
            return false;
        }
    }

    /** Whether the account is on the powered-off list and the feature is on. */
    public static boolean isPoweredOff(int account) {
        return Settings.POWER_OFF_ACCOUNTS.get() && poweredOff(account);
    }

    /** Whether the account is on the receive-only list and the feature is on. */
    public static boolean isReceiveOnly(int account) {
        return Settings.RECEIVE_ONLY.get() && receiveOnly(account);
    }

    /**
     * What goes in front of an account's name in the side menu: "(Off) " for a powered-off account,
     * "(Read only) " for a receive-only one, nothing otherwise. Never throws.
     */
    public static String mark(long userId) {
        try {
            if (!Utils.settingsReady() || (!Settings.POWER_OFF_ACCOUNTS.get() && !Settings.RECEIVE_ONLY.get())) return "";
            int account = Accounts.ofUser(userId);
            if (account < 0) return "";
            if (isPoweredOff(account)) return L10n.t("(Off)") + " ";
            if (isReceiveOnly(account)) return L10n.t("(Read only)") + " ";
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "account mark", failure);
        }
        return "";
    }

    /** Whether the account is on the powered-off list, whether or not the feature is on. */
    public static boolean isListedOff(int account) {
        return poweredOff(account);
    }

    /** Whether the account is on the receive-only list, whether or not the feature is on. */
    public static boolean isListedReceiveOnly(int account) {
        return receiveOnly(account);
    }

    /** Powers an account off or on, and asks Telegram's native layer to follow. */
    public static void setPoweredOff(int account, boolean off) {
        Settings.POWERED_OFF_ACCOUNTS.save(withMember(Settings.POWERED_OFF_ACCOUNTS.get(), account, off));
        followNative(account, off && Settings.POWER_OFF_ACCOUNTS.get());
    }

    /** The master switch changed: every listed account is paused when it is on and resumed when it is off. */
    public static void masterChanged(boolean on) {
        for (int account : Accounts.parse(Settings.POWERED_OFF_ACCOUNTS.get())) followNative(account, on);
    }

    private static void followNative(int account, boolean off) {
        Object manager = Accounts.connections(account);
        if (manager == null) return;
        try {
            Class<?> type = manager.getClass();
            if (off) {
                HostNames.method(type, "native_pauseNetwork", int.class).invoke(null, account);
                HostNames.method(type, "native_setNetworkAvailable", int.class, boolean.class, int.class, boolean.class)
                        .invoke(null, account, false, 0, false);
            } else {
                HostNames.method(type, "native_resumeNetwork", int.class, boolean.class).invoke(null, account, false);
                Method check = HostNames.method(type, "checkConnection");
                check.invoke(manager);
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "AccountGuard: the native layer wouldn't follow the power switch", failure);
        }
    }

    /** Makes an account receive-only or ordinary again. */
    public static void setReceiveOnly(int account, boolean on) {
        Settings.RECEIVE_ONLY_ACCOUNTS.save(withMember(Settings.RECEIVE_ONLY_ACCOUNTS.get(), account, on));
    }

    static String withMember(String list, int account, boolean member) {
        Set<Integer> indexes = new TreeSet<>(Accounts.parse(list));
        if (member) indexes.add(account);
        else indexes.remove(account);
        return Accounts.join(indexes);
    }

    private static boolean poweredOff(int account) {
        String list = Settings.POWERED_OFF_ACCOUNTS.get();
        if (!list.equals(parsedFrom)) {
            poweredOff = Accounts.parse(list);
            parsedFrom = list;
        }
        return poweredOff.contains(account);
    }

    private static boolean receiveOnly(int account) {
        String list = Settings.RECEIVE_ONLY_ACCOUNTS.get();
        if (!list.equals(receiveFrom)) {
            receiveOnly = Accounts.parse(list);
            receiveFrom = list;
        }
        return receiveOnly.contains(account);
    }

    private static boolean refuse(Object request, Object callback, String text, String counted, boolean readsPass) {
        String name = request.getClass().getName();
        boolean reads = reads(name);
        if (readsPass && reads) return false;
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, counted);
        if (callback != null) answer(callback, text);
        if (!reads) toast(text);
        return true;
    }

    private static void answer(Object callback, String text) {
        try {
            if (!RequestAnswers.error(callback, ERROR_CODE, text)) {
                HookStatus.missingMember(FamilyNames.DISABLE_ANALYTICS, "method", callback.getClass().getName(), "run");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "account guard answer", failure);
        }
    }

    private static void toast(String text) {
        long now = System.currentTimeMillis();
        synchronized (AccountGuard.class) {
            if (now - lastToast < TOAST_GAP_MS) return;
            lastToast = now;
        }
        try {
            Utils.showToastShort(POWERED_OFF_TEXT.equals(text) ? L10n.t("This account is powered off.") : L10n.t("Receive only mode is on."));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "account guard toast", failure);
        }
    }

    /**
     * Whether a request only reads, judged by the name Telegram's builds keep for its class:
     * {@code TLRPC$TL_messages_getHistory}, {@code TL_account$updateStatus}. Sign-in, config and
     * language calls and anything without a namespace (pings, acknowledgements) pass, as do the
     * calls named get, search, check, resolve, read or received, and the push registration.
     */
    static boolean reads(String className) {
        int dollar = className.lastIndexOf('$');
        String outer = dollar < 0 ? "" : className.substring(className.lastIndexOf('.', dollar) + 1, dollar);
        String inner = className.substring(dollar < 0 ? className.lastIndexOf('.') + 1 : dollar + 1);
        if (inner.startsWith("TL_")) inner = inner.substring(3);
        String namespace;
        String verb;
        int underscore = inner.indexOf('_');
        if (outer.startsWith("TL_") && outer.length() > 3) {
            namespace = outer.substring(3);
            verb = underscore > 0 && inner.startsWith(namespace + "_") ? inner.substring(underscore + 1) : inner;
        } else if (underscore > 0) {
            namespace = inner.substring(0, underscore);
            verb = inner.substring(underscore + 1);
        } else {
            return true;
        }
        switch (namespace) {
            case "auth":
            case "help":
            case "langpack":
            case "updates":
            case "ping":
                return true;
            default:
                break;
        }
        return verb.startsWith("get") || verb.startsWith("search") || verb.startsWith("check")
                || verb.startsWith("resolve") || verb.startsWith("read") || verb.startsWith("received")
                || verb.startsWith("registerDevice") || verb.startsWith("invoke") || verb.startsWith("initConnection");
    }
}
