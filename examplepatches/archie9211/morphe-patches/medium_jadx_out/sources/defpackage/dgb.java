package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class dgb implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ lgb c;
    public final /* synthetic */ aib d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ boolean h;
    public final /* synthetic */ l78 i;

    public /* synthetic */ dgb(lgb lgbVar, aib aibVar, boolean z, boolean z2, boolean z3, l78 l78Var, boolean z4, boolean z5) {
        this.c = lgbVar;
        this.d = aibVar;
        this.b = z;
        this.e = z2;
        this.f = z3;
        this.i = l78Var;
        this.g = z4;
        this.h = z5;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        l78 l78Var;
        final l78 l78Var2;
        p65 p65Var;
        int i;
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        final int i3 = 0;
        final int i4 = 1;
        switch (i2) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var2.S();
                } else {
                    lgb lgbVar = this.c;
                    boolean zF = p65Var2.f(lgbVar);
                    aib aibVar = this.d;
                    boolean zF2 = zF | p65Var2.f(aibVar);
                    Object objM = p65Var2.M();
                    if (zF2 || objM == uobVar) {
                        objM = new nbb(lgbVar, 2, aibVar);
                        p65Var2.j0(objM);
                    }
                    f49.l((m45) objM, null, false, null, null, yi2.w, p65Var2, 1572864, 62);
                    boolean z = this.b;
                    boolean z2 = this.e;
                    boolean z3 = this.f;
                    if ((z || z2 || z3) && aibVar.d() == ResponsesReference.ResponseViewType.Standard) {
                        p65Var2.Y(-711824660);
                        Object objM2 = p65Var2.M();
                        l78 l78Var3 = this.i;
                        if (objM2 == uobVar) {
                            objM2 = new z7b(l78Var3, 11);
                            p65Var2.j0(objM2);
                        }
                        f49.l((m45) objM2, null, false, null, null, yi2.x, p65Var2, 1572870, 62);
                        boolean zBooleanValue = ((Boolean) l78Var3.getValue()).booleanValue();
                        Object objM3 = p65Var2.M();
                        if (objM3 == uobVar) {
                            l78Var = l78Var3;
                            objM3 = new z7b(l78Var, 12);
                            p65Var2.j0(objM3);
                        } else {
                            l78Var = l78Var3;
                        }
                        xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(-1466389272, new dgb(z3, lgbVar, aibVar, z, this.g, z2, this.h, l78Var), p65Var2), p65Var2, 48, 2044);
                        p65Var2 = p65Var2;
                    } else {
                        p65Var2.Y(-744447696);
                    }
                    p65Var2.p(false);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var3 = (p65) x12Var2;
                if (!p65Var3.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var3.S();
                } else {
                    boolean z4 = this.b;
                    final lgb lgbVar2 = this.c;
                    l78 l78Var4 = this.i;
                    if (z4) {
                        p65Var3.Y(-1090378486);
                        mz1 mz1Var = yi2.y;
                        boolean zF3 = p65Var3.f(lgbVar2);
                        aib aibVar2 = this.d;
                        boolean zF4 = zF3 | p65Var3.f(aibVar2);
                        Object objM4 = p65Var3.M();
                        if (zF4 || objM4 == uobVar) {
                            objM4 = new i16(lgbVar2, aibVar2, l78Var4, 22);
                            p65Var3.j0(objM4);
                        }
                        l78Var2 = l78Var4;
                        i = -1123440358;
                        oq.b(mz1Var, (m45) objM4, bgf.N(o28.b, "manage_responses_menu_item"), null, null, false, null, null, p65Var3, 390, 504);
                        p65Var = p65Var3;
                    } else {
                        l78Var2 = l78Var4;
                        p65Var = p65Var3;
                        i = -1123440358;
                        p65Var.Y(-1123440358);
                    }
                    p65Var.p(false);
                    if (this.e) {
                        p65Var.Y(-1089728106);
                        final boolean z5 = this.f;
                        mz1 mz1VarE = pxf.E(1961957002, new ts4(2, z5), p65Var);
                        boolean zF5 = p65Var.f(lgbVar2) | p65Var.g(z5);
                        Object objM5 = p65Var.M();
                        if (zF5 || objM5 == uobVar) {
                            objM5 = new m45() { // from class: egb
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i5 = i3;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var5 = l78Var2;
                                    boolean z6 = z5;
                                    lgb lgbVar3 = lgbVar2;
                                    switch (i5) {
                                        case 0:
                                            l78Var5.setValue(Boolean.FALSE);
                                            nib nibVar = lgbVar3.c;
                                            vx0.c0(f76.F(nibVar), null, null, new jib(!z6, nibVar, null, 2), 3);
                                            break;
                                        default:
                                            l78Var5.setValue(Boolean.FALSE);
                                            nib nibVar2 = lgbVar3.c;
                                            vx0.c0(f76.F(nibVar2), null, null, new jib(!z6, nibVar2, null, 1), 3);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM5);
                        }
                        p65 p65Var4 = p65Var;
                        oq.b(mz1VarE, (m45) objM5, null, null, null, false, null, null, p65Var4, 6, 508);
                        p65Var = p65Var4;
                    } else {
                        p65Var.Y(i);
                    }
                    p65Var.p(false);
                    if (this.g) {
                        p65Var.Y(-1089181731);
                        final boolean z6 = this.h;
                        mz1 mz1VarE2 = pxf.E(-194170421, new ts4(3, z6), p65Var);
                        boolean zF6 = p65Var.f(lgbVar2) | p65Var.g(z6);
                        Object objM6 = p65Var.M();
                        if (zF6 || objM6 == uobVar) {
                            objM6 = new m45() { // from class: egb
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i5 = i4;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var5 = l78Var2;
                                    boolean z62 = z6;
                                    lgb lgbVar3 = lgbVar2;
                                    switch (i5) {
                                        case 0:
                                            l78Var5.setValue(Boolean.FALSE);
                                            nib nibVar = lgbVar3.c;
                                            vx0.c0(f76.F(nibVar), null, null, new jib(!z62, nibVar, null, 2), 3);
                                            break;
                                        default:
                                            l78Var5.setValue(Boolean.FALSE);
                                            nib nibVar2 = lgbVar3.c;
                                            vx0.c0(f76.F(nibVar2), null, null, new jib(!z62, nibVar2, null, 1), 3);
                                            break;
                                    }
                                    return c1eVar2;
                                }
                            };
                            p65Var.j0(objM6);
                        }
                        p65 p65Var5 = p65Var;
                        oq.b(mz1VarE2, (m45) objM6, null, null, null, false, null, null, p65Var5, 6, 508);
                        p65Var = p65Var5;
                    } else {
                        p65Var.Y(i);
                    }
                    p65Var.p(false);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ dgb(boolean z, lgb lgbVar, aib aibVar, boolean z2, boolean z3, boolean z4, boolean z5, l78 l78Var) {
        this.b = z;
        this.c = lgbVar;
        this.d = aibVar;
        this.e = z2;
        this.f = z3;
        this.g = z4;
        this.h = z5;
        this.i = l78Var;
    }
}
