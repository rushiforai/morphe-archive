package r00;

import android.content.Context;
import android.text.TextUtils;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b00.e0;
import c3.z1;
import com.vungle.ads.internal.protos.Sdk;
import cw.l2;
import e10.e2;
import e10.i0;
import e10.k0;
import e10.n0;
import e10.z2;
import iy.p0;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import k0.i2;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlin.ranges.IntRange;
import p1.g1;
import p1.o0;
import t00.a0;
import t70.j0;

/* loaded from: classes4.dex */
public final class c implements Function6 {

    /* renamed from: b, reason: collision with root package name */
    public static final c f84951b = new c(0);

    /* renamed from: c, reason: collision with root package name */
    public static final c f84952c = new c(1);

    /* renamed from: d, reason: collision with root package name */
    public static final c f84953d = new c(2);

    /* renamed from: e, reason: collision with root package name */
    public static final c f84954e = new c(3);

    /* renamed from: f, reason: collision with root package name */
    public static final c f84955f = new c(4);

    /* renamed from: g, reason: collision with root package name */
    public static final c f84956g = new c(5);

    /* renamed from: h, reason: collision with root package name */
    public static final c f84957h = new c(6);

    /* renamed from: i, reason: collision with root package name */
    public static final c f84958i = new c(7);

    /* renamed from: j, reason: collision with root package name */
    public static final c f84959j = new c(8);

    /* renamed from: k, reason: collision with root package name */
    public static final c f84960k = new c(9);

    /* renamed from: l, reason: collision with root package name */
    public static final c f84961l = new c(10);

    /* renamed from: m, reason: collision with root package name */
    public static final c f84962m = new c(11);
    public static final c n = new c(12);
    public static final c o = new c(13);

    /* renamed from: p, reason: collision with root package name */
    public static final c f84963p = new c(14);

    /* renamed from: q, reason: collision with root package name */
    public static final c f84964q = new c(15);

    /* renamed from: r, reason: collision with root package name */
    public static final c f84965r = new c(16);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84966a;

    public /* synthetic */ c(int i5) {
        this.f84966a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x04f1  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0583  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x062f  */
    /* JADX WARN: Removed duplicated region for block: B:197:0x06f5  */
    /* JADX WARN: Removed duplicated region for block: B:225:0x0814  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0462  */
    @Override // kotlin.jvm.functions.Function6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        int i5;
        char c11;
        int i11;
        int i12;
        int i13 = this.f84966a;
        b2.r rVar = b2.r.f17024a;
        final int i14 = 2;
        g1 g1Var = p1.n.f81514a;
        final int i15 = 0;
        switch (i13) {
            case 0:
                final m mVar = (m) obj3;
                int iIntValue = ((Number) obj4).intValue();
                p1.o oVar = (p1.o) obj5;
                int iIntValue2 = ((Number) obj6).intValue();
                if ((iIntValue2 & 384) == 0) {
                    i5 = iIntValue2 | (((p1.t) oVar).f(mVar) ? 256 : 128);
                } else {
                    i5 = iIntValue2;
                }
                if ((iIntValue2 & 3072) == 0) {
                    i5 |= ((p1.t) oVar).d(iIntValue) ? 2048 : 1024;
                }
                if ((i5 & 9345) == 9344) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        p1.t tVar2 = (p1.t) oVar;
                        Object objP = tVar2.P();
                        if (objP == g1Var) {
                            objP = o0.i(EmptyCoroutineContext.f71803a, tVar2);
                            tVar2.m0(objP);
                        }
                        j0 j0Var = (j0) objP;
                        mVar.f88424a.n(j0Var, iIntValue);
                        tz.u uVar = ((tz.g) mVar.f85015e.f83363b.getValue()).f90123l;
                        if (mVar.b().f51588d == 262914) {
                            tVar2.b0(1147288443);
                            i2.b(androidx.compose.foundation.layout.e.g(rVar, 48), tVar2);
                            tVar2.p(false);
                        } else {
                            tVar2.b0(1146874438);
                            a0 a0Var = mVar.f88424a;
                            tVar2.b0(-1625563583);
                            i = (i5 & 896) != 256 ? 0 : 1;
                            Object objP2 = tVar2.P();
                            if (i != 0 || objP2 == g1Var) {
                                objP2 = new Function1() { // from class: r00.b
                                    @Override // kotlin.jvm.functions.Function1
                                    public final Object invoke(Object obj7) {
                                        switch (i15) {
                                            case 0:
                                                m mVar2 = mVar;
                                                mVar2.f85015e.setValue(tz.g.b((tz.g) mVar2.f85015e.f83363b.getValue(), null, null, null, null, null, null, null, null, null, (tz.u) obj7, null, null, null, 30719));
                                                mVar2.f88425b.invoke();
                                                break;
                                            case 1:
                                                m mVar3 = mVar;
                                                mVar3.c(i0.c(mVar3.b(), (fz.d) obj7, null, false, 0, false, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
                                                break;
                                            default:
                                                boolean zBooleanValue = ((Boolean) obj7).booleanValue();
                                                m mVar4 = mVar;
                                                if (zBooleanValue) {
                                                    mVar4.c(i0.c(mVar4.b(), null, null, false, 262914, false, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                                                } else {
                                                    mVar4.c(i0.c(mVar4.b(), null, null, false, -1, false, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                                                }
                                                break;
                                        }
                                        return Unit.f71706a;
                                    }
                                };
                                tVar2.m0(objP2);
                            }
                            tVar2.p(false);
                            p0.f(uVar, a0Var, j0Var, null, false, false, false, false, null, null, (Function1) objP2, tVar2, 1769472, 920);
                            tVar2.p(false);
                        }
                    }
                }
                break;
            case 1:
                String str = (String) obj;
                m mVar2 = (m) obj3;
                ((Number) obj4).intValue();
                p1.o oVar2 = (p1.o) obj5;
                int iIntValue3 = ((Number) obj6).intValue();
                if ((iIntValue3 & 6) == 0) {
                    c11 = 5;
                    i11 = (((p1.t) oVar2).f(str) ? 4 : 2) | iIntValue3;
                } else {
                    c11 = 5;
                    i11 = iIntValue3;
                }
                if ((iIntValue3 & 384) == 0) {
                    i11 |= ((p1.t) oVar2).f(mVar2) ? 256 : 128;
                }
                if ((i11 & 8323) == 8322) {
                    p1.t tVar3 = (p1.t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        i2.b(androidx.compose.foundation.layout.e.o(rVar, 8), oVar2);
                        z2.c(i11 & 14, 2, null, str, oVar2);
                        y9.y yVar = new y9.y();
                        float f11 = 48;
                        p1.t tVar4 = (p1.t) oVar2;
                        int iMo96roundToPx0680j_4 = ((y3.c) tVar4.j(z1.f19497h)).mo96roundToPx0680j_4(f11);
                        p1.z2 z2Var = AndroidCompositionLocals_androidKt.f14166b;
                        Context context = (Context) tVar4.j(z2Var);
                        Object objJ = tVar4.j(z2Var);
                        Intrinsics.e(objJ, "null cannot be cast to non-null type com.android.launcher3.views.ActivityContext");
                        za.d dVar = (za.d) objJ;
                        float f12 = iMo96roundToPx0680j_4;
                        yVar.k(context, dVar, null, iMo96roundToPx0680j_4, 0, MathKt.b(0.8f * f12), MathKt.b(f12 * 0.1f));
                        boolean z11 = TextUtils.getLayoutDirectionFromLocale(Locale.getDefault()) == 1;
                        List list = e10.j0.f51599e;
                        ArrayList arrayListG = vh.a.G((Context) tVar4.j(z2Var));
                        b2.t tVarJ = androidx.compose.foundation.layout.d.j(rVar, 16);
                        e2[] e2VarArr = new e2[7];
                        e2VarArr[0] = e2.f51488f;
                        e2VarArr[1] = e2.f51489g;
                        e2VarArr[2] = e2.f51490h;
                        e2VarArr[3] = e2.f51491i;
                        e2VarArr[4] = e2.f51487e;
                        e2VarArr[c11] = e2.f51492j;
                        e2VarArr[6] = e2.f51486d;
                        p0.h(4, ul.b.Q(e2VarArr), tVarJ, x1.f.d(-1203143043, new e(mVar2, iMo96roundToPx0680j_4, yVar, arrayListG, z11, f11), oVar2), oVar2, 3510, 0);
                    }
                }
                break;
            case 2:
                String str2 = (String) obj;
                final m mVar3 = (m) obj3;
                ((Number) obj4).intValue();
                p1.o oVar3 = (p1.o) obj5;
                int iIntValue4 = ((Number) obj6).intValue();
                if ((iIntValue4 & 6) == 0) {
                    i12 = iIntValue4 | (((p1.t) oVar3).f(str2) ? 4 : 2);
                } else {
                    i12 = iIntValue4;
                }
                if ((iIntValue4 & 384) == 0) {
                    i12 |= ((p1.t) oVar3).f(mVar3) ? 256 : 128;
                }
                if ((i12 & 8323) == 8322) {
                    p1.t tVar5 = (p1.t) oVar3;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        z2.c(i12 & 14, 2, null, str2, oVar3);
                        fz.d dVarG = mVar3.b().g();
                        fz.d.Companion.getClass();
                        List listQ = ul.b.Q(fz.d.f56190k, fz.d.f56191l, fz.d.f56192m, fz.d.n, fz.d.f56198u, fz.d.f56197t);
                        p1.t tVar6 = (p1.t) oVar3;
                        tVar6.b0(-1318956745);
                        boolean z12 = (i12 & 896) == 256;
                        Object objP3 = tVar6.P();
                        if (z12 || objP3 == g1Var) {
                            objP3 = new Function1() { // from class: r00.b
                                @Override // kotlin.jvm.functions.Function1
                                public final Object invoke(Object obj7) {
                                    switch (i) {
                                        case 0:
                                            m mVar22 = mVar3;
                                            mVar22.f85015e.setValue(tz.g.b((tz.g) mVar22.f85015e.f83363b.getValue(), null, null, null, null, null, null, null, null, null, (tz.u) obj7, null, null, null, 30719));
                                            mVar22.f88425b.invoke();
                                            break;
                                        case 1:
                                            m mVar32 = mVar3;
                                            mVar32.c(i0.c(mVar32.b(), (fz.d) obj7, null, false, 0, false, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
                                            break;
                                        default:
                                            boolean zBooleanValue = ((Boolean) obj7).booleanValue();
                                            m mVar4 = mVar3;
                                            if (zBooleanValue) {
                                                mVar4.c(i0.c(mVar4.b(), null, null, false, 262914, false, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                                            } else {
                                                mVar4.c(i0.c(mVar4.b(), null, null, false, -1, false, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                                            }
                                            break;
                                    }
                                    return Unit.f71706a;
                                }
                            };
                            tVar6.m0(objP3);
                        }
                        tVar6.p(false);
                        u00.f.c(dVarG, listQ, null, null, (Function1) objP3, tVar6, 48, 12);
                    }
                }
                break;
            case 3:
                final m mVar4 = (m) obj3;
                ((Number) obj4).intValue();
                p1.o oVar4 = (p1.o) obj5;
                int iIntValue5 = ((Number) obj6).intValue();
                if ((iIntValue5 & 384) == 0) {
                    iIntValue5 |= ((p1.t) oVar4).f(mVar4) ? 256 : 128;
                }
                if ((iIntValue5 & 8321) == 8320) {
                    p1.t tVar7 = (p1.t) oVar4;
                    if (tVar7.E()) {
                        tVar7.V();
                    } else {
                        boolean zA = mVar4.b().a();
                        x1.e eVar = h.f84984d;
                        p1.t tVar8 = (p1.t) oVar4;
                        tVar8.b0(1696159255);
                        i = (iIntValue5 & 896) != 256 ? 0 : 1;
                        Object objP4 = tVar8.P();
                        if (i != 0 || objP4 == g1Var) {
                            objP4 = new Function0() { // from class: r00.f
                                @Override // kotlin.jvm.functions.Function0
                                public final Object invoke() {
                                    switch (i15) {
                                        case 0:
                                            m mVar5 = mVar4;
                                            mVar5.c(i0.c(mVar5.b(), null, null, !mVar5.b().f51587c, 0, false, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
                                            break;
                                        default:
                                            m mVar6 = mVar4;
                                            mVar6.c(i0.c(mVar6.b(), null, null, false, 0, !mVar6.b().f51590f, 95));
                                            break;
                                    }
                                    return Unit.f71706a;
                                }
                            };
                            tVar8.m0(objP4);
                        }
                        tVar8.p(false);
                        ky.l.d(null, zA, null, eVar, false, (Function0) objP4, null, x1.f.d(-2098587554, new g(mVar4, i15), tVar8), null, tVar8, 12585984, 341);
                    }
                }
                break;
            case 4:
                final m mVar5 = (m) obj3;
                ((Number) obj4).intValue();
                p1.o oVar5 = (p1.o) obj5;
                int iIntValue6 = ((Number) obj6).intValue();
                if ((iIntValue6 & 384) == 0) {
                    iIntValue6 |= ((p1.t) oVar5).f(mVar5) ? 256 : 128;
                }
                if ((iIntValue6 & 8321) == 8320) {
                    p1.t tVar9 = (p1.t) oVar5;
                    if (tVar9.E()) {
                        tVar9.V();
                    } else {
                        x1.e eVar2 = h.f84986f;
                        p1.t tVar10 = (p1.t) oVar5;
                        tVar10.b0(416314777);
                        boolean z13 = (iIntValue6 & 896) == 256;
                        Object objP5 = tVar10.P();
                        if (z13 || objP5 == g1Var) {
                            objP5 = new Function0() { // from class: r00.f
                                @Override // kotlin.jvm.functions.Function0
                                public final Object invoke() {
                                    switch (i) {
                                        case 0:
                                            m mVar52 = mVar5;
                                            mVar52.c(i0.c(mVar52.b(), null, null, !mVar52.b().f51587c, 0, false, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
                                            break;
                                        default:
                                            m mVar6 = mVar5;
                                            mVar6.c(i0.c(mVar6.b(), null, null, false, 0, !mVar6.b().f51590f, 95));
                                            break;
                                    }
                                    return Unit.f71706a;
                                }
                            };
                            tVar10.m0(objP5);
                        }
                        tVar10.p(false);
                        ky.l.d(null, false, null, eVar2, false, (Function0) objP5, null, x1.f.d(1722353759, new g(mVar5, i), tVar10), null, tVar10, 12585984, 343);
                    }
                }
                break;
            case 5:
                final m mVar6 = (m) obj3;
                ((Number) obj4).intValue();
                p1.o oVar6 = (p1.o) obj5;
                int iIntValue7 = ((Number) obj6).intValue();
                if ((iIntValue7 & 384) == 0) {
                    iIntValue7 |= ((p1.t) oVar6).f(mVar6) ? 256 : 128;
                }
                if ((iIntValue7 & 8321) == 8320) {
                    p1.t tVar11 = (p1.t) oVar6;
                    if (tVar11.E()) {
                        tVar11.V();
                    } else {
                        x1.e eVar3 = h.f84988h;
                        boolean z14 = mVar6.b().f51588d == 262914;
                        p1.t tVar12 = (p1.t) oVar6;
                        tVar12.b0(-863527474);
                        i = (iIntValue7 & 896) != 256 ? 0 : 1;
                        Object objP6 = tVar12.P();
                        if (i != 0 || objP6 == g1Var) {
                            objP6 = new Function1() { // from class: r00.b
                                @Override // kotlin.jvm.functions.Function1
                                public final Object invoke(Object obj7) {
                                    switch (i14) {
                                        case 0:
                                            m mVar22 = mVar6;
                                            mVar22.f85015e.setValue(tz.g.b((tz.g) mVar22.f85015e.f83363b.getValue(), null, null, null, null, null, null, null, null, null, (tz.u) obj7, null, null, null, 30719));
                                            mVar22.f88425b.invoke();
                                            break;
                                        case 1:
                                            m mVar32 = mVar6;
                                            mVar32.c(i0.c(mVar32.b(), (fz.d) obj7, null, false, 0, false, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
                                            break;
                                        default:
                                            boolean zBooleanValue = ((Boolean) obj7).booleanValue();
                                            m mVar42 = mVar6;
                                            if (zBooleanValue) {
                                                mVar42.c(i0.c(mVar42.b(), null, null, false, 262914, false, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                                            } else {
                                                mVar42.c(i0.c(mVar42.b(), null, null, false, -1, false, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                                            }
                                            break;
                                    }
                                    return Unit.f71706a;
                                }
                            };
                            tVar12.m0(objP6);
                        }
                        tVar12.p(false);
                        x7.f.d(eVar3, z14, null, false, false, null, null, (Function1) objP6, tVar12, 6, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
                    }
                }
                break;
            case 6:
                String str3 = (String) obj;
                p pVar = (p) obj3;
                ((Number) obj4).intValue();
                p1.o oVar7 = (p1.o) obj5;
                ((Number) obj6).intValue();
                androidx.compose.animation.b.d(((n0) pVar.f85021e.f83363b.getValue()).f51677a == e10.p0.f51735c, null, null, null, null, x1.f.d(252366090, new e0(26, pVar, str3), oVar7), oVar7, 196608, 30);
                break;
            case 7:
                p pVar2 = (p) obj3;
                ((Number) obj4).intValue();
                ((Number) obj6).intValue();
                int i16 = ((n0) pVar2.f85021e.f83363b.getValue()).f51680d;
                IntRange intRange = new IntRange(0, 48, 1);
                p1.t tVar13 = (p1.t) ((p1.o) obj5);
                tVar13.b0(1550913147);
                boolean zH = tVar13.h(pVar2);
                Object objP7 = tVar13.P();
                if (zH || objP7 == g1Var) {
                    objP7 = new i(pVar2, 1);
                    tVar13.m0(objP7);
                }
                tVar13.p(false);
                l2.c(i16, null, null, null, null, 0.0f, intRange, 0.0f, (Function1) objP7, tVar13, 0, 190);
                break;
            case 8:
                p pVar3 = (p) obj3;
                ((Number) obj4).intValue();
                ((Number) obj6).intValue();
                x1.e eVar4 = l.f85008l;
                boolean z15 = ((n0) pVar3.f85021e.f83363b.getValue()).f51682f;
                p1.t tVar14 = (p1.t) ((p1.o) obj5);
                tVar14.b0(271062365);
                boolean zH2 = tVar14.h(pVar3);
                Object objP8 = tVar14.P();
                if (zH2 || objP8 == g1Var) {
                    objP8 = new i(pVar3, 2);
                    tVar14.m0(objP8);
                }
                tVar14.p(false);
                x7.f.g(eVar4, z15, null, false, (Function1) objP8, tVar14, 6, 28);
                break;
            case 9:
                p pVar4 = (p) obj3;
                ((Number) obj4).intValue();
                p1.o oVar8 = (p1.o) obj5;
                ((Number) obj6).intValue();
                a.a.j(((n0) pVar4.f85021e.f83363b.getValue()).f51677a, null, null, null, x1.f.d(-1391741034, new j(pVar4, i15), oVar8), oVar8, 24576, 14);
                break;
            case 10:
                String str4 = (String) obj;
                p pVar5 = (p) obj3;
                ((Number) obj4).intValue();
                int iIntValue8 = ((Number) obj6).intValue();
                k0 k0Var = ((n0) pVar5.f85021e.f83363b.getValue()).f51685i;
                List listB1 = kotlin.collections.c.b1(k0.values());
                p1.t tVar15 = (p1.t) ((p1.o) obj5);
                tVar15.b0(2006343266);
                boolean zH3 = tVar15.h(pVar5);
                Object objP9 = tVar15.P();
                if (zH3 || objP9 == g1Var) {
                    objP9 = new i(pVar5, 4);
                    tVar15.m0(objP9);
                }
                tVar15.p(false);
                zg.a.i(str4, k0Var, listB1, null, null, (Function1) objP9, tVar15, iIntValue8 & 14, 24);
                break;
            case 11:
                p pVar6 = (p) obj3;
                ((Number) obj4).intValue();
                ((Number) obj6).intValue();
                x1.e eVar5 = l.f85012r;
                p1.t tVar16 = (p1.t) ((p1.o) obj5);
                tVar16.b0(726491072);
                boolean zH4 = tVar16.h(pVar6);
                Object objP10 = tVar16.P();
                if (zH4 || objP10 == g1Var) {
                    objP10 = new n0.w(pVar6, 12);
                    tVar16.m0(objP10);
                }
                tVar16.p(false);
                ky.l.d(null, false, null, eVar5, false, (Function0) objP10, null, x1.f.d(-2104241529, new k(pVar6, i15), tVar16), null, tVar16, 12585984, 343);
                break;
            case 12:
                p pVar7 = (p) obj3;
                ((Number) obj4).intValue();
                ((Number) obj6).intValue();
                mx.j jVar = (mx.j) pVar7.f85022f.f83363b.getValue();
                float f13 = pVar7.f85024h;
                p1.t tVar17 = (p1.t) ((p1.o) obj5);
                tVar17.b0(397419011);
                boolean zH5 = tVar17.h(pVar7);
                Object objP11 = tVar17.P();
                if (zH5 || objP11 == g1Var) {
                    objP11 = new i(pVar7, 5);
                    tVar17.m0(objP11);
                }
                tVar17.p(false);
                t00.q.h(jVar, f13, (Function1) objP11, tVar17, 0);
                break;
            case 13:
                p pVar8 = (p) obj3;
                ((Number) obj4).intValue();
                ((Number) obj6).intValue();
                mx.j jVar2 = (mx.j) pVar8.f85022f.f83363b.getValue();
                p1.t tVar18 = (p1.t) ((p1.o) obj5);
                tVar18.b0(1904976612);
                boolean zH6 = tVar18.h(pVar8);
                Object objP12 = tVar18.P();
                if (zH6 || objP12 == g1Var) {
                    objP12 = new i(pVar8, 6);
                    tVar18.m0(objP12);
                }
                tVar18.p(false);
                t00.q.d(jVar2, (Function1) objP12, tVar18, 0);
                break;
            case 14:
                p pVar9 = (p) obj3;
                int iIntValue9 = ((Number) obj4).intValue();
                ((Number) obj6).intValue();
                p1.t tVar19 = (p1.t) ((p1.o) obj5);
                Object objP13 = tVar19.P();
                if (objP13 == g1Var) {
                    objP13 = o0.i(EmptyCoroutineContext.f71803a, tVar19);
                    tVar19.m0(objP13);
                }
                j0 j0Var2 = (j0) objP13;
                a0 a0Var2 = pVar9.f88424a;
                Object objP14 = tVar19.P();
                if (objP14 == g1Var) {
                    objP14 = o0.i(EmptyCoroutineContext.f71803a, tVar19);
                    tVar19.m0(objP14);
                }
                a0Var2.n((j0) objP14, iIntValue9);
                tz.u uVar2 = ((tz.g) pVar9.f85020d.f83363b.getValue()).f90116e;
                a0 a0Var3 = pVar9.f88424a;
                tVar19.b0(-882423628);
                boolean zH7 = tVar19.h(pVar9);
                Object objP15 = tVar19.P();
                if (zH7 || objP15 == g1Var) {
                    objP15 = new i(pVar9, 7);
                    tVar19.m0(objP15);
                }
                tVar19.p(false);
                p0.f(uVar2, a0Var3, j0Var2, null, false, false, false, false, null, null, (Function1) objP15, tVar19, 0, 1016);
                break;
            case 15:
                String str5 = (String) obj;
                p pVar10 = (p) obj3;
                ((Number) obj4).intValue();
                int iIntValue10 = ((Number) obj6).intValue();
                e10.p0 p0Var = ((n0) pVar10.f85021e.f83363b.getValue()).f51677a;
                List listB12 = kotlin.collections.c.b1(e10.p0.values());
                p1.t tVar20 = (p1.t) ((p1.o) obj5);
                tVar20.b0(625141730);
                boolean zH8 = tVar20.h(pVar10);
                Object objP16 = tVar20.P();
                if (zH8 || objP16 == g1Var) {
                    objP16 = new i(pVar10, 8);
                    tVar20.m0(objP16);
                }
                tVar20.p(false);
                zg.a.i(str5, p0Var, listB12, null, null, (Function1) objP16, tVar20, iIntValue10 & 14, 24);
                break;
            default:
                p pVar11 = (p) obj3;
                ((Number) obj4).intValue();
                p1.o oVar9 = (p1.o) obj5;
                ((Number) obj6).intValue();
                a.a.j(((n0) pVar11.f85021e.f83363b.getValue()).f51677a, null, null, null, x1.f.d(85687415, new j(pVar11, i), oVar9), oVar9, 24576, 14);
                break;
        }
        return Unit.f71706a;
    }
}
