package com.facebook.ads.internal.dynamicloading;

import com.facebook.ads.Ad;
import com.facebook.ads.AdListener;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class e implements InvocationHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ArrayList f27513a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ HashMap f27514b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ArrayList f27515c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ArrayList f27516d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ HashMap f27517e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ ArrayList f27518f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ ArrayList f27519g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Method f27520h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Method f27521i;

    public e(ArrayList arrayList, HashMap map, ArrayList arrayList2, ArrayList arrayList3, HashMap map2, ArrayList arrayList4, ArrayList arrayList5, Method method, Method method2) {
        this.f27513a = arrayList;
        this.f27514b = map;
        this.f27515c = arrayList2;
        this.f27516d = arrayList3;
        this.f27517e = map2;
        this.f27518f = arrayList4;
        this.f27519g = arrayList5;
        this.f27520h = method;
        this.f27521i = method2;
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) {
        HashMap map;
        boolean zIsPrimitive = method.getReturnType().isPrimitive();
        HashMap map2 = this.f27514b;
        if (zIsPrimitive) {
            if (!method.getReturnType().equals(Void.TYPE)) {
                return Array.get(Array.newInstance(method.getReturnType(), 1), 0);
            }
            Iterator it = this.f27513a.iterator();
            while (it.hasNext() && (!DynamicLoaderFallback.equalsMethods(method, (Method) it.next()) || !DynamicLoaderFallback.reportError(obj, map2))) {
            }
            Iterator it2 = this.f27515c.iterator();
            while (it2.hasNext()) {
                if (DynamicLoaderFallback.equalsMethods(method, (Method) it2.next()) && DynamicLoaderFallback.reportError(obj, map2)) {
                    return null;
                }
            }
            return null;
        }
        if (method.getReturnType().equals(String.class)) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Object objNewProxyInstance = method.getReturnType().equals(obj.getClass().getInterfaces()[0]) ? obj : Proxy.newProxyInstance(DynamicLoaderFallback.class.getClassLoader(), new Class[]{method.getReturnType()}, this);
        Iterator it3 = this.f27516d.iterator();
        while (true) {
            boolean zHasNext = it3.hasNext();
            map = this.f27517e;
            if (!zHasNext) {
                break;
            }
            if (DynamicLoaderFallback.equalsMethods(method, (Method) it3.next())) {
                DynamicLoaderFallback.sApiProxyToAdListenersMap.put(map.get(obj), (AdListener) objArr[0]);
                break;
            }
        }
        Iterator it4 = this.f27518f.iterator();
        while (it4.hasNext()) {
            if (DynamicLoaderFallback.equalsMethods(method, (Method) it4.next())) {
                map.put(objNewProxyInstance, obj);
            }
        }
        Iterator it5 = this.f27519g.iterator();
        while (it5.hasNext()) {
            if (DynamicLoaderFallback.equalsMethods(method, (Method) it5.next())) {
                for (Object obj2 : objArr) {
                    if (obj2 instanceof Ad) {
                        map2.put(objNewProxyInstance, (Ad) obj2);
                    }
                }
            }
        }
        if (DynamicLoaderFallback.equalsMethods(method, this.f27520h)) {
            map2.put(objArr[1], (Ad) objArr[0]);
        }
        if (DynamicLoaderFallback.equalsMethods(method, this.f27521i)) {
            map2.put(objArr[1], (Ad) objArr[0]);
        }
        return objNewProxyInstance;
    }
}
