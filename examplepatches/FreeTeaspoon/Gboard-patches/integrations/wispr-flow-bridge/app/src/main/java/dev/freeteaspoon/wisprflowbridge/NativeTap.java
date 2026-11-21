package dev.freeteaspoon.wisprflowbridge;

import java.lang.reflect.Method;

/** Runs the same permission gate, toggle and follow-up callback as Wispr's short tap. */
final class NativeTap {
    private NativeTap() {}

    static boolean run(Object permissionGate, Object toggle, Object eventSink) throws Exception {
        if (Boolean.TRUE.equals(call(permissionGate, "invoke", new Class<?>[0]))) return false;
        toggle(toggle, eventSink, true);
        return true;
    }

    static void toggle(Object toggle, Object eventSink, boolean submit) throws Exception {
        Object result = call(toggle, "invoke", new Class<?>[]{Object.class, Object.class},
                submit, Boolean.FALSE);
        if (result == null) throw new IllegalStateException("Missing recording toggle result");
        Object followUp = call(result, "getFollowUp", new Class<?>[0]);
        if (followUp != null) call(eventSink, "invoke", new Class<?>[]{Object.class}, followUp);
    }

    private static Object call(Object owner, String name, Class<?>[] parameters, Object... args)
            throws Exception {
        Method method = owner.getClass().getMethod(name, parameters);
        method.setAccessible(true);
        return method.invoke(owner, args);
    }
}
