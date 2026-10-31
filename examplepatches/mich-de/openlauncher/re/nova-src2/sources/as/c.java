package as;

import android.content.Context;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.InputMethodManager;
import b10.l1;
import bn.j1;
import c0.c2;
import c0.i1;
import com.moloco.sdk.internal.ortb.model.C2935e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.C2980g;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.G;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.H;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.K;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.c;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import com.teslacoilsw.launcher.onboarding.WhatsNewActivity;
import e10.s2;
import e10.y2;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.StringCompanionObject;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.json.Json;
import mx.g0;
import nova.branch.engage.sesame_lite.internal.IdHash;
import r10.p0;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15580a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15581b;

    public /* synthetic */ c(Object obj, int i5) {
        this.f15580a = i5;
        this.f15581b = obj;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        tz.g gVarB;
        tz.g gVarB2;
        int i5 = this.f15580a;
        boolean z11 = true;
        Object obj = this.f15581b;
        switch (i5) {
            case 0:
                e eVar = (e) obj;
                g gVar = eVar.f15594f;
                j environment = eVar.f15590b;
                gVar.getClass();
                Intrinsics.g(environment, "environment");
                bh.k kVar = new bh.k(3);
                kVar.h(environment.f15614a);
                return new b(new gi.b(gVar.f15607a, null, gi.e.f57682a, new gi.d(kVar), qg.e.f84049c));
            case 1:
                PaymentSelection paymentSelection = (PaymentSelection) ((au.g) obj).f15684b.f15697b.f93973a.getValue();
                if (paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) {
                    return new ou.v((PaymentSelection.ExternalPaymentMethod) paymentSelection);
                }
                if (paymentSelection instanceof PaymentSelection.CustomPaymentMethod) {
                    return new ou.u((PaymentSelection.CustomPaymentMethod) paymentSelection);
                }
                if (paymentSelection instanceof PaymentSelection.New) {
                    return new ou.w((PaymentSelection.New) paymentSelection);
                }
                return null;
            case 2:
                Context context = g0.f77088a;
                g20.w.k(g0.c(), (IdHash) obj);
                return Unit.f71706a;
            case 3:
                int i11 = FirstRunActivityCompose.f45937s;
                return Integer.valueOf(((l1) obj).f16773a.size());
            case 4:
                WhatsNewActivity whatsNewActivity = (WhatsNewActivity) obj;
                int i12 = WhatsNewActivity.f45941r;
                y2 y2Var = y2.f51877a;
                y2Var.getClass();
                s2 s2VarC = y2.c(false);
                s2 s2VarC2 = y2.c(true);
                tz.g gVarB3 = (tz.g) s2VarC.l();
                tz.g gVar2 = (tz.g) s2VarC2.l();
                b10.s2 s2Var = whatsNewActivity.f45943q;
                if (s2Var == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                if (((Boolean) s2Var.f16898a.getValue()).booleanValue()) {
                    gVarB3 = tz.g.b(gVarB3, tz.h.f90128a.f90112a, null, null, null, null, null, null, null, null, null, null, null, null, 32766);
                    gVarB = tz.g.b(gVar2, tz.h.f90129b.f90112a, null, null, null, null, null, null, null, null, null, null, null, null, 32766);
                } else {
                    gVarB = gVar2;
                }
                tz.g gVarB4 = gVarB3;
                b10.s2 s2Var2 = whatsNewActivity.f45943q;
                if (s2Var2 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                if (((Boolean) s2Var2.f16899b.getValue()).booleanValue()) {
                    gVarB4 = tz.g.b(gVarB4, null, null, tz.h.f90128a.f90114c, null, null, null, null, null, null, null, null, null, null, 32763);
                    gVarB = tz.g.b(gVarB, null, null, tz.h.f90129b.f90114c, null, null, null, null, null, null, null, null, null, null, 32763);
                }
                tz.g gVarB5 = gVarB4;
                b10.s2 s2Var3 = whatsNewActivity.f45943q;
                if (s2Var3 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                if (((Boolean) s2Var3.f16900c.getValue()).booleanValue()) {
                    gVarB5 = tz.g.b(gVarB5, null, null, null, null, tz.h.f90128a.f90116e, null, null, null, null, null, null, null, null, 32751);
                    gVarB2 = tz.g.b(gVarB, null, null, null, null, tz.h.f90129b.f90116e, null, null, null, null, null, null, null, null, 32751);
                } else {
                    gVarB2 = gVarB;
                }
                tz.g gVarB6 = gVarB5;
                b10.s2 s2Var4 = whatsNewActivity.f45943q;
                if (s2Var4 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                if (((Boolean) s2Var4.f16901d.getValue()).booleanValue()) {
                    tz.g gVar3 = tz.h.f90128a;
                    gVarB6 = tz.g.b(gVarB6, null, null, null, null, null, gVar3.f90117f, gVar3.f90118g, gVar3.f90119h, null, null, null, null, null, 32543);
                    tz.g gVar4 = tz.h.f90129b;
                    gVarB2 = tz.g.b(gVarB2, null, null, null, null, null, gVar4.f90117f, gVar4.f90118g, gVar4.f90119h, null, null, null, null, null, 32543);
                }
                tz.g gVarB7 = gVarB2;
                tz.g gVar5 = gVarB6;
                b10.s2 s2Var5 = whatsNewActivity.f45943q;
                if (s2Var5 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                if (((Boolean) s2Var5.f16902e.getValue()).booleanValue()) {
                    tz.g gVarB8 = tz.g.b(gVar5, null, null, null, null, null, null, null, null, null, null, tz.h.f90128a.f90124m, null, null, 28671);
                    gVarB7 = tz.g.b(gVarB7, null, null, null, null, null, null, null, null, null, null, tz.h.f90129b.f90124m, null, null, 28671);
                    gVar5 = gVarB8;
                }
                Set set = (Set) y2.f1().l();
                b10.s2 s2Var6 = whatsNewActivity.f45943q;
                if (s2Var6 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                LinkedHashSet linkedHashSetZ = ((Boolean) s2Var6.f16903f.getValue()).booleanValue() ? b70.n.Z(b70.n.c0(set, p0.f85208e), p0.f85207d) : b70.n.Z(set, p0.f85208e);
                p0 p0Var = p0.f85205b;
                LinkedHashSet linkedHashSetZ2 = b70.n.Z(linkedHashSetZ, p0Var);
                p0 p0Var2 = p0.f85206c;
                LinkedHashSet linkedHashSetZ3 = b70.n.Z(linkedHashSetZ2, p0Var2);
                b10.s2 s2Var7 = whatsNewActivity.f45943q;
                if (s2Var7 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                int iOrdinal = ((e10.r) s2Var7.f16905h.getValue()).ordinal();
                if (iOrdinal != 0) {
                    if (iOrdinal == 1) {
                        linkedHashSetZ3 = b70.n.Z(b70.n.c0(linkedHashSetZ3, p0Var), p0.f85207d);
                    } else {
                        if (iOrdinal != 2) {
                            throw new NoWhenBranchMatchedException();
                        }
                        linkedHashSetZ3 = b70.n.Z(b70.n.c0(linkedHashSetZ3, p0Var2), p0.f85207d);
                    }
                }
                y2.f1().i(linkedHashSetZ3);
                s2 s2VarO = y2.o();
                b10.s2 s2Var8 = whatsNewActivity.f45943q;
                if (s2Var8 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                s2VarO.i(s2Var8.f16904g.getValue());
                s2 s2VarK0 = y2Var.K0();
                b10.s2 s2Var9 = whatsNewActivity.f45943q;
                if (s2Var9 == null) {
                    Intrinsics.m("model");
                    throw null;
                }
                s2VarK0.i(s2Var9.f16906i.getValue());
                s2VarC.i(gVar5);
                s2VarC2.i(gVarB7);
                NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                if (novaLauncher != null) {
                    novaLauncher.recreate();
                }
                whatsNewActivity.finish();
                return Unit.f71706a;
            case 5:
                return ((Iterable) obj).iterator();
            case 6:
                String string = ((j1) obj).a().toString();
                Intrinsics.f(string, "toString(...)");
                return string;
            case 7:
                ru.d dVar = ((bu.n) obj).f18572h;
                z2 z2Var = PaymentMethod.Type.f43637g;
                ((ru.a) dVar).n("us_bank_account");
                return Unit.f71706a;
            case 8:
                i1 i1Var = (i1) obj;
                c2 c2Var = i1Var.o;
                i1Var.J = c2Var != null ? ((Number) c2Var.f18741l.getValue()).longValue() : 0L;
                return Unit.f71706a;
            case 9:
                ((c0.n) obj).f18882f = false;
                return Unit.f71706a;
            case 10:
                c2 c2Var2 = (c2) obj;
                if (Intrinsics.b(((p1.s2) c2Var2.f18733d).getValue(), c2Var2.f18730a.c()) && c2Var2.f18736g.m() == Long.MIN_VALUE && !((Boolean) ((p1.s2) c2Var2.f18737h).getValue()).booleanValue()) {
                    z11 = false;
                }
                return Boolean.valueOf(z11);
            case 11:
                Object systemService = ((c1.m) obj).f19099b.getContext().getSystemService("input_method");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.inputmethod.InputMethodManager");
                return (InputMethodManager) systemService;
            case 12:
                return new BaseInputConnection(((c1.r) obj).f19121a, false);
            case 13:
                return com.moloco.sdk.acm.services.g.a((com.moloco.sdk.acm.services.g) obj);
            case 14:
                return com.moloco.sdk.internal.ilrd.a.a((com.moloco.sdk.internal.ilrd.a) obj);
            case 15:
                return com.moloco.sdk.internal.publisher.nativead.d.a((C2935e) obj);
            case 16:
                return com.moloco.sdk.internal.publisher.nativead.d.a((com.moloco.sdk.internal.publisher.nativead.d) obj);
            case 17:
                return com.moloco.sdk.internal.publisher.nativead.model.d.a((com.moloco.sdk.internal.publisher.nativead.model.d) obj);
            case 18:
                return G.d((G) obj);
            case 19:
                return H.g((H) obj);
            case 20:
                return K.f((K) obj);
            case 21:
                return C2980g.b.b((Ref.ObjectRef) obj);
            case 22:
                return b.a.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.b) obj);
            case 23:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.a.c((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.a) obj);
            case 24:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.handlers.e.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.handlers.e) obj);
            case 25:
                return c.a.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.c) obj);
            case 26:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.z.c((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.z) obj);
            case 27:
                ((cu.w) ((cu.g) obj).f47943f.get()).a(cu.q.f47963b);
                return Unit.f71706a;
            case 28:
                Context context2 = ((cx.a) obj).f48400a;
                try {
                    KSerializer serializer = BuiltinSerializersKt.ListSerializer(BuiltinSerializersKt.serializer(StringCompanionObject.f71868a));
                    ArrayList arrayListA = cx.a.a(context2.getPackageName(), context2.getPackageCodePath());
                    Json json = ax.b.f15734a;
                    Intrinsics.g(serializer, "serializer");
                    return ax.b.f15734a.encodeToString(serializer, arrayListA);
                } catch (IOException unused) {
                    return "[]";
                }
            default:
                KSerializer<zw.c> serializer2 = zw.c.Companion.serializer();
                Json json2 = ax.b.f15734a;
                Intrinsics.g(serializer2, "serializer");
                return ax.b.f15734a.encodeToString(serializer2, (zw.c) obj);
        }
    }
}
