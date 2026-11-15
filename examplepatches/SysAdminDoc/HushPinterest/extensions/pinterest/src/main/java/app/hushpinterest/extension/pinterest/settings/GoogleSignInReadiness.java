/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * Says why Google sign-in didn't start on a build that sends it to microG-RE. androidx turns every
 * failed request to microG-RE's sign-in service into "no credential", and Pinterest's landing screen
 * shows nothing for that error, so a phone that can't reach microG-RE just sees a button that does
 * nothing. The hook tells the user once and notes a fixed category for the report. It never retries,
 * and no account name, token or exception message reaches a line here.
 */
public final class GoogleSignInReadiness implements LogBufferManager.ReportSection {
    static final GoogleSignInReadiness REPORT = new GoogleSignInReadiness();
    private static final String SIGN_IN_SERVICE = PushReadiness.GMS_CORE + ".auth.api.identity.service.signin.START";
    private static final String SPOOF_METADATA = PushReadiness.GMS_CORE + ".SPOOFED_PACKAGE_SIGNATURE";
    private static final String SPOOF_PACKAGE_METADATA = PushReadiness.GMS_CORE + ".SPOOFED_PACKAGE_NAME";
    private static final String PINTEREST_PACKAGE = "com.pinterest";
    private static final int STATUS_CANCELED = 16;
    private static final String NO_REQUEST = "none this launch";
    /** The credential type of Sign in with Google's options, both the ID token and the button's. */
    static final String GOOGLE_ID_TOKEN = "com.google.android.libraries.identity.googleid.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL";

    /** What the last failed request came to since launch. Tests put it back through this field. */
    static volatile String lastRequest = NO_REQUEST;

    /** microG-RE as Android sees it, for the message and the report. */
    private enum MicroG { MISSING, DISABLED, ENABLED, UNKNOWN }

    private GoogleSignInReadiness() { }

    /** Placed at the head of androidx's failure listener for the Sign in with Google request. */
    public static void requestFailed(Exception failure) {
        HookStatus.invoked(FamilyNames.GMS_CORE_SUPPORT);
        try {
            if (!PushReadiness.gmsCore()) return;
            int status = statusOf(failure);
            lastRequest = "failed " + category(status);
            HookStatus.counted(FamilyNames.GMS_CORE_SUPPORT, "Google sign-in request failed");
            if (status == STATUS_CANCELED) return;
            Context context = Utils.getContext();
            Utils.showToastLong(message(context == null ? MicroG.UNKNOWN : microG(context)));
        } catch (Throwable problem) {
            HookStatus.threw(FamilyNames.GMS_CORE_SUPPORT, "sign-in failure", problem);
        }
    }

    /**
     * Placed first in androidx Credential Manager's framework provider, which answers unavailable
     * when this is true. While microG-RE is installed the provider steps aside, because Android
     * hands Google's requests to Google's own Play services, and androidx falls back to the Play
     * services provider the patch points at microG-RE. Without microG-RE the provider answers for
     * itself, so a password manager can still offer a saved login. A request that asks only for a
     * Google ID token never gets this far: {@link #isGoogleIdOption} sends it to microG-RE first. One
     * that mixes a Google ID option with a password, Pinterest's offer on the login screen, still
     * comes here, so its Google half goes to the phone's own Play services, which turns a re-signed
     * build away. Before the settings are ready, or when Android can't say, it steps aside as the
     * patch always had it. A build without GmsCore support leaves the provider alone.
     */
    public static boolean signsInThroughMicroG() {
        HookStatus.invoked(FamilyNames.GMS_CORE_SUPPORT);
        try {
            if (!PushReadiness.gmsCore()) return false;
            if (!Utils.settingsReady()) return true;
            Context context = Utils.getContext();
            if (context == null || microG(context) != MicroG.MISSING) return true;
            HookStatus.counted(FamilyNames.GMS_CORE_SUPPORT, "Android's credential provider kept without microG-RE");
            return false;
        } catch (Throwable problem) {
            HookStatus.threw(FamilyNames.GMS_CORE_SUPPORT, "credential provider", problem);
            return true;
        }
    }

    /**
     * Placed in androidx Credential Manager's provider choice, once for each option of a request,
     * with the option's credential type. When every option asks for a Google ID token, androidx
     * sends the request straight to the Play services provider, which the patch points at
     * microG-RE: Continue with Google signs in there, and without microG-RE it fails into
     * {@link #requestFailed}, which says to install it. Anything else, a password or a passkey
     * among them, keeps Android's own provider. A build without GmsCore support answers false.
     */
    public static boolean isGoogleIdOption(@Nullable String type) {
        HookStatus.invoked(FamilyNames.GMS_CORE_SUPPORT);
        try {
            if (!PushReadiness.gmsCore() || !GOOGLE_ID_TOKEN.equals(type)) return false;
            // Counted per option: a later option that isn't Google's still keeps the request on
            // Android's own provider, so this counts what the choice saw, not where it went.
            HookStatus.counted(FamilyNames.GMS_CORE_SUPPORT, "Google sign-in option in a credential request");
            return true;
        } catch (Throwable problem) {
            HookStatus.threw(FamilyNames.GMS_CORE_SUPPORT, "credential option", problem);
            return false;
        }
    }

    /**
     * The status code from an ApiException's "code: text" message, or -1. Only the leading digits are
     * read, because the text can carry private context.
     */
    static int statusOf(@Nullable Exception failure) {
        String text = failure == null ? null : failure.getMessage();
        if (text == null) return -1;
        int colon = text.indexOf(':');
        if (colon < 1 || colon > 4) return -1;
        int status = 0;
        for (int at = 0; at < colon; at++) {
            char digit = text.charAt(at);
            if (digit < '0' || digit > '9') return -1;
            status = status * 10 + (digit - '0');
        }
        return status;
    }

    /** A fixed name for a Play services status code, so nothing the service sent reaches the report. */
    static String category(int status) {
        switch (status) {
            case 1: return "service_missing";
            case 2: return "update_required";
            case 3: return "service_disabled";
            case 7: return "network";
            case 8: return "internal";
            case 9: return "service_invalid";
            case 10: return "developer_error";
            case 13: return "error";
            case 14: return "interrupted";
            case 15: return "timeout";
            case STATUS_CANCELED: return "canceled";
            case 17: return "api_unavailable";
            case 19: return "remote_exception";
            default: return "other";
        }
    }

    private static String message(MicroG state) {
        switch (state) {
            case MISSING: return L10n.t("Install microG-RE to use Google sign-in.");
            case DISABLED: return L10n.t("Turn on microG-RE to use Google sign-in.");
            default: return L10n.t("microG-RE didn't answer. Open it, then try again.");
        }
    }

    private static MicroG microG(Context context) {
        try {
            ApplicationInfo app = context.getPackageManager().getPackageInfo(PushReadiness.GMS_CORE, 0).applicationInfo;
            return app == null ? MicroG.UNKNOWN : app.enabled ? MicroG.ENABLED : MicroG.DISABLED;
        } catch (PackageManager.NameNotFoundException missing) {
            return MicroG.MISSING;
        } catch (RuntimeException unavailable) {
            return MicroG.UNKNOWN;
        }
    }

    @Override public String title() { return "GOOGLE SIGN-IN READINESS"; }

    @Override public List<String> lines() {
        boolean gmsCore = PushReadiness.gmsCore();
        List<String> lines = new ArrayList<>();
        lines.add("gmscore_support: " + (gmsCore ? "in build" : "not in build"));
        lines.add("spoof_signature: " + (PatchFamily.SPOOF_SIGNATURE.inBuild() ? "in build" : "not in build"));
        lines.add("provider_path: " + (gmsCore ? "microg-re" : "play services"));
        Context context = Utils.getContext();
        if (context == null) return Collections.unmodifiableList(lines);
        Bundle metaData = ownMetaData(context);
        lines.add("spoof_metadata: " + spoofMetadata(metaData));
        lines.add("spoof_package: " + spoofPackage(metaData));
        if (gmsCore) {
            lines.add("microg_re: " + microGLine(context));
            lines.add("signin_service: " + signInService(context));
            lines.add("last_request: " + lastRequest);
        }
        lines.add("sign_in: local checks don't prove a sign-in finishes");
        return lines;
    }

    /** The running app's own meta-data, an empty bundle when it has none, or null when it can't be read. */
    private static Bundle ownMetaData(Context context) {
        try {
            ApplicationInfo app = context.getPackageManager().getApplicationInfo(
                    context.getPackageName(), PackageManager.GET_META_DATA);
            return app.metaData != null ? app.metaData : new Bundle();
        } catch (PackageManager.NameNotFoundException | RuntimeException unavailable) {
            return null;
        }
    }

    private static String spoofMetadata(Bundle metaData) {
        if (metaData == null) return "unknown";
        return metaData.containsKey(SPOOF_METADATA) ? "present" : "missing";
    }

    /**
     * Whether microG-RE gets Pinterest's own package to show Google: "pinterest", "other" for any
     * other value (which isn't printed, a copy's custom package included), or "missing". A renamed
     * copy without it shows Google its own package beside Pinterest's certificate (#28).
     */
    private static String spoofPackage(Bundle metaData) {
        if (metaData == null) return "unknown";
        if (!metaData.containsKey(SPOOF_PACKAGE_METADATA)) return "missing";
        return PINTEREST_PACKAGE.equals(metaData.getString(SPOOF_PACKAGE_METADATA)) ? "pinterest" : "other";
    }

    private static String microGLine(Context context) {
        MicroG state = microG(context);
        if (state == MicroG.MISSING) return "missing";
        if (state == MicroG.UNKNOWN) return "unknown";
        String version = "unknown";
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(PushReadiness.GMS_CORE, 0);
            if (info.versionName != null) version = info.versionName;
        } catch (PackageManager.NameNotFoundException | RuntimeException unavailable) {
            // The state above still says what Android knows.
        }
        return "installed, version " + version + (state == MicroG.ENABLED ? ", enabled" : ", disabled");
    }

    /** Who answers the service the request binds to. Another package's name never reaches the report. */
    private static String signInService(Context context) {
        try {
            List<ResolveInfo> matches = context.getPackageManager().queryIntentServices(new Intent(SIGN_IN_SERVICE), 0);
            boolean other = false;
            for (ResolveInfo match : matches) {
                if (match.serviceInfo == null) continue;
                if (PushReadiness.GMS_CORE.equals(match.serviceInfo.packageName)) return "microg-re";
                other = true;
            }
            return other ? "other package (redacted)" : "none";
        } catch (RuntimeException unavailable) {
            return "unknown";
        }
    }
}
