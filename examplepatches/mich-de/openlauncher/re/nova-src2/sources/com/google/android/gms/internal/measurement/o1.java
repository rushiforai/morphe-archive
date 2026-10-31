package com.google.android.gms.internal.measurement;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public abstract class o1 extends n0 {
    public static final /* synthetic */ int zzd = 0;
    private static final Map zze = new ConcurrentHashMap();
    private int zzb;
    protected y2 zzc;

    public o1() {
        this.zza = 0;
        this.zzb = -1;
        this.zzc = y2.f33241f;
    }

    public static o1 e(o1 o1Var, byte[] bArr, e1 e1Var) throws zzaeh {
        int length = bArr.length;
        if (length != 0) {
            o1 o1VarI = o1Var.i();
            try {
                t2 t2VarA = q2.f32981c.a(o1VarI.getClass());
                t2VarA.c(o1VarI, bArr, 0, length, new q0(e1Var));
                t2VarA.a(o1VarI);
                o1Var = o1VarI;
            } catch (zzaeh e3) {
                if (e3.f33302a) {
                    throw new zzaeh(e3.getMessage(), e3);
                }
                throw e3;
            } catch (zzafy e11) {
                throw e11.a();
            } catch (IOException e12) {
                if (e12.getCause() instanceof zzaeh) {
                    throw ((zzaeh) e12.getCause());
                }
                throw new zzaeh(e12.getMessage(), e12);
            } catch (IndexOutOfBoundsException unused) {
                throw new zzaeh("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            }
        }
        v(o1Var);
        return o1Var;
    }

    public static o1 o(Class cls) throws ClassNotFoundException {
        Map map = zze;
        o1 o1Var = (o1) map.get(cls);
        if (o1Var == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                o1Var = (o1) map.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (o1Var != null) {
            return o1Var;
        }
        o1 o1Var2 = (o1) ((o1) d3.d(cls)).w(6);
        if (o1Var2 == null) {
            throw new IllegalStateException();
        }
        map.put(cls, o1Var2);
        return o1Var2;
    }

    public static void p(Class cls, o1 o1Var) {
        o1Var.h();
        zze.put(cls, o1Var);
    }

    public static s2 q(o1 o1Var, String str, Object[] objArr) {
        return new s2(o1Var, str, objArr);
    }

    public static Object r(Method method, o1 o1Var, Object... objArr) {
        try {
            return method.invoke(o1Var, objArr);
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

    public static r2 s() {
        return r2.f33023e;
    }

    public static y1 t(y1 y1Var) {
        return b.c9.i(y1Var);
    }

    public static final boolean u(o1 o1Var, boolean z11) {
        byte bByteValue = ((Byte) o1Var.w(1)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        boolean zG = q2.f32981c.a(o1Var.getClass()).g(o1Var);
        if (z11) {
            o1Var.w(2);
        }
        return zG;
    }

    public static void v(o1 o1Var) throws zzaeh {
        if (o1Var != null && !u(o1Var, true)) {
            throw new zzafy().a();
        }
    }

    @Override // com.google.android.gms.internal.measurement.n0
    public final int c(t2 t2Var) {
        if (g()) {
            int iE = t2Var.e(this);
            if (iE >= 0) {
                return iE;
            }
            StringBuilder sb2 = new StringBuilder(String.valueOf(iE).length() + 42);
            sb2.append("serialized size must be non-negative, was ");
            sb2.append(iE);
            throw new IllegalStateException(sb2.toString());
        }
        int i5 = this.zzb & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iE2 = t2Var.e(this);
        if (iE2 >= 0) {
            this.zzb = (this.zzb & Integer.MIN_VALUE) | iE2;
            return iE2;
        }
        StringBuilder sb3 = new StringBuilder(String.valueOf(iE2).length() + 42);
        sb3.append("serialized size must be non-negative, was ");
        sb3.append(iE2);
        throw new IllegalStateException(sb3.toString());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return q2.f32981c.a(getClass()).h(this, (o1) obj);
    }

    public final void f(c1 c1Var) {
        t2 t2VarA = q2.f32981c.a(getClass());
        d2 d2Var = c1Var.f32418c;
        if (d2Var == null) {
            d2Var = new d2(c1Var);
        }
        t2VarA.b(this, d2Var);
    }

    public final boolean g() {
        return (this.zzb & Integer.MIN_VALUE) != 0;
    }

    public final void h() {
        this.zzb &= LayoutNode.NotPlacedPlaceOrder;
    }

    public final int hashCode() {
        if (g()) {
            return q2.f32981c.a(getClass()).d(this);
        }
        int i5 = this.zza;
        if (i5 != 0) {
            return i5;
        }
        int iD = q2.f32981c.a(getClass()).d(this);
        this.zza = iD;
        return iD;
    }

    public final o1 i() {
        return (o1) w(4);
    }

    public final void j() {
        q2.f32981c.a(getClass()).a(this);
        h();
    }

    public final l1 k() {
        return (l1) w(5);
    }

    public final l1 l() {
        l1 l1Var = (l1) w(5);
        l1Var.g(this);
        return l1Var;
    }

    public final void m() {
        this.zzb = (this.zzb & Integer.MIN_VALUE) | LayoutNode.NotPlacedPlaceOrder;
    }

    public final int n() {
        if (g()) {
            int iE = q2.f32981c.a(getClass()).e(this);
            if (iE >= 0) {
                return iE;
            }
            StringBuilder sb2 = new StringBuilder(String.valueOf(iE).length() + 42);
            sb2.append("serialized size must be non-negative, was ");
            sb2.append(iE);
            throw new IllegalStateException(sb2.toString());
        }
        int i5 = this.zzb & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iE2 = q2.f32981c.a(getClass()).e(this);
        if (iE2 >= 0) {
            this.zzb = (this.zzb & Integer.MIN_VALUE) | iE2;
            return iE2;
        }
        StringBuilder sb3 = new StringBuilder(String.valueOf(iE2).length() + 42);
        sb3.append("serialized size must be non-negative, was ");
        sb3.append(iE2);
        throw new IllegalStateException(sb3.toString());
    }

    public final String toString() {
        String string = super.toString();
        char[] cArr = j2.f32675a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("# ");
        sb2.append(string);
        j2.b(this, sb2, 0);
        return sb2.toString();
    }

    public abstract Object w(int i5);
}
