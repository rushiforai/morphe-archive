package com.google.android.gms.internal.measurement;

import android.content.Context;

/* loaded from: classes3.dex */
public final /* synthetic */ class i3 implements vk.g {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ i3 f32630b = new i3(0);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i3 f32631c = new i3(1);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i3 f32632d = new i3(2);

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i3 f32633e = new i3(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32634a;

    public /* synthetic */ i3(int i5) {
        this.f32634a = i5;
    }

    @Override // vk.g
    public final Object apply(Object obj) {
        switch (this.f32634a) {
            case 0:
                Context context = (Context) obj;
                String str = j3.f32677b;
                if (str == null) {
                    synchronized (j3.class) {
                        try {
                            str = j3.f32677b;
                            if (str == null) {
                                String strB = mb.b(context, "com.google.android.gms.measurement");
                                j3.f32677b = strB;
                                str = strB;
                            }
                        } finally {
                        }
                    }
                }
                return str;
            case 1:
                d2 d2Var = sd.f33058i;
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            case 2:
                dc dcVar = (dc) obj;
                me meVarD = ne.D();
                if (dcVar == null) {
                    return (ne) meVarD.f();
                }
                for (fc fcVar : dcVar.B()) {
                    oe oeVarD = pe.D();
                    String strX = fcVar.x();
                    oeVarD.c();
                    ((pe) oeVarD.f32762b).E(strX);
                    int iL = fcVar.L();
                    int i5 = iL - 1;
                    if (iL == 0) {
                        throw null;
                    }
                    if (i5 == 0) {
                        long jY = fcVar.y();
                        oeVarD.c();
                        ((pe) oeVarD.f32762b).F(jY);
                    } else if (i5 == 1) {
                        boolean z11 = fcVar.z();
                        oeVarD.c();
                        ((pe) oeVarD.f32762b).G(z11);
                    } else if (i5 == 2) {
                        double dA = fcVar.A();
                        oeVarD.c();
                        ((pe) oeVarD.f32762b).H(dA);
                    } else if (i5 == 3) {
                        String strB2 = fcVar.B();
                        oeVarD.c();
                        ((pe) oeVarD.f32762b).I(strB2);
                    } else {
                        if (i5 != 4) {
                            throw new IllegalStateException("No known flag type");
                        }
                        v0 v0VarC = fcVar.C();
                        oeVarD.c();
                        ((pe) oeVarD.f32762b).J(v0VarC);
                    }
                    pe peVar = (pe) oeVarD.f();
                    meVarD.c();
                    ((ne) meVarD.f32762b).J(peVar);
                }
                String strA = dcVar.A();
                meVarD.c();
                ((ne) meVarD.f32762b).H(strA);
                String strX2 = dcVar.x();
                meVarD.c();
                ((ne) meVarD.f32762b).F(strX2);
                long jC = dcVar.C();
                meVarD.c();
                ((ne) meVarD.f32762b).I(jC);
                if (dcVar.y()) {
                    v0 v0VarZ = dcVar.z();
                    meVarD.c();
                    ((ne) meVarD.f32762b).G(v0VarZ);
                }
                return (ne) meVarD.f();
            default:
                zzmk zzmkVar = (zzmk) obj;
                if (zzmkVar.f33346a != 29514) {
                    throw zzmkVar;
                }
                vc vcVarA = wc.A();
                rc rcVarK = sc.K();
                long jCurrentTimeMillis = System.currentTimeMillis();
                rcVarK.c();
                ((sc) rcVarK.f32762b).M(jCurrentTimeMillis);
                vcVarA.c();
                ((wc) vcVarA.f32762b).B((sc) rcVarK.f());
                return (wc) vcVarA.f();
        }
    }
}
