package g90;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.net.ssl.SSLSocket;
import kotlin.jvm.internal.Intrinsics;
import x80.f0;

/* loaded from: classes5.dex */
public final class i extends m {

    /* renamed from: c, reason: collision with root package name */
    public final Method f57262c;

    /* renamed from: d, reason: collision with root package name */
    public final Method f57263d;

    /* renamed from: e, reason: collision with root package name */
    public final Method f57264e;

    /* renamed from: f, reason: collision with root package name */
    public final Class f57265f;

    /* renamed from: g, reason: collision with root package name */
    public final Class f57266g;

    public i(Method method, Method method2, Method method3, Class cls, Class cls2) {
        this.f57262c = method;
        this.f57263d = method2;
        this.f57264e = method3;
        this.f57265f = cls;
        this.f57266g = cls2;
    }

    @Override // g90.m
    public final void a(SSLSocket sSLSocket) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            this.f57264e.invoke(null, sSLSocket);
        } catch (IllegalAccessException e3) {
            throw new AssertionError("failed to remove ALPN", e3);
        } catch (InvocationTargetException e11) {
            throw new AssertionError("failed to remove ALPN", e11);
        }
    }

    @Override // g90.m
    public final void d(SSLSocket sSLSocket, String str, List protocols) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(protocols, "protocols");
        ArrayList arrayList = new ArrayList();
        for (Object obj : protocols) {
            if (((f0) obj) != f0.HTTP_1_0) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(((f0) it.next()).f95490a);
        }
        try {
            this.f57262c.invoke(null, sSLSocket, Proxy.newProxyInstance(m.class.getClassLoader(), new Class[]{this.f57265f, this.f57266g}, new h(arrayList2)));
        } catch (IllegalAccessException e3) {
            throw new AssertionError("failed to set ALPN", e3);
        } catch (InvocationTargetException e11) {
            throw new AssertionError("failed to set ALPN", e11);
        }
    }

    @Override // g90.m
    public final String f(SSLSocket sSLSocket) throws IllegalArgumentException {
        try {
            InvocationHandler invocationHandler = Proxy.getInvocationHandler(this.f57263d.invoke(null, sSLSocket));
            Intrinsics.e(invocationHandler, "null cannot be cast to non-null type okhttp3.internal.platform.Jdk8WithJettyBootPlatform.AlpnProvider");
            h hVar = (h) invocationHandler;
            boolean z11 = hVar.f57260b;
            if (!z11 && hVar.f57261c == null) {
                m.j(this, "ALPN callback dropped: HTTP/2 is disabled. Is alpn-boot on the boot class path?", 6);
                return null;
            }
            if (z11) {
                return null;
            }
            return hVar.f57261c;
        } catch (IllegalAccessException e3) {
            throw new AssertionError("failed to get ALPN selected protocol", e3);
        } catch (InvocationTargetException e11) {
            throw new AssertionError("failed to get ALPN selected protocol", e11);
        }
    }
}
