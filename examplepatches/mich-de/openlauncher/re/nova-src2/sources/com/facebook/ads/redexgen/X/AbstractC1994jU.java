package com.facebook.ads.redexgen.X;

import java.lang.reflect.Proxy;

/* renamed from: com.facebook.ads.redexgen.X.jU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1994jU {
    public static <T> T A00(T impl, Class<T> clazz) {
        ClassLoader classLoader = impl.getClass().getClassLoader();
        return clazz.cast(Proxy.newProxyInstance(classLoader, new Class[]{clazz}, new C1993jT(impl, classLoader)));
    }
}
