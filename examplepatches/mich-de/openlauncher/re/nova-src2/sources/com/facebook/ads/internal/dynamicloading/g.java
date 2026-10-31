package com.facebook.ads.internal.dynamicloading;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public final class g implements InvocationHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h f27524a;

    public g(h hVar) {
        this.f27524a = hVar;
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) {
        if ("toString".equals(method.getName())) {
            return null;
        }
        this.f27524a.f27525a = method;
        return null;
    }
}
