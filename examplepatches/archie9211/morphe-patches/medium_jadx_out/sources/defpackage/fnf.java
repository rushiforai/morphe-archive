package defpackage;

import com.google.android.recaptcha.internal.zzaek;
import com.google.android.recaptcha.internal.zzagd;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fnf extends emf {
    private static final Map zzd = new ConcurrentHashMap();
    private int zza;
    protected epf zzc;

    public fnf() {
        this.zzb = 0;
        this.zza = -1;
        this.zzc = epf.f;
    }

    public static fnf k(Class cls) {
        Map map = zzd;
        fnf fnfVar = (fnf) map.get(cls);
        if (fnfVar == null) {
            try {
                Class.forName(cls.getName(), true, cls.getClassLoader());
                fnfVar = (fnf) map.get(cls);
            } catch (ClassNotFoundException e) {
                throw new IllegalStateException("Class initialization cannot fail.", e);
            }
        }
        if (fnfVar != null) {
            return fnfVar;
        }
        try {
            fnf fnfVar2 = (fnf) ((fnf) ipf.a.allocateInstance(cls)).t(6);
            if (fnfVar2 != null) {
                map.put(cls, fnfVar2);
                return fnfVar2;
            }
            lg8.d();
            return null;
        } catch (InstantiationException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static void l(Class cls, fnf fnfVar) {
        fnfVar.f();
        zzd.put(cls, fnfVar);
    }

    public static Object m(Method method, fnf fnfVar, Object... objArr) {
        try {
            return method.invoke(fnfVar, objArr);
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

    public static fnf n(fnf fnfVar, pmf pmfVar) throws zzaek {
        anf anfVar = anf.a;
        int i = gmf.a;
        anf anfVar2 = anf.a;
        up1 up1VarY = pmfVar.y();
        fnf fnfVarG = fnfVar.g();
        try {
            vof vofVarA = pof.c.a(fnfVarG.getClass());
            ym0 ym0Var = (ym0) up1VarY.c;
            if (ym0Var == null) {
                ym0Var = new ym0(up1VarY);
            }
            vofVarA.g(fnfVarG, ym0Var, anfVar2);
            vofVarA.a(fnfVarG);
            up1VarY.T();
            s(fnfVarG);
            s(fnfVarG);
            return fnfVarG;
        } catch (zzaek e) {
            if (e.a) {
                throw new zzaek(e.getMessage(), e);
            }
            throw e;
        } catch (zzagd e2) {
            ygf.j(e2.getMessage());
            return null;
        } catch (IOException e3) {
            if (e3.getCause() instanceof zzaek) {
                throw ((zzaek) e3.getCause());
            }
            throw new zzaek(e3.getMessage(), e3);
        } catch (RuntimeException e4) {
            if (e4.getCause() instanceof zzaek) {
                throw ((zzaek) e4.getCause());
            }
            throw e4;
        }
    }

    public static fnf o(fnf fnfVar, pmf pmfVar, anf anfVar) throws zzaek {
        up1 up1VarY = pmfVar.y();
        fnf fnfVarG = fnfVar.g();
        try {
            vof vofVarA = pof.c.a(fnfVarG.getClass());
            ym0 ym0Var = (ym0) up1VarY.c;
            if (ym0Var == null) {
                ym0Var = new ym0(up1VarY);
            }
            vofVarA.g(fnfVarG, ym0Var, anfVar);
            vofVarA.a(fnfVarG);
            up1VarY.T();
            s(fnfVarG);
            return fnfVarG;
        } catch (zzaek e) {
            if (e.a) {
                throw new zzaek(e.getMessage(), e);
            }
            throw e;
        } catch (zzagd e2) {
            ygf.j(e2.getMessage());
            return null;
        } catch (IOException e3) {
            if (e3.getCause() instanceof zzaek) {
                throw ((zzaek) e3.getCause());
            }
            throw new zzaek(e3.getMessage(), e3);
        } catch (RuntimeException e4) {
            if (e4.getCause() instanceof zzaek) {
                throw ((zzaek) e4.getCause());
            }
            throw e4;
        }
    }

    public static fnf p(fnf fnfVar, byte[] bArr) throws zzaek {
        int length = bArr.length;
        anf anfVar = anf.a;
        int i = gmf.a;
        fnf fnfVarR = r(fnfVar, bArr, length, anf.a);
        s(fnfVarR);
        return fnfVarR;
    }

    public static final boolean q(fnf fnfVar, boolean z) {
        byte bByteValue = ((Byte) fnfVar.t(1)).byteValue();
        if (bByteValue == 1) {
            return true;
        }
        if (bByteValue == 0) {
            return false;
        }
        boolean zD = pof.c.a(fnfVar.getClass()).d(fnfVar);
        if (z) {
            fnfVar.t(2);
        }
        return zD;
    }

    public static fnf r(fnf fnfVar, byte[] bArr, int i, anf anfVar) throws zzaek {
        if (i == 0) {
            return fnfVar;
        }
        fnf fnfVarG = fnfVar.g();
        try {
            vof vofVarA = pof.c.a(fnfVarG.getClass());
            hmf hmfVar = new hmf();
            anfVar.getClass();
            vofVarA.e(fnfVarG, bArr, 0, i, hmfVar);
            vofVarA.a(fnfVarG);
            return fnfVarG;
        } catch (zzaek e) {
            if (e.a) {
                throw new zzaek(e.getMessage(), e);
            }
            throw e;
        } catch (zzagd e2) {
            ygf.j(e2.getMessage());
            return null;
        } catch (IOException e3) {
            if (e3.getCause() instanceof zzaek) {
                throw ((zzaek) e3.getCause());
            }
            throw new zzaek(e3.getMessage(), e3);
        } catch (IndexOutOfBoundsException unused) {
            ygf.j("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
            return null;
        }
    }

    public static void s(fnf fnfVar) throws zzaek {
        if (fnfVar == null || q(fnfVar, true)) {
            return;
        }
        ygf.j(new zzagd().getMessage());
    }

    @Override // defpackage.emf
    public final void a(h30 h30Var) {
        vof vofVarA = pof.c.a(getClass());
        ujf ujfVar = (ujf) h30Var.d;
        if (ujfVar == null) {
            ujfVar = new ujf(h30Var);
        }
        vofVarA.h(this, ujfVar);
    }

    @Override // defpackage.emf
    public final int b() {
        if (u()) {
            int i = pof.c.a(getClass()).i(this);
            if (i >= 0) {
                return i;
            }
            ygf.b(String.valueOf(i).length() + 42, i);
            return 0;
        }
        int i2 = this.zza & Integer.MAX_VALUE;
        if (i2 != Integer.MAX_VALUE) {
            return i2;
        }
        int i3 = pof.c.a(getClass()).i(this);
        if (i3 >= 0) {
            this.zza = (this.zza & Integer.MIN_VALUE) | i3;
            return i3;
        }
        ygf.b(String.valueOf(i3).length() + 42, i3);
        return 0;
    }

    @Override // defpackage.emf
    public final int e(vof vofVar) {
        if (u()) {
            int i = vofVar.i(this);
            if (i >= 0) {
                return i;
            }
            ygf.b(String.valueOf(i).length() + 42, i);
            return 0;
        }
        int i2 = this.zza & Integer.MAX_VALUE;
        if (i2 != Integer.MAX_VALUE) {
            return i2;
        }
        int i3 = vofVar.i(this);
        if (i3 >= 0) {
            this.zza = (this.zza & Integer.MIN_VALUE) | i3;
            return i3;
        }
        ygf.b(String.valueOf(i3).length() + 42, i3);
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        return pof.c.a(getClass()).b(this, (fnf) obj);
    }

    public final void f() {
        this.zza &= Integer.MAX_VALUE;
    }

    public final fnf g() {
        return (fnf) t(4);
    }

    public final cnf h() {
        return (cnf) t(5);
    }

    public final int hashCode() {
        if (u()) {
            return pof.c.a(getClass()).f(this);
        }
        int i = this.zzb;
        if (i != 0) {
            return i;
        }
        int iF = pof.c.a(getClass()).f(this);
        this.zzb = iF;
        return iF;
    }

    public final cnf i() {
        cnf cnfVar = (cnf) t(5);
        cnfVar.g(this);
        return cnfVar;
    }

    public final void j() {
        this.zza = (this.zza & Integer.MIN_VALUE) | Integer.MAX_VALUE;
    }

    public abstract Object t(int i);

    public final String toString() {
        String string = super.toString();
        char[] cArr = hof.a;
        StringBuilder sb = new StringBuilder();
        sb.append("# ");
        sb.append(string);
        hof.b(this, sb, 0);
        return sb.toString();
    }

    public final boolean u() {
        return (this.zza & Integer.MIN_VALUE) != 0;
    }
}
