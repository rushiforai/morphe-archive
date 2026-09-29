/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings;

import android.content.SharedPreferences;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.settings.preference.SharedPrefCategory;

/**
 * Setting's store with a fault put in on purpose for each editor it opens, in order. Editors past
 * the list work. Closing it puts the store it replaced back.
 */
public final class FailingStore implements AutoCloseable {
    /** What one editor does. */
    public enum Fault {
        /** Works. */
        NONE,
        /** {@code edit()} throws. */
        EDIT_THROWS,
        /** The editor refuses the first value it's handed. */
        STAGE_THROWS,
        /** The commit lands and still answers false. */
        COMMIT_FALSE,
        /** The commit throws before it lands. */
        COMMIT_THROWS,
        /** The commit lands, then throws. */
        COMMIT_THROWS_AFTER_LANDING,
        /** The commit never lands and answers false. */
        LOST
    }

    /** How many editors were asked for, the refused ones included. */
    public final AtomicInteger editors = new AtomicInteger();

    private final Field field;
    private final Object replaced;

    private FailingStore(Fault[] faults) throws ReflectiveOperationException {
        field = SharedPrefCategory.class.getDeclaredField("preferences");
        field.setAccessible(true);
        replaced = field.get(Setting.preferences);
        SharedPreferences target = (SharedPreferences) replaced;
        field.set(Setting.preferences, Proxy.newProxyInstance(target.getClass().getClassLoader(),
                new Class<?>[]{SharedPreferences.class}, (proxy, method, args) -> {
                    if (!method.getName().equals("edit")) return call(method, target, args);
                    int index = editors.getAndIncrement();
                    Fault fault = index < faults.length ? faults[index] : Fault.NONE;
                    if (fault == Fault.EDIT_THROWS) throw new IllegalStateException("injected editor failure");
                    SharedPreferences.Editor editor = target.edit();
                    return Proxy.newProxyInstance(editor.getClass().getClassLoader(),
                            new Class<?>[]{SharedPreferences.Editor.class}, (editorProxy, edit, values) -> {
                                String name = edit.getName();
                                if (name.equals("commit")) return commit(fault, editor);
                                if (fault == Fault.STAGE_THROWS && (name.startsWith("put") || name.equals("remove"))) {
                                    throw new IllegalArgumentException("injected staging failure");
                                }
                                Object result = call(edit, editor, values);
                                return result instanceof SharedPreferences.Editor ? editorProxy : result;
                            });
                }));
    }

    /** Puts the faults in, one per editor, until {@link #close()}. */
    public static FailingStore install(Fault... faults) {
        try {
            return new FailingStore(faults);
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Could not replace Setting's store", failure);
        }
    }

    @Override
    public void close() {
        try {
            field.set(Setting.preferences, replaced);
        } catch (IllegalAccessException failure) {
            throw new IllegalStateException("Could not put Setting's store back", failure);
        }
    }

    private static boolean commit(Fault fault, SharedPreferences.Editor editor) {
        switch (fault) {
            case COMMIT_THROWS:
                throw new IllegalStateException("injected commit failure");
            case LOST:
                return false;
            case COMMIT_FALSE:
                editor.commit();
                return false;
            case COMMIT_THROWS_AFTER_LANDING:
                editor.commit();
                throw new IllegalStateException("injected commit failure after landing");
            default:
                return editor.commit();
        }
    }

    private static Object call(java.lang.reflect.Method method, Object target, Object[] args) throws Throwable {
        try {
            return method.invoke(target, args);
        } catch (InvocationTargetException failure) {
            throw failure.getCause();
        }
    }
}
