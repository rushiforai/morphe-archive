package dev.jason.gboardpatches.extension.addsymbols;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.shadows.ShadowSystemClock;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.time.Duration;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

@RunWith(RobolectricTestRunner.class)
public final class GboardAddSymbolsRuntimeTest {
    @Before
    @After
    public void resetRuntimeState() throws Exception {
        activeCustomEmoticonKeyboards().clear();
        currentCustomEmoticonRenderMode().clear();
        activeCustomEmoticonSession().set(false);
        currentCustomEmoticonSessionKeyboard().set(null);
        pendingStockEmoticonTabSwitchKeyboard().set(null);
        pendingStockEmoticonTabSwitchRenderMode().set(null);
        pendingStockEmoticonTabSwitchActiveSession().set(false);
        setStaticLong("pendingCustomFlowUntilUptimeMs", 0L);
        setStaticLong("pendingStockEmoticonTabSwitchUntilUptimeMs", 0L);
    }

    @Test
    public void markPendingStockTabSwitchSuppressesOnlyTrackedSessionKeyboard() throws Exception {
        Object sessionKeyboard = new Object();
        Object otherKeyboard = new Object();
        activeCustomEmoticonKeyboards().put(sessionKeyboard, Boolean.TRUE);
        activeCustomEmoticonKeyboards().put(otherKeyboard, Boolean.TRUE);
        currentCustomEmoticonRenderMode().put(sessionKeyboard, Boolean.TRUE);
        currentCustomEmoticonRenderMode().put(otherKeyboard, Boolean.TRUE);
        currentCustomEmoticonSessionKeyboard().set(sessionKeyboard);
        activeCustomEmoticonSession().set(true);

        privateMethod("markPendingStockEmoticonTabSwitch").invoke(null);

        Assert.assertFalse(activeCustomEmoticonSession().get());
        Assert.assertEquals(Boolean.FALSE, currentCustomEmoticonRenderMode().get(sessionKeyboard));
        Assert.assertEquals(Boolean.TRUE, currentCustomEmoticonRenderMode().get(otherKeyboard));
        Assert.assertSame(sessionKeyboard, pendingStockEmoticonTabSwitchKeyboard().get());
        Assert.assertEquals(Boolean.TRUE, pendingStockEmoticonTabSwitchRenderMode().get());
        Assert.assertTrue(pendingStockEmoticonTabSwitchActiveSession().get());
    }

    @Test
    public void expiredPendingStockTabSwitchRestoresPreviousSessionState() throws Exception {
        Object sessionKeyboard = new Object();
        activeCustomEmoticonKeyboards().put(sessionKeyboard, Boolean.TRUE);
        currentCustomEmoticonRenderMode().put(sessionKeyboard, Boolean.TRUE);
        currentCustomEmoticonSessionKeyboard().set(sessionKeyboard);
        activeCustomEmoticonSession().set(true);

        privateMethod("markPendingStockEmoticonTabSwitch").invoke(null);
        ShadowSystemClock.advanceBy(Duration.ofMillis(2_600L));

        boolean hasPending = (Boolean) privateMethod("hasPendingStockEmoticonTabSwitch")
                .invoke(null);

        Assert.assertFalse(hasPending);
        Assert.assertTrue(activeCustomEmoticonSession().get());
        Assert.assertEquals(Boolean.TRUE, currentCustomEmoticonRenderMode().get(sessionKeyboard));
        Assert.assertNull(pendingStockEmoticonTabSwitchKeyboard().get());
        Assert.assertNull(pendingStockEmoticonTabSwitchRenderMode().get());
        Assert.assertFalse(pendingStockEmoticonTabSwitchActiveSession().get());
    }

    @Test
    public void resolvesChineseLabelsOnlyForZhLocalesAndEnglishOtherwise() throws Exception {
        Assert.assertEquals(
                "常用",
                localeAwareCategoryLabel(
                        GboardAddSymbolsDataset.KEY_COMMON,
                        Locale.forLanguageTag("zh-Hant-TW")));
        Assert.assertEquals(
                "Common",
                localeAwareCategoryLabel(
                        GboardAddSymbolsDataset.KEY_COMMON,
                        Locale.US));
        Assert.assertEquals(
                "Common",
                localeAwareCategoryLabel(
                        GboardAddSymbolsDataset.KEY_COMMON,
                        Locale.JAPAN));
        Assert.assertEquals(
                "Common",
                localeAwareCategoryLabel(
                        GboardAddSymbolsDataset.KEY_COMMON,
                        null));
    }

    @Test
    public void resolvesMultipleCategoryLabelsConsistently() throws Exception {
        Assert.assertEquals(
                "Typography",
                localeAwareCategoryLabel(
                        GboardAddSymbolsDataset.KEY_TYPOGRAPHY,
                        Locale.CANADA_FRENCH));
        Assert.assertEquals(
                "箭頭",
                localeAwareCategoryLabel(
                        GboardAddSymbolsDataset.KEY_ARROWS,
                        Locale.forLanguageTag("zh-TW")));
        Assert.assertEquals(
                "Currency",
                localeAwareCategoryLabel(
                        GboardAddSymbolsDataset.KEY_CURRENCY,
                        Locale.KOREA));
        Assert.assertEquals(
                "Recents",
                localeAwareCategoryLabel("RECENTS", Locale.GERMANY));
    }

    @Test
    public void datasetDoesNotExposeLegacyCategoryLabelsConstant() throws Exception {
        try {
            GboardAddSymbolsDataset.class.getDeclaredField("CATEGORY_LABELS");
            Assert.fail("Legacy CATEGORY_LABELS constant should be removed.");
        } catch (NoSuchFieldException expected) {
            // Expected.
        }
    }

    @SuppressWarnings("unchecked")
    private static Map<Object, Boolean> activeCustomEmoticonKeyboards() throws Exception {
        return (Map<Object, Boolean>) staticField("ACTIVE_CUSTOM_EMOTICON_KEYBOARDS").get(null);
    }

    @SuppressWarnings("unchecked")
    private static Map<Object, Boolean> currentCustomEmoticonRenderMode() throws Exception {
        return (Map<Object, Boolean>) staticField("CURRENT_CUSTOM_EMOTICON_RENDER_MODE").get(null);
    }

    private static AtomicBoolean activeCustomEmoticonSession() throws Exception {
        return (AtomicBoolean) staticField("ACTIVE_CUSTOM_EMOTICON_SESSION").get(null);
    }

    @SuppressWarnings("unchecked")
    private static AtomicReference<Object> currentCustomEmoticonSessionKeyboard() throws Exception {
        return (AtomicReference<Object>) staticField("CURRENT_CUSTOM_EMOTICON_SESSION_KEYBOARD")
                .get(null);
    }

    @SuppressWarnings("unchecked")
    private static AtomicReference<Object> pendingStockEmoticonTabSwitchKeyboard()
            throws Exception {
        return (AtomicReference<Object>) staticField("PENDING_STOCK_EMOTICON_TAB_SWITCH_KEYBOARD")
                .get(null);
    }

    @SuppressWarnings("unchecked")
    private static AtomicReference<Boolean> pendingStockEmoticonTabSwitchRenderMode()
            throws Exception {
        return (AtomicReference<Boolean>)
                staticField("PENDING_STOCK_EMOTICON_TAB_SWITCH_RENDER_MODE").get(null);
    }

    private static AtomicBoolean pendingStockEmoticonTabSwitchActiveSession() throws Exception {
        return (AtomicBoolean) staticField("PENDING_STOCK_EMOTICON_TAB_SWITCH_ACTIVE_SESSION")
                .get(null);
    }

    private static void setStaticLong(String fieldName, long value) throws Exception {
        staticField(fieldName).setLong(null, value);
    }

    private static Field staticField(String fieldName) throws Exception {
        Field field = GboardAddSymbolsRuntime.class.getDeclaredField(fieldName);
        field.setAccessible(true);
        return field;
    }

    private static Method privateMethod(String methodName) throws Exception {
        Method method = GboardAddSymbolsRuntime.class.getDeclaredMethod(methodName);
        method.setAccessible(true);
        return method;
    }

    private static String localeAwareCategoryLabel(String categoryKey, Locale locale)
            throws Exception {
        Method method = GboardAddSymbolsRuntime.class.getDeclaredMethod(
                "resolveCustomEmoticonCategoryLabel",
                String.class,
                Locale.class);
        method.setAccessible(true);
        return (String) method.invoke(null, categoryKey, locale);
    }
}
