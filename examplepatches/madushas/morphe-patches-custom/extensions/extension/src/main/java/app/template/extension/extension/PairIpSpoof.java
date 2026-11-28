package app.template.extension.extension;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;

import java.io.File;

/**
 * Context shield for PairIP-protected apps (adidas 14.12.1 and friends).
 *
 * PairIP's VM resolves everything it wants to know about "its own app" through the
 * {@link android.content.Context} handed to {@code com.pairip.VMRunner.setContext}:
 * its APK path ({@code getPackageManager().getApplicationInfo(...).sourceDir}), its
 * signature (any PackageManager call), its installer, and so on. The framework answers
 * those calls from the *installed* APK - which after re-signing carries the wrong
 * certificate, the wrong signing scheme and no SourceStamp, so every integrity check
 * inside the VM fails and the VM kills the app with a poison-pointer SIGSEGV
 * (deterministic fault address, identical across signing keys, dex content and all
 * parcel-level hooks - measured on device 2026-11-21).
 *
 * {@link #wrap} therefore hands the VM a {@link ContextWrapper} whose PackageManager
 * reports a spoofed view:
 * <ul>
 *   <li>{@code hasSigningCertificate(...)} - true (the one signature API that bypasses
 *       the {@code PackageInfo.CREATOR} hook, because the verdict is computed
 *       system-side);</li>
 *   <li>{@code checkSignatures(...)} - match for this app's package;</li>
 *   <li>{@code getApplicationInfo(...).sourceDir} - redirected to the pristine
 *       Play-signed original ({@code filesDir/pairip-original.apk}) when it has been
 *       seeded, so file-level integrity scans see the untouched original. The seed is
 *       optional: without it the redirect is a no-op and everything else still applies.</li>
 * </ul>
 *
 * All other calls delegate unchanged, so the VM keeps working against the real app.
 */
public final class PairIpSpoof {

    private static final String SEED_NAME = "pairip-original.apk";
    private static volatile String sSeedPath;
    private static boolean sSeedResolved;

    private PairIpSpoof() {}

    /** Returns the wrapped context; idempotent (re-wrapping a wrapper is a no-op). */
    public static Context wrap(Context base) {
        if (base == null) return null;
        try {
            if (base instanceof SpoofContext) return base;
            createEnableFlag(base);
            return new SpoofContext(base);
        } catch (Throwable t) {
            return base; // never break the app because of the shield
        }
    }

    /**
     * Arms the native seed hook (libpairipseed.so, loaded via wrap.sh): from this point
     * every open of the installed base.apk is redirected to the pristine original.
     * This runs inside VMRunner.invoke - AFTER the runtime has loaded the (patched)
     * dexes from the real file, and BEFORE the startup program's integrity check reads
     * it - which is exactly the window the hook needs.
     */
    private static void createEnableFlag(Context base) {
        try {
            File flag = new File(base.getFilesDir(), "pairip-enable");
            if (!flag.exists()) {
                java.io.FileWriter w = new java.io.FileWriter(flag);
                w.write("1");
                w.close();
            }
        } catch (Throwable ignored) {
        }
    }

    /** Path of the seeded pristine original, or null when it has not been provided. */
    private static String seedPath(Context c) {
        if (sSeedResolved) return sSeedPath;
        try {
            File f = new File(c.getFilesDir(), SEED_NAME);
            sSeedPath = (f.exists() && f.length() > 0) ? f.getAbsolutePath() : null;
        } catch (Throwable t) {
            sSeedPath = null;
        }
        sSeedResolved = true;
        return sSeedPath;
    }

    private static final class SpoofContext extends ContextWrapper {
        private PackageManager mPm;

        SpoofContext(Context base) {
            super(base);
        }

        @Override
        public PackageManager getPackageManager() {
            if (mPm == null) {
                String redirect = seedPath(this);
                mPm = new SpoofPackageManager(getBaseContext().getPackageManager(),
                        getPackageName(), redirect);
            }
            return mPm;
        }

        @Override
        public ApplicationInfo getApplicationInfo() {
            ApplicationInfo info = super.getApplicationInfo();
            String redirect = seedPath(this);
            if (redirect != null && info != null) {
                info.sourceDir = redirect;
                info.publicSourceDir = redirect;
            }
            return info;
        }
    }
}
