package pu;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import c3.m3;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.stripe.android.core.model.Country;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import com.stripe.android.model.AndroidVerificationObject;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.model.RadarOptions;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionContract;
import com.stripe.android.view.CountryTextInputLayout;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.v3;
import h6.c1;
import h6.g1;
import i2.s0;
import java.util.ArrayList;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.reflect.KProperty;
import kotlin.time.Duration;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.json.Json;
import p1.e1;
import p1.o2;
import p1.s2;
import p1.y2;
import p6.a1;
import p6.o0;
import r10.p0;
import t0.d1;
import t0.t0;
import t0.x1;
import t0.y1;
import vt.q0;
import z2.h1;
import z2.i1;

/* loaded from: classes4.dex */
public final /* synthetic */ class f0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83034a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f83035b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f83036c;

    public /* synthetic */ f0(int i5, Object obj, Object obj2) {
        this.f83034a = i5;
        this.f83035b = obj;
        this.f83036c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0295  */
    /* JADX WARN: Type inference failed for: r7v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r7v14 */
    /* JADX WARN: Type inference failed for: r7v16 */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        m3.m0 m0VarB;
        m3.m0 m0VarB2;
        m3.m0 m0VarB3;
        m3.l0 l0Var;
        i2.h hVarH;
        m3.k0 k0Var;
        Object objA;
        int i5 = this.f83034a;
        int i11 = 2;
        int i12 = 3;
        m3.g0 g0VarC = 0;
        g0VarC = 0;
        int i13 = 0;
        Object obj2 = this.f83036c;
        Object obj3 = this.f83035b;
        switch (i5) {
            case 0:
                ((Boolean) obj).getClass();
                c1.B(!((Boolean) ((y2) obj2).getValue()).booleanValue(), ((com.stripe.android.paymentsheet.addresselement.k0) obj3).o, null);
                return Unit.f71706a;
            case 1:
                View viewInflate = LayoutInflater.from((Context) obj).inflate(2131624043, (ViewGroup) null);
                Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaBubbleTextView");
                DoubleShadowBubbleTextView doubleShadowBubbleTextView = (DoubleShadowBubbleTextView) viewInflate;
                doubleShadowBubbleTextView.r((mx.f) obj3);
                doubleShadowBubbleTextView.setText((String) obj2);
                doubleShadowBubbleTextView.B = false;
                return doubleShadowBubbleTextView;
            case 2:
                Bitmap bitmap = (Bitmap) obj2;
                DoubleShadowBubbleTextView doubleShadowBubbleTextView2 = (DoubleShadowBubbleTextView) obj;
                doubleShadowBubbleTextView2.r((mx.f) obj3);
                aa.n nVar = new aa.n(bitmap, 0, false);
                nVar.setBounds(0, 0, bitmap.getWidth(), bitmap.getHeight());
                doubleShadowBubbleTextView2.t(nVar);
                return Unit.f71706a;
            case 3:
                ConfirmationHandler$Args confirmationHandler$Args = (ConfirmationHandler$Args) obj2;
                cv.j recollectionData = (cv.j) obj;
                Intrinsics.g(recollectionData, "recollectionData");
                PaymentSheet$Appearance appearance = confirmationHandler$Args.f44129b.F;
                boolean f43769g = confirmationHandler$Args.f44130c.getF43545m();
                Intrinsics.g(appearance, "appearance");
                j.c cVar = ((com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.h) ((cv.k) obj3)).f44933a;
                String str = recollectionData.f48012a;
                if (str == null) {
                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                cVar.a(new CvcRecollectionContract.Args(str, recollectionData.f48013b, appearance, !f43769g), null);
                return Unit.f71706a;
            case 4:
                View view = (View) obj3;
                p1.l0 DisposableEffect = (p1.l0) obj;
                Intrinsics.g(DisposableEffect, "$this$DisposableEffect");
                io.sentry.android.core.internal.util.h hVar = new io.sentry.android.core.internal.util.h(view, (e1) obj2);
                view.getViewTreeObserver().addOnGlobalLayoutListener(hVar);
                return new b00.g0(15, view, hVar);
            case 5:
                rw.c cVar2 = (rw.c) obj3;
                p6.l0 l0Var2 = (p6.l0) obj2;
                o0 o0Var = (o0) obj;
                o0Var.f82220b = cVar2.f86454c;
                rw.g gVar = cVar2.f86453b;
                if (gVar != null) {
                    if (!gVar.equals(rw.g.f86458a)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    o0Var.f82222d = l0Var2.h().f82157f;
                    o0Var.f82223e = false;
                    Unit unit = Unit.f71706a;
                    o0Var.f82223e = true;
                    o0Var.f82224f = false;
                }
                return Unit.f71706a;
            case 6:
                Function0 function0 = (Function0) obj3;
                q00.l lVar = (q00.l) obj2;
                NamedIntent namedIntent = (NamedIntent) obj;
                if (namedIntent != null) {
                    lVar.setValue(namedIntent);
                    if (function0 != null) {
                        function0.invoke();
                    }
                }
                return Unit.f71706a;
            case 7:
                String str2 = (String) obj3;
                sr.l lVar2 = (sr.l) obj2;
                FinancialConnectionsSheetActivityArgs financialConnectionsSheetActivityArgs = lVar2.f87726d;
                t70.c0 c0Var = lVar2.f87725c;
                sr.b state = (sr.b) obj;
                Intrinsics.g(state, "state");
                if (r70.k.K0(str2, state.f87698a, false)) {
                    int iOrdinal = a1.f(financialConnectionsSheetActivityArgs).ordinal();
                    if (iOrdinal == 0) {
                        t70.m0.t(g1.f(lVar2), c0Var, null, new sr.i(lVar2, false, null), 2);
                    } else if (iOrdinal == 1) {
                        t70.m0.t(g1.f(lVar2), null, null, new sr.j(str2, null, lVar2), 3);
                    } else {
                        if (iOrdinal != 2) {
                            throw new NoWhenBranchMatchedException();
                        }
                        t70.m0.t(g1.f(lVar2), c0Var, null, new sr.k(lVar2, false, null), 2);
                    }
                } else if (r70.k.K0(str2, state.f87699b, false)) {
                    int iOrdinal2 = a1.f(financialConnectionsSheetActivityArgs).ordinal();
                    if (iOrdinal2 == 0) {
                        t70.m0.t(g1.f(lVar2), c0Var, null, new sr.i(lVar2, true, null), 2);
                    } else if (iOrdinal2 == 1) {
                        t70.m0.t(g1.f(lVar2), null, null, new sr.h(lVar2, null), 3);
                    } else {
                        if (iOrdinal2 != 2) {
                            throw new NoWhenBranchMatchedException();
                        }
                        t70.m0.t(g1.f(lVar2), c0Var, null, new sr.k(lVar2, true, null), 2);
                    }
                } else {
                    t70.m0.t(g1.f(lVar2), null, null, new q(lVar2, str2, g0VarC, 21), 3);
                }
                return Unit.f71706a;
            case 8:
                Function1 function1 = (Function1) obj2;
                r3.z zVar = (r3.z) obj;
                if (!Intrinsics.b((r3.z) obj3, zVar)) {
                    function1.invoke(zVar);
                }
                return Unit.f71706a;
            case 9:
                h1 h1Var = (h1) obj;
                ArrayList arrayListO = t0.o((List) obj3, (Function0) ((k0.n0) obj2).f70684b);
                if (arrayListO != null) {
                    int size = arrayListO.size();
                    while (i13 < size) {
                        Pair pair = (Pair) arrayListO.get(i13);
                        i1 i1Var = (i1) pair.f71683a;
                        Function0 function02 = (Function0) pair.f71684b;
                        h1.k(h1Var, i1Var, function02 != null ? ((y3.k) function02.invoke()).f96605a : 0L);
                        i13++;
                    }
                }
                return Unit.f71706a;
            case 10:
                m3.e eVar = (m3.e) obj3;
                o2 o2Var = ((t0.a1) obj2).f87900b;
                d1 d1Var = (d1) obj;
                m3.n nVar2 = (m3.n) eVar.f75852a;
                m3.m0 m0VarB4 = nVar2.b();
                m3.g0 g0Var = m0VarB4 != null ? m0VarB4.f75936a : null;
                m3.g0 g0VarC2 = ((o2Var.m() & 1) == 0 || (m0VarB3 = nVar2.b()) == null) ? null : m0VarB3.f75937b;
                if (g0Var != null) {
                    g0VarC2 = g0Var.c(g0VarC2);
                }
                m3.g0 g0VarC3 = ((o2Var.m() & 2) == 0 || (m0VarB2 = nVar2.b()) == null) ? null : m0VarB2.f75938c;
                if (g0VarC2 != null) {
                    g0VarC3 = g0VarC2.c(g0VarC3);
                }
                if ((o2Var.m() & 4) != 0 && (m0VarB = nVar2.b()) != null) {
                    g0VarC = m0VarB.f75939d;
                }
                if (g0VarC3 != null) {
                    g0VarC = g0VarC3.c(g0VarC);
                }
                d1Var.getClass();
                Ref.BooleanRef booleanRef = new Ref.BooleanRef();
                m3.g gVar2 = d1Var.f87962a;
                n00.u uVar = new n00.u(5, booleanRef, eVar, g0VarC);
                gVar2.getClass();
                m3.d dVar = new m3.d(gVar2);
                dVar.d(uVar);
                d1Var.f87963b = dVar.i();
                return Unit.f71706a;
            case 11:
                y1 y1Var = (y1) obj3;
                m3.e eVar2 = (m3.e) obj2;
                i2.a0 a0Var = (i2.a0) obj;
                m3.g gVar3 = y1Var.f88304b;
                e1 e1Var = y1Var.f88303a;
                m3.l0 l0Var3 = (m3.l0) ((s2) e1Var).getValue();
                if (Intrinsics.b(gVar3, (l0Var3 == null || (k0Var = l0Var3.f75927a) == null) ? null : k0Var.f75914a) && (l0Var = (m3.l0) ((s2) e1Var).getValue()) != null) {
                    m3.p pVar = l0Var.f75928b;
                    m3.e eVarC = y1.c(eVar2, l0Var);
                    if (eVarC == null) {
                        hVarH = null;
                    } else {
                        int i14 = eVarC.f75854c;
                        int i15 = eVarC.f75853b;
                        hVarH = l0Var.h(i15, i14);
                        h2.c cVarB = l0Var.b(i15);
                        hVarH.g(((Float.floatToRawIntBits(cVarB.f59019b) & 4294967295L) | (Float.floatToRawIntBits(pVar.d(i15) == pVar.d(i14 - 1) ? Math.min(l0Var.b(r5).f59018a, cVarB.f59018a) : 0.0f) << 32)) ^ (-9223372034707292160L));
                    }
                }
                x1 x1Var = hVarH != null ? new x1(hVarH) : null;
                if (x1Var != null) {
                    s0 s0Var = (s0) a0Var;
                    s0Var.m(x1Var);
                    s0Var.f(true);
                }
                return Unit.f71706a;
            case 12:
                List list = (List) obj3;
                List list2 = (List) obj2;
                h1 h1Var2 = (h1) obj;
                if (list != null) {
                    int size2 = list.size();
                    for (int i16 = 0; i16 < size2; i16++) {
                        Pair pair2 = (Pair) list.get(i16);
                        h1.k(h1Var2, (i1) pair2.f71683a, ((y3.k) pair2.f71684b).f96605a);
                    }
                }
                if (list2 != null) {
                    int size3 = list2.size();
                    while (i13 < size3) {
                        Pair pair3 = (Pair) list2.get(i13);
                        i1 i1Var2 = (i1) pair3.f71683a;
                        Function0 function03 = (Function0) pair3.f71684b;
                        h1.k(h1Var2, i1Var2, function03 != null ? ((y3.k) function03.invoke()).f96605a : 0L);
                        i13++;
                    }
                }
                return Unit.f71706a;
            case 13:
                int iIntValue = ((Integer) obj).intValue();
                ((Function1) obj3).invoke(((m3.g) obj2).c(iIntValue, iIntValue, "URL"));
                return Unit.f71706a;
            case 14:
                h6.a0 a0Var2 = (h6.a0) obj3;
                m3 m3Var = new m3((o2) obj2, 7);
                a0Var2.getLifecycle().a(m3Var);
                return new b00.g0(18, a0Var2, m3Var);
            case 15:
                ((u70.d) obj3).f90670c.removeCallbacks((s90.s0) obj2);
                return Unit.f71706a;
            case 16:
                mh.c cVar3 = (mh.c) obj3;
                KSerializer kSerializer = (KSerializer) obj2;
                String body = (String) obj;
                Intrinsics.g(body, "body");
                try {
                    int i17 = Result.f71687b;
                    objA = ((Json) cVar3.f76324c).decodeFromString(kSerializer, body);
                } catch (Throwable th2) {
                    int i18 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                return new Result(objA);
            case 17:
                return new v3((i6.e) obj, t70.m0.t((t70.j0) obj3, null, null, new u6.a((b00.f) obj2, g0VarC, i12), 3), i11);
            case 18:
                PaymentMethodConfirmationOption.Saved saved = (PaymentMethodConfirmationOption.Saved) obj3;
                dq.c createConfirmAction = (dq.c) obj;
                Intrinsics.g(createConfirmAction, "$this$createConfirmAction");
                PaymentMethod paymentMethod = saved.f44143a;
                PaymentMethodOptionsParams paymentMethodOptionsParams = saved.f44144b;
                RadarOptions radarOptions = new RadarOptions(saved.f44146d, new AndroidVerificationObject(saved.f44147e));
                ClientAttributionMetadata clientAttributionMetadata = ((q0) obj2).f93110b;
                Intrinsics.g(paymentMethod, "paymentMethod");
                String str3 = paymentMethod.f43569a;
                PaymentMethod.Type type = paymentMethod.f43573e;
                if (type != null) {
                    return createConfirmAction.b(str3, type, paymentMethodOptionsParams, null, null, radarOptions, clientAttributionMetadata);
                }
                throw new IllegalArgumentException("Required value was null.");
            case 19:
                PaymentMethodConfirmationOption.New r11 = (PaymentMethodConfirmationOption.New) obj3;
                dq.c createConfirmAction2 = (dq.c) obj;
                Intrinsics.g(createConfirmAction2, "$this$createConfirmAction");
                return createConfirmAction2.a(r11.f44137a, r11.f44138b, r11.f44139c, ((q0) obj2).f93110b);
            case 20:
                w00.z zVar2 = (w00.z) obj3;
                Context context = (Context) obj2;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                if (!zBooleanValue || ((Boolean) zVar2.f93630g.getValue()).booleanValue()) {
                    if (!zBooleanValue && ((Boolean) zVar2.f93630g.getValue()).booleanValue()) {
                        e10.y2.f51877a.getClass();
                        if (!((Boolean) e10.y2.t1().l()).booleanValue()) {
                            oy.c.b(context, false, null);
                            zVar2.f93630g.setValue(Boolean.FALSE);
                        }
                    }
                    zVar2.b(p0.f85207d, zBooleanValue);
                } else {
                    oy.c.b(context, true, new w00.h(zVar2, 0));
                }
                return Unit.f71706a;
            case 21:
                w00.z zVar3 = (w00.z) obj3;
                e1 e1Var2 = (e1) obj2;
                e10.p0 p0Var = (e10.p0) obj;
                e10.p0 p0Var2 = e10.p0.f51735c;
                if (p0Var == p0Var2 && zVar3.n.f83363b.getValue() == e10.c0.f51450b) {
                    e1Var2.setValue(Boolean.TRUE);
                } else {
                    zVar3.f93635l.setValue(Boolean.valueOf(p0Var == p0Var2));
                }
                return Unit.f71706a;
            case 22:
                e10.p pVar2 = (e10.p) obj;
                ((e1) obj3).setValue(pVar2);
                e10.y2.f51877a.getClass();
                e10.y2.p1().i(pVar2);
                ((Function0) obj2).invoke();
                return Unit.f71706a;
            case 23:
                h.k kVar = (h.k) obj2;
                ((Function1[]) obj3)[0] = (Function1) obj;
                return kVar;
            case 24:
                ViewGroup it = (ViewGroup) obj;
                KProperty[] kPropertyArr = CountryTextInputLayout.I0;
                Intrinsics.g(it, "it");
                View viewInflate2 = LayoutInflater.from((Context) obj3).inflate(((CountryTextInputLayout) obj2).C0, it, false);
                Intrinsics.e(viewInflate2, "null cannot be cast to non-null type android.widget.TextView");
                return (TextView) viewInflate2;
            case 25:
                CountryTextInputLayout countryTextInputLayout = (CountryTextInputLayout) obj3;
                String str4 = (String) obj2;
                Country country = (Country) obj;
                KProperty[] kPropertyArr2 = CountryTextInputLayout.I0;
                countryTextInputLayout.E0.setValue(countryTextInputLayout, CountryTextInputLayout.I0[0], country != null ? country.f42572a : null);
                if (country != null) {
                    countryTextInputLayout.m(null);
                    countryTextInputLayout.n(false);
                } else {
                    countryTextInputLayout.m(str4);
                    countryTextInputLayout.n(true);
                }
                return Unit.f71706a;
            default:
                yw.a aVar = (yw.a) obj3;
                String token = (String) obj;
                Intrinsics.g(token, "token");
                long j11 = ((zw.c) obj2).f98788r;
                Handler handler = aVar.f18676f;
                handler.postDelayed(new aa.x(aVar, 14), Duration.h(j11));
                aVar.f18671a = new yw.e(token, handler);
                aVar.a();
                return Unit.f71706a;
        }
    }

    public /* synthetic */ f0(rw.c cVar, p6.l0 l0Var, String str) {
        this.f83034a = 5;
        this.f83035b = cVar;
        this.f83036c = l0Var;
    }

    public /* synthetic */ f0(y1 y1Var, m3.e eVar, t0.a1 a1Var) {
        this.f83034a = 10;
        this.f83035b = eVar;
        this.f83036c = a1Var;
    }
}
