package h90;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.net.ssl.SSLSocket;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public class f implements m {

    /* renamed from: f, reason: collision with root package name */
    public static final e f59551f = new e();

    /* renamed from: a, reason: collision with root package name */
    public final Class f59552a;

    /* renamed from: b, reason: collision with root package name */
    public final Method f59553b;

    /* renamed from: c, reason: collision with root package name */
    public final Method f59554c;

    /* renamed from: d, reason: collision with root package name */
    public final Method f59555d;

    /* renamed from: e, reason: collision with root package name */
    public final Method f59556e;

    public f(Class cls) throws NoSuchMethodException, SecurityException {
        this.f59552a = cls;
        Method declaredMethod = cls.getDeclaredMethod("setUseSessionTickets", Boolean.TYPE);
        Intrinsics.f(declaredMethod, "sslSocketClass.getDeclar…:class.javaPrimitiveType)");
        this.f59553b = declaredMethod;
        this.f59554c = cls.getMethod("setHostname", String.class);
        this.f59555d = cls.getMethod("getAlpnSelectedProtocol", null);
        this.f59556e = cls.getMethod("setAlpnProtocols", byte[].class);
    }

    @Override // h90.m
    public final boolean a(SSLSocket sSLSocket) {
        return this.f59552a.isInstance(sSLSocket);
    }

    @Override // h90.m
    public final boolean b() {
        boolean z11 = g90.c.f57251e;
        return jk.b.L();
    }

    @Override // h90.m
    public final String c(SSLSocket sSLSocket) {
        if (this.f59552a.isInstance(sSLSocket)) {
            try {
                byte[] bArr = (byte[]) this.f59555d.invoke(sSLSocket, null);
                if (bArr != null) {
                    return new String(bArr, Charsets.f72000b);
                }
            } catch (IllegalAccessException e3) {
                throw new AssertionError(e3);
            } catch (InvocationTargetException e11) {
                Throwable cause = e11.getCause();
                if (!(cause instanceof NullPointerException) || !Intrinsics.b(((NullPointerException) cause).getMessage(), "ssl == null")) {
                    throw new AssertionError(e11);
                }
            }
        }
        return null;
    }

    @Override // h90.m
    public final void d(SSLSocket sSLSocket, String str, List protocols) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(protocols, "protocols");
        if (this.f59552a.isInstance(sSLSocket)) {
            try {
                this.f59553b.invoke(sSLSocket, Boolean.TRUE);
                if (str != null) {
                    this.f59554c.invoke(sSLSocket, str);
                }
                Method method = this.f59556e;
                g90.m mVar = g90.m.f57276a;
                method.invoke(sSLSocket, lm.e.l(protocols));
            } catch (IllegalAccessException e3) {
                throw new AssertionError(e3);
            } catch (InvocationTargetException e11) {
                throw new AssertionError(e11);
            }
        }
    }
}
