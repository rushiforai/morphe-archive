/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.coexist;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.After;
import org.junit.Test;

/**
 * Facebook's code spells some of its own provider authorities out, and the patch hands each to
 * {@link OwnAuthorities#name}. Facebook itself gets them back as they were. A copy renamed with
 * Morphe's Clone app gets its own, which is where its providers are, rather than the ones of the
 * Facebook it was cloned from (#16).
 */
public class OwnAuthoritiesTest {
    private static final String DEDUP = "content://com.facebook.katana.ClientMessagePushDedupInfoProvider/mutestatus";
    private static final String FEO2 = "com.facebook.katana.identity.feo2.api";

    @After
    public void forget() {
        OwnAuthorities.runningPackage = null;
    }

    @Test
    public void facebookGetsItsNamesBackAsTheyWere() {
        OwnAuthorities.runningPackage = "com.facebook.katana";
        assertEquals(DEDUP, OwnAuthorities.name(DEDUP));
        assertEquals(FEO2, OwnAuthorities.name(FEO2));
    }

    @Test
    public void aCloneGetsItsOwn() {
        OwnAuthorities.runningPackage = "com.facebook.katana.morphe";
        assertEquals("content://com.facebook.katana.morphe.ClientMessagePushDedupInfoProvider/mutestatus",
                OwnAuthorities.name(DEDUP));
        assertEquals("com.facebook.katana.morphe.identity.feo2.api", OwnAuthorities.name(FEO2));

        OwnAuthorities.runningPackage = "org.example.fb";
        assertEquals("content://org.example.fb.ClientMessagePushDedupInfoProvider/mutestatus", OwnAuthorities.name(DEDUP));
    }

    /** Only a name under Facebook's package moves: another app's, or text that isn't one, stays. */
    @Test
    public void anythingElseComesBackAsItWas() {
        OwnAuthorities.runningPackage = "com.facebook.katana.morphe";
        String messenger = "content://com.facebook.orca.ClientMessagePushDedupInfoProvider/mutestatus";
        assertEquals(messenger, OwnAuthorities.name(messenger));
        assertEquals("com.facebook.katana", OwnAuthorities.name("com.facebook.katana"));
        assertEquals("com.facebook.katanax.y", OwnAuthorities.name("com.facebook.katanax.y"));
        assertEquals("", OwnAuthorities.name(""));
        assertNull(OwnAuthorities.name(null));
    }

    /**
     * Facebook names every process after its package, a colon and a name of its own, so the part
     * before the colon is the package, even while content providers start and there's no context.
     */
    @Test
    public void theRunningPackageIsTheProcessNameUpToItsColon() {
        assertEquals("com.facebook.katana.morphe", OwnAuthorities.packageOf("com.facebook.katana.morphe"));
        assertEquals("com.facebook.katana.morphe", OwnAuthorities.packageOf("com.facebook.katana.morphe:fbns"));
        assertEquals("com.facebook.katana", OwnAuthorities.packageOf("com.facebook.katana:sandboxed_process0:x"));
        assertNull(OwnAuthorities.packageOf(""));
        assertNull(OwnAuthorities.packageOf(":fbns"));
        assertNull(OwnAuthorities.packageOf(null));
    }
}
