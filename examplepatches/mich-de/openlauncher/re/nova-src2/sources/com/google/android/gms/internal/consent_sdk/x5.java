package com.google.android.gms.internal.consent_sdk;

import androidx.compose.ui.node.LayoutNode;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes3.dex */
public abstract class x5 extends i5 {
    private static final Map zzb = new ConcurrentHashMap();
    protected y6 zzc;
    private int zzd;

    public x5() {
        this.zza = 0;
        this.zzd = -1;
        this.zzc = y6.f32321e;
    }

    public static x5 h(Class cls) throws ClassNotFoundException {
        Map map = zzb;
        x5 x5Var = (x5) map.get(cls);
        if (x5Var == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                x5Var = (x5) map.get(cls);
            } catch (ClassNotFoundException e3) {
                throw new IllegalStateException("Class initialization cannot fail.", e3);
            }
        }
        if (x5Var != null) {
            return x5Var;
        }
        x5 x5Var2 = (x5) ((x5) e7.g(cls)).f(6);
        if (x5Var2 == null) {
            throw new IllegalStateException();
        }
        map.put(cls, x5Var2);
        return x5Var2;
    }

    public static Object i(Method method, x5 x5Var, Object... objArr) {
        try {
            return method.invoke(x5Var, objArr);
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

    public static void l(Class cls, x5 x5Var) {
        x5Var.k();
        zzb.put(cls, x5Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.i5
    public final void a(o5 o5Var) {
        t6 t6VarA = q6.f32217c.a(getClass());
        h6 h6Var = o5Var.f32199d;
        if (h6Var == null) {
            h6Var = new h6(o5Var);
        }
        t6VarA.c(this, h6Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.i5
    public final int b(t6 t6Var) {
        if (e()) {
            int iD = t6Var.d(this);
            if (iD >= 0) {
                return iD;
            }
            throw new IllegalStateException(b.c0.h(iD, "serialized size must be non-negative, was "));
        }
        int i5 = this.zzd & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iD2 = t6Var.d(this);
        if (iD2 < 0) {
            throw new IllegalStateException(b.c0.h(iD2, "serialized size must be non-negative, was "));
        }
        this.zzd = (this.zzd & Integer.MIN_VALUE) | iD2;
        return iD2;
    }

    @Override // com.google.android.gms.internal.consent_sdk.i5
    public final int c() {
        if (e()) {
            int iD = q6.f32217c.a(getClass()).d(this);
            if (iD >= 0) {
                return iD;
            }
            throw new IllegalStateException(b.c0.h(iD, "serialized size must be non-negative, was "));
        }
        int i5 = this.zzd & LayoutNode.NotPlacedPlaceOrder;
        if (i5 != Integer.MAX_VALUE) {
            return i5;
        }
        int iD2 = q6.f32217c.a(getClass()).d(this);
        if (iD2 < 0) {
            throw new IllegalStateException(b.c0.h(iD2, "serialized size must be non-negative, was "));
        }
        this.zzd = (this.zzd & Integer.MIN_VALUE) | iD2;
        return iD2;
    }

    public final void d() {
        this.zzd = (this.zzd & Integer.MIN_VALUE) | LayoutNode.NotPlacedPlaceOrder;
    }

    public final boolean e() {
        return (this.zzd & Integer.MIN_VALUE) != 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return q6.f32217c.a(getClass()).b(this, (x5) obj);
    }

    public abstract Object f(int i5);

    public final v5 g() {
        return (v5) f(5);
    }

    public final int hashCode() {
        if (e()) {
            return q6.f32217c.a(getClass()).a(this);
        }
        int i5 = this.zza;
        if (i5 != 0) {
            return i5;
        }
        int iA = q6.f32217c.a(getClass()).a(this);
        this.zza = iA;
        return iA;
    }

    public final void j() {
        q6.f32217c.a(getClass()).zzd(this);
        k();
    }

    public final void k() {
        this.zzd &= LayoutNode.NotPlacedPlaceOrder;
    }

    public final String toString() {
        String string = super.toString();
        char[] cArr = m6.f32148a;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("# ");
        sb2.append(string);
        m6.c(this, sb2, 0);
        return sb2.toString();
    }
}
