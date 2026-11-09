/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Space;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.BotTokenPrompt;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Bot token sign-in: an account signed in as a bot made with @BotFather, the way Telegram's own
 * clients sign bots in, with {@code auth.importBotAuthorization} instead of a phone number.
 *
 * <p>With the switch on, the phone number screen (first sign-in and Add account alike) gets a
 * Sign in with a bot token button under the number. It asks for the token, checks its shape, and
 * sends it from the account being signed in with this app's own API ID. Telegram's answer goes to
 * the same method a code or password sign-in ends in, so the account is set up the usual way and
 * Telegram keeps the authorization in its own storage. HushTelegram never saves, logs or shows the
 * token.
 *
 * <p>A bot can't call some of the methods Telegram asks for right after a sign-in: its chat list,
 * contacts, sticker sets and a chat's history are refused with BOT_METHOD_INVALID, and some screens
 * would wait on those forever or ask again. On a bot account only, those requests are answered on
 * the phone with an empty result, so the chat list settles and a chat opens with what has arrived
 * since sign-in. Ordinary accounts never take that path, whatever the switch says.
 */
public final class BotSignIn {
    private BotSignIn() {}

    /** The tag on the button, so a second constructor run never adds two. */
    static final String TAG = "hushtelegram_bot_sign_in";
    /** The refusal for a token that doesn't have a token's shape. Never sent. */
    static final String MALFORMED = "MALFORMED";
    /** Telegram's rate limit error, followed by the seconds to wait. */
    private static final String FLOOD_WAIT = "FLOOD_WAIT_";
    /** What a successful {@code auth.importBotAuthorization} answers with. */
    static final String AUTHORIZATION = "org.telegram.tgnet.TLRPC$TL_auth_authorization";
    /** The login screen's mode for a sign-in; the other modes change a number. */
    static final int SIGN_IN_MODE = 0;
    /** A bot's id is a positive long, at most 19 digits. */
    static final int MAX_ID_DIGITS = 19;
    /** The secret half of a token is 35 characters of letters, digits, _ and -. */
    static final int SECRET_LENGTH = 35;
    /** The longest server error shown in a refusal, so the toast stays two short lines. */
    static final int MAX_CODE = 28;

    private static final String TLRPC = "org.telegram.tgnet.TLRPC$";

    /**
     * Requests a bot can't make, answered on a bot account with the empty answer Telegram asks for.
     * Each of them is refused by the server for a bot, and the screens that send them wait on the
     * answer or send them again.
     */
    static final Map<String, String> EMPTY_ANSWERS = new HashMap<>();

    static {
        EMPTY_ANSWERS.put(TLRPC + "TL_messages_getDialogs", TLRPC + "TL_messages_dialogs");
        EMPTY_ANSWERS.put(TLRPC + "TL_messages_getHistory", TLRPC + "TL_messages_messages");
        EMPTY_ANSWERS.put(TLRPC + "TL_contacts_getContacts", TLRPC + "TL_contacts_contacts");
        EMPTY_ANSWERS.put(TLRPC + "TL_messages_getAllStickers", TLRPC + "TL_messages_allStickers");
        EMPTY_ANSWERS.put(TLRPC + "TL_messages_getMaskStickers", TLRPC + "TL_messages_allStickers");
        EMPTY_ANSWERS.put(TLRPC + "TL_messages_getEmojiStickers", TLRPC + "TL_messages_allStickers");
        EMPTY_ANSWERS.put(TLRPC + "TL_messages_getFeaturedStickers", TLRPC + "TL_messages_featuredStickers");
        EMPTY_ANSWERS.put(TLRPC + "TL_messages_getFeaturedEmojiStickers", TLRPC + "TL_messages_featuredStickers");
    }

    /** What this reaches in Telegram; the patch writes the stubs these call, and a test swaps it. */
    interface Telegram {
        /** The phone view's login screen. */
        Object login(Object phoneView);

        /** The login screen's mode: 0 signs in, the others change a number. */
        int mode(Object login);

        /** The account the login screen signs in. */
        int account(Object login);

        /** Telegram's request callback type. */
        Class<?> requestDelegate();

        /** Sends [request] from [account], with [callback] for its answer. */
        void send(int account, Object request, Object callback);

        /** Hands an {@code auth.authorization} to the login screen's own sign-in ending. */
        void signedIn(Object login, Object authorization);

        /** Whether [account] is signed in as a bot. */
        boolean isBot(int account);

        /** The account a connection manager belongs to, or -1. */
        int accountOf(Object connectionsManager);

        /** This app's API ID and hash, as Telegram sends them with a sign-in. */
        int apiId(ClassLoader loader) throws ReflectiveOperationException;

        String apiHash(ClassLoader loader) throws ReflectiveOperationException;

        /** The login screen's activity, or null once it's gone. */
        Activity screen(Object login);
    }

    static final Telegram PATCHED = new Telegram() {
        @Override public Object login(Object phoneView) { return BotSignIn.login(phoneView); }
        @Override public int mode(Object login) { return BotSignIn.mode(login); }
        @Override public int account(Object login) { return BotSignIn.account(login); }
        @Override public Class<?> requestDelegate() { return BotSignIn.requestDelegate(); }
        @Override public void send(int account, Object request, Object callback) { BotSignIn.sendRequest(account, request, callback); }
        @Override public void signedIn(Object login, Object authorization) { BotSignIn.signedIn(login, authorization); }
        @Override public boolean isBot(int account) { return BotSignIn.isBot(account); }
        @Override public int accountOf(Object connectionsManager) { return Accounts.indexOf(connectionsManager); }

        @Override public int apiId(ClassLoader loader) throws ReflectiveOperationException {
            return HostNames.field(buildVars(loader), "APP_ID").getInt(null);
        }

        @Override public String apiHash(ClassLoader loader) throws ReflectiveOperationException {
            return (String) HostNames.field(buildVars(loader), "APP_HASH").get(null);
        }

        @Override public Activity screen(Object login) {
            try {
                Object activity = HostNames.method(login.getClass(), "getParentActivity").invoke(login);
                return activity instanceof Activity ? (Activity) activity : null;
            } catch (ReflectiveOperationException | RuntimeException failure) {
                HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "screen", failure);
                return null;
            }
        }
    };

    static volatile Telegram telegram = PATCHED;

    /**
     * Read at run time, not loaded as a constant: the API ID patch rewrites these fields where
     * Telegram sets them, so this sends whatever the app itself signs in with.
     */
    static Class<?> buildVars(ClassLoader loader) throws ClassNotFoundException {
        return Class.forName("org.telegram.messenger.BuildVars", true, loader);
    }

    /** Whether the phone screen in [mode] offers a bot token sign-in. */
    public static boolean offered(int mode) {
        return mode == SIGN_IN_MODE && switchOn();
    }

    /**
     * Whether [token] has a bot token's shape: the bot's id in digits, a colon, then 35 letters,
     * digits, underscores or hyphens. Checked here so a typo never goes to Telegram.
     */
    public static boolean wellFormed(String token) {
        if (token == null) return false;
        int colon = token.indexOf(':');
        if (colon < 1 || colon > MAX_ID_DIGITS || token.length() - colon - 1 != SECRET_LENGTH) return false;
        for (int i = 0; i < colon; i++) {
            char c = token.charAt(i);
            if (c < '0' || c > '9') return false;
        }
        for (int i = colon + 1; i < token.length(); i++) {
            char c = token.charAt(i);
            boolean allowed = (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '_' || c == '-';
            if (!allowed) return false;
        }
        return true;
    }

    /**
     * Called at the end of the phone view's constructor. With the switch on and the screen signing
     * in, adds the bot token button under the number. Never throws.
     */
    public static void phoneScreen(Object phoneView) {
        HookStatus.invoked(FamilyNames.BOT_TOKEN_SIGN_IN);
        try {
            if (!(phoneView instanceof LinearLayout)) return;
            LinearLayout screen = (LinearLayout) phoneView;
            if (screen.getOrientation() != LinearLayout.VERTICAL || screen.findViewWithTag(TAG) != null) return;
            Object login = telegram.login(phoneView);
            if (login == null || !offered(telegram.mode(login))) return;
            TextView button = button(screen.getContext());
            button.setOnClickListener(v -> {
                Activity activity = activity(v.getContext());
                if (activity == null || activity.isFinishing()) return;
                BotTokenPrompt.ask(activity, (token, answer) -> send(login, token, answer));
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.gravity = Gravity.CENTER_HORIZONTAL;
            params.topMargin = dp(screen.getContext(), 8);
            int last = screen.getChildCount() - 1;
            int at = last >= 0 && screen.getChildAt(last) instanceof Space ? last : screen.getChildCount();
            screen.addView(button, at, params);
            HookStatus.counted(FamilyNames.BOT_TOKEN_SIGN_IN, "bot token button");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "phoneScreen", failure);
        }
    }

    private static TextView button(Context context) {
        TextView button = new TextView(context) {
            @Override public CharSequence getAccessibilityClassName() {
                return Button.class.getName();
            }
        };
        button.setTag(TAG);
        button.setText(L10n.t("Sign in with a bot token"));
        int color = Utils.isDarkModeEnabled() ? 0xFF62B6F6 : 0xFF2678B6;
        button.setTextColor(color);
        button.setTextSize(15);
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(dp(context, 48));
        int sides = dp(context, 16);
        button.setPadding(sides, dp(context, 8), sides, dp(context, 8));
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(0xFFFFFFFF);
        mask.setCornerRadius(dp(context, 8));
        button.setBackground(new RippleDrawable(ColorStateList.valueOf((color & 0x00FFFFFF) | 0x33000000), null, mask));
        button.setClickable(true);
        button.setFocusable(true);
        return button;
    }

    /**
     * Sends [typed] as a bot token from the login screen's account, or refuses it. Null when it went,
     * else the refusal to show; [answer] hears Telegram's reply on the main thread.
     */
    static String send(Object login, String typed, BotTokenPrompt.Answer answer) {
        String token = typed == null ? "" : typed.trim();
        if (!wellFormed(token)) return refusal(MALFORMED);
        try {
            Telegram host = telegram;
            ClassLoader loader = login.getClass().getClassLoader();
            BotTokenRequest request = new BotTokenRequest(host.apiId(loader), host.apiHash(loader), token);
            host.send(host.account(login), request, callback(host.requestDelegate(), login, answer));
            HookStatus.counted(FamilyNames.BOT_TOKEN_SIGN_IN, "bot sign-in sent");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "send", failure);
            return refusal(null);
        }
    }

    /** Telegram's request callback, answering on the main thread. */
    static Object callback(Class<?> delegate, Object login, BotTokenPrompt.Answer answer) {
        if (delegate == null) throw new IllegalStateException("Telegram's request callback isn't patched in");
        return Proxy.newProxyInstance(delegate.getClassLoader(), new Class<?>[]{delegate}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals": return proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    default: return "HushTelegram bot sign-in";
                }
            }
            Object response = args != null && args.length > 0 ? args[0] : null;
            Object error = args != null && args.length > 1 ? args[1] : null;
            String code = error == null ? null : errorText(error);
            Utils.runOnMainThread(() -> answered(login, response, code, answer));
            return null;
        });
    }

    /**
     * Telegram's answer, on the main thread. An authorization goes to the login screen's own
     * ending while the screen is still there, even if the prompt was closed meanwhile; anything else
     * is a refusal the prompt shows.
     */
    static void answered(Object login, Object response, String code, BotTokenPrompt.Answer answer) {
        try {
            if (response != null && AUTHORIZATION.equals(response.getClass().getName())) {
                Telegram host = telegram;
                Activity screen = host.screen(login);
                if (screen == null || screen.isFinishing()) {
                    HookStatus.counted(FamilyNames.BOT_TOKEN_SIGN_IN, "bot sign-in after the screen closed");
                    return;
                }
                answer.signedIn();
                host.signedIn(login, response);
                HookStatus.counted(FamilyNames.BOT_TOKEN_SIGN_IN, "bot signed in");
                return;
            }
            answer.refused(refusal(response == null ? code : null));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "answered", failure);
        }
    }

    private static String errorText(Object error) {
        try {
            Object text = HostNames.field(error.getClass(), "text").get(error);
            return text instanceof String ? (String) text : null;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "error text", failure);
            return null;
        }
    }

    /** The toast for Telegram's error [code], or for no answer at all when it's null. */
    static String refusal(String code) {
        if (code == null || code.isEmpty()) return L10n.t("Telegram didn't sign the bot in.");
        switch (code) {
            case MALFORMED:
                return L10n.t("That isn't a bot token.");
            case "ACCESS_TOKEN_INVALID":
                return L10n.t("That bot token isn't valid.");
            case "ACCESS_TOKEN_EXPIRED":
                return L10n.t("That bot token was revoked.");
            default:
                break;
        }
        if (code.startsWith(FLOOD_WAIT)) return L10n.f("Wait %1$s seconds, then try again.", code.substring(FLOOD_WAIT.length()));
        if (code.startsWith("API_ID_")) return L10n.t("Telegram refused this app's ID");
        return L10n.f("Telegram refused it: %1$s", code.length() > MAX_CODE ? code.substring(0, MAX_CODE) : code);
    }

    /**
     * Asked with every request just before Telegram sends it. On a bot account, a request a bot
     * can't make (see {@link #EMPTY_ANSWERS}) stays on the phone and its callback gets an empty
     * answer. Everything else, and every request of an ordinary account, goes on as it was. Never
     * throws.
     */
    public static boolean drop(Object connectionsManager, Object request, Object callback) {
        if (request == null || callback == null) return false;
        String answer = EMPTY_ANSWERS.get(request.getClass().getName());
        if (answer == null) return false;
        Object empty;
        try {
            Telegram host = telegram;
            int account = host.accountOf(connectionsManager);
            if (account < 0 || !host.isBot(account)) return false;
            empty = empty(answer, request.getClass().getClassLoader());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "bot request check", failure);
            return false;
        }
        HookStatus.counted(FamilyNames.BOT_TOKEN_SIGN_IN, "bot request answered on the phone");
        try {
            if (!RequestAnswers.success(callback, empty)) {
                HookStatus.missingMember(FamilyNames.BOT_TOKEN_SIGN_IN, "method", callback.getClass().getName(), "run");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "bot request answer", failure);
        }
        return true;
    }

    /** A new [type] with every list Telegram reads from it there and empty. */
    static Object empty(String type, ClassLoader loader) throws ReflectiveOperationException {
        Object empty = Class.forName(type, true, loader).getConstructor().newInstance();
        for (Field field : empty.getClass().getFields()) {
            if (field.getType() == java.util.ArrayList.class && field.get(empty) == null) field.set(empty, new java.util.ArrayList<>());
        }
        return empty;
    }

    /** Whether the switch is on; false while HushTelegram is paused or its settings can't be read. */
    static boolean switchOn() {
        try {
            return Utils.settingsReady() && Settings.BOT_TOKEN_SIGN_IN.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BOT_TOKEN_SIGN_IN, "switch", failure);
            return false;
        }
    }

    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    // Stubs: the patch writes each body for this build of Telegram.

    /** {@code phoneView.<login field>}, the login screen the phone view belongs to. */
    public static Object login(Object phoneView) { return null; }

    /** The login screen's mode field. */
    public static int mode(Object login) { return -1; }

    /** {@code login.getCurrentAccount()}. */
    public static int account(Object login) { return -1; }

    /** {@code org.telegram.tgnet.RequestDelegate}. */
    public static Class<?> requestDelegate() { return null; }

    /** {@code ConnectionsManager.getInstance(account).sendRequest(request, callback, 10)}. */
    public static void sendRequest(int account, Object request, Object callback) { }

    /** Turns contact sync off for the new account, then {@code login.onAuthSuccess(authorization, false)}. */
    public static void signedIn(Object login, Object authorization) { }

    /** {@code UserConfig.getInstance(account).getCurrentUser().bot}. */
    public static boolean isBot(int account) { return false; }
}
