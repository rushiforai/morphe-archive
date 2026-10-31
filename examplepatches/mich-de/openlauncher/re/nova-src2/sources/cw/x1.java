package cw;

import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes4.dex */
public final class x1 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48372a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w70.n f48373b;

    public /* synthetic */ x1(w70.n nVar, int i5) {
        this.f48372a = i5;
        this.f48373b = nVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(w70.m mVar, Continuation continuation) {
        w70.r0 r0Var;
        if (continuation instanceof w70.r0) {
            r0Var = (w70.r0) continuation;
            int i5 = r0Var.f93998v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r0Var.f93998v = i5 - Integer.MIN_VALUE;
            } else {
                r0Var = new w70.r0(this, continuation);
            }
        }
        Object obj = r0Var.f93996t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r0Var.f93998v;
        if (i11 == 0) {
            ResultKt.b(obj);
            r0Var.f93998v = 1;
            if (w70.u1.m(r0Var, mVar, this.f48373b) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:119:0x0207  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0271  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x02b5  */
    /* JADX WARN: Removed duplicated region for block: B:189:0x030d  */
    /* JADX WARN: Removed duplicated region for block: B:227:0x03ba  */
    /* JADX WARN: Removed duplicated region for block: B:250:0x041b  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x046b  */
    /* JADX WARN: Removed duplicated region for block: B:288:0x04b6  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:316:0x0513  */
    /* JADX WARN: Removed duplicated region for block: B:335:0x055c  */
    /* JADX WARN: Removed duplicated region for block: B:358:0x05af  */
    /* JADX WARN: Removed duplicated region for block: B:375:0x05fa  */
    /* JADX WARN: Removed duplicated region for block: B:394:0x063e  */
    /* JADX WARN: Removed duplicated region for block: B:411:0x0686  */
    /* JADX WARN: Removed duplicated region for block: B:428:0x06ca  */
    /* JADX WARN: Removed duplicated region for block: B:445:0x0711  */
    /* JADX WARN: Removed duplicated region for block: B:472:0x076d  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:489:0x07b3  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00f2  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) throws Throwable {
        w1 w1Var;
        z1 z1Var;
        dv.t tVar;
        dv.m mVar;
        e20.h0 h0Var;
        gx.k kVar;
        gx.a0 a0Var;
        hq.o oVar;
        hq.q qVar;
        hv.g0 g0Var;
        jv.p pVar;
        kw.f1 f1Var;
        pw.a aVar;
        m00.d0 d0Var;
        m00.h0 h0Var2;
        mx.y0 y0Var;
        n8.j jVar;
        y8.f fVar;
        p10.r rVar;
        px.b bVar;
        t5.p pVar2;
        uu.d dVar;
        uu.e eVar;
        vs.m mVar2;
        w70.e eVar2;
        w70.f1 f1Var2;
        switch (this.f48372a) {
            case 0:
                if (continuation instanceof w1) {
                    w1Var = (w1) continuation;
                    int i5 = w1Var.f48360u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        w1Var.f48360u = i5 - Integer.MIN_VALUE;
                    } else {
                        w1Var = new w1(this, continuation);
                    }
                }
                Object obj2 = w1Var.f48359t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = w1Var.f48360u;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    if (obj instanceof hq.c) {
                        w1Var.f48360u = 1;
                        if (this.f48373b.emit(obj, w1Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            case 1:
                if (continuation instanceof z1) {
                    z1Var = (z1) continuation;
                    int i12 = z1Var.f48398u;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        z1Var.f48398u = i12 - Integer.MIN_VALUE;
                    } else {
                        z1Var = new z1(this, continuation);
                    }
                }
                Object obj3 = z1Var.f48397t;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = z1Var.f48398u;
                if (i13 == 0) {
                    ResultKt.b(obj3);
                    List listA = ((hq.d) obj).a();
                    z1Var.f48398u = 1;
                    if (this.f48373b.emit(listA, z1Var) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
            case 2:
                if (continuation instanceof dv.t) {
                    tVar = (dv.t) continuation;
                    int i14 = tVar.f49645u;
                    if ((i14 & Integer.MIN_VALUE) != 0) {
                        tVar.f49645u = i14 - Integer.MIN_VALUE;
                    } else {
                        tVar = new dv.t(this, continuation);
                    }
                }
                Object obj4 = tVar.f49644t;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i15 = tVar.f49645u;
                if (i15 == 0) {
                    ResultKt.b(obj4);
                    StripeIntent.Status status = (StripeIntent.Status) obj;
                    if (status != null) {
                        switch (status.ordinal()) {
                            case 0:
                            case 1:
                            case 3:
                            case 4:
                            case 6:
                                mVar = dv.m.f49618c;
                                break;
                            case 2:
                                mVar = dv.m.f49616a;
                                break;
                            case 5:
                                mVar = dv.m.f49617b;
                                break;
                            default:
                                throw new NoWhenBranchMatchedException();
                        }
                    } else {
                        mVar = dv.m.f49616a;
                    }
                    tVar.f49645u = 1;
                    if (this.f48373b.emit(mVar, tVar) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj4);
                }
                return Unit.f71706a;
            case 3:
                if (continuation instanceof e20.h0) {
                    h0Var = (e20.h0) continuation;
                    int i16 = h0Var.f52028u;
                    if ((i16 & Integer.MIN_VALUE) != 0) {
                        h0Var.f52028u = i16 - Integer.MIN_VALUE;
                    } else {
                        h0Var = new e20.h0(this, continuation);
                    }
                }
                Object obj5 = h0Var.f52027t;
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i17 = h0Var.f52028u;
                if (i17 == 0) {
                    ResultKt.b(obj5);
                    e20.b0 b0Var = new e20.b0((jx.a) obj);
                    h0Var.f52028u = 1;
                    if (this.f48373b.emit(b0Var, h0Var) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj5);
                }
                return Unit.f71706a;
            case 4:
                if (continuation instanceof gx.k) {
                    kVar = (gx.k) continuation;
                    int i18 = kVar.f58104u;
                    if ((i18 & Integer.MIN_VALUE) != 0) {
                        kVar.f58104u = i18 - Integer.MIN_VALUE;
                    } else {
                        kVar = new gx.k(this, continuation);
                    }
                }
                Object obj6 = kVar.f58103t;
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i19 = kVar.f58104u;
                if (i19 == 0) {
                    ResultKt.b(obj6);
                    dx.j0 j0Var = ((dx.h) obj).f49706b;
                    kVar.f58104u = 1;
                    if (this.f48373b.emit(j0Var, kVar) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i19 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj6);
                }
                return Unit.f71706a;
            case 5:
                if (continuation instanceof gx.a0) {
                    a0Var = (gx.a0) continuation;
                    int i21 = a0Var.f58017u;
                    if ((i21 & Integer.MIN_VALUE) != 0) {
                        a0Var.f58017u = i21 - Integer.MIN_VALUE;
                    } else {
                        a0Var = new gx.a0(this, continuation);
                    }
                }
                Object obj7 = a0Var.f58016t;
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                int i22 = a0Var.f58017u;
                if (i22 == 0) {
                    ResultKt.b(obj7);
                    dx.h hVarA = dx.h.a((dx.h) obj, dx.h0.f49708a);
                    a0Var.f58017u = 1;
                    if (this.f48373b.emit(hVarA, a0Var) == coroutineSingletons6) {
                        return coroutineSingletons6;
                    }
                } else {
                    if (i22 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj7);
                }
                return Unit.f71706a;
            case 6:
                if (continuation instanceof hq.o) {
                    oVar = (hq.o) continuation;
                    int i23 = oVar.f59991u;
                    if ((i23 & Integer.MIN_VALUE) != 0) {
                        oVar.f59991u = i23 - Integer.MIN_VALUE;
                    } else {
                        oVar = new hq.o(this, continuation);
                    }
                }
                Object obj8 = oVar.f59990t;
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i24 = oVar.f59991u;
                if (i24 == 0) {
                    ResultKt.b(obj8);
                    if (obj instanceof hq.c) {
                        oVar.f59991u = 1;
                        if (this.f48373b.emit(obj, oVar) == coroutineSingletons7) {
                            return coroutineSingletons7;
                        }
                    }
                } else {
                    if (i24 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj8);
                }
                return Unit.f71706a;
            case 7:
                if (continuation instanceof hq.q) {
                    qVar = (hq.q) continuation;
                    int i25 = qVar.f59996u;
                    if ((i25 & Integer.MIN_VALUE) != 0) {
                        qVar.f59996u = i25 - Integer.MIN_VALUE;
                    } else {
                        qVar = new hq.q(this, continuation);
                    }
                }
                Object obj9 = qVar.f59995t;
                CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                int i26 = qVar.f59996u;
                if (i26 == 0) {
                    ResultKt.b(obj9);
                    hq.c cVar = (hq.c) obj;
                    hq.a aVar2 = new hq.a(cVar.f59960a, cVar.f59961b);
                    qVar.f59996u = 1;
                    if (this.f48373b.emit(aVar2, qVar) == coroutineSingletons8) {
                        return coroutineSingletons8;
                    }
                } else {
                    if (i26 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj9);
                }
                return Unit.f71706a;
            case 8:
                if (continuation instanceof hv.g0) {
                    g0Var = (hv.g0) continuation;
                    int i27 = g0Var.f60267u;
                    if ((i27 & Integer.MIN_VALUE) != 0) {
                        g0Var.f60267u = i27 - Integer.MIN_VALUE;
                    } else {
                        g0Var = new hv.g0(this, continuation);
                    }
                }
                Object obj10 = g0Var.f60266t;
                CoroutineSingletons coroutineSingletons9 = CoroutineSingletons.f71806a;
                int i28 = g0Var.f60267u;
                if (i28 == 0) {
                    ResultKt.b(obj10);
                    PaymentSelection paymentSelection = (PaymentSelection) obj;
                    if ((paymentSelection instanceof PaymentSelection.Saved) || (paymentSelection instanceof PaymentSelection.Link) || Intrinsics.b(paymentSelection, PaymentSelection.GooglePay.f44810a)) {
                        g0Var.f60267u = 1;
                        if (this.f48373b.emit(obj, g0Var) == coroutineSingletons9) {
                            return coroutineSingletons9;
                        }
                    }
                } else {
                    if (i28 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj10);
                }
                return Unit.f71706a;
            case 9:
                if (continuation instanceof jv.p) {
                    pVar = (jv.p) continuation;
                    int i29 = pVar.f70117u;
                    if ((i29 & Integer.MIN_VALUE) != 0) {
                        pVar.f70117u = i29 - Integer.MIN_VALUE;
                    } else {
                        pVar = new jv.p(this, continuation);
                    }
                }
                Object obj11 = pVar.f70116t;
                CoroutineSingletons coroutineSingletons10 = CoroutineSingletons.f71806a;
                int i31 = pVar.f70117u;
                if (i31 == 0) {
                    ResultKt.b(obj11);
                    if (((Boolean) obj).booleanValue()) {
                        pVar.f70117u = 1;
                        if (this.f48373b.emit(obj, pVar) == coroutineSingletons10) {
                            return coroutineSingletons10;
                        }
                    }
                } else {
                    if (i31 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj11);
                }
                return Unit.f71706a;
            case 10:
                if (continuation instanceof kw.f1) {
                    f1Var = (kw.f1) continuation;
                    int i32 = f1Var.f72365u;
                    if ((i32 & Integer.MIN_VALUE) != 0) {
                        f1Var.f72365u = i32 - Integer.MIN_VALUE;
                    } else {
                        f1Var = new kw.f1(this, continuation);
                    }
                }
                Object obj12 = f1Var.f72364t;
                CoroutineSingletons coroutineSingletons11 = CoroutineSingletons.f71806a;
                int i33 = f1Var.f72365u;
                if (i33 == 0) {
                    ResultKt.b(obj12);
                    Pair pair = (Pair) b70.g.Y0((List) obj);
                    String str = null;
                    if (pair != null && (aVar = (pw.a) pair.f71684b) != null) {
                        if (!aVar.f83106b) {
                            aVar = null;
                        }
                        if (aVar != null) {
                            str = aVar.f83105a;
                        }
                    }
                    if (str != null) {
                        f1Var.f72365u = 1;
                        if (this.f48373b.emit(str, f1Var) == coroutineSingletons11) {
                            return coroutineSingletons11;
                        }
                    }
                } else {
                    if (i33 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj12);
                }
                return Unit.f71706a;
            case 11:
                if (continuation instanceof m00.d0) {
                    d0Var = (m00.d0) continuation;
                    int i34 = d0Var.f75533u;
                    if ((i34 & Integer.MIN_VALUE) != 0) {
                        d0Var.f75533u = i34 - Integer.MIN_VALUE;
                    } else {
                        d0Var = new m00.d0(this, continuation);
                    }
                }
                Object obj13 = d0Var.f75532t;
                CoroutineSingletons coroutineSingletons12 = CoroutineSingletons.f71806a;
                int i35 = d0Var.f75533u;
                if (i35 == 0) {
                    ResultKt.b(obj13);
                    Integer num = new Integer(((List) obj).size());
                    d0Var.f75533u = 1;
                    if (this.f48373b.emit(num, d0Var) == coroutineSingletons12) {
                        return coroutineSingletons12;
                    }
                } else {
                    if (i35 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj13);
                }
                return Unit.f71706a;
            case 12:
                if (continuation instanceof m00.h0) {
                    h0Var2 = (m00.h0) continuation;
                    int i36 = h0Var2.f75558u;
                    if ((i36 & Integer.MIN_VALUE) != 0) {
                        h0Var2.f75558u = i36 - Integer.MIN_VALUE;
                    } else {
                        h0Var2 = new m00.h0(this, continuation);
                    }
                }
                Object obj14 = h0Var2.f75557t;
                CoroutineSingletons coroutineSingletons13 = CoroutineSingletons.f71806a;
                int i37 = h0Var2.f75558u;
                if (i37 == 0) {
                    ResultKt.b(obj14);
                    Boolean boolValueOf = Boolean.valueOf(((List) obj).size() < 6);
                    h0Var2.f75558u = 1;
                    if (this.f48373b.emit(boolValueOf, h0Var2) == coroutineSingletons13) {
                        return coroutineSingletons13;
                    }
                } else {
                    if (i37 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj14);
                }
                return Unit.f71706a;
            case 13:
                if (continuation instanceof mx.y0) {
                    y0Var = (mx.y0) continuation;
                    int i38 = y0Var.f77277u;
                    if ((i38 & Integer.MIN_VALUE) != 0) {
                        y0Var.f77277u = i38 - Integer.MIN_VALUE;
                    } else {
                        y0Var = new mx.y0(this, continuation);
                    }
                }
                Object obj15 = y0Var.f77276t;
                CoroutineSingletons coroutineSingletons14 = CoroutineSingletons.f71806a;
                int i39 = y0Var.f77277u;
                if (i39 == 0) {
                    ResultKt.b(obj15);
                    ArrayList arrayList = new ArrayList();
                    Iterator it = ((List) obj).iterator();
                    while (it.hasNext()) {
                        y30.b bVar2 = ((uy.q) it.next()).f91752d;
                        if (bVar2 != null) {
                            arrayList.add(bVar2);
                        }
                    }
                    y0Var.f77277u = 1;
                    if (this.f48373b.emit(arrayList, y0Var) == coroutineSingletons14) {
                        return coroutineSingletons14;
                    }
                } else {
                    if (i39 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj15);
                }
                return Unit.f71706a;
            case 14:
                if (continuation instanceof n8.j) {
                    jVar = (n8.j) continuation;
                    int i40 = jVar.f77986u;
                    if ((i40 & Integer.MIN_VALUE) != 0) {
                        jVar.f77986u = i40 - Integer.MIN_VALUE;
                    } else {
                        jVar = new n8.j(this, continuation);
                    }
                }
                Object obj16 = jVar.f77985t;
                CoroutineSingletons coroutineSingletons15 = CoroutineSingletons.f71806a;
                int i41 = jVar.f77986u;
                if (i41 == 0) {
                    ResultKt.b(obj16);
                    long j11 = ((h2.e) obj).f59030a;
                    if (j11 == 9205357640488583168L) {
                        fVar = y8.f.f96844c;
                    } else if (h2.e.d(j11) < 0.5d || h2.e.b(j11) < 0.5d) {
                        fVar = null;
                    } else {
                        float fD = h2.e.d(j11);
                        boolean zIsInfinite = Float.isInfinite(fD);
                        v4.a aVar3 = y8.b.f96840d;
                        v4.a aVar4 = (zIsInfinite || Float.isNaN(fD)) ? aVar3 : new y8.a(MathKt.b(h2.e.d(j11)));
                        float fB = h2.e.b(j11);
                        if (!Float.isInfinite(fB) && !Float.isNaN(fB)) {
                            aVar3 = new y8.a(MathKt.b(h2.e.b(j11)));
                        }
                        fVar = new y8.f(aVar4, aVar3);
                    }
                    if (fVar != null) {
                        jVar.f77986u = 1;
                        if (this.f48373b.emit(fVar, jVar) == coroutineSingletons15) {
                            return coroutineSingletons15;
                        }
                    }
                } else {
                    if (i41 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj16);
                }
                return Unit.f71706a;
            case 15:
                if (continuation instanceof p10.r) {
                    rVar = (p10.r) continuation;
                    int i42 = rVar.f81883u;
                    if ((i42 & Integer.MIN_VALUE) != 0) {
                        rVar.f81883u = i42 - Integer.MIN_VALUE;
                    } else {
                        rVar = new p10.r(this, continuation);
                    }
                }
                Object obj17 = rVar.f81882t;
                CoroutineSingletons coroutineSingletons16 = CoroutineSingletons.f71806a;
                int i43 = rVar.f81883u;
                if (i43 == 0) {
                    ResultKt.b(obj17);
                    Long l9 = (Long) ((y5.b) obj).b(p10.s.f81891d);
                    Long l11 = new Long(l9 != null ? l9.longValue() : 0L);
                    rVar.f81883u = 1;
                    if (this.f48373b.emit(l11, rVar) == coroutineSingletons16) {
                        return coroutineSingletons16;
                    }
                } else {
                    if (i43 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj17);
                }
                return Unit.f71706a;
            case 16:
                if (continuation instanceof px.b) {
                    bVar = (px.b) continuation;
                    int i44 = bVar.f83108u;
                    if ((i44 & Integer.MIN_VALUE) != 0) {
                        bVar.f83108u = i44 - Integer.MIN_VALUE;
                    } else {
                        bVar = new px.b(this, continuation);
                    }
                }
                Object obj18 = bVar.f83107t;
                CoroutineSingletons coroutineSingletons17 = CoroutineSingletons.f71806a;
                int i45 = bVar.f83108u;
                if (i45 == 0) {
                    ResultKt.b(obj18);
                    Unit unit = Unit.f71706a;
                    bVar.f83108u = 1;
                    if (this.f48373b.emit(unit, bVar) == coroutineSingletons17) {
                        return coroutineSingletons17;
                    }
                } else {
                    if (i45 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj18);
                }
                return Unit.f71706a;
            case 17:
                if (continuation instanceof t5.p) {
                    pVar2 = (t5.p) continuation;
                    int i46 = pVar2.f88664u;
                    if ((i46 & Integer.MIN_VALUE) != 0) {
                        pVar2.f88664u = i46 - Integer.MIN_VALUE;
                    } else {
                        pVar2 = new t5.p(this, continuation);
                    }
                }
                Object obj19 = pVar2.f88663t;
                CoroutineSingletons coroutineSingletons18 = CoroutineSingletons.f71806a;
                int i47 = pVar2.f88664u;
                if (i47 == 0) {
                    ResultKt.b(obj19);
                    t5.i1 i1Var = (t5.i1) obj;
                    if (i1Var instanceof t5.z0) {
                        throw ((t5.z0) i1Var).f88757b;
                    }
                    if (!(i1Var instanceof t5.c)) {
                        if (i1Var instanceof t5.n0 ? true : i1Var instanceof t5.l1) {
                            throw new IllegalStateException("This is a bug in DataStore. Please file a bug at: https://issuetracker.google.com/issues/new?component=907884&template=1466542");
                        }
                        throw new NoWhenBranchMatchedException();
                    }
                    Object obj20 = ((t5.c) i1Var).f88541b;
                    pVar2.f88664u = 1;
                    if (this.f48373b.emit(obj20, pVar2) == coroutineSingletons18) {
                        return coroutineSingletons18;
                    }
                } else {
                    if (i47 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj19);
                }
                return Unit.f71706a;
            case 18:
                if (continuation instanceof uu.d) {
                    dVar = (uu.d) continuation;
                    int i48 = dVar.f91552u;
                    if ((i48 & Integer.MIN_VALUE) != 0) {
                        dVar.f91552u = i48 - Integer.MIN_VALUE;
                    } else {
                        dVar = new uu.d(this, continuation);
                    }
                }
                Object obj21 = dVar.f91551t;
                CoroutineSingletons coroutineSingletons19 = CoroutineSingletons.f71806a;
                int i49 = dVar.f91552u;
                if (i49 == 0) {
                    ResultKt.b(obj21);
                    ArrayList arrayList2 = new ArrayList();
                    for (Object obj22 : (List) obj) {
                        Object obj23 = ((Pair) obj22).f71683a;
                        IdentifierSpec.Companion.getClass();
                        if (Intrinsics.b(obj23, IdentifierSpec.f45380w)) {
                            arrayList2.add(obj22);
                        }
                    }
                    ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList2, 10));
                    Iterator it2 = arrayList2.iterator();
                    while (it2.hasNext()) {
                        arrayList3.add(Boolean.valueOf(Boolean.parseBoolean(((pw.a) ((Pair) it2.next()).f71684b).f83105a)));
                    }
                    ArrayList arrayList4 = new ArrayList(b70.c.u0(arrayList3, 10));
                    Iterator it3 = arrayList3.iterator();
                    while (it3.hasNext()) {
                        arrayList4.add(((Boolean) it3.next()).booleanValue() ? wu.c.f94689b : wu.c.f94690c);
                    }
                    wu.c cVar2 = (wu.c) b70.g.Y0(arrayList4);
                    if (cVar2 == null) {
                        cVar2 = wu.c.f94691d;
                    }
                    dVar.f91552u = 1;
                    if (this.f48373b.emit(cVar2, dVar) == coroutineSingletons19) {
                        return coroutineSingletons19;
                    }
                } else {
                    if (i49 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj21);
                }
                return Unit.f71706a;
            case 19:
                if (continuation instanceof uu.e) {
                    eVar = (uu.e) continuation;
                    int i51 = eVar.f91555u;
                    if ((i51 & Integer.MIN_VALUE) != 0) {
                        eVar.f91555u = i51 - Integer.MIN_VALUE;
                    } else {
                        eVar = new uu.e(this, continuation);
                    }
                }
                Object obj24 = eVar.f91554t;
                CoroutineSingletons coroutineSingletons20 = CoroutineSingletons.f71806a;
                int i52 = eVar.f91555u;
                if (i52 == 0) {
                    ResultKt.b(obj24);
                    Map mapR0 = MapsKt.r0((List) obj);
                    eVar.f91555u = 1;
                    if (this.f48373b.emit(mapR0, eVar) == coroutineSingletons20) {
                        return coroutineSingletons20;
                    }
                } else {
                    if (i52 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj24);
                }
                return Unit.f71706a;
            case 20:
                if (continuation instanceof vs.m) {
                    mVar2 = (vs.m) continuation;
                    int i53 = mVar2.f92981u;
                    if ((i53 & Integer.MIN_VALUE) != 0) {
                        mVar2.f92981u = i53 - Integer.MIN_VALUE;
                    } else {
                        mVar2 = new vs.m(this, continuation);
                    }
                }
                Object obj25 = mVar2.f92980t;
                CoroutineSingletons coroutineSingletons21 = CoroutineSingletons.f71806a;
                int i54 = mVar2.f92981u;
                if (i54 == 0) {
                    ResultKt.b(obj25);
                    Boolean boolValueOf2 = Boolean.valueOf(((kw.e3) obj).isValid());
                    mVar2.f92981u = 1;
                    if (this.f48373b.emit(boolValueOf2, mVar2) == coroutineSingletons21) {
                        return coroutineSingletons21;
                    }
                } else {
                    if (i54 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj25);
                }
                return Unit.f71706a;
            case 21:
                if (continuation instanceof w70.e) {
                    eVar2 = (w70.e) continuation;
                    int i55 = eVar2.f93886v;
                    if ((i55 & Integer.MIN_VALUE) != 0) {
                        eVar2.f93886v = i55 - Integer.MIN_VALUE;
                    } else {
                        eVar2 = new w70.e(this, continuation);
                    }
                }
                Object obj26 = eVar2.f93884t;
                CoroutineSingletons coroutineSingletons22 = CoroutineSingletons.f71806a;
                int i56 = eVar2.f93886v;
                if (i56 == 0) {
                    ResultKt.b(obj26);
                    t70.m0.k(eVar2.getContext());
                    eVar2.f93886v = 1;
                    if (this.f48373b.emit(obj, eVar2) == coroutineSingletons22) {
                        return coroutineSingletons22;
                    }
                } else {
                    if (i56 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj26);
                }
                return Unit.f71706a;
            case 22:
                return a((w70.m) obj, continuation);
            default:
                if (continuation instanceof w70.f1) {
                    f1Var2 = (w70.f1) continuation;
                    int i57 = f1Var2.f93897u;
                    if ((i57 & Integer.MIN_VALUE) != 0) {
                        f1Var2.f93897u = i57 - Integer.MIN_VALUE;
                    } else {
                        f1Var2 = new w70.f1(this, continuation);
                    }
                }
                Object obj27 = f1Var2.f93896t;
                CoroutineSingletons coroutineSingletons23 = CoroutineSingletons.f71806a;
                int i58 = f1Var2.f93897u;
                if (i58 == 0) {
                    ResultKt.b(obj27);
                    if (obj != null) {
                        f1Var2.f93897u = 1;
                        if (this.f48373b.emit(obj, f1Var2) == coroutineSingletons23) {
                            return coroutineSingletons23;
                        }
                    }
                } else {
                    if (i58 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj27);
                }
                return Unit.f71706a;
        }
    }
}
