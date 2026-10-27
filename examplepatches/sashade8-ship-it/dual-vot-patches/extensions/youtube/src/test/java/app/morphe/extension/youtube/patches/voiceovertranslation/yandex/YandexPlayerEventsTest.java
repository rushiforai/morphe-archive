/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;

import org.junit.Test;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

public class YandexPlayerEventsTest {
    public static class JavaEvent {
        final Set<Consumer<Object>> listeners = new LinkedHashSet<>();

        public void addObserver(Consumer<Object> observer) { listeners.add(observer); }
        public void removeObserver(Consumer<Object> observer) { listeners.remove(observer); }
        public int size() { return listeners.size(); }
        public void fire(Object value) {
            for (Consumer<Object> observer : new ArrayList<>(listeners)) observer.accept(value);
        }
    }

    public static class LegacyEvent {
        final Set<Function1<Object, Unit>> listeners = new LinkedHashSet<>();

        public void addObserver(Function1<Object, Unit> observer) { listeners.add(observer); }
        public void removeObserver(Function1<Object, Unit> observer) { listeners.remove(observer); }
        public void fire(Object value) {
            for (Function1<Object, Unit> observer : new ArrayList<>(listeners)) {
                assertSame(Unit.INSTANCE, observer.invoke(value));
            }
        }
    }

    @Test
    public void javaEventsWorkWithoutAnyKotlinClasses() throws Exception {
        // Compile-time availability of Kotlin hid the previous NoClassDefFoundError.
        // Load the production adapter and event again with Kotlin entirely forbidden.
        ClassLoader source = getClass().getClassLoader();
        ClassLoader withoutKotlin = new ClassLoader(null) {
            @Override
            protected Class<?> findClass(String name) throws ClassNotFoundException {
                if (name.startsWith("kotlin.")) throw new ClassNotFoundException(name);
                if (!name.equals(YandexPlayerEvents.class.getName())
                        && !name.equals(JavaEvent.class.getName())) throw new ClassNotFoundException(name);
                try (InputStream input = source.getResourceAsStream(name.replace('.', '/') + ".class")) {
                    if (input == null) throw new ClassNotFoundException(name);
                    ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int count;
                    while ((count = input.read(buffer)) != -1) bytes.write(buffer, 0, count);
                    byte[] code = bytes.toByteArray();
                    return defineClass(name, code, 0, code.length);
                } catch (java.io.IOException error) {
                    throw new ClassNotFoundException(name, error);
                }
            }
        };
        Class<?> eventClass = withoutKotlin.loadClass(JavaEvent.class.getName());
        Object event = eventClass.getConstructor().newInstance();
        Method observe = withoutKotlin.loadClass(YandexPlayerEvents.class.getName())
                .getDeclaredMethod("observe", Object.class, Consumer.class);
        observe.setAccessible(true);
        List<Object> received = new ArrayList<>();
        Runnable remove = (Runnable) observe.invoke(null, event, (Consumer<Object>) received::add);
        eventClass.getMethod("fire", Object.class).invoke(event, "playing");
        eventClass.getMethod("fire", Object.class).invoke(event, "paused");
        assertEquals(2, received.size());
        remove.run();
        remove.run();
        assertEquals(0, eventClass.getMethod("size").invoke(event));
        eventClass.getMethod("fire", Object.class).invoke(event, "stopped");
        assertEquals(2, received.size());
    }

    @Test
    public void legacyEventsReturnUnitAndRemoveTheSameProxy() {
        LegacyEvent event = new LegacyEvent();
        List<String> received = new ArrayList<>();
        Runnable remove = YandexPlayerEvents.<String>observe(event, received::add);
        Function1<Object, Unit> listener = event.listeners.iterator().next();
        assertTrue(listener.equals(listener));
        assertTrue(!listener.equals(new Object()));
        assertEquals(listener.hashCode(), listener.hashCode());
        event.fire("playing");
        event.fire("paused");
        assertEquals(2, received.size());
        remove.run();
        remove.run();
        assertTrue(event.listeners.isEmpty());
    }

    @Test
    public void observersCanRemoveThemselvesDuringNotification() {
        JavaEvent current = new JavaEvent();
        Runnable[] removeCurrent = new Runnable[1];
        removeCurrent[0] = YandexPlayerEvents.observe(current, value -> removeCurrent[0].run());
        current.fire("pip");
        assertTrue(current.listeners.isEmpty());

        LegacyEvent legacy = new LegacyEvent();
        Runnable[] removeLegacy = new Runnable[1];
        removeLegacy[0] = YandexPlayerEvents.observe(legacy, value -> removeLegacy[0].run());
        legacy.fire("pip");
        assertTrue(legacy.listeners.isEmpty());
    }
}
