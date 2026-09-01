package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.gms.internal.p000firebaseauthapi.zzang;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ytf extends xrf {
    private static final Map<Class<?>, ytf> zzc = new ConcurrentHashMap();
    protected yuf zzb;
    private int zzd;

    public ytf() {
        this.zza = 0;
        this.zzd = -1;
        this.zzb = yuf.f;
    }

    public static Object e(Method method, ytf ytfVar, Object... objArr) {
        try {
            return method.invoke(ytfVar, objArr);
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

    public static ytf f(Class cls) {
        Map<Class<?>, ytf> map = zzc;
        ytf ytfVar = map.get(cls);
        if (ytfVar == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                ytfVar = map.get(cls);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException("Class initialization cannot fail.", e);
            }
        }
        if (ytfVar != null) {
            return ytfVar;
        }
        try {
            ytf ytfVar2 = (ytf) ((ytf) avf.a.allocateInstance(cls)).d(6);
            if (ytfVar2 != null) {
                map.put(cls, ytfVar2);
                return ytfVar2;
            }
            lg8.d();
            return null;
        } catch (InstantiationException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static ytf g(ytf ytfVar, up1 up1Var, ptf ptfVar) throws zzale {
        ytf ytfVarP = ytfVar.p();
        try {
            quf qufVar = quf.c;
            qufVar.getClass();
            suf sufVarA = qufVar.a(ytfVarP.getClass());
            ym0 ym0Var = (ym0) up1Var.c;
            if (ym0Var == null) {
                ym0Var = new ym0(up1Var, (byte) 0);
            }
            sufVarA.h(ytfVarP, ym0Var, ptfVar);
            sufVarA.d(ytfVarP);
            return ytfVarP;
        } catch (zzale e) {
            if (e.a) {
                throw new zzale(e.getMessage(), e);
            }
            throw e;
        } catch (zzang e2) {
            throw new zzale(e2.getMessage());
        } catch (IOException e3) {
            if (e3.getCause() instanceof zzale) {
                throw ((zzale) e3.getCause());
            }
            throw new zzale(e3.getMessage(), e3);
        } catch (RuntimeException e4) {
            if (e4.getCause() instanceof zzale) {
                throw ((zzale) e4.getCause());
            }
            throw e4;
        }
    }

    public static ytf h(ytf ytfVar, hsf hsfVar, ptf ptfVar) throws zzale {
        xsf xsfVarW = hsfVar.w();
        ytf ytfVarG = g(ytfVar, xsfVarW, ptfVar);
        xsfVarW.X(0);
        l(ytfVarG);
        return ytfVarG;
    }

    public static ytf i(ytf ytfVar, byte[] bArr, ptf ptfVar) throws zzale {
        int length = bArr.length;
        if (length != 0) {
            ytf ytfVarP = ytfVar.p();
            try {
                quf qufVar = quf.c;
                qufVar.getClass();
                suf sufVarA = qufVar.a(ytfVarP.getClass());
                hmf hmfVar = new hmf();
                ptfVar.getClass();
                sufVarA.e(ytfVarP, bArr, 0, length, hmfVar);
                sufVarA.d(ytfVarP);
                ytfVar = ytfVarP;
            } catch (zzale e) {
                if (e.a) {
                    throw new zzale(e.getMessage(), e);
                }
                throw e;
            } catch (zzang e2) {
                throw new zzale(e2.getMessage());
            } catch (IOException e3) {
                if (e3.getCause() instanceof zzale) {
                    throw ((zzale) e3.getCause());
                }
                throw new zzale(e3.getMessage(), e3);
            } catch (IndexOutOfBoundsException unused) {
                throw zzale.g();
            }
        }
        l(ytfVar);
        return ytfVar;
    }

    public static void j(Class cls, ytf ytfVar) {
        ytfVar.r();
        zzc.put(cls, ytfVar);
    }

    public static void l(ytf ytfVar) throws zzale {
        if (ytfVar != null && !n(ytfVar, true)) {
            throw new zzale(new zzang().getMessage());
        }
    }

    public static final boolean n(ytf ytfVar, boolean z) {
        byte bByteValue = ((Byte) ytfVar.d(1)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        quf qufVar = quf.c;
        qufVar.getClass();
        boolean zB = qufVar.a(ytfVar.getClass()).b(ytfVar);
        if (z) {
            ytfVar.d(2);
        }
        return zB;
    }

    @Override // defpackage.xrf
    public final int a(suf sufVar) {
        int iG;
        int iG2;
        if (s()) {
            if (sufVar == null) {
                quf qufVar = quf.c;
                qufVar.getClass();
                iG2 = qufVar.a(getClass()).g(this);
            } else {
                iG2 = sufVar.g(this);
            }
            if (iG2 >= 0) {
                return iG2;
            }
            ygf.f(b09.w(iG2, "serialized size must be non-negative, was "));
            return 0;
        }
        int i = this.zzd;
        if ((i & Integer.MAX_VALUE) != Integer.MAX_VALUE) {
            return i & Integer.MAX_VALUE;
        }
        if (sufVar == null) {
            quf qufVar2 = quf.c;
            qufVar2.getClass();
            iG = qufVar2.a(getClass()).g(this);
        } else {
            iG = sufVar.g(this);
        }
        m(iG);
        return iG;
    }

    public abstract Object d(int i);

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        quf qufVar = quf.c;
        qufVar.getClass();
        return qufVar.a(getClass()).a(this, (ytf) obj);
    }

    public final int hashCode() {
        if (s()) {
            quf qufVar = quf.c;
            qufVar.getClass();
            return qufVar.a(getClass()).c(this);
        }
        int i = this.zza;
        if (i != 0) {
            return i;
        }
        quf qufVar2 = quf.c;
        qufVar2.getClass();
        int iC = qufVar2.a(getClass()).c(this);
        this.zza = iC;
        return iC;
    }

    public final void k(htf htfVar) {
        quf qufVar = quf.c;
        qufVar.getClass();
        suf sufVarA = qufVar.a(getClass());
        ujf ujfVar = htfVar.a;
        if (ujfVar == null) {
            ujfVar = new ujf(htfVar);
        }
        sufVarA.f(this, ujfVar);
    }

    public final void m(int i) {
        if (i < 0) {
            ygf.f(b09.w(i, "serialized size must be non-negative, was "));
        } else {
            this.zzd = (i & Integer.MAX_VALUE) | (this.zzd & Integer.MIN_VALUE);
        }
    }

    public final xtf o() {
        return (xtf) d(5);
    }

    public final ytf p() {
        return (ytf) d(4);
    }

    public final void q() {
        quf qufVar = quf.c;
        qufVar.getClass();
        qufVar.a(getClass()).d(this);
        r();
    }

    public final void r() {
        this.zzd &= Integer.MAX_VALUE;
    }

    public final boolean s() {
        return (this.zzd & Integer.MIN_VALUE) != 0;
    }

    public final String toString() {
        String string = super.toString();
        char[] cArr = luf.a;
        StringBuilder sb = new StringBuilder();
        sb.append("# ");
        sb.append(string);
        luf.c(this, sb, 0);
        return sb.toString();
    }
}
