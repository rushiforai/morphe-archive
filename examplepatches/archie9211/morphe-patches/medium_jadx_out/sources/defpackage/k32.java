package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class k32 {
    public static final /* synthetic */ long a;
    public static final /* synthetic */ long b;
    public static final /* synthetic */ int c = 0;
    private volatile /* synthetic */ Object _next$volatile;
    private volatile /* synthetic */ Object _prev$volatile;

    static {
        Unsafe unsafe = m80.a;
        a = unsafe.objectFieldOffset(k32.class.getDeclaredField("_next$volatile"));
        b = unsafe.objectFieldOffset(k32.class.getDeclaredField("_prev$volatile"));
    }

    public k32(jwb jwbVar) {
        this._prev$volatile = jwbVar;
    }

    public final void a() {
        m80.a.putObjectVolatile(this, b, (Object) null);
    }

    public final k32 c() {
        Object objectVolatile = m80.a.getObjectVolatile(this, a);
        if (objectVolatile == s42.f) {
            return null;
        }
        return (k32) objectVolatile;
    }

    public abstract boolean d();

    public final void e() {
        k32 k32Var;
        Unsafe unsafe;
        if (c() == null) {
            return;
        }
        while (true) {
            Unsafe unsafe2 = m80.a;
            long j = b;
            k32 k32Var2 = (k32) unsafe2.getObjectVolatile(this, j);
            while (k32Var2 != null && k32Var2.d()) {
                k32Var2 = (k32) m80.a.getObjectVolatile(k32Var2, j);
            }
            k32 k32VarC = c();
            k32VarC.getClass();
            do {
                k32Var = k32VarC;
                if (!k32Var.d()) {
                    break;
                } else {
                    k32VarC = k32Var.c();
                }
            } while (k32VarC != null);
            while (true) {
                Object objectVolatile = m80.a.getObjectVolatile(k32Var, j);
                k32 k32Var3 = ((k32) objectVolatile) == null ? null : k32Var2;
                do {
                    unsafe = m80.a;
                    if (unsafe.compareAndSwapObject(k32Var, b, objectVolatile, k32Var3)) {
                        break;
                    }
                } while (unsafe.getObjectVolatile(k32Var, j) == objectVolatile);
            }
            if (k32Var2 != null) {
                unsafe.putObjectVolatile(k32Var2, a, k32Var);
            }
            if (!k32Var.d() || k32Var.c() == null) {
                if (k32Var2 == null || !k32Var2.d()) {
                    return;
                }
            }
        }
    }
}
