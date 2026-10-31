package com.google.android.gms.internal.measurement;

import com.google.android.gms.tasks.Task;
import java.util.UUID;

/* loaded from: classes3.dex */
public final class k1 implements i2, rg.l, fi.c, u1 {

    /* renamed from: b, reason: collision with root package name */
    public static final k1 f32721b = new k1(0);

    /* renamed from: c, reason: collision with root package name */
    public static final k1 f32722c = new k1(2);

    /* renamed from: d, reason: collision with root package name */
    public static final k1 f32723d = new k1(3);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ k1 f32724e = new k1(10);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32725a;

    public /* synthetic */ k1(int i5) {
        this.f32725a = i5;
    }

    public static final y1 a(long j11, Object obj) {
        y1 y1Var = (y1) d3.i(j11, obj);
        if (((o0) y1Var).f32868a) {
            return y1Var;
        }
        int size = y1Var.size();
        y1 y1VarZzg = y1Var.zzg(size == 0 ? 10 : size + size);
        d3.j(j11, obj, y1VarZzg);
        return y1VarZzg;
    }

    public static qg b(String str) {
        boolean z11;
        zg zgVarX;
        tg tgVar = sg.f33071e;
        yg ygVarC = jg.c();
        zg zgVar = ygVarC.f33266b;
        if (zgVar == pg.f32968g) {
            zgVar = null;
            jg.b(ygVarC, null);
            z11 = true;
        } else {
            z11 = false;
        }
        if (zgVar == null) {
            UUID uuidB = kg.f32741c.b();
            String strA = dg.a(uuidB);
            zzvr zzvrVar = ng.f32857g;
            xk.d1 d1Var = (xk.d1) jg.f32692a.get();
            if (!d1Var.isEmpty()) {
                d1Var.forEach(new mg(1));
            }
            zgVarX = new og(uuidB, strA, str, tgVar, zzvrVar, ygVarC);
        } else {
            zgVarX = zgVar instanceof fg ? ((fg) zgVar).X(str, tgVar, false, ygVarC) : zgVar.F(str, tgVar, ygVarC);
        }
        jg.b(ygVarC, zgVarX);
        return new qg(zgVarX, z11);
    }

    public static final f2 c(Object obj, Object obj2) {
        f2 f2VarA = (f2) obj;
        f2 f2Var = (f2) obj2;
        if (!f2Var.isEmpty()) {
            if (!f2VarA.f32524a) {
                f2VarA = f2VarA.a();
            }
            f2VarA.d();
            if (!f2Var.isEmpty()) {
                f2VarA.putAll(f2Var);
            }
        }
        return f2VarA;
    }

    public static /* bridge */ y2 d(Object obj) {
        o1 o1Var = (o1) obj;
        y2 y2Var = o1Var.zzc;
        if (y2Var != y2.f33241f) {
            return y2Var;
        }
        y2 y2VarA = y2.a();
        o1Var.zzc = y2VarA;
        return y2VarA;
    }

    public static boolean e(int i5, aq.y yVar, Object obj) throws zzaeh {
        y0 y0Var = (y0) yVar.f15540e;
        int i11 = yVar.f15537b;
        int i12 = i11 >>> 3;
        int i13 = i11 & 7;
        if (i13 == 0) {
            yVar.x(0);
            ((y2) obj).d(i12 << 3, Long.valueOf(y0Var.r()));
            return true;
        }
        if (i13 == 1) {
            yVar.x(1);
            ((y2) obj).d((i12 << 3) | 1, Long.valueOf(y0Var.t()));
            return true;
        }
        if (i13 == 2) {
            ((y2) obj).d((i12 << 3) | 2, yVar.F());
            return true;
        }
        if (i13 != 3) {
            if (i13 == 4) {
                if (i5 != 0) {
                    return false;
                }
                throw new zzaeh("Protocol message end-group tag did not match expected tag.");
            }
            if (i13 != 5) {
                throw new zzaeg();
            }
            yVar.x(5);
            ((y2) obj).d(5 | (i12 << 3), Integer.valueOf(y0Var.u()));
            return true;
        }
        y2 y2VarA = y2.a();
        int i14 = i12 << 3;
        int i15 = i5 + 1;
        if (i15 >= 100) {
            throw new zzaeh("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        while (yVar.E() != Integer.MAX_VALUE && e(i15, yVar, y2VarA)) {
        }
        if ((i14 | 4) != yVar.f15537b) {
            throw new zzaeh("Protocol message end-group tag did not match expected tag.");
        }
        if (y2VarA.f33246e) {
            y2VarA.f33246e = false;
        }
        ((y2) obj).d(i14 | 3, y2VarA);
        return true;
    }

    @Override // rg.l
    public /* synthetic */ void accept(Object obj, Object obj2) {
        int i5 = ab.f32377l;
    }

    @Override // fi.c
    public Object then(Task task) {
        o1 o1VarF;
        zzjh zzjhVar = (zzjh) task.m();
        cc ccVarD = dc.D();
        String str = zzjhVar.f33315f;
        ccVarD.c();
        ((dc) ccVarD.f32762b).E(str);
        String str2 = zzjhVar.f33317h;
        ccVarD.c();
        ((dc) ccVarD.f32762b).G(str2);
        boolean z11 = zzjhVar.f33320k;
        ccVarD.c();
        ((dc) ccVarD.f32762b).J(z11);
        long j11 = zzjhVar.f33321l;
        ccVarD.c();
        ((dc) ccVarD.f32762b).K(j11);
        byte[] bArr = zzjhVar.f33316g;
        if (bArr != null) {
            u0 u0VarK = v0.k(0, bArr.length, bArr);
            ccVarD.c();
            ((dc) ccVarD.f32762b).F(u0VarK);
        }
        for (zzjf zzjfVar : zzjhVar.f33318i) {
            for (zzjo zzjoVar : zzjfVar.f33312g) {
                int i5 = zzjoVar.f33337l;
                String str3 = zzjoVar.f33331f;
                if (i5 == 1) {
                    ec ecVarD = fc.D();
                    ecVarD.i(str3);
                    if (i5 != 1) {
                        throw new IllegalArgumentException("Not a long type");
                    }
                    long j12 = zzjoVar.f33332g;
                    ecVarD.c();
                    ((fc) ecVarD.f32762b).G(j12);
                    o1VarF = ecVarD.f();
                } else if (i5 == 2) {
                    ec ecVarD2 = fc.D();
                    ecVarD2.i(str3);
                    if (i5 != 2) {
                        throw new IllegalArgumentException("Not a boolean type");
                    }
                    boolean z12 = zzjoVar.f33333h;
                    ecVarD2.c();
                    ((fc) ecVarD2.f32762b).H(z12);
                    o1VarF = ecVarD2.f();
                } else if (i5 == 3) {
                    ec ecVarD3 = fc.D();
                    ecVarD3.i(str3);
                    if (i5 != 3) {
                        throw new IllegalArgumentException("Not a double type");
                    }
                    double d5 = zzjoVar.f33334i;
                    ecVarD3.c();
                    ((fc) ecVarD3.f32762b).I(d5);
                    o1VarF = ecVarD3.f();
                } else if (i5 == 4) {
                    ec ecVarD4 = fc.D();
                    ecVarD4.i(str3);
                    if (i5 != 4) {
                        throw new IllegalArgumentException("Not a String type");
                    }
                    String str4 = zzjoVar.f33335j;
                    sg.w.h(str4);
                    ecVarD4.c();
                    ((fc) ecVarD4.f32762b).J(str4);
                    o1VarF = ecVarD4.f();
                } else {
                    if (i5 != 5) {
                        throw new IllegalArgumentException(b.c0.p(new StringBuilder(String.valueOf(i5).length() + 24), "Unrecognized flag type: ", i5));
                    }
                    ec ecVarD5 = fc.D();
                    ecVarD5.i(str3);
                    if (i5 != 5) {
                        throw new IllegalArgumentException("Not a bytes type");
                    }
                    byte[] bArr2 = zzjoVar.f33336k;
                    sg.w.h(bArr2);
                    u0 u0VarK2 = v0.k(0, bArr2.length, bArr2);
                    ecVarD5.c();
                    ((fc) ecVarD5.f32762b).K(u0VarK2);
                    o1VarF = ecVarD5.f();
                }
                ccVarD.c();
                ((dc) ccVarD.f32762b).H((fc) o1VarF);
            }
            String[] strArr = zzjfVar.f33313h;
            if (strArr != null) {
                for (String str5 : strArr) {
                    ccVarD.c();
                    ((dc) ccVarD.f32762b).I(str5);
                }
            }
        }
        return (dc) ccVarD.f();
    }

    @Override // com.google.android.gms.internal.measurement.i2
    public boolean zzb(Class cls) {
        switch (this.f32725a) {
            case 0:
                return o1.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }

    @Override // com.google.android.gms.internal.measurement.i2
    public s2 zzc(Class cls) {
        switch (this.f32725a) {
            case 0:
                if (!o1.class.isAssignableFrom(cls)) {
                    throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
                }
                try {
                    return (s2) o1.o(cls.asSubclass(o1.class)).w(3);
                } catch (Exception e3) {
                    throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }
}
