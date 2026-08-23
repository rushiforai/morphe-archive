package dev.jason.gboardpatches.extension.longpressquickactions;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public final class GboardLongPressQuickActions1777PolicyTest {
    private static final String POLICY_CLASS =
            "dev.jason.gboardpatches.extension.longpressquickactions."
                    + "GboardLongPressQuickActions1777Policy";

    @Test
    public void mapsAllEnglishLowerAndUppercaseTargetKeysToExactActions() throws Exception {
        assertPlan(0x7f0b193c, "a", -0x2766, 0x7f0804a7,
                "Select all", 0x102001f);
        assertPlan(0x7f0b185e, "A", -0x2766, 0x7f0804a7,
                "Select all", 0x102001f);
        assertPlan(0x7f0b1a75, "z", -0x273d, 0x7f0804db,
                "Undo", 0);
        assertPlan(0x7f0b1915, "Z", -0x273d, 0x7f0804db,
                "Undo", 0);
        assertPlan(0x7f0b1951, "c", -0x2767, 0x7f080425,
                "Copy", 0x1020021);
        assertPlan(0x7f0b186f, "C", -0x2767, 0x7f080425,
                "Copy", 0x1020021);
        assertPlan(0x7f0b1a6b, "x", -0x2769, 0x7f080426,
                "Cut", 0x1020020);
        assertPlan(0x7f0b1910, "X", -0x2769, 0x7f080426,
                "Cut", 0x1020020);
        assertPlan(0x7f0b1a63, "v", -0x2768, 0x7f080428,
                "Paste", 0x1020022);
        assertPlan(0x7f0b190b, "V", -0x2768, 0x7f080428,
                "Paste", 0x1020022);
        assertPlan(0x7f0b1a6e, "y", -0x27a3, 0x7f0804a3,
                "Redo", 0);
        assertPlan(0x7f0b1911, "Y", -0x27a3, 0x7f0804a3,
                "Redo", 0);
    }

    @Test
    public void mapsExactZhuyinTargetKeysToActions() throws Exception {
        assertPlan(0x7f0b28d6, "a", -0x2766, 0x7f0804a7,
                "Select all", 0x102001f);
        assertPlan(0x7f0b28cd, "z", -0x273d, 0x7f0804db,
                "Undo", 0);
        assertPlan(0x7f0b28d0, "c", -0x2767, 0x7f080425,
                "Copy", 0x1020021);
        assertPlan(0x7f0b28d5, "x", -0x2769, 0x7f080426,
                "Cut", 0x1020020);
        assertPlan(0x7f0b28e7, "v", -0x2768, 0x7f080428,
                "Paste", 0x1020022);
        assertPlan(0x7f0b28e9, "y", -0x27a3, 0x7f0804a3,
                "Redo", 0);
    }

    @Test
    public void rejectsMismatchedPayloadsUnknownKeysAndDuplicateActions() throws Exception {
        Assert.assertNull(invokePlan(0x7f0b193c, "A", new int[0]));
        Assert.assertNull(invokePlan(0x7f0b185e, "a", new int[0]));
        Assert.assertNull(invokePlan(0x7f0b28d6, "A", new int[0]));
        Assert.assertNull(invokePlan(0x7f0b28d0, "x", new int[0]));
        Assert.assertNull(invokePlan(0x7f0b19f6, "q", new int[0]));
        Assert.assertNull(invokePlan(0x7f0b193c, null, new int[0]));
        Assert.assertNull(invokePlan(0x7f0b193c, "a", new int[] {-0x2766}));
        Assert.assertNull(invokePlan(0x7f0b28d6, "a", new int[] {-0x2766}));
        Assert.assertNotNull(invokePlan(0x7f0b28d6, "a", new int[] {-0x2767}));
    }

    @Test
    public void exposesContextMenuActionsOnlyForExactEligibleLongPressEvents()
            throws Exception {
        Assert.assertEquals(Integer.valueOf(0x102001f),
                contextMenuActionFor(0x7f0b193c, "a", "LONG_PRESS", -0x2766));
        Assert.assertEquals(Integer.valueOf(0x1020021),
                contextMenuActionFor(0x7f0b186f, "C", "LONG_PRESS", -0x2767));
        Assert.assertEquals(Integer.valueOf(0x1020020),
                contextMenuActionFor(0x7f0b1a6b, "x", "LONG_PRESS", -0x2769));
        Assert.assertEquals(Integer.valueOf(0x1020022),
                contextMenuActionFor(0x7f0b190b, "V", "LONG_PRESS", -0x2768));
        Assert.assertEquals(Integer.valueOf(0x102001f),
                contextMenuActionFor(0x7f0b28d6, "a", "LONG_PRESS", -0x2766));
        Assert.assertEquals(Integer.valueOf(0x1020021),
                contextMenuActionFor(0x7f0b28d0, "c", "LONG_PRESS", -0x2767));
        Assert.assertEquals(Integer.valueOf(0x1020020),
                contextMenuActionFor(0x7f0b28d5, "x", "LONG_PRESS", -0x2769));
        Assert.assertEquals(Integer.valueOf(0x1020022),
                contextMenuActionFor(0x7f0b28e7, "v", "LONG_PRESS", -0x2768));

        Assert.assertNull(contextMenuActionFor(
                0x7f0b1a75, "z", "LONG_PRESS", -0x273d));
        Assert.assertNull(contextMenuActionFor(
                0x7f0b1911, "Y", "LONG_PRESS", -0x27a3));
        Assert.assertNull(contextMenuActionFor(
                0x7f0b28cd, "z", "LONG_PRESS", -0x273d));
        Assert.assertNull(contextMenuActionFor(
                0x7f0b28e9, "y", "LONG_PRESS", -0x27a3));
        Assert.assertNull(contextMenuActionFor(
                0x7f0b193c, "a", "PRESS", -0x2766));
        Assert.assertNull(contextMenuActionFor(
                0x7f0b28d6, "a", "LONG_PRESS", -0x2767));
        Assert.assertNull(contextMenuActionFor(
                0x7f0b19f6, "q", "LONG_PRESS", -0x2766));
    }

    @Test
    public void recognizesAllSixExactInjectedActionEvents() throws Exception {
        Assert.assertTrue(isQuickActionEvent(
                0x7f0b193c, "a", "LONG_PRESS", -0x2766));
        Assert.assertTrue(isQuickActionEvent(
                0x7f0b28cd, "z", "LONG_PRESS", -0x273d));
        Assert.assertTrue(isQuickActionEvent(
                0x7f0b28d0, "c", "LONG_PRESS", -0x2767));
        Assert.assertTrue(isQuickActionEvent(
                0x7f0b1a6b, "x", "LONG_PRESS", -0x2769));
        Assert.assertTrue(isQuickActionEvent(
                0x7f0b28e7, "v", "LONG_PRESS", -0x2768));
        Assert.assertTrue(isQuickActionEvent(
                0x7f0b1911, "Y", "LONG_PRESS", -0x27a3));

        Assert.assertFalse(isQuickActionEvent(
                0x7f0b193c, "a", "PRESS", -0x2766));
        Assert.assertFalse(isQuickActionEvent(
                0x7f0b193c, "a", "LONG_PRESS", -0x2767));
        Assert.assertFalse(isQuickActionEvent(
                0x7f0b28d6, "A", "LONG_PRESS", -0x2766));
    }

    @Test
    public void recognizesOnlyTheAssignedActionInsidePatchedMetadata() throws Exception {
        Assert.assertTrue(containsAssignedAction(
                0x7f0b1a6b, "x", new int[] {-0x2769}));
        Assert.assertTrue(containsAssignedAction(
                0x7f0b28e7, "v", new int[] {-0x2767, -0x2768}));
        Assert.assertFalse(containsAssignedAction(
                0x7f0b1a6b, "x", new int[] {-0x2768}));
        Assert.assertFalse(containsAssignedAction(
                0x7f0b19f6, "q", new int[] {-0x2769}));
    }

    private static void assertPlan(int keyId, String pressText, int actionCode,
            int iconResId, String debugName, int contextMenuActionId) throws Exception {
        Object plan = invokePlan(keyId, pressText, new int[0]);
        Assert.assertNotNull("missing plan for key id 0x" + Integer.toHexString(keyId), plan);
        Assert.assertEquals(actionCode, intField(plan, "actionCode"));
        Assert.assertEquals(iconResId, intField(plan, "iconResId"));
        Assert.assertEquals(debugName, objectField(plan, "debugName"));
        Assert.assertEquals(contextMenuActionId, intField(plan, "contextMenuActionId"));
        assertMissingField(plan, "labelResId");
        assertMissingField(plan, "fallbackLabel");
    }

    private static Object invokePlan(int keyId, String pressText, int[] existingCodes)
            throws Exception {
        try {
            Class<?> policy = Class.forName(POLICY_CLASS);
            Method method = policy.getMethod(
                    "plan", int.class, String.class, int[].class);
            return method.invoke(null, Integer.valueOf(keyId), pressText, existingCodes);
        } catch (ClassNotFoundException missing) {
            Assert.fail("missing GboardLongPressQuickActions1777Policy");
            throw missing;
        } catch (InvocationTargetException invocation) {
            throw rethrow(invocation);
        }
    }

    private static Integer contextMenuActionFor(int keyId, String pressText,
            String actionTypeName, int selectedCode) throws Exception {
        try {
            Class<?> policy = Class.forName(POLICY_CLASS);
            Method method = policy.getMethod(
                    "contextMenuActionFor",
                    int.class, String.class, String.class, int.class);
            return (Integer) method.invoke(null, Integer.valueOf(keyId), pressText,
                    actionTypeName, Integer.valueOf(selectedCode));
        } catch (ClassNotFoundException missing) {
            Assert.fail("missing GboardLongPressQuickActions1777Policy");
            throw missing;
        } catch (InvocationTargetException invocation) {
            throw rethrow(invocation);
        }
    }

    private static boolean isQuickActionEvent(int keyId, String pressText,
            String actionTypeName, int selectedCode) throws Exception {
        try {
            Class<?> policy = Class.forName(POLICY_CLASS);
            Method method = policy.getMethod(
                    "isQuickActionEvent",
                    int.class, String.class, String.class, int.class);
            return ((Boolean) method.invoke(null, Integer.valueOf(keyId), pressText,
                    actionTypeName, Integer.valueOf(selectedCode))).booleanValue();
        } catch (ClassNotFoundException missing) {
            Assert.fail("missing GboardLongPressQuickActions1777Policy");
            throw missing;
        } catch (InvocationTargetException invocation) {
            throw rethrow(invocation);
        }
    }

    private static boolean containsAssignedAction(int keyId, String pressText,
            int[] existingCodes) throws Exception {
        try {
            Class<?> policy = Class.forName(POLICY_CLASS);
            Method method = policy.getMethod(
                    "containsAssignedAction", int.class, String.class, int[].class);
            return ((Boolean) method.invoke(null, Integer.valueOf(keyId), pressText,
                    existingCodes)).booleanValue();
        } catch (ClassNotFoundException missing) {
            Assert.fail("missing GboardLongPressQuickActions1777Policy");
            throw missing;
        } catch (InvocationTargetException invocation) {
            throw rethrow(invocation);
        }
    }

    private static int intField(Object instance, String name) throws Exception {
        return ((Integer) objectField(instance, name)).intValue();
    }

    private static Object objectField(Object instance, String name) throws Exception {
        Field field = instance.getClass().getField(name);
        return field.get(instance);
    }

    private static void assertMissingField(Object instance, String name) {
        try {
            instance.getClass().getField(name);
            Assert.fail("unexpected visible-label field: " + name);
        } catch (NoSuchFieldException expected) {
            // Expected: icon-only actions do not carry visible label resources.
        }
    }

    private static Exception rethrow(InvocationTargetException invocation)
            throws Exception {
        Throwable cause = invocation.getCause();
        if (cause instanceof Exception exception) {
            return exception;
        }
        throw invocation;
    }
}
