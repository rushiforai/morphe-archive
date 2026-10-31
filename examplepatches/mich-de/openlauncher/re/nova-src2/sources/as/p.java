package as;

import ads_mobile_sdk.ec1;
import ads_mobile_sdk.i8;
import ads_mobile_sdk.jc1;
import ads_mobile_sdk.mi3;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.s8;
import ads_mobile_sdk.tu2;
import ads_mobile_sdk.xu0;
import android.content.Intent;
import android.os.Bundle;
import b.a1;
import b.ja;
import com.google.android.gms.tasks.Task;
import com.stripe.android.googlepaylauncher.GooglePayLauncherActivity;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkActivity;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.paymentelement.embedded.manage.ManageActivity;
import com.stripe.android.paymentsheet.PaymentOptionsActivity;
import com.stripe.android.paymentsheet.PaymentOptionsActivityResult;
import com.stripe.android.paymentsheet.PaymentSheetActivity;
import com.stripe.android.paymentsheet.PaymentSheetResult;
import e00.z4;
import e20.e0;
import e20.k0;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jv.v0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.flow.internal.AbortFlowException;
import kw.e3;
import ni.g0;
import ou.c1;
import p1.e1;
import p1.s2;
import t70.j0;
import t70.m0;
import w70.g1;
import w70.o1;
import w70.p0;
import w70.y0;

/* loaded from: classes4.dex */
public final class p implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15623a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15624b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f15625c;

    public /* synthetic */ p(int i5, Object obj, Object obj2) {
        this.f15623a = i5;
        this.f15624b = obj;
        this.f15625c = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(LinkActivityResult linkActivityResult, Continuation continuation) {
        es.e eVar;
        p pVar;
        if (continuation instanceof es.e) {
            eVar = (es.e) continuation;
            int i5 = eVar.f52940x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f52940x = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new es.e(this, continuation);
            }
        }
        Object obj = eVar.f52938v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f52940x;
        if (i11 == 0) {
            ResultKt.b(obj);
            lw.l lVar = (lw.l) this.f15624b;
            eVar.f52936t = this;
            eVar.f52937u = linkActivityResult;
            eVar.f52940x = 1;
            if (lVar.b(eVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            pVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            linkActivityResult = eVar.f52937u;
            pVar = eVar.f52936t;
            ResultKt.b(obj);
        }
        LinkActivity linkActivity = (LinkActivity) pVar.f15625c;
        int i12 = LinkActivity.f42866s;
        linkActivity.setResult(73563, new Intent().putExtras(w.b.a(new Pair("com.stripe.android.link.LinkActivityContract.extra_result", linkActivityResult))));
        linkActivity.finish();
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object b(PaymentOptionsActivityResult result, Continuation continuation) throws IOException {
        ou.z zVar;
        p pVar;
        if (continuation instanceof ou.z) {
            zVar = (ou.z) continuation;
            int i5 = zVar.f81018w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zVar.f81018w = i5 - Integer.MIN_VALUE;
            } else {
                zVar = new ou.z(this, continuation);
            }
        }
        Object obj = zVar.f81016u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zVar.f81018w;
        if (i11 == 0) {
            ResultKt.b(obj);
            PaymentOptionsActivity paymentOptionsActivity = (PaymentOptionsActivity) this.f15624b;
            Intrinsics.g(result, "result");
            paymentOptionsActivity.setResult(result.f44439a, new Intent().putExtras(w.b.a(new Pair("extra_activity_result", result))));
            lw.l lVar = (lw.l) this.f15625c;
            zVar.f81015t = this;
            zVar.f81018w = 1;
            if (lVar.b(zVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            pVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            pVar = zVar.f81015t;
            ResultKt.b(obj);
        }
        for (Object obj2 : (Iterable) ((PaymentOptionsActivity) pVar.f15624b).Z().f72278m.f96341f.getValue()) {
            if (obj2 instanceof Closeable) {
                ((Closeable) obj2).close();
            }
        }
        ((PaymentOptionsActivity) pVar.f15624b).finish();
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object e(PaymentSheetResult paymentSheetResult, Continuation continuation) throws IOException {
        c1 c1Var;
        p pVar;
        if (continuation instanceof c1) {
            c1Var = (c1) continuation;
            int i5 = c1Var.f80815w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c1Var.f80815w = i5 - Integer.MIN_VALUE;
            } else {
                c1Var = new c1(this, continuation);
            }
        }
        Object obj = c1Var.f80813u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c1Var.f80815w;
        if (i11 == 0) {
            ResultKt.b(obj);
            ((PaymentSheetActivity) this.f15624b).b0(paymentSheetResult);
            lw.l lVar = (lw.l) this.f15625c;
            c1Var.f80812t = this;
            c1Var.f80815w = 1;
            if (lVar.b(c1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            pVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            pVar = c1Var.f80812t;
            ResultKt.b(obj);
        }
        for (Object obj2 : (Iterable) ((PaymentSheetActivity) pVar.f15624b).Z().f72278m.f96341f.getValue()) {
            if (obj2 instanceof Closeable) {
                ((Closeable) obj2).close();
            }
        }
        ((PaymentSheetActivity) pVar.f15624b).finish();
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x02f2  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x0360  */
    /* JADX WARN: Removed duplicated region for block: B:231:0x042d  */
    /* JADX WARN: Removed duplicated region for block: B:281:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0028  */
    /* JADX WARN: Type inference failed for: r10v0, types: [java.lang.Object, kotlin.jvm.functions.Function2] */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        ec1 ec1Var;
        w70.n nVar;
        Object obj2;
        g0 g0VarA;
        Pair pair;
        k0 k0Var;
        fs.v vVar;
        w70.n nVar2;
        uw.i iVar;
        vs.l lVar;
        p0 p0Var;
        p pVar;
        p pVar2;
        y0 y0Var;
        p pVar3;
        g1 g1Var;
        w70.n nVar3;
        Object obj3 = obj;
        int i5 = this.f15623a;
        ?? r102 = this.f15625c;
        Object obj4 = this.f15624b;
        switch (i5) {
            case 0:
                Task task = (Task) obj3;
                if (task != null) {
                    ((j.c) obj4).a(task, null);
                    int i11 = GooglePayLauncherActivity.f42780r;
                    com.stripe.android.googlepaylauncher.j jVarA0 = ((GooglePayLauncherActivity) r102).a0();
                    jVarA0.f42838h.d("has_launched", Boolean.TRUE);
                    jVarA0.f42843m.c(null);
                }
                return Unit.f71706a;
            case 1:
                jc1 jc1Var = (jc1) r102;
                if (continuation instanceof ec1) {
                    ec1Var = (ec1) continuation;
                    int i12 = ec1Var.f2840b;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        ec1Var.f2840b = i12 - Integer.MIN_VALUE;
                    } else {
                        ec1Var = new ec1(this, continuation);
                    }
                }
                Object obj5 = ec1Var.f2839a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i13 = ec1Var.f2840b;
                if (i13 == 0) {
                    ResultKt.b(obj5);
                    nVar = (w70.n) obj4;
                    obj2 = (a1) obj3;
                    if (obj2 instanceof xu0) {
                        ja jaVar = (ja) ((xu0) obj2).f11834b;
                        if (!jaVar.b().f12416z0) {
                            mi3 mi3Var = jc1Var.f5217h;
                            mi3 traceMetaSet = jaVar.a();
                            mi3Var.getClass();
                            Intrinsics.g(traceMetaSet, "traceMetaSet");
                            tu2 tu2Var = traceMetaSet.f7226c;
                            tu2 tu2Var2 = mi3Var.f7226c;
                            tu2Var2.f10105b = tu2Var.f10105b;
                            tu2Var2.f10107d = tu2Var.f10107d;
                            tu2Var2.f10108e = tu2Var.f10108e;
                            tu2Var2.f10104a = tu2Var.f10104a;
                            tu2Var2.f10106c = tu2Var.f10106c;
                            tu2Var2.f10109f = tu2Var.f10109f;
                            tu2Var2.f10111h = tu2Var.f10111h;
                            s8 s8Var = traceMetaSet.f7227d;
                            s8 s8Var2 = mi3Var.f7227d;
                            s8Var2.f9458b = s8Var.f9458b;
                            s8Var2.f9459c = s8Var.f9459c;
                        }
                        i8 i8Var = jc1Var.f5214e;
                        com.google.gson.r rVarG = jaVar.g();
                        ni.l lVar2 = i8Var.f4661e;
                        String adapterClassName = lVar2 != null ? lVar2.getAdapterClassName() : null;
                        String str = i8Var.f4658b;
                        Bundle bundleA = i8Var.a(rVarG);
                        ni.l lVar3 = i8Var.f4661e;
                        List adapterResponses = i8Var.f4662f;
                        Intrinsics.f(adapterResponses, "adapterResponses");
                        g0 g0Var = new g0(adapterClassName, str, bundleA, lVar3, adapterResponses);
                        jaVar.a(g0Var);
                        pair = new Pair(obj2, g0Var);
                        ec1Var.f2841c = null;
                        ec1Var.f2843e = null;
                        ec1Var.f2844f = null;
                        ec1Var.f2840b = 2;
                        if (nVar.emit(pair, ec1Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        return Unit.f71706a;
                    }
                    if (!(obj2 instanceof pu0)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    g0VarA = jc1Var.f5214e.a();
                    b.o oVar = jc1Var.f5219j;
                    pu0 pu0Var = (pu0) obj2;
                    ec1Var.f2841c = nVar;
                    ec1Var.f2843e = pu0Var;
                    ec1Var.f2844f = g0VarA;
                    ec1Var.f2840b = 1;
                    if (oVar.a(pu0Var, g0VarA, ec1Var) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i13 != 1) {
                        if (i13 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj5);
                        return Unit.f71706a;
                    }
                    g0VarA = ec1Var.f2844f;
                    obj2 = ec1Var.f2843e;
                    nVar = ec1Var.f2841c;
                    ResultKt.b(obj5);
                }
                pair = new Pair(obj2, g0VarA);
                ec1Var.f2841c = null;
                ec1Var.f2843e = null;
                ec1Var.f2844f = null;
                ec1Var.f2840b = 2;
                if (nVar.emit(pair, ec1Var) == coroutineSingletons) {
                }
                return Unit.f71706a;
            case 2:
                ManageActivity manageActivity = (ManageActivity) obj4;
                Boolean bool = Boolean.TRUE;
                ManageActivity.a0(manageActivity, Intrinsics.b((Boolean) obj3, bool));
                manageActivity.finish();
                ((e1) r102).setValue(bool);
                return Unit.f71706a;
            case 3:
                long j11 = ((h2.b) obj3).f59016a;
                c0.e eVar = (c0.e) obj4;
                if ((((h2.b) eVar.e()).f59016a & 9223372034707292159L) == 9205357640488583168L || (j11 & 9223372034707292159L) == 9205357640488583168L || Float.intBitsToFloat((int) (((h2.b) eVar.e()).f59016a & 4294967295L)) == Float.intBitsToFloat((int) (j11 & 4294967295L))) {
                    Object objG = eVar.g(new h2.b(j11), continuation);
                    return objG == CoroutineSingletons.f71806a ? objG : Unit.f71706a;
                }
                m0.t((j0) r102, null, null, new b4.j(eVar, j11, (Continuation) null, 4), 3);
                return Unit.f71706a;
            case 4:
                if (continuation instanceof k0) {
                    k0Var = (k0) continuation;
                    int i14 = k0Var.f52044u;
                    if ((i14 & Integer.MIN_VALUE) != 0) {
                        k0Var.f52044u = i14 - Integer.MIN_VALUE;
                    } else {
                        k0Var = new k0(this, continuation);
                    }
                }
                Object obj6 = k0Var.f52043t;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i15 = k0Var.f52044u;
                if (i15 == 0) {
                    ResultKt.b(obj6);
                    e0 e0Var = new e0(new jx.t(((o1) r102).f93973a.getReplayCache()));
                    k0Var.f52044u = 1;
                    if (((w70.n) obj4).emit(e0Var, k0Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj6);
                }
                return Unit.f71706a;
            case 5:
                return a((LinkActivityResult) obj3, continuation);
            case 6:
                fs.y yVar = (fs.y) r102;
                if (continuation instanceof fs.v) {
                    vVar = (fs.v) continuation;
                    int i16 = vVar.f55841u;
                    if ((i16 & Integer.MIN_VALUE) != 0) {
                        vVar.f55841u = i16 - Integer.MIN_VALUE;
                    } else {
                        vVar = new fs.v(this, continuation);
                    }
                }
                Object obj7 = vVar.f55840t;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i17 = vVar.f55841u;
                if (i17 == 0) {
                    ResultKt.b(obj7);
                    w70.n nVar4 = (w70.n) obj4;
                    LinkAccountUpdate.Value value = (LinkAccountUpdate.Value) obj3;
                    z = (value.f42865b == com.stripe.android.link.d.f42969a && yVar.f55854b.f42916x) ? false : true;
                    LinkAccount linkAccount = value.f42864a;
                    vVar.f55842v = nVar4;
                    vVar.f55841u = 1;
                    Object objF = yVar.f(linkAccount, z, vVar);
                    if (objF == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                    obj7 = objF;
                    nVar2 = nVar4;
                } else {
                    if (i17 != 1) {
                        if (i17 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj7);
                        return Unit.f71706a;
                    }
                    nVar2 = vVar.f55842v;
                    ResultKt.b(obj7);
                }
                vVar.f55842v = null;
                vVar.f55841u = 2;
                if (nVar2.emit(obj7, vVar) == coroutineSingletons3) {
                    return coroutineSingletons3;
                }
                return Unit.f71706a;
            case 7:
                i0.h hVar = (i0.h) obj3;
                ArrayList arrayList = (ArrayList) obj4;
                if (hVar instanceof i0.d) {
                    arrayList.add(hVar);
                } else if (hVar instanceof i0.e) {
                    arrayList.remove(((i0.e) hVar).f61085a);
                }
                ((e1) r102).setValue(Boolean.valueOf(!arrayList.isEmpty()));
                return Unit.f71706a;
            case 8:
                ((Boolean) obj3).getClass();
                ((kv.c) obj4).f72283t.a(((v0) ((jv.q) r102).f70136s.f91586b.invoke()).f70182f, true);
                return Unit.f71706a;
            case 9:
                i0.h hVar2 = (i0.h) obj3;
                k1.a aVar = (k1.a) obj4;
                if (hVar2 instanceof i0.k) {
                    i0.k kVar = (i0.k) hVar2;
                    k1.g gVarA = aVar.f70801h;
                    if (gVarA == null) {
                        gVarA = k1.o.a(aVar.f70800g);
                        aVar.f70801h = gVarA;
                    }
                    k1.i iVarA = gVarA.a(aVar);
                    iVarA.a(kVar, aVar.f70796c, aVar.f70804k, aVar.f70805l, ((i2.s) aVar.f70798e.getValue()).f61148a, ((k1.e) aVar.f70799f.getValue()).f70826d, aVar.f70806m);
                    ((s2) aVar.f70802i).setValue(iVarA);
                } else if (hVar2 instanceof i0.l) {
                    k1.i iVar2 = (k1.i) ((s2) aVar.f70802i).getValue();
                    if (iVar2 != null) {
                        iVar2.d(false);
                    }
                } else if (hVar2 instanceof i0.j) {
                    k1.i iVar3 = (k1.i) ((s2) aVar.f70802i).getValue();
                    if (iVar3 != null) {
                        iVar3.d(false);
                    }
                } else {
                    aVar.f70795b.e(hVar2, (j0) r102);
                }
                return Unit.f71706a;
            case 10:
                i0.h hVar3 = (i0.h) obj3;
                k1.b bVar = (k1.b) obj4;
                if (!(hVar3 instanceof i0.m)) {
                    j0 j0Var = (j0) r102;
                    e20.r rVar = bVar.f70812f;
                    if (rVar == null) {
                        rVar = new e20.r(bVar.f70808b, bVar.f70811e);
                        b3.g.d(bVar);
                        bVar.f70812f = rVar;
                    }
                    rVar.e(hVar3, j0Var);
                } else if (bVar.f70815i) {
                    bVar.B((i0.m) hVar3);
                } else {
                    bVar.f70816j.g(hVar3);
                }
                return Unit.f71706a;
            case 11:
                return b((PaymentOptionsActivityResult) obj3, continuation);
            case 12:
                return e((PaymentSheetResult) obj3, continuation);
            case 13:
                ((t7.f) obj4).a((x7.q) r102, (t7.d) obj3);
                return Unit.f71706a;
            case 14:
                if (continuation instanceof uw.i) {
                    iVar = (uw.i) continuation;
                    int i18 = iVar.f91598u;
                    if ((i18 & Integer.MIN_VALUE) != 0) {
                        iVar.f91598u = i18 - Integer.MIN_VALUE;
                    } else {
                        iVar = new uw.i(this, continuation);
                    }
                }
                Object obj8 = iVar.f91597t;
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i19 = iVar.f91598u;
                if (i19 == 0) {
                    ResultKt.b(obj8);
                    Object objInvoke = ((Function1) r102).invoke(obj3);
                    iVar.f91598u = 1;
                    if (((w70.n) obj4).emit(objInvoke, iVar) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i19 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj8);
                }
                return Unit.f71706a;
            case 15:
                if (continuation instanceof vs.l) {
                    lVar = (vs.l) continuation;
                    int i21 = lVar.f92978u;
                    if ((i21 & Integer.MIN_VALUE) != 0) {
                        lVar.f92978u = i21 - Integer.MIN_VALUE;
                    } else {
                        lVar = new vs.l(this, continuation);
                    }
                }
                Object obj9 = lVar.f92977t;
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i22 = lVar.f92978u;
                if (i22 == 0) {
                    ResultKt.b(obj9);
                    w70.n nVar5 = (w70.n) obj4;
                    Boolean boolValueOf = Boolean.valueOf(((vs.e) ((vs.o) r102).o.f93973a.getValue()).f92951c ? ((e3) obj3).isValid() : true);
                    lVar.f92978u = 1;
                    if (nVar5.emit(boolValueOf, lVar) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i22 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj9);
                }
                return Unit.f71706a;
            case 16:
                if (continuation instanceof p0) {
                    p0Var = (p0) continuation;
                    int i23 = p0Var.f93983v;
                    if ((i23 & Integer.MIN_VALUE) != 0) {
                        p0Var.f93983v = i23 - Integer.MIN_VALUE;
                    } else {
                        p0Var = new p0(this, continuation);
                    }
                }
                Object objInvoke2 = p0Var.f93982u;
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i24 = p0Var.f93983v;
                if (i24 == 0) {
                    ResultKt.b(objInvoke2);
                    p0Var.f93981t = this;
                    p0Var.f93985x = obj3;
                    p0Var.f93983v = 1;
                    objInvoke2 = ((z4) obj4).invoke(obj3, p0Var);
                    if (objInvoke2 == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                    pVar = this;
                } else {
                    if (i24 != 1) {
                        if (i24 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        pVar2 = p0Var.f93981t;
                        ResultKt.b(objInvoke2);
                        pVar = pVar2;
                        z = true;
                        if (z) {
                            throw new AbortFlowException(pVar);
                        }
                        return Unit.f71706a;
                    }
                    obj3 = p0Var.f93985x;
                    pVar = p0Var.f93981t;
                    ResultKt.b(objInvoke2);
                }
                if (((Boolean) objInvoke2).booleanValue()) {
                    w70.n nVar6 = (w70.n) pVar.f15625c;
                    p0Var.f93981t = pVar;
                    p0Var.f93985x = null;
                    p0Var.f93983v = 2;
                    if (nVar6.emit(obj3, p0Var) == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                    pVar2 = pVar;
                    pVar = pVar2;
                    z = true;
                }
                if (z) {
                }
            case 17:
                if (continuation instanceof y0) {
                    y0Var = (y0) continuation;
                    int i25 = y0Var.f94083v;
                    if ((i25 & Integer.MIN_VALUE) != 0) {
                        y0Var.f94083v = i25 - Integer.MIN_VALUE;
                    } else {
                        y0Var = new y0(this, continuation);
                    }
                }
                Object objInvoke3 = y0Var.f94082u;
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i26 = y0Var.f94083v;
                if (i26 == 0) {
                    ResultKt.b(objInvoke3);
                    y0Var.f94081t = this;
                    y0Var.f94085x = obj3;
                    y0Var.f94083v = 1;
                    objInvoke3 = ((Function2) obj4).invoke(obj3, y0Var);
                    if (objInvoke3 == coroutineSingletons7) {
                        return coroutineSingletons7;
                    }
                    pVar3 = this;
                } else {
                    if (i26 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    obj3 = y0Var.f94085x;
                    pVar3 = y0Var.f94081t;
                    ResultKt.b(objInvoke3);
                }
                if (!((Boolean) objInvoke3).booleanValue()) {
                    return Unit.f71706a;
                }
                ((Ref.ObjectRef) pVar3.f15625c).f71863a = obj3;
                throw new AbortFlowException(pVar3);
            default:
                if (continuation instanceof g1) {
                    g1Var = (g1) continuation;
                    int i27 = g1Var.f93907u;
                    if ((i27 & Integer.MIN_VALUE) != 0) {
                        g1Var.f93907u = i27 - Integer.MIN_VALUE;
                    } else {
                        g1Var = new g1(this, continuation);
                    }
                }
                Object obj10 = g1Var.f93906t;
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                int i28 = g1Var.f93907u;
                if (i28 == 0) {
                    ResultKt.b(obj10);
                    nVar3 = (w70.n) obj4;
                    g1Var.f93909w = obj3;
                    g1Var.f93910x = nVar3;
                    g1Var.f93907u = 1;
                    if (r102.invoke(obj3, g1Var) == coroutineSingletons8) {
                        return coroutineSingletons8;
                    }
                } else {
                    if (i28 != 1) {
                        if (i28 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj10);
                        return Unit.f71706a;
                    }
                    w70.n nVar7 = g1Var.f93910x;
                    Object obj11 = g1Var.f93909w;
                    ResultKt.b(obj10);
                    nVar3 = nVar7;
                    obj3 = obj11;
                }
                g1Var.f93909w = null;
                g1Var.f93910x = null;
                g1Var.f93907u = 2;
                if (nVar3.emit(obj3, g1Var) == coroutineSingletons8) {
                    return coroutineSingletons8;
                }
                return Unit.f71706a;
        }
    }
}
