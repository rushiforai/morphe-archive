package com.google.android.gms.internal.play_billing;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public abstract class x2 extends g2 {
    private static final Map zzb = new ConcurrentHashMap();
    protected e4 zzc;
    private int zzd;

    public x2() {
        this.zza = 0;
        this.zzd = -1;
        this.zzc = e4.f33387f;
    }

    public static void f(Class cls, x2 x2Var) {
        x2Var.e();
        zzb.put(cls, x2Var);
    }

    public static final boolean i(x2 x2Var, boolean z11) {
        byte bByteValue = ((Byte) x2Var.j(1)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        boolean zA = u3.f33553c.a(x2Var.getClass()).a(x2Var);
        if (z11) {
            x2Var.j(2);
        }
        return zA;
    }

    public static x2 m(Class cls) throws ClassNotFoundException {
        Map map = zzb;
        x2 x2Var = (x2) map.get(cls);
        if (x2Var == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                x2Var = (x2) map.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (x2Var != null) {
            return x2Var;
        }
        x2 x2Var2 = (x2) ((x2) j4.g(cls)).j(6);
        if (x2Var2 == null) {
            throw new IllegalStateException();
        }
        map.put(cls, x2Var2);
        return x2Var2;
    }

    public static x2 n(x2 x2Var, byte[] bArr) throws zzgc {
        int length = bArr.length;
        p2 p2Var = p2.f33476a;
        int i5 = i2.f33421a;
        p2 p2Var2 = p2.f33476a;
        if (length != 0) {
            x2 x2Var2 = (x2) x2Var.j(4);
            try {
                x3 x3VarA = u3.f33553c.a(x2Var2.getClass());
                com.google.android.gms.internal.measurement.q0 q0Var = new com.google.android.gms.internal.measurement.q0();
                p2Var2.getClass();
                x3VarA.f(x2Var2, bArr, 0, length, q0Var);
                x3VarA.b(x2Var2);
                x2Var = x2Var2;
            } catch (zzgc e3) {
                throw e3;
            } catch (zzia e11) {
                throw new zzgc(e11.getMessage());
            } catch (IOException e12) {
                if (e12.getCause() instanceof zzgc) {
                    throw ((zzgc) e12.getCause());
                }
                throw new zzgc(e12.getMessage(), e12);
            } catch (IndexOutOfBoundsException unused) {
                throw new zzgc("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
        }
        if (x2Var == null || i(x2Var, true)) {
            return x2Var;
        }
        throw new zzgc(new zzia().getMessage());
    }

    public static Object o(Method method, x2 x2Var, Object... objArr) {
        try {
            return method.invoke(x2Var, objArr);
        } catch (IllegalAccessException e3) {
            throw new RuntimeException("Couldn't use Java reflection to implement protocol message reflection.", e3);
        } catch (InvocationTargetException e11) {
            Throwable cause = e11.getCause();
            if (cause instanceof RuntimeException) {
                throw ((RuntimeException) cause);
            }
            if (cause instanceof Error) {
                throw ((Error) cause);
            }
            throw new RuntimeException("Unexpected exception thrown by generated accessor method.", cause);
        }
    }

    @Override // com.google.android.gms.internal.play_billing.g2
    public final void a(n2 n2Var) {
        x3 x3VarA = u3.f33553c.a(getClass());
        k3 k3Var = n2Var.f33459c;
        if (k3Var == null) {
            k3Var = new k3(n2Var);
        }
        x3VarA.c(this, k3Var);
    }

    @Override // com.google.android.gms.internal.play_billing.g2
    public final int c(x3 x3Var) {
        if (h()) {
            int iG = x3Var.g(this);
            if (iG >= 0) {
                return iG;
            }
            throw new IllegalStateException(b.c0.h(iG, "serialized size must be non-negative, was "));
        }
        int i5 = this.zzd & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iG2 = x3Var.g(this);
        if (iG2 < 0) {
            throw new IllegalStateException(b.c0.h(iG2, "serialized size must be non-negative, was "));
        }
        this.zzd = (this.zzd & Integer.MIN_VALUE) | iG2;
        return iG2;
    }

    @Override // com.google.android.gms.internal.play_billing.g2
    public final int d() {
        if (h()) {
            int iG = u3.f33553c.a(getClass()).g(this);
            if (iG >= 0) {
                return iG;
            }
            throw new IllegalStateException(b.c0.h(iG, "serialized size must be non-negative, was "));
        }
        int i5 = this.zzd & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iG2 = u3.f33553c.a(getClass()).g(this);
        if (iG2 < 0) {
            throw new IllegalStateException(b.c0.h(iG2, "serialized size must be non-negative, was "));
        }
        this.zzd = (this.zzd & Integer.MIN_VALUE) | iG2;
        return iG2;
    }

    public final void e() {
        this.zzd &= LayoutNode.NotPlacedPlaceOrder;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return u3.f33553c.a(getClass()).e(this, (x2) obj);
    }

    public final void g() {
        this.zzd = (this.zzd & Integer.MIN_VALUE) | LayoutNode.NotPlacedPlaceOrder;
    }

    public final boolean h() {
        return (this.zzd & Integer.MIN_VALUE) != 0;
    }

    public final int hashCode() {
        if (h()) {
            return u3.f33553c.a(getClass()).d(this);
        }
        int i5 = this.zza;
        if (i5 != 0) {
            return i5;
        }
        int iD = u3.f33553c.a(getClass()).d(this);
        this.zza = iD;
        return iD;
    }

    public abstract Object j(int i5);

    public final v2 k() {
        return (v2) j(5);
    }

    public final v2 l() {
        v2 v2Var = (v2) j(5);
        if (!v2Var.f33563a.equals(this)) {
            if (!v2Var.f33564b.h()) {
                v2Var.e();
            }
            x2 x2Var = v2Var.f33564b;
            u3.f33553c.a(x2Var.getClass()).zzg(x2Var, this);
        }
        return v2Var;
    }

    public final void p() {
        u3.f33553c.a(getClass()).b(this);
        e();
    }

    public final String toString() {
        String string = super.toString();
        char[] cArr = q3.f33497a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("# ");
        sb2.append(string);
        q3.c(this, sb2, 0);
        return sb2.toString();
    }
}
