package bu;

import ads_mobile_sdk.by2;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.fl2;
import ads_mobile_sdk.gh1;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.mj2;
import ads_mobile_sdk.ti3;
import android.os.Bundle;
import android.os.UserHandle;
import b.b4;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.financialconnections.FinancialConnectionsSheetResult;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetInstantDebitsResult;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.vungle.ads.internal.protos.Sdk;
import e00.z1;
import e10.t0;
import fs.j0;
import h6.g1;
import hv.s2;
import java.util.LinkedHashSet;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.SuspendFunction;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import ou.g2;
import p6.e0;
import t70.l1;
import t70.m0;
import w70.i2;
import z.f0;

/* loaded from: classes4.dex */
public final /* synthetic */ class m extends FunctionReferenceImpl implements Function1, SuspendFunction {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f18564d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m(int i5, Object obj, Class cls, String str, String str2, int i11, int i12) {
        super(i5, i11, cls, obj, str, str2);
        this.f18564d = i12;
    }

    /* JADX WARN: Removed duplicated region for block: B:123:0x0395  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x02a7  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x02f7  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        Object value;
        Object value2;
        Object value3;
        Object value4;
        cv.w wVar;
        cv.x xVar;
        int i5;
        Object value5;
        String str;
        LinkedHashSet linkedHashSet;
        IdentifierResolvableString identifierResolvableStringG;
        e0 e0Var;
        Object value6;
        ps.m mVar;
        switch (this.f18564d) {
            case 0:
                String p02 = (String) obj;
                Intrinsics.g(p02, "p0");
                ru.a aVar = (ru.a) ((ru.d) this.receiver);
                aVar.getClass();
                aVar.g(new kt.g(p02));
                ru.a.i(aVar, new ru.n(p02, 6));
                return Unit.f71706a;
            case 1:
                ((au.i) this.receiver).a((PaymentSelection) obj);
                return Unit.f71706a;
            case 2:
                zu.r p03 = (zu.r) obj;
                Intrinsics.g(p03, "p0");
                ((ru.a) ((ru.d) this.receiver)).t(p03);
                return Unit.f71706a;
            case 3:
                Function1 p04 = (Function1) obj;
                Intrinsics.g(p04, "p0");
                i iVar = (i) this.receiver;
                i2 i2Var = iVar.f18556f;
                b0 b0Var = iVar.f18554d;
                s2 s2Var = (s2) p04.invoke(iVar.f18558h);
                iVar.f18558h = s2Var;
                if (s2Var != null) {
                    Function0 function0 = s2Var.f60583c;
                    b0Var.getClass();
                    b0Var.f18523a = function0;
                    do {
                        value2 = i2Var.getValue();
                    } while (!i2Var.i(value2, u.a((u) value2, s2Var.f60581a, s2Var.f60585e, null, false, null, null, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE)));
                } else {
                    b0Var.f18523a = null;
                    do {
                        value = i2Var.getValue();
                    } while (!i2Var.i(value, u.a((u) value, i.a(iVar.f18551a.f43092a, iVar.f18553c), iVar.f18552b.f15697b.f93973a.getValue() != null, null, false, null, null, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE)));
                }
                return Unit.f71706a;
            case 4:
                ResolvableString resolvableString = (ResolvableString) obj;
                i2 i2Var2 = ((i) this.receiver).f18556f;
                do {
                    value3 = i2Var2.getValue();
                } while (!i2Var2.i(value3, u.a((u) value3, null, false, null, false, resolvableString, null, 95)));
                return Unit.f71706a;
            case 5:
                bv.l p05 = (bv.l) obj;
                Intrinsics.g(p05, "p0");
                ((bv.n) this.receiver).e(p05);
                return Unit.f71706a;
            case 6:
                ou.j p06 = (ou.j) obj;
                Intrinsics.g(p06, "p0");
                ((g2) this.receiver).f(p06);
                return Unit.f71706a;
            case 7:
                ((au.i) this.receiver).a((PaymentSelection) obj);
                return Unit.f71706a;
            case 8:
                cv.u p07 = (cv.u) obj;
                Intrinsics.g(p07, "p0");
                ((cv.v) this.receiver).e(p07);
                return Unit.f71706a;
            case 9:
                String p08 = (String) obj;
                Intrinsics.g(p08, "p0");
                cv.a0 a0Var = (cv.a0) this.receiver;
                a0Var.getClass();
                i2 i2Var3 = a0Var.f47999b;
                do {
                    value4 = i2Var3.getValue();
                    wVar = (cv.w) value4;
                    xVar = wVar.f48044c;
                    int length = p08.length();
                    ft.b bVar = xVar.f48047b;
                    if (length <= bVar.a()) {
                        xVar = new cv.x(p08, bVar);
                    }
                } while (!i2Var3.i(value4, cv.w.a(wVar, xVar, false, 11)));
                return Unit.f71706a;
            case 10:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                e0.g gVar = (e0.g) this.receiver;
                f0 f0Var = gVar.n;
                if (zBooleanValue) {
                    gVar.I();
                } else {
                    if (gVar.f49980a != null) {
                        Object[] objArr = f0Var.f97824c;
                        long[] jArr = f0Var.f97822a;
                        int length2 = jArr.length - 2;
                        if (length2 >= 0) {
                            int i11 = 0;
                            while (true) {
                                long j11 = jArr[i11];
                                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                    int i12 = 8;
                                    int i13 = 8 - ((~(i11 - length2)) >>> 31);
                                    int i14 = 0;
                                    while (i14 < i13) {
                                        if ((255 & j11) < 128) {
                                            i5 = i12;
                                            m0.t(gVar.getCoroutineScope(), null, null, new e0.e(gVar, (i0.k) objArr[(i11 << 3) + i14], null, 0), 3);
                                        } else {
                                            i5 = i12;
                                        }
                                        j11 >>= i5;
                                        i14++;
                                        i12 = i5;
                                    }
                                    if (i13 == i12) {
                                        if (i11 != length2) {
                                            i11++;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    f0Var.c();
                    gVar.M();
                }
                return Unit.f71706a;
            case 11:
                ((z1) this.receiver).f51195d.setValue((mx.j) obj);
                return Unit.f71706a;
            case 12:
                z1 z1Var = (z1) this.receiver;
                z1Var.f51197f.setValue((t0) obj);
                z1Var.f88425b.invoke();
                return Unit.f71706a;
            case 13:
                rw.a p09 = (rw.a) obj;
                Intrinsics.g(p09, "p0");
                com.stripe.android.link.l lVar = (com.stripe.android.link.l) this.receiver;
                lVar.getClass();
                p6.n nVar = p09.f86450b;
                if (nVar != null) {
                    p6.n nVar2 = p09.f86449a;
                    String str2 = (nVar2 == null || (e0Var = nVar2.f82192b) == null) ? null : e0Var.f82158g;
                    i2 i2Var4 = lVar.f42999p;
                    do {
                        value5 = i2Var4.getValue();
                        LinkAccount linkAccountH = lVar.h();
                        boolean z11 = linkAccountH != null && linkAccountH.f43019k;
                        e0 e0Var2 = nVar.f82192b;
                        str = e0Var2 != null ? e0Var2.f82158g : null;
                        String[] strArr = {es.r.f53005d.a(), es.u.f53008d.a(), es.y.f53012d.a(), es.x.f53011d.a(), es.s.f53006d.a()};
                        linkedHashSet = new LinkedHashSet(b70.k.d0(5));
                        kotlin.collections.c.Z0(strArr, linkedHashSet);
                        if (z11) {
                            linkedHashSet.add(es.t.f53007d.a());
                        }
                        if (Intrinsics.b(str, es.t.f53007d.a())) {
                            identifierResolvableStringG = z11 ? null : zg.a.G(2132019628);
                        } else {
                            if (Intrinsics.b(str, es.w.f53010d.a())) {
                                Bundle bundleA = nVar.a();
                                identifierResolvableStringG = ((bundleA != null && Boolean.parseBoolean(bundleA.getString("is_billing_update_flow"))) ? new es.v(bundleA.getString("billing_update_cvc")) : null) != null ? zg.a.G(2132019829) : zg.a.G(2132019848);
                            }
                        }
                    } while (!i2Var4.i(value5, new ps.m(b70.g.O0(linkedHashSet, str), str2 != null, identifierResolvableStringG, false)));
                }
                return Unit.f71706a;
            case 14:
                LinkActivityResult p010 = (LinkActivityResult) obj;
                Intrinsics.g(p010, "p0");
                com.stripe.android.link.l lVar2 = (com.stripe.android.link.l) this.receiver;
                lVar2.getClass();
                lVar2.g(p010);
                return Unit.f71706a;
            case 15:
                es.c p011 = (es.c) obj;
                Intrinsics.g(p011, "p0");
                com.stripe.android.link.l lVar3 = (com.stripe.android.link.l) this.receiver;
                lVar3.getClass();
                if (p011.equals(es.a.f52909a)) {
                    lVar3.g(new LinkActivityResult.Canceled(j0.a(lVar3.f42987b)));
                } else {
                    if (!p011.equals(es.b.f52924a)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    m0.t(l1.f88818a, null, null, new es.j(lVar3, null, 0), 3);
                    lVar3.g(new LinkActivityResult.Canceled(com.stripe.android.link.g.f42981b, new LinkAccountUpdate.Value(null, com.stripe.android.link.d.f42969a)));
                }
                return Unit.f71706a;
            case 16:
                Throwable p012 = (Throwable) obj;
                Intrinsics.g(p012, "p0");
                ((com.stripe.android.link.l) this.receiver).j(p012);
                return Unit.f71706a;
            case 17:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                i2 i2Var5 = ((com.stripe.android.link.l) this.receiver).f42999p;
                do {
                    value6 = i2Var5.getValue();
                    mVar = (ps.m) value6;
                } while (!i2Var5.i(value6, new ps.m(mVar.f82931a, mVar.f82932b, mVar.f82933c, zBooleanValue2)));
                return Unit.f71706a;
            case 18:
                String p013 = (String) obj;
                Intrinsics.g(p013, "p0");
                ((ex.s) this.receiver).getClass();
                Continuation continuation = null;
                if (!wi.e.f94394a.s(p013)) {
                    return null;
                }
                b4.f15783a.getClass();
                fl2 fl2Var = (fl2) ((db0) gu0.a()).f2356v1.get();
                fl2Var.getClass();
                gh1 gh1Var = (gh1) m0.u(new ti3(), new mj2(fl2Var, p013, continuation, 2));
                if (gh1Var != null) {
                    return new by2(gh1Var);
                }
                return null;
            case 19:
                return Long.valueOf(((b20.e) this.receiver).c((UserHandle) obj));
            case 20:
                Throwable p014 = (Throwable) obj;
                Intrinsics.g(p014, "p0");
                gv.x xVar2 = (gv.x) this.receiver;
                xVar2.f57964f.b("Failure loading PaymentSheetState", p014);
                ru.a aVar2 = (ru.a) xVar2.f57965g;
                aVar2.getClass();
                aVar2.h(new ru.p(((ir.a) aVar2.f86341e).a(ir.b.f67995a), p014, 5), null);
                return Unit.f71706a;
            case 21:
                FinancialConnectionsSheetInstantDebitsResult p015 = (FinancialConnectionsSheetInstantDebitsResult) obj;
                Intrinsics.g(p015, "p0");
                hu.m mVar2 = (hu.m) this.receiver;
                mVar2.getClass();
                mVar2.f60098f.d("key_has_launched", Boolean.FALSE);
                m0.t(g1.f(mVar2), null, null, new hu.l(p015, mVar2, null), 3);
                return Unit.f71706a;
            case 22:
                FinancialConnectionsSheetResult p016 = (FinancialConnectionsSheetResult) obj;
                Intrinsics.g(p016, "p0");
                hu.m mVar3 = (hu.m) this.receiver;
                mVar3.getClass();
                mVar3.f60098f.d("key_has_launched", Boolean.FALSE);
                m0.t(g1.f(mVar3), null, null, new hu.k(p016, mVar3, null), 3);
                return Unit.f71706a;
            case 23:
                String p017 = (String) obj;
                Intrinsics.g(p017, "p0");
                return ((ou.d) ((ou.o) this.receiver)).a(p017);
            case 24:
                String p018 = (String) obj;
                Intrinsics.g(p018, "p0");
                return ((ou.d) ((ou.o) this.receiver)).b(p018);
            case 25:
                String p019 = (String) obj;
                Intrinsics.g(p019, "p0");
                ((ru.f) this.receiver).b(p019);
                return Unit.f71706a;
            case 26:
                String p020 = (String) obj;
                Intrinsics.g(p020, "p0");
                ((ru.a) ((ru.d) this.receiver)).r(p020);
                return Unit.f71706a;
            case 27:
                ou.j p021 = (ou.j) obj;
                Intrinsics.g(p021, "p0");
                ((g2) this.receiver).f(p021);
                return Unit.f71706a;
            case 28:
                return ((io.ktor.utils.io.j0) this.receiver).d((Continuation) obj);
            default:
                String p022 = (String) obj;
                Intrinsics.g(p022, "p0");
                ru.a aVar3 = (ru.a) ((ru.d) this.receiver);
                aVar3.getClass();
                ru.a.i(aVar3, new ru.k(p022));
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(e0.g gVar) {
        super(1, 0, e0.g.class, gVar, "onFocusChange", "onFocusChange(Z)V");
        this.f18564d = 10;
    }
}
