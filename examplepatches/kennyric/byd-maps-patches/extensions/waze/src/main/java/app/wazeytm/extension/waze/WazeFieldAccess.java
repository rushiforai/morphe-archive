package app.wazeytm.extension.waze;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

/** Resolve the verified SDK field shapes without JADX's display-only field aliases. */
public final class WazeFieldAccess {
    private WazeFieldAccess() { }

    public static Field find(Class<?> owner, Class<?> type, boolean isStatic) throws NoSuchFieldException {
        Field found = null;
        for (Field field : owner.getDeclaredFields()) {
            if (field.getType() != type || Modifier.isStatic(field.getModifiers()) != isStatic) continue;
            if (found != null) throw new NoSuchFieldException("Ambiguous " + type.getName() + " in " + owner.getName());
            found = field;
        }
        if (found == null) throw new NoSuchFieldException(type.getName() + " in " + owner.getName());
        found.setAccessible(true);
        return found;
    }
}
