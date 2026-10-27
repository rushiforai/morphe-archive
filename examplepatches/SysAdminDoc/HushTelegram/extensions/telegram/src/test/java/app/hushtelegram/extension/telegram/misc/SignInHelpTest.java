/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import java.security.MessageDigest;
import java.util.Arrays;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowSigningInfo;
import org.telegram.tgnet.TLRPC;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SignInHelpTest {
    /** Stands in for Telegram's screen, which hands out its activity the same way. */
    public static final class Screen {
        private final Activity activity;

        Screen(Activity activity) {
            this.activity = activity;
        }

        public Activity getParentActivity() {
            return activity;
        }
    }

    @Test
    public void onlyTheTwoApiIdRefusalsOnSendCodeAreExplained() throws Exception {
        Object sendCode = new TLRPC.TL_auth_sendCode();
        assertEquals("API_ID_PUBLISHED_FLOOD",
                SignInHelp.refusal(new TLRPC.TL_error(400, "API_ID_PUBLISHED_FLOOD"), sendCode));
        assertEquals("API_ID_INVALID", SignInHelp.refusal(new TLRPC.TL_error(400, "API_ID_INVALID"), sendCode));
        // Telegram's own screen already says these.
        assertNull(SignInHelp.refusal(new TLRPC.TL_error(400, "PHONE_NUMBER_INVALID"), sendCode));
        assertNull(SignInHelp.refusal(new TLRPC.TL_error(420, "FLOOD_WAIT_30"), sendCode));
        // Another request with the same error is left to Telegram.
        assertNull(SignInHelp.refusal(new TLRPC.TL_error(400, "API_ID_PUBLISHED_FLOOD"), new TLRPC.TL_auth_resendCode()));
        assertNull(SignInHelp.refusal(new TLRPC.TL_error(400, null), sendCode));
        assertNull(SignInHelp.refusal(null, sendCode));
        assertNull(SignInHelp.refusal(new TLRPC.TL_error(400, "API_ID_INVALID"), null));
    }

    @Test
    public void aRefusedIdShowsTheMessageAndTelegramsHandlerSkipsItsOwn() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        assertTrue(SignInHelp.explain(new TLRPC.TL_error(400, "API_ID_PUBLISHED_FLOOD"), new Screen(activity),
                new TLRPC.TL_auth_sendCode()));
        Dialog shown = ShadowDialog.getLatestDialog();
        assertNotNull(shown);
        assertTrue(shown.isShowing());
    }

    @Test
    public void anythingElseGoesOnToTelegram() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        assertFalse(SignInHelp.explain(new TLRPC.TL_error(400, "PHONE_NUMBER_BANNED"), new Screen(activity),
                new TLRPC.TL_auth_sendCode()));
        assertNull(ShadowDialog.getLatestDialog());
        // A screen that has already let go of its activity can't show anything, so Telegram decides.
        assertFalse(SignInHelp.explain(new TLRPC.TL_error(400, "API_ID_INVALID"), new Screen(null),
                new TLRPC.TL_auth_sendCode()));
        // Something unexpected in place of the screen never throws into Telegram's handler.
        assertFalse(SignInHelp.explain(new TLRPC.TL_error(400, "API_ID_INVALID"), new Object(),
                new TLRPC.TL_auth_sendCode()));
    }

    @Test
    public void theMessageSaysWhichErrorItWas() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        String flood = SignInHelp.message(activity, "API_ID_PUBLISHED_FLOOD");
        assertTrue(flood, flood.contains("Use registered Telegram API credentials"));
        assertTrue(flood, flood.endsWith("(API_ID_PUBLISHED_FLOOD)"));
        String invalid = SignInHelp.message(activity, "API_ID_INVALID");
        assertTrue(invalid, invalid.contains("Copy both again"));
        assertTrue(invalid, invalid.endsWith("(API_ID_INVALID)"));
    }

    @Test
    public void theGuideOpensTheReadmeSection() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        SignInHelp.openGuide(activity);
        Intent started = Shadows.shadowOf(activity).getNextStartedActivity();
        assertNotNull(started);
        assertEquals(Intent.ACTION_VIEW, started.getAction());
        assertEquals("https://github.com/SysAdminDoc/HushTelegram#your-telegram-account", started.getDataString());
    }

    @After
    public void forgetThePasskeyAnswer() {
        SignInHelp.passkeyCapable = null;
    }

    @Test
    public void passkeysStayOffWhereTelegramSaysNoOrTheInstallCantUseThem() {
        assertFalse(SignInHelp.passkeysWork(0));
        SignInHelp.passkeyCapable = true;
        assertTrue(SignInHelp.passkeysWork(1));
        assertFalse(SignInHelp.passkeysWork(0));
        SignInHelp.passkeyCapable = false;
        assertFalse(SignInHelp.passkeysWork(1));
    }

    @Test
    public void telegramsPackagesAndKeyAreTheOnesItsSiteNames() throws Exception {
        assertEquals(Arrays.asList("org.telegram.messenger", "org.telegram.messenger.web", "org.telegram.messenger.beta"),
                SignInHelp.PASSKEY_PACKAGES);
        assertEquals("49c1522548ebacd46ce322b6fd47f6092bb745d0f88082145caf35e14dcc38e1", SignInHelp.TELEGRAM_SIGNER);
        // This test app isn't one of Telegram's packages, whatever signs it.
        assertFalse(SignInHelp.passkeyCapable(RuntimeEnvironment.getApplication()));
    }

    @Test
    public void onlyTheCurrentSignerCounts() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        Signature telegram = new Signature(new byte[] {1, 2, 3, 4});
        Signature other = new Signature(new byte[] {5, 6, 7, 8});
        install(context, "org.telegram.messenger.web", telegram);
        assertTrue(SignInHelp.signedBy(context, "org.telegram.messenger.web", sha256(telegram)));
        assertFalse(SignInHelp.signedBy(context, "org.telegram.messenger.web", sha256(other)));
        // Re-signed: the same package with another key.
        install(context, "org.telegram.messenger", other);
        assertFalse(SignInHelp.signedBy(context, "org.telegram.messenger", sha256(telegram)));
        // Rotated from Telegram's key to another one: the old key no longer counts.
        install(context, "org.telegram.messenger.beta", telegram, other);
        assertFalse(SignInHelp.signedBy(context, "org.telegram.messenger.beta", sha256(telegram)));
        assertTrue(SignInHelp.signedBy(context, "org.telegram.messenger.beta", sha256(other)));
    }

    @Test
    public void aCheckThatFailsKeepsTelegramsAnswerOnce() {
        Context broken = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override
            public String getPackageName() {
                return "org.telegram.messenger.web";
            }

            @Override
            public PackageManager getPackageManager() {
                throw new IllegalStateException("package manager gone");
            }
        };
        assertTrue(SignInHelp.learnPasskeys(broken));
        assertEquals(Boolean.TRUE, SignInHelp.passkeyCapable);
        // Later reads take the kept answer and never ask again.
        assertTrue(SignInHelp.passkeysWork(1));
        assertFalse(SignInHelp.passkeysWork(0));
    }

    /** Installs {@code name} signed with {@code history}, oldest key first, as Android lists it. */
    private static void install(Context context, String name, Signature... history) {
        SigningInfo signing = Shadow.newInstanceOf(SigningInfo.class);
        ShadowSigningInfo shadow = Shadow.extract(signing);
        shadow.setSignatures(new Signature[] {history[history.length - 1]});
        if (history.length > 1) shadow.setPastSigningCertificates(history);
        PackageInfo info = new PackageInfo();
        info.packageName = name;
        info.signingInfo = signing;
        Shadows.shadowOf(context.getPackageManager()).installPackage(info);
    }

    private static String sha256(Signature signature) throws Exception {
        StringBuilder hex = new StringBuilder();
        for (byte b : MessageDigest.getInstance("SHA-256").digest(signature.toByteArray())) hex.append(String.format("%02x", b));
        return hex.toString();
    }
}
