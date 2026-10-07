/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/extensions/extension/src/main/java/app/andrewliang/extension/FacebookSignature.java
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.extension.hushthreads.misc;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.os.Process;
import android.util.Base64;

import java.util.Collections;
import java.util.List;

import app.morphe.extension.hushthreads.coexist.FamilySignatureTrust;
import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the Threads "Restore screens on re-signed builds" patch.
 *
 * <p>Meta's security code in Threads compares the signing certificate of a package with a table of
 * Meta certificates, and it does this for its own package too. A re-signed build has a different
 * certificate, so Threads does not trust itself. The patch gives the check the original certificate
 * of Threads when the package is this app.
 *
 * <p>The name alone doesn't say that. Morphe's Clone app patch renames the package, and the stock
 * Threads it was cloned from can stay installed beside it. The uid does: Android gives every
 * installed app its own, and the process has it before any code runs, so the check needs no context
 * even while content providers start.
 *
 * <p>The same reader gives Threads a caller's signers when it builds the caller's identity for a
 * guarded component. On a re-signed build an Instagram the user patched with the same key is
 * answered Instagram's own Meta certificate here, so Threads' caller rules judge it exactly as the
 * Meta-signed Instagram. {@link FamilySignatureTrust} makes that decision.
 * It also recognizes a local lookup of the installed same-key Instagram provider, where there is
 * no incoming Binder caller. The consumer can then apply its existing Meta certificate rules.
 */
public final class ThreadsSignature {

    private ThreadsSignature() {}

    private static final String PACKAGE = "com.instagram.barcelona";

    /**
     * The original signing certificate of Threads, DER in Base64: the APK v3.0 signer Android reads
     * up to API 32 and the first of the v3.1 lineage above it. Its SHA-256 is 5367570b…58b432.
     */
    private static final String CERTIFICATE =
        "MIIFnTCCA4UCFDFg4fUMGFm6i3t6zwZ/B4y/z5WcMA0GCSqGSIb3DQEBCwUAMIGJMRwwGgYDVQQDDBNNZXRhIFBs"
        + "YXRmb3JtcyBJbmMuMRQwEgYDVQQLDAtNZXRhIE1vYmlsZTEcMBoGA1UECgwTTWV0YSBQbGF0Zm9ybXMgSW5jLjET"
        + "MBEGA1UEBwwKTWVubG8gUGFyazETMBEGA1UECAwKQ2FsaWZvcm5pYTELMAkGA1UEBhMCVVMwIBcNMjMwMTI2MTA1"
        + "NzM2WhgPMjA1MzAxMjUxMDU3MzZaMIGJMRwwGgYDVQQDDBNNZXRhIFBsYXRmb3JtcyBJbmMuMRQwEgYDVQQLDAtN"
        + "ZXRhIE1vYmlsZTEcMBoGA1UECgwTTWV0YSBQbGF0Zm9ybXMgSW5jLjETMBEGA1UEBwwKTWVubG8gUGFyazETMBEG"
        + "A1UECAwKQ2FsaWZvcm5pYTELMAkGA1UEBhMCVVMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCsoLaD"
        + "gbhdqVNCjsfpVafcT/rEigcJiNPBcPEqJ+vbPgmSMJCTk2v3GH/fPgmncPmPGEY+DVSmv/O/MR0h0Ss1VlugaUnY"
        + "oLbiAUx+ySPD/SbSyJm6vuynrP1a+2a7PgWHYFEoZFYS7rRYjfGX2Un08wX9e4nv3xRu3xsrzmDsBp8To9AcpKMJ"
        + "qzUNeg/PlDEJ3yLb3mCKVbHcu3p8XP0tOI3ean/b46KS2/yt1Fg9jJdO0/KDPjqf6m6sKZ0Tl341tIowZhezd77s"
        + "miHagpAdX2eKjkvg1WNscc0ndd0jNpAkE3laQe398dC1cdzl+EHuKc9WoyWrMzQ+mpIi27GO1MWky042Dkx4Gqcs"
        + "sgJ5+vLqXGGnYuy28Sfdf61tM7SfwjhHVtvPVdHAWaqu9HzOczepLZ/7AI1zR03HwITfrTN4zwDAn1gf2L/f1l/h"
        + "KsjiFBK6o+R6Bh421FhkSbThP/DDr8cAYCDGYeEKPEuc/Qv+3xHVkPqt2txm/QxNhTNjFID5rIoy48R0foPn/pqz"
        + "tN/vuXSV4Ylofs4m/ehGoUGSrIO0X4Nw8/YqDQWiIw33MGYQYoPvgGT9hLApMqbWsDzhXuVtNyl9m+03B/17/t4F"
        + "i9W1Nd4aKwL3xiEXU746AOwkF3ZGQt61Kq3UwfM8CFBV+0TRA5eozStwYUmeNQIDAQABMA0GCSqGSIb3DQEBCwUA"
        + "A4ICAQBL8A9YqfUoYASGERvK9BSpLpa1/Cu0rwWaxxUUHVZQsuSKcTbpfMcfmebfKi6bz+pNL8L8THMCYocIT6yT"
        + "2wpcba4LOybGmZ0mt4f6reA0paQg/REUy7qR7tNZnHgqAliSRY7CjvVejthrIh98v0maYAY70ypr0nHJdBLb3B1I"
        + "LGLl9tewQJjUo8QGpp9bkWcTTVsEEC93ynk30mC2HX9vno/dRief2JYrVfAnkBexNVgYWr92860HFp5P2mo36S9c"
        + "GflgfJkmDHmKknH3mY/9ppIiIzApCxBHPO5r1R/89y+TxaASSr1/s5RCOBtif0eG6GGRYcSQWPinCMjh8tORlhzn"
        + "dauxrI3Dm931rKqSfg8vtgcCH/TpUPYe0oX1p4ZcxIn6EsbjaQNzfpq4/OgOFpZLid6EaUBxd1/NyPnYNWEKgk7M"
        + "pEkBgDRQWCIOKJgoGG2GwlIX8S84uR0gNUILBe/M+bQjtzm6sHREl/X5JIHid6XPVNBi5zvnqa7286IyEoBjGVFF"
        + "VVC2pGA+4Z8PN+RNBqCM9oJmZIkXCdK4pw7nxxTgx/pty1KPCPVAbNCFMn/NiLOHWdIKBTRX4br0nfjsttWWtGxQ"
        + "ji7UP0D0TfXqlh48Y3K+Ej28GvV6h5zsMFJMgkCWG/ZuDafwHigzu+1fnQbMCcecA1WEtI7eKw==";

    /**
     * Instagram's original signing certificate, DER in Base64, answered for a same-key Instagram
     * calling in. Its SHA-256 is 5f3e50f4…93e305.
     */
    private static final String INSTAGRAM_CERTIFICATE =
        "MIICTTCCAbagAwIBAgIETzHSyzANBgkqhkiG9w0BAQUFADBqMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZv"
        + "cm5pYTEWMBQGA1UEBxMNU2FuIEZyYW5jaXNjbzEWMBQGA1UEChMNSW5zdGFncmFtIEluYzEWMBQGA1UEAxMNS2V2"
        + "aW4gU3lzdHJvbTAgFw0xMjAyMDgwMTQxMzFaGA8yMTEyMDExNTAxNDEzMVowajELMAkGA1UEBhMCVVMxEzARBgNV"
        + "BAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBGcmFuY2lzY28xFjAUBgNVBAoTDUluc3RhZ3JhbSBJbmMxFjAU"
        + "BgNVBAMTDUtldmluIFN5c3Ryb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAInrysAVZgtCpcCAv2lMUuKe"
        + "nfg6TJSWSwIso40rohV9jkZQlVx4eQasNEvbi30gKpIjFAPUjp4vDfPLkXz6m5dBMUyFBSZz1CrQDywlG+SmsBL7"
        + "nVszExsOXKC5GThW3DEdxl3EX5fSYy5yvsK0lkrf1dMGddXTcvuvETWaevtVAgMBAAEwDQYJKoZIhvcNAQEFBQAD"
        + "gYEAKu/YRSa1cBkpZ7Z5poW83BLPQAMFiVlNBNiFz6ijETcvuT8sHIumNvBhrrhyB/WhrSb+WHR8MHFPHpuRirLg"
        + "kNUlAwdlXuq1/t4eZAkxbF0pd5wDe1UPKbytQPpwyUe2FswF2qVTLA7MPs53OnHzcoekrDLyvX/u3oR8usVnGWk=";

    private static volatile List<Signature> original;

    private static volatile List<Signature> instagram;

    /**
     * The original signers of Threads if [info] is this app, Instagram's if [info] is an Instagram
     * the user patched with this build's key that is calling in or being read as a local peer,
     * or {@code null} to keep the signers
     * the system reports.
     */
    public static List<Signature> originalSigners(PackageInfo info) {
        if (isThisApp(info)) {
            // Counted when it answers for this app. The name is a compile-time constant: this can run
            // while content providers start, before HushThreads has a context, and Hook status reads
            // no setting.
            HookStatus.invoked(FamilyNames.RESTORE_TRUST);
            return meta();
        }

        // An Instagram re-signed with this build's key, calling a guarded component over Binder:
        // answer Instagram's own certificate for it, so Threads' caller checks judge it as the
        // Meta-signed app. FamilySignatureTrust counts it under this same patch and takes Threads'
        // own path for anyone else. Outbound provider reads use the separate local-peer policy.
        if (FamilySignatureTrust.isSameKeyFamilyCaller(info)
                || FamilySignatureTrust.isSameKeyFamilyProvider(info)) {
            return instagram();
        }
        return null;
    }

    /**
     * The signers FBNS, the push service Meta's apps share, reads for a package it may hand pushes
     * to: Threads' original certificate if [info] is this app, so a re-signed build passes its own
     * check, and [reported] for any other package. FBNS reads {@code PackageInfo.signatures} itself
     * rather than through the signers method {@link #originalSigners} answers for.
     */
    public static Signature[] fbnsSigners(PackageInfo info, Signature[] reported) {
        if (!isThisApp(info)) return reported;
        HookStatus.invoked(FamilyNames.RESTORE_TRUST);
        return meta().toArray(new Signature[0]);
    }

    /** Threads' original certificate, read once. */
    private static List<Signature> meta() {
        List<Signature> signers = original;
        if (signers == null) {
            signers = Collections.singletonList(new Signature(Base64.decode(CERTIFICATE, Base64.DEFAULT)));
            original = signers;
        }
        return signers;
    }

    /** Instagram's original certificate, read once. */
    private static List<Signature> instagram() {
        List<Signature> signers = instagram;
        if (signers == null) {
            signers = Collections.singletonList(new Signature(Base64.decode(INSTAGRAM_CERTIFICATE, Base64.DEFAULT)));
            instagram = signers;
        }
        return signers;
    }

    /**
     * Whether [info] describes the running app, under Threads' name or a clone's. A package with
     * another uid is another app, whatever its name. PackageManager always fills in the
     * ApplicationInfo; without one only the name is known. The same goes for an isolated process,
     * like the browser's renderers: it runs under a uid of its own, not the app's, so a clone can't
     * be told apart there.
     */
    private static boolean isThisApp(PackageInfo info) {
        if (info == null || info.packageName == null) return false;
        ApplicationInfo app = info.applicationInfo;
        if (app == null || Process.isIsolated()) return PACKAGE.equals(info.packageName);
        return app.uid == Process.myUid() && info.packageName.equals(app.packageName);
    }
}
