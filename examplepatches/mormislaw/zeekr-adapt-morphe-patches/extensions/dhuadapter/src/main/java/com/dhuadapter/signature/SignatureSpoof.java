package com.dhuadapter.signature;

import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.util.Log;

import java.lang.reflect.Method;

import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 9 — Signature spoof. gate: config.copySign
 *
 * Some apps (Spotify) read their OWN signing certificate at runtime
 * (SigningInfo.getApkContentsSigners) and compare its SHA-256 to the expected
 * Play-Store certificate ("Play Store package certs are not valid. Found these
 * sha256 certs: [...]"). A debug re-sign fails that check. This hook feeds the
 * app the GENUINE certificate so the self-check passes.
 *
 * NO cert bytes are hardcoded: patch_apk.sh --copy-sign extracts the genuine
 * signer certificate from the STOCK APK's v2/v3 APK Signing Block into
 * assets/orig-cert.der at patch time; here we read that raw X.509 DER from our
 * own APK zip and feed it back.
 *
 * Why we extract from the v2/v3 block (not META-INF/*.RSA and not
 * getPackageArchiveInfo): modern APKs (e.g. Spotify 9.1.44) ship NO v1 JAR
 * signature at all — the cert lives only in the v2/v3 signing block. And on
 * Android 12 the platform APK verifier reports the STRONGEST scheme present
 * (v3 > v2 > v1); since we re-sign v2/v3 with a debug key, getPackageArchiveInfo
 * would return the DEBUG cert. Extracting the DER at patch time and reading it
 * as data bypasses both problems and yields the genuine cert.
 */
public final class SignatureSpoof {

    private static final String TAG = HookEnv.TAG;
    private static final String SIG_ASSET = "assets/orig-cert.der";

    private SignatureSpoof() {}

    public static void install() {
        if (!HookEnv.config.copySign) {
            Log.i(TAG, "Signature spoof disabled (config.copySign=false)");
            return;
        }

        final Signature[] genuine = loadGenuineSignature();
        if (genuine == null) {
            Log.w(TAG, "SigSpoof: no genuine signature available ("
                    + SIG_ASSET + " missing or unparseable) — hook NOT installed");
            return;
        }

        // 1. SigningInfo.getApkContentsSigners() / getSigningCertificateHistory()
        //    → genuine; hasMultipleSigners() → false. This is the modern path
        //    (PackageInfo.signingInfo) that the app's self-check reads.
        try {
            Class<?> si = SigningInfo.class;
            Pine.hook(si.getMethod("getApkContentsSigners"), new MethodHook() {
                @Override public void afterCall(Pine.CallFrame f) {
                    f.setResult(genuine.clone());
                    if (HookEnv.config.debug) {
                        Log.d(TAG, "SigSpoof: getApkContentsSigners() → genuine (app consulted signature)");
                    }
                }
            });
            Pine.hook(si.getMethod("getSigningCertificateHistory"), new MethodHook() {
                @Override public void afterCall(Pine.CallFrame f) { f.setResult(genuine.clone()); }
            });
            Pine.hook(si.getMethod("hasMultipleSigners"), new MethodHook() {
                @Override public void afterCall(Pine.CallFrame f) { f.setResult(false); }
            });
        } catch (Throwable t) {
            Log.e(TAG, "SigSpoof: SigningInfo hook failed", t);
        }

        // 2. Legacy getPackageInfo(pkg, GET_SIGNATURES) — only for our own
        //    package. PackageManager.getPackageInfo is ABSTRACT (Pine cannot hook
        //    it), so hook the concrete android.app.ApplicationPackageManager, the
        //    same class RootBypass hooks. GET_SIGNATURES = 0x40.
        try {
            Class<?> apm = Class.forName("android.app.ApplicationPackageManager");
            Method gpi = apm.getMethod("getPackageInfo", String.class, int.class);
            Pine.hook(gpi, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame f) {
                    try {
                        String ownPkg = HookEnv.appContext != null
                                ? HookEnv.appContext.getPackageName() : null;
                        if (ownPkg != null && ownPkg.equals(f.args[0])
                                && ((int) f.args[1] & 0x40) != 0
                                && f.getResult() instanceof PackageInfo) {
                            ((PackageInfo) f.getResult()).signatures = genuine.clone();
                        }
                    } catch (Throwable ignored) { }
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "SigSpoof: getPackageInfo hook failed", t);
        }

        Log.i(TAG, "Hook installed: signature spoof (genuine cert from " + SIG_ASSET + ")");
    }

    /** Read assets/orig-cert.der (raw X.509 DER, extracted from the stock APK's
     *  v2/v3 signing block at patch time) from our own APK zip. */
    private static Signature[] loadGenuineSignature() {
        String apk = HookEnv.apkSourceDir;
        if (apk == null && HookEnv.appContext != null) {
            apk = HookEnv.appContext.getPackageCodePath();
        }
        if (apk == null) {
            Log.e(TAG, "SigSpoof: no apk path to read " + SIG_ASSET);
            return null;
        }
        try (java.util.zip.ZipFile zf = new java.util.zip.ZipFile(apk)) {
            java.util.zip.ZipEntry e = zf.getEntry(SIG_ASSET);
            if (e == null) {
                Log.w(TAG, "SigSpoof: " + SIG_ASSET + " not present in APK");
                return null;
            }
            byte[] der;
            try (java.io.InputStream is = zf.getInputStream(e)) {
                java.io.ByteArrayOutputStream bos = new java.io.ByteArrayOutputStream();
                byte[] tmp = new byte[4096];
                int n;
                while ((n = is.read(tmp)) > 0) bos.write(tmp, 0, n);
                der = bos.toByteArray();
            }
            // Validate it really is an X.509 cert (pure, unit-tested CertReader).
            if (CertReader.parse(der) == null) {
                Log.w(TAG, "SigSpoof: " + SIG_ASSET + " is not a valid X.509 cert");
                return null;
            }
            // Diagnostic: SHA-256 of the DER = the APK-signer certificate digest.
            // Should match the app's genuine Play cert (e.g. Spotify 6505b181…).
            Log.i(TAG, "SigSpoof: genuine cert sha256=" + CertReader.sha256Hex(der));

            // Signature stores the cert's DER; Signature.toByteArray() returns it,
            // and PackageManager derives the cert/digest from it.
            return new Signature[]{ new Signature(der) };
        } catch (Throwable t) {
            Log.e(TAG, "SigSpoof: failed to read/parse " + SIG_ASSET, t);
            return null;
        }
    }
}
