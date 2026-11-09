/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Space;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.BotTokenPrompt;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowLooper;
import org.telegram.messenger.BuildVars;
import org.telegram.tgnet.OutputSerializedData;
import org.telegram.tgnet.RequestDelegate;
import org.telegram.tgnet.TLRPC;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BotSignInTest {
    /** A made-up token with a real one's shape. No bot has it. */
    private static final String SECRET = "AAFakeTokenForTestsOnly_0123456789-";
    private static final String TOKEN = "123456:" + SECRET;
    private static final String HASH = "0123456789abcdef0123456789abcdef";
    private static final int API_ID = 4242;
    private static final int BOT_ACCOUNT = 3;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private FakeTelegram telegram;
    private List<String> heard;

    @Before public void reset() {
        restore();
        telegram = new FakeTelegram();
        BotSignIn.telegram = telegram;
        heard = new ArrayList<>();
        telegram.events = heard;
        ShadowLog.clear();
    }

    @After public void restore() {
        BotSignIn.telegram = BotSignIn.PATCHED;
        BuildVars.APP_ID = 0;
        BuildVars.APP_HASH = null;
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.BOT_TOKEN_SIGN_IN);
        Settings.BOT_TOKEN_SIGN_IN.resetToDefault();
        HookStatus.clear();
    }

    @Test public void onlyATokensShapeIsSent() {
        assertEquals("the secret is a token's length", BotSignIn.SECRET_LENGTH, SECRET.length());
        assertTrue(BotSignIn.wellFormed(TOKEN));
        assertTrue("a 19 digit id", BotSignIn.wellFormed("1234567890123456789:" + SECRET));
        assertTrue("letters, digits, _ and - in any order", BotSignIn.wellFormed("7:" + "-_zZ09" + SECRET.substring(6)));
        String accented = SECRET.substring(0, 34) + (char) 0x00E9;
        for (String typed : new String[]{null, "", TOKEN.substring(0, TOKEN.length() - 1), TOKEN + "A", ":" + SECRET,
                "12345678901234567890:" + SECRET, "abc:" + SECRET, "-1:" + SECRET, "12 3:" + SECRET, "123:" + accented,
                "123:" + SECRET.replace('_', '.'), "123:" + SECRET.replace('A', ' '), "123:" + SECRET.substring(1) + ":",
                "123;" + SECRET, " " + TOKEN, TOKEN + "\n"}) {
            assertFalse(String.valueOf(typed), BotSignIn.wellFormed(typed));
        }
    }

    @Test public void theRequestWritesWhatTelegramSendsForABotSignIn() {
        Recording stream = new Recording();
        BotTokenRequest request = new BotTokenRequest(API_ID, HASH, TOKEN);
        request.write(stream);
        assertEquals(Arrays.<Object>asList(0x67a3ff2c, 0, API_ID, HASH, TOKEN), stream.written);
        // Telegram measures a request and then writes it, and each pass writes the same bytes.
        request.write(stream);
        assertEquals(10, stream.written.size());
        assertEquals(stream.written.subList(0, 5), stream.written.subList(5, 10));
        assertEquals("auth.importBotAuthorization", request.toString());
        assertTrue(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
    }

    @Test public void aStreamThatFailsKeepsTheTokenOutOfTheReport() {
        Recording stream = new Recording();
        stream.failure = new IllegalStateException("couldn't write " + TOKEN);
        new BotTokenRequest(API_ID, HASH, TOKEN).write(stream);
        assertFalse(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
        assertNothingHolds(SECRET);
    }

    @Test public void theApiIdAndHashAreTheAppsOwnAtSignIn() throws Exception {
        BuildVars.APP_ID = API_ID;
        BuildVars.APP_HASH = HASH;
        ClassLoader loader = getClass().getClassLoader();
        assertEquals(API_ID, BotSignIn.PATCHED.apiId(loader));
        assertEquals(HASH, BotSignIn.PATCHED.apiHash(loader));
        // Read again each time, since the API ID patch sets them where Telegram does.
        BuildVars.APP_ID = 17;
        assertEquals(17, BotSignIn.PATCHED.apiId(loader));
    }

    @Test public void theLoginScreensActivityIsAskedForEachAnswer() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Login login = new Login();
            login.activity = controller.get();
            assertSame(controller.get(), BotSignIn.PATCHED.screen(login));
            login.activity = null;
            assertNull(BotSignIn.PATCHED.screen(login));
            assertTrue(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
            assertNull("a screen without the method is gone", BotSignIn.PATCHED.screen(new Object()));
            assertFalse(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
        }
    }

    @Test public void aWellFormedTokenGoesOutFromTheScreensAccount() {
        Object login = new Login();
        assertNull(BotSignIn.send(login, "  " + TOKEN + "\n", heard()));
        assertEquals(1, telegram.sent.size());
        Sent sent = telegram.sent.get(0);
        assertEquals("the account the login screen signs in", 2, sent.account);
        assertSame(login, telegram.accountAskedOf);
        BotTokenRequest request = (BotTokenRequest) sent.request;
        assertEquals(API_ID, request.apiId);
        assertEquals(HASH, request.apiHash);
        assertEquals("the typed spaces stay behind", TOKEN, request.token);
        assertTrue(sent.callback instanceof RequestDelegate);
        assertFalse("the callback's name holds nothing of the token", sent.callback.toString().contains(SECRET));
        assertTrue("nothing is heard until Telegram answers", heard.isEmpty());
    }

    @Test public void aMalformedTokenIsRefusedWithoutSending() {
        for (String typed : new String[]{null, "", "123:abc", TOKEN + "A"}) {
            assertEquals(String.valueOf(typed), "That isn't a bot token.", BotSignIn.send(new Login(), typed, heard()));
        }
        assertTrue(telegram.sent.isEmpty());
        assertTrue(heard.isEmpty());
    }

    @Test public void aSendThatFailsIsRefusedAndKeepsTheTokenOutOfTheReport() {
        telegram.sendFailure = new IllegalStateException("couldn't send " + TOKEN);
        assertEquals("Telegram didn't sign the bot in.", BotSignIn.send(new Login(), TOKEN, heard()));
        telegram.sendFailure = null;
        telegram.delegate = null;
        assertEquals("a build without the callback type refuses too",
                "Telegram didn't sign the bot in.", BotSignIn.send(new Login(), TOKEN, heard()));
        assertTrue(telegram.sent.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
        assertNothingHolds(SECRET);
    }

    @Test public void aSignInAnswerGoesToTheLoginScreensOwnEnding() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            telegram.screen = controller.get();
            Object login = new Login();
            assertNull(BotSignIn.send(login, TOKEN, heard()));
            TLRPC.TL_auth_authorization authorization = new TLRPC.TL_auth_authorization();
            delegate(0).run(authorization, null);
            assertTrue("Telegram answers on its network thread, so the screen hears it on the main one", heard.isEmpty());
            ShadowLooper.idleMainLooper();
            assertEquals(Arrays.asList("prompt closed", "telegram signed in"), heard);
            assertSame(login, telegram.signedInLogin);
            assertSame(authorization, telegram.signedInWith);
        }
        assertNothingHolds(SECRET);
    }

    @Test public void aSignInAfterTheScreenClosedIsLeftAlone() {
        assertNull(BotSignIn.send(new Login(), TOKEN, heard()));
        delegate(0).run(new TLRPC.TL_auth_authorization(), null);
        ShadowLooper.idleMainLooper();
        assertTrue(heard.isEmpty());

        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            controller.get().finish();
            telegram.screen = controller.get();
            assertNull(BotSignIn.send(new Login(), TOKEN, heard()));
            delegate(1).run(new TLRPC.TL_auth_authorization(), null);
            ShadowLooper.idleMainLooper();
            assertTrue(heard.isEmpty());
        }
        assertNull(telegram.signedInWith);
    }

    @Test public void telegramsErrorsBecomeShortRefusals() {
        assertNull(BotSignIn.send(new Login(), TOKEN, heard()));
        RequestDelegate callback = delegate(0);
        callback.run(null, new TLRPC.TL_error(401, "ACCESS_TOKEN_INVALID"));
        callback.run(null, new TLRPC.TL_error(401, "ACCESS_TOKEN_EXPIRED"));
        callback.run(null, new TLRPC.TL_error(420, "FLOOD_WAIT_30"));
        callback.run(null, new TLRPC.TL_error(400, "API_ID_PUBLISHED_FLOOD"));
        callback.run(null, new TLRPC.TL_error(400, "SOMETHING_TELEGRAM_ADDED_LATER_AND_LONGER"));
        callback.run(null, new TLRPC.TL_error(500, null));
        callback.run(null, null);
        callback.run(new TLRPC.TL_boolTrue(), null);
        ShadowLooper.idleMainLooper();
        assertEquals(Arrays.asList(
                "refused: That bot token isn't valid.",
                "refused: That bot token was revoked.",
                "refused: Wait 30 seconds, then try again.",
                "refused: Telegram refused this app's ID",
                "refused: Telegram refused it: SOMETHING_TELEGRAM_ADDED_LAT",
                "refused: Telegram didn't sign the bot in.",
                "refused: Telegram didn't sign the bot in.",
                "refused: Telegram didn't sign the bot in."), heard);
        assertNull(telegram.signedInWith);
    }

    @Test public void everyRefusalWrapsIntoTwoShortLinesInEveryLanguage() {
        String longCode = "ABCDEFGHIJ_KLMNOPQRST_UVWXYZ";
        assertEquals(BotSignIn.MAX_CODE, longCode.length());
        String[][] refusals = {
                {"Telegram didn't sign the bot in.", null},
                {"That isn't a bot token.", null},
                {"That bot token isn't valid.", null},
                {"That bot token was revoked.", null},
                {"Wait %1$s seconds, then try again.", "86400"},
                {"Telegram refused this app's ID", null},
                {"Telegram refused it: %1$s", longCode},
        };
        String[] codes = {null, BotSignIn.MALFORMED, "ACCESS_TOKEN_INVALID", "ACCESS_TOKEN_EXPIRED", "FLOOD_WAIT_86400",
                "API_ID_INVALID", longCode + "_AND_MORE"};
        for (int i = 0; i < refusals.length; i++) {
            String english = refusals[i][1] == null ? refusals[i][0] : String.format(Locale.ROOT, refusals[i][0], refusals[i][1]);
            assertEquals(english, BotSignIn.refusal(codes[i]));
            assertFitsATwoLineToast("en", english);
            for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr"}) {
                Map<String, String> table = L10nTablesForTests.of(language);
                String row = table.get(refusals[i][0]);
                assertNotNull(language + " translates " + refusals[i][0], row);
                assertFitsATwoLineToast(language, refusals[i][1] == null ? row : String.format(Locale.ROOT, row, refusals[i][1]));
            }
        }
    }

    @Test public void aBotsRequestsItCantMakeAreAnsweredEmptyOnThePhone() throws Exception {
        telegram.bot = true;
        Object connections = new Object();
        for (Map.Entry<String, String> pair : BotSignIn.EMPTY_ANSWERS.entrySet()) {
            Object request = Class.forName(pair.getKey()).getConstructor().newInstance();
            Answers answers = new Answers();
            assertTrue(pair.getKey(), BotSignIn.drop(connections, request, answers));
            assertEquals(pair.getKey(), 1, answers.responses.size());
            Object response = answers.responses.get(0);
            assertEquals(pair.getValue(), response.getClass().getName());
            assertNull(answers.errors.get(0));
            int lists = 0;
            for (Field field : response.getClass().getFields()) {
                if (field.getType() != ArrayList.class) continue;
                lists++;
                assertTrue(field.getName() + " is there and empty", ((ArrayList<?>) field.get(response)).isEmpty());
            }
            assertTrue(pair.getValue() + " carries lists", lists > 0);
        }
        assertSame(connections, telegram.managerAsked);
        assertTrue(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
    }

    @Test public void aBotStaysUsableWithTheSwitchOffOrPaused() {
        telegram.bot = true;
        assertFalse(Settings.BOT_TOKEN_SIGN_IN.get());
        assertTrue(BotSignIn.drop(new Object(), new TLRPC.TL_messages_getDialogs(), new Answers()));
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertTrue(reason.name(), BotSignIn.drop(new Object(), new TLRPC.TL_messages_getHistory(), new Answers()));
            PauseForTests.resume();
        }
    }

    @Test public void everyOtherRequestGoesOutAsItWas() {
        Answers answers = new Answers();
        assertFalse("an ordinary account", BotSignIn.drop(new Object(), new TLRPC.TL_messages_getDialogs(), answers));
        telegram.bot = true;
        assertFalse("a request a bot can make", BotSignIn.drop(new Object(), new TLRPC.TL_auth_sendCode(), answers));
        assertFalse("no request", BotSignIn.drop(new Object(), null, answers));
        assertFalse("no callback", BotSignIn.drop(new Object(), new TLRPC.TL_messages_getDialogs(), null));
        telegram.managerAccount = -1;
        assertFalse("a manager that belongs to no account", BotSignIn.drop(new Object(), new TLRPC.TL_messages_getDialogs(), answers));
        telegram.managerAccount = BOT_ACCOUNT;
        assertTrue(answers.responses.isEmpty());
        assertTrue(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());

        telegram.botFailure = new IllegalStateException("no user yet");
        assertFalse("an account it can't read", BotSignIn.drop(new Object(), new TLRPC.TL_messages_getDialogs(), answers));
        assertTrue(answers.responses.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
    }

    @Test public void aCallbackWithoutTelegramsRunIsReportedButStillHeld() {
        telegram.bot = true;
        assertTrue("the request still stays on the phone, so the server never refuses it",
                BotSignIn.drop(new Object(), new TLRPC.TL_contacts_getContacts(), new Object()));
        assertFalse(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
    }

    @Test public void thePhoneScreenGetsTheButtonAboveItsSpacer() {
        Settings.BOT_TOKEN_SIGN_IN.save(true);
        LinearLayout screen = phoneScreen(RuntimeEnvironment.getApplication());
        Space spacer = new Space(screen.getContext());
        screen.addView(spacer);
        BotSignIn.phoneScreen(screen);
        assertEquals(3, screen.getChildCount());
        TextView button = (TextView) screen.getChildAt(1);
        assertEquals(BotSignIn.TAG, button.getTag());
        assertEquals("Sign in with a bot token", button.getText().toString());
        assertSame(spacer, screen.getChildAt(2));
        assertEquals(android.widget.Button.class.getName(), button.getAccessibilityClassName());
        BotSignIn.phoneScreen(screen);
        assertEquals("a second run adds nothing", 3, screen.getChildCount());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.BOT_TOKEN_SIGN_IN));

        LinearLayout plain = phoneScreen(RuntimeEnvironment.getApplication());
        BotSignIn.phoneScreen(plain);
        assertEquals(2, plain.getChildCount());
        assertEquals(BotSignIn.TAG, plain.getChildAt(1).getTag());
    }

    @Test public void theButtonStaysOffEveryOtherScreen() {
        assertNoButton("the switch is off", phoneScreen(RuntimeEnvironment.getApplication()));
        Settings.BOT_TOKEN_SIGN_IN.save(true);
        telegram.mode = 1;
        assertNoButton("changing a number", phoneScreen(RuntimeEnvironment.getApplication()));
        telegram.mode = BotSignIn.SIGN_IN_MODE;
        telegram.login = null;
        assertNoButton("no login screen", phoneScreen(RuntimeEnvironment.getApplication()));
        telegram.login = new Login();
        LinearLayout across = phoneScreen(RuntimeEnvironment.getApplication());
        across.setOrientation(LinearLayout.HORIZONTAL);
        assertNoButton("a row", across);
        FrameLayout other = new FrameLayout(RuntimeEnvironment.getApplication());
        BotSignIn.phoneScreen(other);
        assertEquals(0, other.getChildCount());
        BotSignIn.phoneScreen(null);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertNoButton(reason.name(), phoneScreen(RuntimeEnvironment.getApplication()));
            PauseForTests.resume();
        }
        assertTrue(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
    }

    @Test public void theSwitchIsOfferedOnlyWhileItCanBeRead() {
        assertFalse(BotSignIn.offered(BotSignIn.SIGN_IN_MODE));
        Settings.BOT_TOKEN_SIGN_IN.save(true);
        assertTrue(BotSignIn.offered(BotSignIn.SIGN_IN_MODE));
        assertFalse(BotSignIn.offered(1));
        assertFalse(BotSignIn.offered(2));
        SettingsContextRule.withoutContext(() -> assertFalse(BotSignIn.offered(BotSignIn.SIGN_IN_MODE)));
        SettingReadsForTests.breakReads(Settings.BOT_TOKEN_SIGN_IN);
        assertFalse(BotSignIn.offered(BotSignIn.SIGN_IN_MODE));
        assertFalse(HookStatus.missing(FamilyNames.BOT_TOKEN_SIGN_IN).isEmpty());
    }

    @Test public void theButtonOpensThePromptAndASignInClosesIt() {
        Settings.BOT_TOKEN_SIGN_IN.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            telegram.screen = activity;
            LinearLayout screen = phoneScreen(activity);
            activity.setContentView(screen);
            BotSignIn.phoneScreen(screen);
            screen.findViewWithTag(BotSignIn.TAG).performClick();
            ShadowLooper.idleMainLooper();
            AlertDialog prompt = ShadowAlertDialog.getLatestAlertDialog();
            assertTrue(prompt.isShowing());
            EditText field = prompt.findViewById(android.R.id.edit);
            field.setText("123:short");
            prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            assertTrue(telegram.sent.isEmpty());
            assertTrue(prompt.isShowing());

            field.setText(TOKEN);
            prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            assertEquals(1, telegram.sent.size());
            assertEquals(TOKEN, ((BotTokenRequest) telegram.sent.get(0).request).token);
            delegate(0).run(null, new TLRPC.TL_error(401, "ACCESS_TOKEN_INVALID"));
            ShadowLooper.idleMainLooper();
            assertTrue("a refused token keeps the prompt", prompt.isShowing());
            assertEquals(TOKEN, field.getText().toString());
            assertTrue(prompt.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());

            prompt.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            TLRPC.TL_auth_authorization authorization = new TLRPC.TL_auth_authorization();
            delegate(1).run(authorization, null);
            ShadowLooper.idleMainLooper();
            assertFalse(prompt.isShowing());
            assertSame(authorization, telegram.signedInWith);
        }
        assertNothingHolds(SECRET);
    }

    private BotTokenPrompt.Answer heard() {
        return new BotTokenPrompt.Answer() {
            @Override public void signedIn() { heard.add("prompt closed"); }
            @Override public void refused(String refused) { heard.add("refused: " + refused); }
        };
    }

    private RequestDelegate delegate(int index) {
        return (RequestDelegate) telegram.sent.get(index).callback;
    }

    private static LinearLayout phoneScreen(android.content.Context context) {
        LinearLayout screen = new LinearLayout(context);
        screen.setOrientation(LinearLayout.VERTICAL);
        screen.addView(new TextView(context));
        return screen;
    }

    private static void assertNoButton(String why, LinearLayout screen) {
        int before = screen.getChildCount();
        BotSignIn.phoneScreen(screen);
        assertEquals(why, before, screen.getChildCount());
        assertNull(why, screen.findViewWithTag(BotSignIn.TAG));
    }

    /** Neither the diagnostic report nor anything logged holds [text]. */
    private static void assertNothingHolds(String text) {
        assertFalse(String.join("\n", HookStatus.report()).contains(text));
        for (ShadowLog.LogItem item : ShadowLog.getLogs()) {
            assertFalse(item.tag + ": " + item.msg, String.valueOf(item.msg).contains(text));
            assertFalse(item.tag, item.throwable != null && String.valueOf(item.throwable.getMessage()).contains(text));
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }

    /** The phone screen's login screen, with the activity Telegram's fragments hand out. */
    public static final class Login {
        Activity activity;

        public Activity getParentActivity() {
            return activity;
        }
    }

    private static final class Sent {
        final int account;
        final Object request;
        final Object callback;

        Sent(int account, Object request, Object callback) {
            this.account = account;
            this.request = request;
            this.callback = callback;
        }
    }

    /** Telegram as the stubs reach it, recording what it was asked. */
    private static final class FakeTelegram implements BotSignIn.Telegram {
        Object login = new Login();
        int mode = BotSignIn.SIGN_IN_MODE;
        Class<?> delegate = RequestDelegate.class;
        Activity screen;
        boolean bot;
        int managerAccount = BOT_ACCOUNT;
        RuntimeException sendFailure;
        RuntimeException botFailure;
        final List<Sent> sent = new ArrayList<>();
        Object accountAskedOf;
        Object managerAsked;
        Object signedInLogin;
        Object signedInWith;
        List<String> events;

        @Override public Object login(Object phoneView) { return login; }
        @Override public int mode(Object login) { return mode; }

        @Override public int account(Object login) {
            accountAskedOf = login;
            return 2;
        }

        @Override public Class<?> requestDelegate() { return delegate; }

        @Override public void send(int account, Object request, Object callback) {
            if (sendFailure != null) throw sendFailure;
            sent.add(new Sent(account, request, callback));
        }

        @Override public void signedIn(Object login, Object authorization) {
            signedInLogin = login;
            signedInWith = authorization;
            if (events != null) events.add("telegram signed in");
        }

        @Override public boolean isBot(int account) {
            if (botFailure != null) throw botFailure;
            return bot && account == BOT_ACCOUNT;
        }

        @Override public int accountOf(Object connectionsManager) {
            managerAsked = connectionsManager;
            return managerAccount;
        }

        @Override public int apiId(ClassLoader loader) { return API_ID; }
        @Override public String apiHash(ClassLoader loader) { return HASH; }
        @Override public Activity screen(Object login) { return screen; }
    }

    /** Telegram's request callback, keeping what it was handed. */
    private static final class Answers implements RequestDelegate {
        final List<Object> responses = new ArrayList<>();
        final List<Object> errors = new ArrayList<>();

        @Override public void run(Object response, TLRPC.TL_error error) {
            responses.add(response);
            errors.add(error);
        }
    }

    /** Telegram's output stream, keeping each value in the order it was written. */
    private static final class Recording implements OutputSerializedData {
        final List<Object> written = new ArrayList<>();
        RuntimeException failure;

        @Override public void writeInt32(int value) {
            if (failure != null) throw failure;
            written.add(value);
        }

        @Override public void writeString(String value) {
            if (failure != null) throw failure;
            written.add(value);
        }
    }
}
