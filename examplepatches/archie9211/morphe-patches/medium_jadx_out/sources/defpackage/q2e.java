package defpackage;

import java.lang.reflect.Field;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class q2e {
    public final /* synthetic */ int a;
    public final Unsafe b;

    public /* synthetic */ q2e(Unsafe unsafe, int i) {
        this.a = i;
        this.b = unsafe;
    }

    public abstract void A(Object obj, long j, double d);

    public abstract void B(Object obj, long j, double d);

    public abstract void C(Object obj, long j, float f);

    public abstract boolean D(long j, Object obj);

    public abstract void a(long j, byte[] bArr, long j2);

    public abstract boolean b(long j, Object obj);

    public abstract byte c(long j);

    public abstract byte d(long j, Object obj);

    public abstract double e(long j, Object obj);

    public abstract float f(long j, Object obj);

    public abstract void g(Object obj, long j, boolean z);

    public abstract void h(Object obj, long j, byte b);

    public abstract void i(Object obj, long j, double d);

    public abstract void j(Object obj, long j, float f);

    public boolean k() {
        int i = this.a;
        Class<?> cls = Integer.TYPE;
        Class<?> cls2 = Long.TYPE;
        Unsafe unsafe = this.b;
        switch (i) {
            case 0:
                if (unsafe != null) {
                    try {
                        Class<?> cls3 = unsafe.getClass();
                        cls3.getMethod("objectFieldOffset", Field.class);
                        cls3.getMethod("arrayBaseOffset", Class.class);
                        cls3.getMethod("arrayIndexScale", Class.class);
                        cls3.getMethod("getInt", Object.class, cls2);
                        cls3.getMethod("putInt", Object.class, cls2, cls);
                        cls3.getMethod("getLong", Object.class, cls2);
                        cls3.getMethod("putLong", Object.class, cls2, cls2);
                        cls3.getMethod("getObject", Object.class, cls2);
                        cls3.getMethod("putObject", Object.class, cls2, Object.class);
                    } catch (Throwable th) {
                        r2e.k(th);
                    }
                }
                break;
            default:
                if (unsafe != null) {
                    try {
                        Class<?> cls4 = unsafe.getClass();
                        cls4.getMethod("objectFieldOffset", Field.class);
                        cls4.getMethod("arrayBaseOffset", Class.class);
                        cls4.getMethod("arrayIndexScale", Class.class);
                        cls4.getMethod("getInt", Object.class, cls2);
                        cls4.getMethod("putInt", Object.class, cls2, cls);
                        cls4.getMethod("getLong", Object.class, cls2);
                        cls4.getMethod("putLong", Object.class, cls2, cls2);
                        cls4.getMethod("getObject", Object.class, cls2);
                        cls4.getMethod("putObject", Object.class, cls2, Object.class);
                    } catch (Throwable th2) {
                        s2e.i(th2);
                    }
                }
                break;
        }
        return false;
    }

    public abstract boolean l();

    public abstract double m(long j, Object obj);

    public abstract void n(Object obj, long j, byte b);

    public abstract void o(Object obj, long j, double d);

    public abstract void p(Object obj, long j, float f);

    public abstract void q(Object obj, long j, boolean z);

    public abstract boolean r(long j, Object obj);

    public abstract float s(long j, Object obj);

    public abstract void t(Object obj, long j, boolean z);

    public abstract float u(long j, Object obj);

    public abstract void v(Object obj, long j, boolean z);

    public abstract boolean w(long j, Object obj);

    public abstract void x(Object obj, long j, byte b);

    public abstract void y(Object obj, long j, float f);

    public abstract double z(long j, Object obj);
}
