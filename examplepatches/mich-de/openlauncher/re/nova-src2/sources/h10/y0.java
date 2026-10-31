package h10;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.stripe.android.customersheet.CustomerSheetActivity;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.model.z2;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountResponseInternal;
import com.stripe.android.uicore.elements.AddressInputMode;
import com.stripe.android.uicore.elements.IdentifierSpec;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fragments.SettingsNightMode;
import com.teslacoilsw.launcher.preferences.fragments.SettingsSearch;
import com.teslacoilsw.launcher.privacy.KoreaAnalyticsConsentActivity;
import com.teslacoilsw.launcher.workspace.CrosshairsCellLayout;
import f1.d3;
import io.sentry.e3;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeReference;
import kotlin.math.MathKt;
import kotlin.reflect.KType;
import kotlin.reflect.KTypeProjection;
import kotlin.reflect.KVariance;
import kotlinx.serialization.ContextualSerializer;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.PolymorphicSerializer;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptorKt;
import kotlinx.serialization.internal.TripleSerializer;
import kotlinx.serialization.modules.SerializersModuleCollector;
import kw.c3;
import kw.h2;
import kw.k2;
import kw.n2;
import kw.q2;
import kw.r2;
import kw.t2;
import kw.x2;
import kw.y2;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class y0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59007a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f59008b;

    public /* synthetic */ y0(Object obj, int i5) {
        this.f59007a = i5;
        this.f59008b = obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:176:0x03e4  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        FancyPrefCheckableView fancyPrefCheckableView;
        FancyPrefCheckableView fancyPrefCheckableView2;
        Object value;
        ArrayList arrayList;
        String strValueOf;
        int i5 = this.f59007a;
        boolean z11 = false;
        int i11 = 1;
        Object obj2 = this.f59008b;
        switch (i5) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                v9.g0 g0Var = (v9.g0) ((SettingsNightMode) obj2).f46052e;
                if (g0Var != null && (fancyPrefCheckableView = g0Var.f92349b) != null) {
                    fancyPrefCheckableView.setChecked(zBooleanValue);
                }
                return Unit.f71706a;
            case 1:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                v9.l0 l0Var = (v9.l0) ((SettingsSearch) obj2).f46052e;
                if (l0Var != null && (fancyPrefCheckableView2 = l0Var.f92446c) != null) {
                    fancyPrefCheckableView2.setChecked(zBooleanValue2);
                }
                return Unit.f71706a;
            case 2:
                return new CollectBankAccountResponseInternal((StripeIntent) obj, new CollectBankAccountResponseInternal.USBankAccountData((FinancialConnectionsSession) obj2), null);
            case 3:
                g.s addCallback = (g.s) obj;
                Intrinsics.g(addCallback, "$this$addCallback");
                ((hv.j) obj2).Z().m();
                return Unit.f71706a;
            case 4:
                j3.b0 semantics = (j3.b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                j3.y.e(((hv.p) obj2).f60464a.f55898b, semantics);
                return Unit.f71706a;
            case 5:
                Intrinsics.g((Context) obj, "<unused var>");
                FrameLayout frameLayout = new FrameLayout((Activity) obj2);
                frameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
                return frameLayout;
            case 6:
                p1.l0 DisposableEffect = (p1.l0) obj;
                Intrinsics.g(DisposableEffect, "$this$DisposableEffect");
                return new a1.j((dx.w) obj2, 8);
            case 7:
                ww.a host = (ww.a) obj;
                Intrinsics.g(host, "host");
                j.c launcher = ((com.stripe.android.challenge.confirmation.c) obj2).f42498d;
                if (launcher == null) {
                    return new gu.j(host);
                }
                Intrinsics.g(launcher, "launcher");
                iq.k kVar = new iq.k();
                kVar.f67979a = launcher;
                return kVar;
            case 8:
                KoreaAnalyticsConsentActivity koreaAnalyticsConsentActivity = (KoreaAnalyticsConsentActivity) obj2;
                ya.j.f97146a.submit(new he.j(koreaAnalyticsConsentActivity.getApplicationContext(), ((Boolean) obj).booleanValue(), i11));
                koreaAnalyticsConsentActivity.finish();
                return Unit.f71706a;
            case 9:
                CustomerSheetActivity customerSheetActivity = (CustomerSheetActivity) obj2;
                d3 it = (d3) obj;
                Intrinsics.g(it, "it");
                if (it == d3.f53456a) {
                    int i12 = CustomerSheetActivity.f42601r;
                    com.stripe.android.customersheet.d dVarA0 = customerSheetActivity.a0();
                    jr.q0 q0Var = (jr.q0) dVarA0.f42624m.f91586b.invoke();
                    q0Var.getClass();
                    if ((q0Var instanceof jr.n0) || (q0Var instanceof jr.p0) || (q0Var instanceof jr.o0)) {
                        z11 = true;
                    } else {
                        if (!(q0Var instanceof jr.m0)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        jr.m0 m0Var = (jr.m0) q0Var;
                        String str = m0Var.f69690c;
                        z2 z2Var = PaymentMethod.Type.f43637g;
                        if (str.equals("us_bank_account") && m0Var.f69706u != null) {
                            i2 i2Var = dVarA0.f42623l;
                            do {
                                value = i2Var.getValue();
                                List<Object> list = (List) value;
                                arrayList = new ArrayList(b70.c.u0(list, 10));
                                for (Object objC : list) {
                                    if (objC instanceof jr.m0) {
                                        objC = jr.m0.c((jr.m0) objC, null, null, null, null, null, false, false, null, null, false, null, null, false, true, null, 917503);
                                    }
                                    arrayList.add(objC);
                                }
                            } while (!i2Var.i(value, arrayList));
                        }
                    }
                }
                return Boolean.valueOf(z11);
            case 10:
                ft.b brand = (ft.b) obj;
                Intrinsics.g(brand, "brand");
                fl.l lVar = ((com.stripe.android.customersheet.d) obj2).f42616e;
                kr.i[] iVarArr = kr.i.f72141a;
                lVar.getClass();
                lVar.m(new kr.b(kr.a.f72126b, brand));
                return Unit.f71706a;
            case 11:
                ((jv.s) obj2).a(new jv.n1((uu.b) obj));
                return Unit.f71706a;
            case 12:
                r1.e eVar = (r1.e) obj2;
                Object[] objArr = eVar.f85077a;
                int i13 = eVar.f85079c;
                for (int i14 = 0; i14 < i13; i14++) {
                    ((z2.s0) objArr[i14]).b();
                }
                return Unit.f71706a;
            case 13:
                KTypeProjection it2 = (KTypeProjection) obj;
                int i15 = TypeReference.f71874d;
                Intrinsics.g(it2, "it");
                ((TypeReference) obj2).getClass();
                if (it2.getVariance() == null) {
                    return "*";
                }
                KType type = it2.getType();
                TypeReference typeReference = type instanceof TypeReference ? (TypeReference) type : null;
                if (typeReference == null || (strValueOf = typeReference.a(true)) == null) {
                    strValueOf = String.valueOf(it2.getType());
                }
                KVariance variance = it2.getVariance();
                int i16 = variance != null ? TypeReference.WhenMappings.f71878a[variance.ordinal()] : -1;
                if (i16 == 1) {
                    return strValueOf;
                }
                if (i16 == 2) {
                    return "in ".concat(strValueOf);
                }
                if (i16 == 3) {
                    return "out ".concat(strValueOf);
                }
                throw new NoWhenBranchMatchedException();
            case 14:
                return ContextualSerializer.descriptor$lambda$0((ContextualSerializer) obj2, (ClassSerialDescriptorBuilder) obj);
            case 15:
                return PolymorphicSerializer.descriptor_delegate$lambda$1$lambda$0((PolymorphicSerializer) obj2, (ClassSerialDescriptorBuilder) obj);
            case 16:
                return PluginGeneratedSerialDescriptorKt.toStringImpl$lambda$2((SerialDescriptor) obj2, ((Integer) obj).intValue());
            case 17:
                return TripleSerializer.descriptor$lambda$0((TripleSerializer) obj2, (ClassSerialDescriptorBuilder) obj);
            case 18:
                return SerializersModuleCollector.contextual$lambda$0((KSerializer) obj2, (List) obj);
            case 19:
                ww.a host2 = (ww.a) obj;
                Intrinsics.g(host2, "host");
                j.c cVar = ((com.stripe.android.payments.core.authentication.threeds2.a) obj2).f44324e;
                return cVar != null ? new com.stripe.android.payments.core.authentication.threeds2.d(cVar) : new com.stripe.android.payments.core.authentication.threeds2.c(host2);
            case 20:
                com.stripe.android.uicore.elements.a aVar = (com.stripe.android.uicore.elements.a) obj2;
                String str2 = (String) obj;
                if (str2 != null) {
                    aVar.f45402l.f72551c.f72528j.t(str2);
                }
                e3 e3Var = aVar.n;
                Iterable iterable = str2 != null ? (List) ((LinkedHashMap) e3Var.f67209c).get(str2) : (ArrayList) e3Var.f67208b;
                if (iterable == null) {
                    iterable = EmptyList.f71733a;
                }
                Iterable<k2> iterable2 = iterable;
                for (k2 field : iterable2) {
                    AddressInputMode addressInputMode = aVar.f45393c;
                    boolean z12 = aVar.f45395e;
                    Intrinsics.g(field, "field");
                    Intrinsics.g(addressInputMode, "addressInputMode");
                    IdentifierSpec identifierSpecB = field.b();
                    IdentifierSpec.Companion.getClass();
                    if (Intrinsics.b(identifierSpecB, IdentifierSpec.o)) {
                        q2 q2Var = field instanceof q2 ? (q2) field : null;
                        y2 y2Var = q2Var != null ? q2Var.f72582c : null;
                        t2 t2Var = y2Var instanceof t2 ? (t2) y2Var : null;
                        x2 x2Var = t2Var != null ? t2Var.f72634a : null;
                        r2 r2Var = x2Var instanceof r2 ? (r2) x2Var : null;
                        if (r2Var != null) {
                            iw.c cVar2 = addressInputMode instanceof iw.c ? (iw.c) addressInputMode : null;
                            ((i2) r2Var.f72594d).j(Intrinsics.b(cVar2 != null ? Boolean.valueOf(cVar2.d(str2, z12)) : null, Boolean.TRUE) ? new c3(2131232299, (Integer) 2132019690, true, (Function0) new fr.b0(addressInputMode, 23)) : null);
                        }
                    }
                    field.h(aVar.f45392b);
                }
                return (List) iterable2;
            case 21:
                com.stripe.android.uicore.elements.e eVar2 = (com.stripe.android.uicore.elements.e) obj2;
                kw.o event = (kw.o) obj;
                Intrinsics.g(event, "event");
                Map mapR0 = MapsKt.r0((Iterable) eVar2.f45420p.f91586b.invoke());
                LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(mapR0.size()));
                for (Map.Entry entry : mapR0.entrySet()) {
                    linkedHashMap.put(entry.getKey(), ((pw.a) entry.getValue()).f83105a);
                }
                Map mapA = event.a();
                if (mapA == null) {
                    mapA = b70.h.f17594a;
                }
                LinkedHashMap linkedHashMapM0 = MapsKt.m0(linkedHashMap, mapA);
                if (!(event instanceof kw.n)) {
                    if (!(event instanceof kw.m)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    eVar2.f45417k = true;
                }
                AddressInputMode addressInputModeW = eVar2.w(linkedHashMapM0, eVar2.f45417k);
                if (!linkedHashMap.equals(linkedHashMapM0) || !addressInputModeW.equals(((com.stripe.android.uicore.elements.a) eVar2.o.f91586b.invoke()).f45393c)) {
                    IdentifierSpec.Companion.getClass();
                    String str3 = (String) linkedHashMapM0.get(IdentifierSpec.f45379v);
                    if (str3 != null) {
                        eVar2.f45408b.t(str3);
                    }
                    i2 i2Var2 = eVar2.n;
                    com.stripe.android.uicore.elements.a aVarV = eVar2.v(linkedHashMapM0, eVar2.w(linkedHashMapM0, eVar2.f45417k));
                    i2Var2.getClass();
                    i2Var2.k(null, aVarV);
                }
                return Unit.f71706a;
            case 22:
                kw.v vVar = (kw.v) obj2;
                if (((Boolean) obj).booleanValue() || !vVar.f72697b) {
                    return null;
                }
                return new kw.u0(2132019788, null);
            case 23:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                return ul.b.P(new Pair(((kw.w) obj2).f72717a, new pw.a(String.valueOf(zBooleanValue3), zBooleanValue3)));
            case 24:
                g2.s.c((g2.s) obj2);
                return Unit.f71706a;
            case 25:
                pw.a formFieldEntry = (pw.a) obj;
                Intrinsics.g(formFieldEntry, "formFieldEntry");
                return ul.b.P(new Pair(((h2) obj2).f72393a, formFieldEntry));
            case 26:
                pw.a formFieldEntry2 = (pw.a) obj;
                Intrinsics.g(formFieldEntry2, "formFieldEntry");
                return ul.b.P(new Pair(((n2) obj2).b(), formFieldEntry2));
            case 27:
                ky.e eVar3 = (ky.e) obj2;
                z2.y yVar = (z2.y) obj;
                z2.y yVarI = yVar.I();
                eVar3.f72774d = androidx.compose.runtime.d.k(Integer.valueOf(MathKt.b(Float.intBitsToFloat((int) (4294967295L & (yVarI != null ? yVarI.m(yVar, 0L) : 0L))))));
                return Unit.f71706a;
            case 28:
                kz.f fVar = ((kz.e) obj2).f72868b;
                return fVar.u0(fVar.indexOfChild((View) obj));
            default:
                ((Integer) obj).intValue();
                ((CrosshairsCellLayout) obj2).requestLayout();
                return Unit.f71706a;
        }
    }
}
