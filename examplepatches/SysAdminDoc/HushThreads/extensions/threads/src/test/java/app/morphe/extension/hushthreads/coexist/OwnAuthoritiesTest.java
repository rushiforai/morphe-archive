/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c21b570b (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

/**
 * Threads' code spells some of its own provider authorities out, and Change package name hands
 * each to {@link OwnAuthorities#name}. Threads itself gets them back as they were. A renamed copy
 * gets its own, which is where its providers are, rather than those of the stock Threads beside it.
 */
public class OwnAuthoritiesTest {
    private static final String LITE = "content://com.instagram.barcelona.liteprovider.BarcelonaLiteContentProvider";
    private static final String USDID = "com.instagram.barcelona.liteprovider.usdid.UsdidValuesProvider";

    @After
    public void forget() {
        OwnAuthorities.runningPackage = null;
    }

    @Test
    public void threadsGetsItsNamesBackAsTheyWere() {
        OwnAuthorities.runningPackage = "com.instagram.barcelona";
        assertEquals(LITE, OwnAuthorities.name(LITE));
        assertEquals(USDID, OwnAuthorities.name(USDID));
    }

    @Test
    public void aCopyGetsItsOwn() {
        OwnAuthorities.runningPackage = "com.instagram.barcelona.hushthreads";
        assertEquals("content://com.instagram.barcelona.hushthreads.liteprovider.BarcelonaLiteContentProvider",
                OwnAuthorities.name(LITE));
        assertEquals("com.instagram.barcelona.hushthreads.liteprovider.usdid.UsdidValuesProvider", OwnAuthorities.name(USDID));

        OwnAuthorities.runningPackage = "org.example.threads";
        assertEquals("content://org.example.threads.liteprovider.BarcelonaLiteContentProvider", OwnAuthorities.name(LITE));
    }

    /** Only a name under Threads' package moves: another app's, or text that isn't one, stays. */
    @Test
    public void anythingElseComesBackAsItWas() {
        OwnAuthorities.runningPackage = "com.instagram.barcelona.hushthreads";
        String instagram = "content://com.instagram.barcelonaig.deferreddeeplink.TixuDeferredDeeplinkProvider/deeplink";
        assertEquals(instagram, OwnAuthorities.name(instagram));
        assertEquals("com.instagram.barcelona", OwnAuthorities.name("com.instagram.barcelona"));
        assertEquals("com.instagram.barcelonax.y", OwnAuthorities.name("com.instagram.barcelonax.y"));
        assertEquals("", OwnAuthorities.name(""));
        assertNull(OwnAuthorities.name(null));
    }

    /**
     * A copy passes Threads' check for its own package with its own name and nothing else. Threads
     * itself, and a process whose package isn't known, leave the check to Threads.
     */
    @Test
    public void onlyACopysOwnPackageCountsAsThreads() {
        OwnAuthorities.runningPackage = "com.instagram.barcelona.hushthreads";
        assertTrue(OwnAuthorities.isRunningCopy("com.instagram.barcelona.hushthreads"));
        assertFalse(OwnAuthorities.isRunningCopy("com.instagram.barcelona"));
        assertFalse(OwnAuthorities.isRunningCopy("com.instagram.android"));
        assertFalse(OwnAuthorities.isRunningCopy("com.instagram.barcelona.hushthreads.x"));
        assertFalse(OwnAuthorities.isRunningCopy(""));
        assertFalse(OwnAuthorities.isRunningCopy(null));

        OwnAuthorities.runningPackage = "com.instagram.barcelona";
        assertFalse(OwnAuthorities.isRunningCopy("com.instagram.barcelona"));
    }

    /**
     * Threads names every process after its package, a colon and a name of its own, so the part
     * before the colon is the package, even while content providers start and there's no context.
     */
    @Test
    public void theRunningPackageIsTheProcessNameUpToItsColon() {
        assertEquals("com.instagram.barcelona.hushthreads", OwnAuthorities.packageOf("com.instagram.barcelona.hushthreads"));
        assertEquals("com.instagram.barcelona.hushthreads", OwnAuthorities.packageOf("com.instagram.barcelona.hushthreads:fbns"));
        assertEquals("com.instagram.barcelona", OwnAuthorities.packageOf("com.instagram.barcelona:fbns"));
        assertNull(OwnAuthorities.packageOf(""));
        assertNull(OwnAuthorities.packageOf(":fbns"));
        assertNull(OwnAuthorities.packageOf(null));
    }
}
