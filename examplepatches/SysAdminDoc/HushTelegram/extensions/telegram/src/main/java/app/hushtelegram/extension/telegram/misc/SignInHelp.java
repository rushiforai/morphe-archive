/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.net.Uri;
import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.ui.CustomDialog;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.List;

/**
 * Says why sign-in stopped when Telegram refuses the app's API ID. Telegram 13's phone screen
 * names a few sendCode errors itself and hands the rest to its general error handler, which has no
 * case for sendCode, so API_ID_PUBLISHED_FLOOD (the API ID built into the app refused) left the
 * screen sitting there with nothing said (issues #3 and #11). Only those two errors on sendCode
 * get the message; everything else goes on to Telegram's handler as before.
 *
 * <p>It also keeps passkeys out of sight where they can't work. Android hands a telegram.org passkey
 * only to an app that site names in its assetlinks.json: Telegram's own package names signed with
 * Telegram's key. A patched APK signed with any other key gets nothing from the passkey prompt, so
 * {@link #passkeysWork} answers no there and Telegram hides its passkey row, its "set up a passkey"
 * banner and the passkey step at sign-in, the way it does on its own forks. Saved passkeys, sessions,
 * 2FA and the code and password routes are untouched. An install that kept Telegram's signature
 * (a root mount) keeps passkeys.
 *
 * <p>It works while HushTelegram is paused too. The credentials patches it points at keep their
 * values through Pause, and a message is all it adds. The passkey check reads no setting either:
 * what decides it is the install's signature, which Pause doesn't change.
 */
public final class SignInHelp {
    static final String GUIDE_URL = "https://github.com/SysAdminDoc/HushTelegram#your-telegram-account";
    /** Where to go by hand, without the section, so the toast stays inside two lines. */
    static final String GUIDE_ADDRESS = GUIDE_URL.substring(GUIDE_URL.indexOf("://") + 3, GUIDE_URL.indexOf('#'));
    static final String SEND_CODE = "org.telegram.tgnet.TLRPC$TL_auth_sendCode";
    static final String PUBLISHED_FLOOD = "API_ID_PUBLISHED_FLOOD";
    static final String INVALID = "API_ID_INVALID";
    /** The packages telegram.org's assetlinks.json lets use its passkeys (Telegram X has its own key). */
    static final List<String> PASSKEY_PACKAGES =
            Arrays.asList("org.telegram.messenger", "org.telegram.messenger.web", "org.telegram.messenger.beta");
    /** SHA-256 of the signing certificate telegram.org's assetlinks.json names for those packages. */
    static final String TELEGRAM_SIGNER = "49c1522548ebacd46ce322b6fd47f6092bb745d0f88082145caf35e14dcc38e1";

    /** Whether this install can use passkeys, worked out once per process. Package-visible for tests. */
    @Nullable
    static volatile Boolean passkeyCapable;

    private SignInHelp() {}

    /**
     * Hooked after every read of Telegram's BuildVars.SUPPORTS_PASSKEYS and after the chat list's check
     * for the SETUP_PASSKEY suggestion, with what Telegram read (an int, as the patches pass a boolean
     * register). Yes only when Telegram said yes and this install can use telegram.org passkeys.
     */
    public static boolean passkeysWork(int telegramSaid) {
        if (telegramSaid == 0) return false;
        Boolean known = passkeyCapable;
        if (known != null) return known;
        Context context = Utils.getContext();
        // Before the app has started there's nothing to check against; Telegram's answer stands.
        return context == null || learnPasskeys(context);
    }

    /**
     * Works out whether passkeys can work here and keeps the answer for the rest of the process. A
     * check that fails keeps Telegram's yes, once, rather than asking the package manager on every read.
     */
    static boolean learnPasskeys(Context context) {
        boolean capable;
        try {
            capable = passkeyCapable(context);
            if (!capable) Logger.printInfo(() -> "Passkeys stay hidden: this install isn't signed with Telegram's key");
        } catch (Throwable failure) {
            Logger.printException(() -> "Couldn't check whether passkeys can work here, so Telegram's answer stands", failure);
            capable = true;
        }
        passkeyCapable = capable;
        return capable;
    }

    static boolean passkeyCapable(Context context) throws Exception {
        String name = context.getPackageName();
        return PASSKEY_PACKAGES.contains(name) && signedBy(context, name, TELEGRAM_SIGNER);
    }

    /**
     * Whether {@code packageName} is signed now with the certificate whose SHA-256 is {@code sha256}, in
     * lowercase hex. Only the current signers count, the ones Android checks against assetlinks.json.
     */
    static boolean signedBy(Context context, String packageName, String sha256) throws Exception {
        SigningInfo signing = context.getPackageManager()
                .getPackageInfo(packageName, PackageManager.GET_SIGNING_CERTIFICATES).signingInfo;
        if (signing == null) return false;
        Signature[] signers = signing.hasMultipleSigners() ? signing.getApkContentsSigners() : signing.getSigningCertificateHistory();
        if (signers == null || signers.length == 0) return false;
        // One signer's history runs from the first key to the current one, which is last.
        if (!signing.hasMultipleSigners()) signers = new Signature[] {signers[signers.length - 1]};
        for (Signature signer : signers) {
            StringBuilder hex = new StringBuilder();
            for (byte b : MessageDigest.getInstance("SHA-256").digest(signer.toByteArray())) hex.append(String.format("%02x", b));
            if (hex.toString().equals(sha256)) return true;
        }
        return false;
    }

    /**
     * Hooked at the start of Telegram's error handler with its error, screen and request. True when
     * this showed the message, and the handler then returns without its own.
     */
    public static boolean explain(Object error, Object fragment, Object request) {
        try {
            String code = refusal(error, request);
            if (code == null) return false;
            Activity activity = (Activity) fragment.getClass().getMethod("getParentActivity").invoke(fragment);
            if (activity == null || activity.isFinishing()) return false;
            show(activity, code);
            Logger.printInfo(() -> "Explained a sign-in refusal: " + code);
            return true;
        } catch (Throwable failure) {
            Logger.printException(() -> "Couldn't explain a sign-in refusal", failure);
            return false;
        }
    }

    /** The error name this explains, or null for any other error or request. */
    @Nullable
    static String refusal(Object error, Object request) throws ReflectiveOperationException {
        if (error == null || request == null || !SEND_CODE.equals(request.getClass().getName())) return null;
        Object text = error.getClass().getField("text").get(error);
        if (!(text instanceof String)) return null;
        if (((String) text).contains(PUBLISHED_FLOOD)) return PUBLISHED_FLOOD;
        if (((String) text).contains(INVALID)) return INVALID;
        return null;
    }

    static String message(Context context, String code) {
        String reason = PUBLISHED_FLOOD.equals(code)
                ? L10n.t(context, "Telegram turned down the API ID this app signs in with, so no login code was sent."
                        + " Patch HushTelegram again with Use registered Telegram API credentials and your own ID from"
                        + " my.telegram.org/apps. The guide walks you through it.")
                : L10n.t(context, "Telegram didn't accept the API ID and hash this app was patched with, so no login"
                        + " code was sent. Copy both again from my.telegram.org/apps and patch once more.");
        return reason + "\n\n(" + code + ")";
    }

    private static void show(Activity activity, String code) {
        CustomDialog.create(activity, L10n.t(activity, "Telegram refused this app's ID"), message(activity, code),
                null, L10n.t(activity, "Open the guide"), () -> openGuide(activity), () -> { },
                null, null, false).first.show();
    }

    static void openGuide(Context context) {
        try {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(GUIDE_URL))
                    .addCategory(Intent.CATEGORY_BROWSABLE));
        } catch (ActivityNotFoundException | SecurityException missing) {
            // No browser, or none switched on. Uncaught, Android's exception closed Telegram.
            Logger.printInfo(() -> "No app opened the sign-in guide");
            Utils.showToastLong(L10n.f(context, "Can't open the link. Go to %1$s.", GUIDE_ADDRESS));
        }
    }
}
