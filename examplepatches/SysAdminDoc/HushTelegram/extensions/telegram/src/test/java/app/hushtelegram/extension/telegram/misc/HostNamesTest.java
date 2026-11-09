/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.lang.reflect.Method;
import org.junit.After;
import org.junit.Test;

public class HostNamesTest {
    /** Stands in for a renamed Telegram class: R8 gave its members one-letter names. */
    public static class Renamed {
        public static int r0 = 7;
        public int I1 = 3;
        public long T1() { return 42L; }
        public String b(int account) { return "int " + account; }
        public String c(Long user) { return "user " + user; }
    }

    /** A subclass, the way MessageObject's runtime class can be one. */
    public static class Child extends Renamed {}

    private static final String OWNER = Renamed.class.getName();

    @After
    public void restore() {
        HostNames.useTable(null);
    }

    @Test
    public void anUnpatchedBuildKeepsEveryName() throws Exception {
        HostNames.useTable("");
        assertEquals("T1", HostNames.method(Renamed.class, "T1").getName());
        assertEquals("r0", HostNames.field(Renamed.class, "r0").getName());
        assertEquals("getSize", HostNames.methodName(Renamed.class, "getSize"));
    }

    @Test
    public void aRenamedMemberIsFoundByItsSourceName() throws Exception {
        HostNames.useTable("m " + OWNER + " getSize () T1\n"
                + "f " + OWNER + " selectedAccount r0\n"
                + "f " + OWNER + " currentAccount I1\n");
        assertEquals(42L, HostNames.method(Renamed.class, "getSize").invoke(new Renamed()));
        assertEquals(7, HostNames.field(Renamed.class, "selectedAccount").getInt(null));
        assertEquals(3, HostNames.declaredField(Renamed.class, "currentAccount").getInt(new Renamed()));
    }

    @Test
    public void overloadsAreToldApartByTheirParameters() throws Exception {
        HostNames.useTable("m " + OWNER + " getUser (I) b\n"
                + "m " + OWNER + " getUser (Ljava/lang/Long;) c\n");
        assertEquals("int 5", HostNames.method(Renamed.class, "getUser", int.class).invoke(new Renamed(), 5));
        assertEquals("user 9", HostNames.method(Renamed.class, "getUser", Long.class).invoke(new Renamed(), 9L));
    }

    @Test
    public void aSubclassFindsItsSuperclassRows() throws Exception {
        HostNames.useTable("m " + OWNER + " getSize () T1\nf " + OWNER + " currentAccount I1\n");
        assertEquals(42L, HostNames.method(Child.class, "getSize").invoke(new Child()));
        assertEquals(3, HostNames.field(Child.class, "currentAccount").getInt(new Child()));
    }

    @Test
    public void aScanMatchesTheBuildsNameForTheSourceOne() throws Exception {
        HostNames.useTable("m " + OWNER + " getUser (Ljava/lang/Long;) c\n");
        Method user = Renamed.class.getMethod("c", Long.class);
        Method other = Renamed.class.getMethod("b", int.class);
        assertTrue(HostNames.named(user, "getUser"));
        assertFalse(HostNames.named(other, "getUser"));
        assertFalse(HostNames.named(user, "c2"));
    }

    @Test
    public void anInlinedResourceAnswersItsLiteral() throws Exception {
        HostNames.useTable("r string PushReactText 7f120a3c\nr string Broken zz\n");
        assertEquals(0x7f120a3c, HostNames.resource(getClass().getClassLoader(), "string", "PushReactText"));
        try {
            HostNames.resource(getClass().getClassLoader(), "string", "Broken");
            fail("a malformed row and no R class can't answer an id");
        } catch (ReflectiveOperationException expected) {
            // Nothing in this test's class path is Telegram's R class.
        }
    }

    @Test
    public void aMissingMemberStillFailsTheWayReflectionDoes() {
        HostNames.useTable("m " + OWNER + " getSize () T1\n");
        try {
            HostNames.method(Renamed.class, "getChat");
            fail("no getChat");
        } catch (NoSuchMethodException expected) {
            // The caller's own catch decides what a missing member means.
        }
        try {
            HostNames.field(Renamed.class, "title");
            fail("no title");
        } catch (NoSuchFieldException expected) {
            // Same for fields.
        }
    }
}
