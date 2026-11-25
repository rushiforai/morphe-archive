/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.coexist;

import static org.junit.Assert.assertEquals;

import android.content.Context;
import android.content.ContextWrapper;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Pinterest's reCAPTCHA key accepts only Pinterest's own package, and the reCAPTCHA check in its
 * sign-in reports the app's package through {@link OwnAuthorities#reportedPackage}. A renamed copy
 * reports Pinterest's there, so its email sign-in isn't refused. Everything else reports its own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReportedPackageTest {
    private static final String COPY = "com.pinterest.hushpinterest";

    @After
    public void forget() {
        OwnAuthorities.runningPackage = null;
        OwnAuthorities.renamedForTests = null;
    }

    private static Context runningAs(String packageName) {
        return new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public String getPackageName() { return packageName; }
        };
    }

    @Test
    public void aRenamedCopyReportsPinterest() {
        OwnAuthorities.renamedForTests = true;
        OwnAuthorities.runningPackage = COPY;
        assertEquals("com.pinterest", OwnAuthorities.reportedPackage(runningAs(COPY)));

        OwnAuthorities.runningPackage = "org.example.pins";
        assertEquals("com.pinterest", OwnAuthorities.reportedPackage(runningAs("org.example.pins")));
    }

    @Test
    public void pinterestItselfReportsItsOwn() {
        OwnAuthorities.renamedForTests = true;
        OwnAuthorities.runningPackage = "com.pinterest";
        assertEquals("com.pinterest", OwnAuthorities.reportedPackage(runningAs("com.pinterest")));
    }

    /** A build without Change package name never changes what the SDK sends. */
    @Test
    public void withoutThePatchTheRealPackageGoes() {
        OwnAuthorities.renamedForTests = false;
        OwnAuthorities.runningPackage = COPY;
        assertEquals(COPY, OwnAuthorities.reportedPackage(runningAs(COPY)));
    }

    /** A context for some other package, say a library's own, keeps its name even in the copy. */
    @Test
    public void anotherPackagesContextKeepsItsName() {
        OwnAuthorities.renamedForTests = true;
        OwnAuthorities.runningPackage = COPY;
        assertEquals("com.google.android.gms", OwnAuthorities.reportedPackage(runningAs("com.google.android.gms")));
    }
}
