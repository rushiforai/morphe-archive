/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.os.Process;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowProcess;

import java.security.MessageDigest;
import java.util.List;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Which packages Restore screens on re-signed builds answers for: the running app itself, under
 * Threads' name or a clone's, and nothing else. Threads reads these packages from
 * PackageManager, which fills in their ApplicationInfo.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ThreadsSignatureTest {
    private static final int OTHER_UID = Process.myUid() + 1;

    private static final String THREADS = "com.instagram.barcelona";

    /** Threads' original Meta certificate: APK v3.0, and the first of its v3.1 lineage. */
    private static final String THREADS_SHA256 = "5367570bad488d8da6a0fab78d9766a1a4c23c3c70fac0ad2e91c8f0bd58b432";

    @Before
    @After
    public void clearStatus() {
        HookStatus.clear();
    }

    private static PackageInfo installed(String packageName, int uid) {
        ApplicationInfo app = new ApplicationInfo();
        app.packageName = packageName;
        app.uid = uid;
        PackageInfo info = new PackageInfo();
        info.packageName = packageName;
        info.applicationInfo = app;
        return info;
    }

    private static PackageInfo self(String packageName) {
        return installed(packageName, Process.myUid());
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.RESTORE_TRUST + ":")) return line;
        }
        return null;
    }

    private static void answers(PackageInfo info) throws Exception {
        List<Signature> signers = ThreadsSignature.originalSigners(info);
        assertNotNull(info.packageName + " kept its re-signed signers", signers);
        assertEquals(1, signers.size());
        byte[] sha256 = MessageDigest.getInstance("SHA-256").digest(signers.get(0).toByteArray());
        StringBuilder hex = new StringBuilder();
        for (byte b : sha256) hex.append(String.format("%02x", b));
        assertEquals(THREADS_SHA256, hex.toString());
    }

    private static void keepsItsOwn(PackageInfo info) {
        assertNull((info == null ? "null" : info.packageName) + " got Threads' certificate",
                ThreadsSignature.originalSigners(info));
    }

    @Test
    public void threadsItselfGetsItsOriginalCertificate() throws Exception {
        answers(self(THREADS));
        assertEquals(FamilyNames.RESTORE_TRUST + ": invoked 1, 0 found, 0 missing", statusLine());
    }

    /** Morphe's Clone app patch renames the package; the app is still this one. */
    @Test
    public void aRenamedCloneOfThisAppGetsItToo() throws Exception {
        answers(self(THREADS + ".morphe"));
        answers(self(THREADS + ".hush"));
    }

    /**
     * Stock Threads installed beside a clone has Threads' name but its own uid. Its signers are
     * what the phone says they are, as are Instagram's and those of any name that only looks like it.
     */
    @Test
    public void anotherAppKeepsItsOwnSigners() {
        keepsItsOwn(installed(THREADS, OTHER_UID));
        keepsItsOwn(installed("com.instagram.android", OTHER_UID));
        keepsItsOwn(installed("com.instagram.barcelonax", OTHER_UID));
        keepsItsOwn(installed("com.instagram.barcelona.evil", OTHER_UID));
        keepsItsOwn(installed(THREADS + ".morphe", OTHER_UID));
        assertNull("counted a package it didn't answer for", statusLine());
    }

    /** A package whose name disagrees with its own ApplicationInfo isn't known to be this app. */
    @Test
    public void aNameThatIsntItsApplicationsKeepsItsOwnSigners() {
        PackageInfo info = self(THREADS);
        info.packageName = "com.instagram.android";
        keepsItsOwn(info);
    }

    @Test
    public void missingFactsKeepTheSystemsAnswer() {
        keepsItsOwn(null);
        PackageInfo noName = self(THREADS);
        noName.packageName = null;
        keepsItsOwn(noName);
        assertNull(statusLine());
    }

    /**
     * An isolated process, like the in-app browser's renderers or a service started from Threads'
     * app zygote, runs under a uid of its own rather than the app's. There only the name is known,
     * so only Threads' own name is answered. A clone can't be told apart there.
     */
    @Test
    public void inAnIsolatedProcessOnlyThreadsNameIsAnswered() throws Exception {
        int app = Process.myUid();
        try {
            ShadowProcess.setUid(99001);
            answers(installed(THREADS, app));
            keepsItsOwn(installed(THREADS + ".morphe", app));
            keepsItsOwn(installed("com.instagram.android", OTHER_UID));
            keepsItsOwn(installed("com.instagram.barcelonax", app));
        } finally {
            ShadowProcess.setUid(app);
        }
    }

    /**
     * PackageManager always fills in ApplicationInfo. Without it only the name is known, and only
     * Threads' own name is answered.
     */
    @Test
    public void withoutApplicationInfoOnlyThreadsNameIsAnswered() throws Exception {
        PackageInfo threads = new PackageInfo();
        threads.packageName = THREADS;
        answers(threads);
        for (String name : new String[] {THREADS + ".morphe", "com.instagram.android", "com.instagram.barcelonax"}) {
            PackageInfo other = new PackageInfo();
            other.packageName = name;
            keepsItsOwn(other);
        }
    }
}
