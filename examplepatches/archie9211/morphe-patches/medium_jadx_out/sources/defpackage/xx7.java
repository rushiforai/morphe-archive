package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xx7 implements x45 {
    public final /* synthetic */ int a = 2;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ xx7(kx6 kx6Var, sr4 sr4Var, boolean z, lid lidVar, yqa yqaVar) {
        this.c = kx6Var;
        this.d = sr4Var;
        this.b = z;
        this.e = lidVar;
        this.f = yqaVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        boolean z = this.b;
        Object obj2 = this.f;
        Object obj3 = this.e;
        Object obj4 = this.d;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                k49 k49Var = ((m78) obj5).d;
                l78 l78Var = (l78) obj4;
                upc upcVar = (upc) obj3;
                upc upcVar2 = (upc) obj2;
                tjb tjbVar = (tjb) obj;
                float fFloatValue = 0.8f;
                float fFloatValue2 = 1.0f;
                tjbVar.k(!z ? ((Number) upcVar.getValue()).floatValue() : ((Boolean) k49Var.getValue()).booleanValue() ? 1.0f : 0.8f);
                if (!z) {
                    fFloatValue = ((Number) upcVar.getValue()).floatValue();
                } else if (((Boolean) k49Var.getValue()).booleanValue()) {
                    fFloatValue = 1.0f;
                }
                tjbVar.l(fFloatValue);
                if (!z) {
                    fFloatValue2 = ((Number) upcVar2.getValue()).floatValue();
                } else if (!((Boolean) k49Var.getValue()).booleanValue()) {
                    fFloatValue2 = 0.0f;
                }
                tjbVar.c(fFloatValue2);
                tjbVar.s(((nrd) l78Var.getValue()).a);
                return c1eVar;
            case 1:
                ba8 ba8Var = (ba8) obj;
                ba8Var.getClass();
                ((nya) obj5).a = true;
                ((nya) obj4).a = true;
                ((ka8) obj3).o(ba8Var, z, (m70) obj2);
                return c1eVar;
            case 2:
                es2 es2Var = (es2) obj;
                es2Var.getClass();
                eo2 eo2Var = es2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                vob vobVar = ys2Var.a;
                a13 a13VarV = eo2Var.b.v();
                dzb dzbVarV = ys2Var.v();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new sdc((String) obj5, (String) obj4, (String) obj3, (SusiDestination) obj2, this.b, vobVar, a13VarV, dzbVarV, r13Var);
            default:
                kx6 kx6Var = (kx6) obj5;
                sr4 sr4Var = (sr4) obj4;
                lid lidVar = (lid) obj3;
                yqa yqaVar = (yqa) obj2;
                ip8 ip8Var = (ip8) obj;
                if (kx6Var.b()) {
                    akc akcVar = kx6Var.c;
                    if (akcVar != null) {
                        ((n43) akcVar).b();
                    }
                } else {
                    sr4.a(sr4Var);
                }
                if (kx6Var.b() && z) {
                    if (kx6Var.a() != ci5.Selection) {
                        rjd rjdVarD = kx6Var.d();
                        if (rjdVarD != null) {
                            long j = ip8Var.a;
                            lig ligVar = kx6Var.d;
                            qa2 qa2Var = kx6Var.v;
                            int iB = rjdVarD.b(j, true);
                            yqaVar.c(iB);
                            qa2Var.invoke(uid.a((uid) ligVar.b, null, lk7.q(iB, iB), 5));
                            if (((mx) kx6Var.a.b).b.length() > 0) {
                                kx6Var.k.setValue(ci5.Cursor);
                            }
                        }
                    } else {
                        lidVar.d(ip8Var);
                    }
                }
                return c1eVar;
        }
    }

    public /* synthetic */ xx7(nya nyaVar, nya nyaVar2, ka8 ka8Var, boolean z, m70 m70Var) {
        this.c = nyaVar;
        this.d = nyaVar2;
        this.e = ka8Var;
        this.b = z;
        this.f = m70Var;
    }

    public /* synthetic */ xx7(String str, String str2, String str3, SusiDestination susiDestination, boolean z) {
        this.c = str;
        this.d = str2;
        this.e = str3;
        this.f = susiDestination;
        this.b = z;
    }

    public /* synthetic */ xx7(boolean z, m78 m78Var, l78 l78Var, bsd bsdVar, bsd bsdVar2) {
        this.b = z;
        this.c = m78Var;
        this.d = l78Var;
        this.e = bsdVar;
        this.f = bsdVar2;
    }
}
