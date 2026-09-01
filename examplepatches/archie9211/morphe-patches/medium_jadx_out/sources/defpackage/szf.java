package defpackage;

import java.lang.reflect.Field;
import java.security.PrivilegedExceptionAction;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class szf extends ur7 {
    public static final Unsafe i;
    public static final long j;
    public static final long k;
    public static final long l;
    public static final long m;
    public static final long n;

    static {
        Unsafe unsafeQ;
        try {
            try {
                unsafeQ = Unsafe.getUnsafe();
            } catch (SecurityException unused) {
                try {
                    unsafeQ = (Unsafe) Class.forName("java.security.AccessController").getMethod("doPrivileged", PrivilegedExceptionAction.class).invoke(null, new l2e(4));
                } catch (Exception unused2) {
                    unsafeQ = Q();
                }
            }
            try {
                k = unsafeQ.objectFieldOffset(vzf.class.getDeclaredField("c"));
                j = unsafeQ.objectFieldOffset(vzf.class.getDeclaredField("b"));
                l = unsafeQ.objectFieldOffset(vzf.class.getDeclaredField("a"));
                m = unsafeQ.objectFieldOffset(tzf.class.getDeclaredField("a"));
                n = unsafeQ.objectFieldOffset(tzf.class.getDeclaredField("b"));
                i = unsafeQ;
            } catch (NoSuchFieldException e) {
                ik4.j(e);
            }
        } catch (Exception e2) {
            lg8.p("Could not initialize intrinsics", e2);
        }
    }

    public static /* synthetic */ Unsafe Q() throws IllegalAccessException {
        for (Field field : Unsafe.class.getDeclaredFields()) {
            field.setAccessible(true);
            Object obj = field.get(null);
            if (Unsafe.class.isInstance(obj)) {
                return (Unsafe) Unsafe.class.cast(obj);
            }
        }
        throw new NoSuchFieldError("the Unsafe");
    }

    @Override // defpackage.ur7
    public final nzf G(h1g h1gVar) {
        nzf nzfVar;
        nzf nzfVar2 = nzf.d;
        do {
            nzfVar = h1gVar.b;
            if (nzfVar2 == nzfVar) {
                break;
            }
        } while (!N(h1gVar, nzfVar, nzfVar2));
        return nzfVar;
    }

    @Override // defpackage.ur7
    public final tzf K(h1g h1gVar) {
        tzf tzfVar;
        tzf tzfVar2 = tzf.c;
        do {
            tzfVar = h1gVar.c;
            if (tzfVar2 == tzfVar) {
                break;
            }
        } while (!P(h1gVar, tzfVar, tzfVar2));
        return tzfVar;
    }

    @Override // defpackage.ur7
    public final void L(tzf tzfVar, tzf tzfVar2) {
        i.putObject(tzfVar, n, tzfVar2);
    }

    @Override // defpackage.ur7
    public final void M(tzf tzfVar, Thread thread) {
        i.putObject(tzfVar, m, thread);
    }

    @Override // defpackage.ur7
    public final boolean N(h1g h1gVar, nzf nzfVar, nzf nzfVar2) {
        return hk7.N(i, h1gVar, j, nzfVar, nzfVar2);
    }

    @Override // defpackage.ur7
    public final boolean O(vzf vzfVar, Object obj, Object obj2) {
        return hk7.N(i, vzfVar, l, obj, obj2);
    }

    @Override // defpackage.ur7
    public final boolean P(vzf vzfVar, tzf tzfVar, tzf tzfVar2) {
        return hk7.N(i, vzfVar, k, tzfVar, tzfVar2);
    }
}
