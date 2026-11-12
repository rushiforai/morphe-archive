package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Arrays;

/** Reconnects a transformed native getter result to its actual cached field. */
final class AttachmentCacheFields {
    private AttachmentCacheFields() { }

    static Field reconnect(Object model, String[] returned, String[] projected)
            throws ReflectiveOperationException {
        Field sole = null, equal = null, selected = null;
        int fieldCount = 0, equalCount = 0;
        for (Field field : model.getClass().getDeclaredFields()) {
            if (field.getType() != String[].class || Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            fieldCount++;
            sole = field;
            Object cached = field.get(model);
            if (cached == returned) {
                selected = field;
                break;
            }
            if (cached instanceof String[] && Arrays.equals((String[]) cached, returned)) {
                equal = field;
                equalCount++;
            }
        }
        if (selected == null && equalCount == 1) selected = equal;
        if (selected == null && fieldCount == 1) selected = sole;
        if (selected != null && selected.get(model) != projected) selected.set(model, projected);
        return selected;
    }
}
