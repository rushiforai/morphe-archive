package dev.jason.gboardpatches.extension.shiftdelete;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/** Event members verified against the Gboard 18.8 DEX during patch preflight. */
final class GboardShiftDeleteEventBinding {
    private final Class<?> eventType;
    private final Class<?> entryType;
    private final Field action;
    private final Field entries;
    private final Field metadata;
    private final Field hardwareEvent;
    private final Field code;
    private final Field intention;
    private final Field payload;
    private final Constructor<?> entryConstructor;
    private final Method copy;

    GboardShiftDeleteEventBinding(Class<?> eventType) throws ReflectiveOperationException {
        this.eventType = eventType;
        action = field(eventType, "a");
        entries = field(eventType, "b");
        metadata = field(eventType, "c");
        hardwareEvent = field(eventType, "u");
        entryType = entries.getType().getComponentType();
        code = field(entryType, "d");
        intention = field(entryType, "e");
        payload = field(entryType, "f");
        entryConstructor = entryType.getDeclaredConstructor(
                int.class, intention.getType(), Object.class, int.class);
        copy = eventType.getDeclaredMethod("c", eventType);
        if (!Modifier.isStatic(copy.getModifiers()) || copy.getReturnType() != eventType) {
            throw new NoSuchMethodException("Unexpected Gboard key event copy method");
        }
        entryConstructor.setAccessible(true);
        copy.setAccessible(true);
    }

    Class<?> eventType() {
        return eventType;
    }

    Object remap(Object event, ShiftDeleteSession session) throws ReflectiveOperationException {
        if (hardwareEvent.get(event) != null || metadata.get(event) == null) return event;
        Object data = entries.get(event);
        if (data == null || Array.getLength(data) != 1) return event;
        Object entry = Array.get(data, 0);
        if (entry == null || payload.get(entry) != null) return event;
        if (!(action.get(event) instanceof Enum<?> kind)) return event;

        int originalCode = code.getInt(entry);
        int mappedCode = session.key(kind.name(), originalCode);
        if (mappedCode == originalCode) return event;

        // The fourth constructor argument is a cached hash. A new key code needs a new hash.
        Object replacement = entryConstructor.newInstance(
                mappedCode, intention.get(entry), null, Integer.MAX_VALUE);
        Object result = copy.invoke(null, event);
        if (result == null || result == event) return event;
        Object replacementEntries = Array.newInstance(entryType, 1);
        Array.set(replacementEntries, 0, replacement);
        entries.set(result, replacementEntries);
        return result;
    }

    private static Field field(Class<?> owner, String name) throws NoSuchFieldException {
        Field member = owner.getDeclaredField(name);
        member.setAccessible(true);
        return member;
    }
}
