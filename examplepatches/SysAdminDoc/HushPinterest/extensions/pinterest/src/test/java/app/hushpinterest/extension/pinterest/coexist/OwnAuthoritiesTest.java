/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at 2cb2182 (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 * Forked there from https://github.com/SysAdminDoc/Hushfacebook at c21b570b (GPL-3.0).
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.hushpinterest.extension.pinterest.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * Pinterest's code spells its FileProvider's authority out, and Change package name hands it to
 * {@link OwnAuthorities#name}. Pinterest itself gets it back as it was. A renamed copy gets its own,
 * which is where its provider is, rather than the stock Pinterest's beside it.
 */
public class OwnAuthoritiesTest {
    private static final String PROVIDER = "com.pinterest.provider";

    /** Change package name is the patch that places {@link OwnAuthorities#name}. */
    @Before
    public void renamedBuild() {
        OwnAuthorities.renamedForTests = true;
    }

    @After
    public void forget() {
        OwnAuthorities.runningPackage = null;
        OwnAuthorities.renamedForTests = null;
    }

    /** A build without Change package name keeps Pinterest's names, whatever package it runs as. */
    @Test
    public void withoutThePatchEveryNameStays() {
        OwnAuthorities.renamedForTests = false;
        OwnAuthorities.runningPackage = "com.pinterest.hushpinterest";
        assertEquals(PROVIDER, OwnAuthorities.name(PROVIDER));
        assertEquals("content://com.pinterest.provider/cache/a.jpg", OwnAuthorities.name("content://com.pinterest.provider/cache/a.jpg"));
    }

    @Test
    public void pinterestGetsItsNamesBackAsTheyWere() {
        OwnAuthorities.runningPackage = "com.pinterest";
        assertEquals(PROVIDER, OwnAuthorities.name(PROVIDER));
        assertEquals("content://com.pinterest.provider/cache/a.jpg", OwnAuthorities.name("content://com.pinterest.provider/cache/a.jpg"));
    }

    @Test
    public void aCopyGetsItsOwn() {
        OwnAuthorities.runningPackage = "com.pinterest.hushpinterest";
        assertEquals("com.pinterest.hushpinterest.provider", OwnAuthorities.name(PROVIDER));
        assertEquals("content://com.pinterest.hushpinterest.provider/cache/a.jpg",
                OwnAuthorities.name("content://com.pinterest.provider/cache/a.jpg"));

        OwnAuthorities.runningPackage = "org.example.pins";
        assertEquals("org.example.pins.provider", OwnAuthorities.name(PROVIDER));
    }

    /** Only a name under Pinterest's package moves: another app's, or text that isn't one, stays. */
    @Test
    public void anythingElseComesBackAsItWas() {
        OwnAuthorities.runningPackage = "com.pinterest.hushpinterest";
        assertEquals("com.google.android.gms.provider", OwnAuthorities.name("com.google.android.gms.provider"));
        assertEquals("com.pinterest", OwnAuthorities.name("com.pinterest"));
        assertEquals("com.pinterestx.provider", OwnAuthorities.name("com.pinterestx.provider"));
        assertEquals("", OwnAuthorities.name(""));
        assertNull(OwnAuthorities.name(null));
    }

    /** Only a copy's own package counts as the running copy. Pinterest itself never does. */
    @Test
    public void onlyACopysOwnPackageIsTheRunningCopy() {
        OwnAuthorities.runningPackage = "com.pinterest.hushpinterest";
        assertTrue(OwnAuthorities.isRunningCopy("com.pinterest.hushpinterest"));
        assertFalse(OwnAuthorities.isRunningCopy("com.pinterest"));
        assertFalse(OwnAuthorities.isRunningCopy("com.pinterest.hushpinterest.x"));
        assertFalse(OwnAuthorities.isRunningCopy(""));
        assertFalse(OwnAuthorities.isRunningCopy(null));

        OwnAuthorities.runningPackage = "com.pinterest";
        assertFalse(OwnAuthorities.isRunningCopy("com.pinterest"));
    }

    /** Every process is named after its package, then a colon and a name of its own if it has one. */
    @Test
    public void theRunningPackageIsTheProcessNameUpToItsColon() {
        assertEquals("com.pinterest.hushpinterest", OwnAuthorities.packageOf("com.pinterest.hushpinterest"));
        assertEquals("com.pinterest.hushpinterest", OwnAuthorities.packageOf("com.pinterest.hushpinterest:background"));
        assertEquals("com.pinterest", OwnAuthorities.packageOf("com.pinterest:background"));
        assertNull(OwnAuthorities.packageOf(""));
        assertNull(OwnAuthorities.packageOf(":background"));
        assertNull(OwnAuthorities.packageOf(null));
    }
}
