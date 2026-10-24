/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hxreborn.extension.shared;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public abstract class ProxyHandler implements InvocationHandler {

    @Override
    public final Object invoke(Object proxy, Method method, Object[] args) {
        final String name = method.getName();
        if ("toString".equals(name)) {
            return describe();
        }
        if ("hashCode".equals(name)) {
            return System.identityHashCode(proxy);
        }
        if ("equals".equals(name)) {
            return proxy == args[0];
        }
        return handle(method, args);
    }

    protected String describe() {
        return getClass().getSimpleName();
    }

    protected abstract Object handle(Method method, Object[] args);

}
