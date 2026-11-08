package app.sqzass.patches.protonvpn;

import java.lang.reflect.Field;

final class Reflection {
    private Reflection() {}
    static Object call(Object target, String method) {
        try {
            return target.getClass().getMethod(method).invoke(target);
        } catch (ReflectiveOperationException ex) {
            throw new IllegalStateException(ex);
        }
    }
    static Object read(Object target, String field) {
        try {
            Field member = target.getClass().getDeclaredField(field);
            member.setAccessible(true);
            return member.get(target);
        } catch (ReflectiveOperationException ex) {
            throw new IllegalStateException(ex);
        }
    }
}
