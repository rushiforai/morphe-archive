/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings.preference;

import static org.junit.Assert.assertEquals;

import android.content.SharedPreferences;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Proxy;

import app.morphe.extension.shared.Utils;

/**
 * A stored enum name this build doesn't know (left by a build with more choices) falls back to the
 * default and is removed. When that removal can't be written, the read still answers the default:
 * before, the failed commit's IllegalStateException went out of getEnum and so out of the
 * setting's load, where the wrong-type branch beside it already caught the same failure.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 30)
public class UnknownEnumValueTest {
    private enum Choice { KNOWN, OTHER }

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
    }

    @Test public void anUnknownNameReadsAsTheDefaultEvenWhenItCantBeRemoved() throws Exception {
        SharedPrefCategory category = new SharedPrefCategory("unknown_enum_" + System.nanoTime());
        Field store = SharedPrefCategory.class.getDeclaredField("preferences");
        store.setAccessible(true);
        store.set(category, storeThatCantCommit());

        assertEquals(Choice.OTHER, category.getEnum("start_tab", Choice.OTHER));
    }

    /** Holds a name no Choice has, and refuses every write. */
    private static SharedPreferences storeThatCantCommit() {
        SharedPreferences.Editor[] editor = new SharedPreferences.Editor[1];
        editor[0] = (SharedPreferences.Editor) Proxy.newProxyInstance(UnknownEnumValueTest.class.getClassLoader(),
                new Class<?>[]{SharedPreferences.Editor.class}, (proxy, method, args) -> {
                    if (method.getName().equals("commit")) return false;
                    if (method.getName().equals("apply")) return null;
                    return editor[0];
                });
        return (SharedPreferences) Proxy.newProxyInstance(UnknownEnumValueTest.class.getClassLoader(),
                new Class<?>[]{SharedPreferences.class}, (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "getString": return "REMOVED_IN_THIS_BUILD";
                        case "edit": return editor[0];
                        case "contains": return true;
                        default: throw new UnsupportedOperationException(method.getName());
                    }
                });
    }
}
