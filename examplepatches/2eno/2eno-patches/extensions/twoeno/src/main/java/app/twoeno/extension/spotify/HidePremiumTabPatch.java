package app.twoeno.extension.spotify;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.twoeno.extension.shared.Logger;

/**
 * Removes the "Premium" tab from the bottom navigation bar.
 */
@SuppressWarnings("unused")
public final class HidePremiumTabPatch {
    private static final int TAB_COUNT = 5;

    /**
     * Bits of the tab set flags that must be cleared once the tab count changed.
     */
    private static final int PREMIUM_TAB_FLAGS = 8 | 16;

    private static final Map<Class<?>, Field> tabTypeFields = new ConcurrentHashMap<>();

    /**
     * State of the constructor call being patched, for bytecode patches without free registers.
     */
    private static final class PendingTabs {
        final Object[] tabs;
        int next;

        PendingTabs(Object[] tabs) {
            this.tabs = tabs;
        }
    }

    private static final ThreadLocal<PendingTabs> pendingTabs = new ThreadLocal<>();

    private HidePremiumTabPatch() {
    }

    /**
     * @return The field of the tab holding the navigation tab enum ({@code HOME, SEARCH, YOUR_LIBRARY, PREMIUM, CREATE}).
     */
    private static Field getTabTypeField(Class<?> tabClass) throws NoSuchFieldException {
        Field cached = tabTypeFields.get(tabClass);
        if (cached != null) return cached;

        for (Field field : tabClass.getDeclaredFields()) {
            Object[] constants = field.getType().getEnumConstants();
            if (constants == null) continue;
            for (Object constant : constants) {
                if (((Enum<?>) constant).name().equals("PREMIUM")) {
                    field.setAccessible(true);
                    tabTypeFields.put(tabClass, field);
                    return field;
                }
            }
        }
        throw new NoSuchFieldException("Navigation tab enum not found in " + tabClass.getName());
    }

    private static boolean isPremiumTab(Object tab) throws ReflectiveOperationException {
        Object type = getTabTypeField(tab.getClass()).get(tab);
        return type instanceof Enum && ((Enum<?>) type).name().equals("PREMIUM");
    }

    /**
     * Injection point: start of the navigation tab set constructor {@code (Tab, Tab, Tab, Tab, Tab, int flags)}.
     *
     * @return The tabs without the Premium tab, padded with null to 5 tabs,
     * or null if the tabs do not contain the Premium tab.
     */
    public static Object[] filterTabs(Object tab0, Object tab1, Object tab2, Object tab3, Object tab4) {
        try {
            List<Object> kept = new ArrayList<>(TAB_COUNT);
            boolean removed = false;
            for (Object tab : new Object[]{tab0, tab1, tab2, tab3, tab4}) {
                if (tab == null) continue;
                if (isPremiumTab(tab)) {
                    removed = true;
                } else {
                    kept.add(tab);
                }
            }
            if (!removed) return null;

            Object[] tabs = new Object[TAB_COUNT];
            for (int i = 0; i < kept.size(); i++) tabs[i] = kept.get(i);
            return tabs;
        } catch (Throwable ex) {
            Logger.error("filterTabs failure", ex);
            return null;
        }
    }

    /**
     * Clears the flags that must be cleared after {@link #filterTabs} removed a tab.
     */
    public static int filterFlags(int flags) {
        return flags & ~PREMIUM_TAB_FLAGS;
    }

    // region Bytecode patch injection points, called in this order at the start of the constructor.

    public static void prepareTabs(Object tab0, Object tab1, Object tab2, Object tab3, Object tab4) {
        Object[] tabs = filterTabs(tab0, tab1, tab2, tab3, tab4);
        if (tabs == null) {
            pendingTabs.remove();
        } else {
            pendingTabs.set(new PendingTabs(tabs));
        }
    }

    /**
     * Called once for each tab parameter, in parameter order.
     */
    public static Object nextTab(Object originalTab) {
        PendingTabs pending = pendingTabs.get();
        return pending == null ? originalTab : pending.tabs[pending.next++];
    }

    public static int finishTabs(int flags) {
        PendingTabs pending = pendingTabs.get();
        if (pending == null) return flags;
        pendingTabs.remove();
        return filterFlags(flags);
    }

    // endregion
}
