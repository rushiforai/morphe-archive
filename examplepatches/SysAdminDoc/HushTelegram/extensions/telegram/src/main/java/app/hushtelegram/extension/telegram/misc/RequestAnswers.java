/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Method;

/** Answers the callback of a request that stayed on the phone, the way a server error would. */
final class RequestAnswers {
    private RequestAnswers() {}

    /**
     * Runs the callback's {@code run(response, error)} with no response and an error of Telegram's own
     * type, read off that method, so nothing here names a class R8 could move. False when the callback
     * has no such method. Throws what building the error or the call throws.
     */
    static boolean error(Object callback, int code, String text) throws ReflectiveOperationException {
        for (Class<?> type = callback.getClass(); type != null; type = type.getSuperclass()) {
            for (Class<?> face : type.getInterfaces()) {
                for (Method run : face.getMethods()) {
                    Class<?>[] parameters = run.getParameterTypes();
                    if (!run.getName().equals("run") || parameters.length != 2 || !parameters[1].getName().endsWith("$TL_error")) continue;
                    Object error = parameters[1].getConstructor().newInstance();
                    parameters[1].getField("code").setInt(error, code);
                    parameters[1].getField("text").set(error, text);
                    run.invoke(callback, null, error);
                    return true;
                }
            }
        }
        return false;
    }
}
