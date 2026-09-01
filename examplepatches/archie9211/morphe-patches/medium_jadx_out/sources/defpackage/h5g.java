package defpackage;

import com.google.android.gms.internal.play_billing.zzgs;
import com.google.android.gms.internal.play_billing.zzik;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class h5g extends d3g {
    private static final Map zzb = new ConcurrentHashMap();
    protected c9g zzc;
    private int zzd;

    public h5g() {
        this.zza = 0;
        this.zzd = -1;
        this.zzc = c9g.f;
    }

    public static void f(Class cls, h5g h5gVar) {
        h5gVar.e();
        zzb.put(cls, h5gVar);
    }

    public static final boolean i(h5g h5gVar, boolean z) {
        byte bByteValue = ((Byte) h5gVar.j(1)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        boolean zA = w7g.c.a(h5gVar.getClass()).a(h5gVar);
        if (z) {
            h5gVar.j(2);
        }
        return zA;
    }

    public static h5g m(Class cls) {
        Map map = zzb;
        h5g h5gVar = (h5g) map.get(cls);
        if (h5gVar == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                h5gVar = (h5g) map.get(cls);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException("Class initialization cannot fail.", e);
            }
        }
        if (h5gVar != null) {
            return h5gVar;
        }
        try {
            h5g h5gVar2 = (h5g) ((h5g) o9g.a.allocateInstance(cls)).j(6);
            if (h5gVar2 != null) {
                map.put(cls, h5gVar2);
                return h5gVar2;
            }
            lg8.d();
            return null;
        } catch (InstantiationException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static h5g o(h5g h5gVar, byte[] bArr) throws zzgs {
        int length = bArr.length;
        h4g h4gVar = h4g.a;
        int i = g3g.a;
        h4g h4gVar2 = h4g.a;
        if (length != 0) {
            h5g h5gVarN = h5gVar.n();
            try {
                d8g d8gVarA = w7g.c.a(h5gVarN.getClass());
                hmf hmfVar = new hmf();
                h4gVar2.getClass();
                d8gVarA.c(h5gVarN, bArr, 0, length, hmfVar);
                d8gVarA.b(h5gVarN);
                h5gVar = h5gVarN;
            } catch (zzgs e) {
                throw e;
            } catch (zzik e2) {
                ygf.k(e2.getMessage());
                return null;
            } catch (IOException e3) {
                if (e3.getCause() instanceof zzgs) {
                    throw ((zzgs) e3.getCause());
                }
                throw new zzgs(e3.getMessage(), e3);
            } catch (IndexOutOfBoundsException unused) {
                ygf.k("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
                return null;
            }
        }
        if (h5gVar == null || i(h5gVar, true)) {
            return h5gVar;
        }
        ygf.k(new zzik().getMessage());
        return null;
    }

    public static Object p(Method method, h5g h5gVar, Object... objArr) {
        try {
            return method.invoke(h5gVar, objArr);
        } catch (IllegalAccessException e) {
            lg8.p("Couldn't use Java reflection to implement protocol message reflection.", e);
            return null;
        } catch (InvocationTargetException e2) {
            Throwable cause = e2.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            if (cause instanceof Error) {
                throw ((Error) cause);
            }
            lg8.p("Unexpected exception thrown by generated accessor method.", cause);
            return null;
        }
    }

    @Override // defpackage.d3g
    public final void a(c4g c4gVar) {
        d8g d8gVarA = w7g.c.a(getClass());
        ujf ujfVar = c4gVar.a;
        if (ujfVar == null) {
            ujfVar = new ujf(c4gVar);
        }
        d8gVarA.f(this, ujfVar);
    }

    @Override // defpackage.d3g
    public final int c(d8g d8gVar) {
        if (h()) {
            int i = d8gVar.i(this);
            if (i >= 0) {
                return i;
            }
            ygf.f(b09.w(i, "serialized size must be non-negative, was "));
            return 0;
        }
        int i2 = this.zzd & Integer.MAX_VALUE;
        if (i2 != Integer.MAX_VALUE) {
            return i2;
        }
        int i3 = d8gVar.i(this);
        if (i3 >= 0) {
            this.zzd = (this.zzd & Integer.MIN_VALUE) | i3;
            return i3;
        }
        ygf.f(b09.w(i3, "serialized size must be non-negative, was "));
        return 0;
    }

    @Override // defpackage.d3g
    public final int d() {
        if (h()) {
            int i = w7g.c.a(getClass()).i(this);
            if (i >= 0) {
                return i;
            }
            ygf.f(b09.w(i, "serialized size must be non-negative, was "));
            return 0;
        }
        int i2 = this.zzd & Integer.MAX_VALUE;
        if (i2 != Integer.MAX_VALUE) {
            return i2;
        }
        int i3 = w7g.c.a(getClass()).i(this);
        if (i3 >= 0) {
            this.zzd = (this.zzd & Integer.MIN_VALUE) | i3;
            return i3;
        }
        ygf.f(b09.w(i3, "serialized size must be non-negative, was "));
        return 0;
    }

    public final void e() {
        this.zzd &= Integer.MAX_VALUE;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return w7g.c.a(getClass()).h(this, (h5g) obj);
    }

    public final void g() {
        this.zzd = (this.zzd & Integer.MIN_VALUE) | Integer.MAX_VALUE;
    }

    public final boolean h() {
        return (this.zzd & Integer.MIN_VALUE) != 0;
    }

    public final int hashCode() {
        if (h()) {
            return w7g.c.a(getClass()).d(this);
        }
        int i = this.zza;
        if (i != 0) {
            return i;
        }
        int iD = w7g.c.a(getClass()).d(this);
        this.zza = iD;
        return iD;
    }

    public abstract Object j(int i);

    public final y4g k() {
        return (y4g) j(5);
    }

    public final y4g l() {
        y4g y4gVar = (y4g) j(5);
        if (!y4gVar.a.equals(this)) {
            if (!y4gVar.b.h()) {
                y4gVar.c();
            }
            h5g h5gVar = y4gVar.b;
            w7g.c.a(h5gVar.getClass()).e(h5gVar, this);
        }
        return y4gVar;
    }

    public final h5g n() {
        return (h5g) j(4);
    }

    public final String toString() {
        String string = super.toString();
        char[] cArr = k7g.a;
        StringBuilder sb = new StringBuilder();
        sb.append("# ");
        sb.append(string);
        k7g.c(this, sb, 0);
        return sb.toString();
    }
}
