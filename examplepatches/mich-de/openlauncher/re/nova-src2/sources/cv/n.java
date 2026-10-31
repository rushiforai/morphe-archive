package cv;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b.i8;
import c3.z1;
import cl.l0;
import com.android.billingclient.api.ProductDetails;
import com.stripe.android.uicore.elements.IdentifierSpec;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import cw.m0;
import cw.n0;
import e0.l1;
import e0.m1;
import j3.b0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import kotlin.text.MatchResult;
import kotlinx.serialization.json.JsonBuilder;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kw.c3;
import kw.e3;
import kw.k2;
import kw.w0;
import p1.n1;
import p1.z2;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48022a;

    public /* synthetic */ n(int i5) {
        this.f48022a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int iIntValue = -1;
        int i5 = 10;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        switch (this.f48022a) {
            case 0:
                b0 semantics = (b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                c2.m.f19181a.getClass();
                j3.y.f(semantics, c2.l.f19176f);
                return Unit.f71706a;
            case 1:
                w state = (w) obj;
                Intrinsics.g(state, "state");
                x xVar = state.f48044c;
                return xVar.f48048c ? new d(xVar.f48046a) : e.f48005a;
            case 2:
                List fields = (List) obj;
                Intrinsics.g(fields, "fields");
                List list = fields;
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    arrayList.add(((k2) it.next()).i().g());
                }
                return new uw.c(arrayList.isEmpty() ? ps.v.y((w0) b70.g.Y0(b70.g.U0(EmptyList.f71733a))) : new m0((w70.m[]) b70.g.I1(arrayList).toArray(new w70.m[0]), objArr2 == true ? 1 : 0), new n0(arrayList, 0));
            case 3:
                ft.b it2 = (ft.b) obj;
                Intrinsics.g(it2, "it");
                IdentifierSpec.Companion.getClass();
                return new Pair(IdentifierSpec.f45365f, new pw.a(it2.f55897a, true));
            case 4:
                ft.b brand = (ft.b) obj;
                Intrinsics.g(brand, "brand");
                IdentifierSpec.Companion.getClass();
                return new Pair(IdentifierSpec.f45366g, new pw.a(brand != ft.b.f55894x ? brand.f55897a : null, true));
            case 5:
                pw.a it3 = (pw.a) obj;
                Intrinsics.g(it3, "it");
                IdentifierSpec.Companion.getClass();
                IdentifierSpec identifierSpec = IdentifierSpec.f45369j;
                String str = it3.f83105a;
                if (str != null) {
                    String strV = l0.v(str);
                    if (strV.length() == 4) {
                        Integer numU0 = r70.i.u0(r70.l.G1(2, strV));
                        if (numU0 == null) {
                            throw new IllegalArgumentException("Required value was null.");
                        }
                        iIntValue = numU0.intValue();
                    }
                }
                return new Pair(identifierSpec, pw.a.a(r70.k.Y0(2, String.valueOf(iIntValue)), it3));
            case 6:
                pw.a it4 = (pw.a) obj;
                Intrinsics.g(it4, "it");
                IdentifierSpec.Companion.getClass();
                IdentifierSpec identifierSpec2 = IdentifierSpec.f45370k;
                String str2 = it4.f83105a;
                if (str2 != null) {
                    String strV2 = l0.v(str2);
                    if (strV2.length() == 4) {
                        Integer numU02 = r70.i.u0(r70.l.H1(2, strV2));
                        if (numU02 == null) {
                            throw new IllegalArgumentException("Required value was null.");
                        }
                        iIntValue = numU02.intValue() + 2000;
                    }
                }
                return new Pair(identifierSpec2, pw.a.a(String.valueOf(iIntValue), it4));
            case 7:
                b0 semantics2 = (b0) obj;
                Intrinsics.g(semantics2, "$this$semantics");
                KProperty[] kPropertyArr = j3.y.f68878a;
                j3.a0 a0Var = j3.w.f68859h;
                Unit unit = Unit.f71706a;
                ((j3.k) semantics2).f(a0Var, unit);
                return unit;
            case 8:
                ft.b cardBrand = (ft.b) obj;
                Intrinsics.g(cardBrand, "cardBrand");
                return zg.a.U(cardBrand == ft.b.f55887q ? 2132019760 : 2132019763, new Object[0], EmptyList.f71733a);
            case 9:
                String it5 = (String) obj;
                Intrinsics.g(it5, "it");
                return zg.a.H(ps.j.d(it5));
            case 10:
                e3 it6 = (e3) obj;
                Intrinsics.g(it6, "it");
                return Boolean.valueOf(it6.isValid());
            case 11:
                ft.b it7 = (ft.b) obj;
                Intrinsics.g(it7, "it");
                return new c3(it7.f55900d, (boolean) (objArr3 == true ? 1 : 0), (n0.w) (objArr == true ? 1 : 0), i5);
            case 12:
                String it8 = (String) obj;
                Intrinsics.g(it8, "it");
                return zg.a.H(ps.j.d(it8));
            case 13:
                e3 it9 = (e3) obj;
                Intrinsics.g(it9, "it");
                return Boolean.valueOf(it9.isValid());
            case 14:
                JsonBuilder Json = (JsonBuilder) obj;
                Intrinsics.g(Json, "$this$Json");
                Json.setIgnoreUnknownKeys(true);
                return Unit.f71706a;
            case 15:
                MatchResult it10 = (MatchResult) obj;
                Intrinsics.g(it10, "it");
                return String.valueOf(r70.l.D1(it10.getValue()) - '7');
            case 16:
                JsonBuilder Json2 = (JsonBuilder) obj;
                Intrinsics.g(Json2, "$this$Json");
                Json2.setIgnoreUnknownKeys(true);
                Json2.setClassDiscriminator("#class");
                Json2.setCoerceInputValues(true);
                return Unit.f71706a;
            case 17:
                Intrinsics.g((b0) obj, "$this$semantics");
                return Unit.f71706a;
            case 18:
                return String.valueOf(((Boolean) obj).booleanValue());
            case 19:
                return String.valueOf(((Boolean) obj).booleanValue());
            case 20:
                Intrinsics.g((b0) obj, "$this$semantics");
                return Unit.f71706a;
            case 21:
                String basePlanId = ((ProductDetails.SubscriptionOfferDetails) obj).getBasePlanId();
                return basePlanId != null ? basePlanId : AbstractJsonLexerKt.NULL;
            case 22:
                Context context = (Context) obj;
                ComponentName componentName = SettingsActivity.f45966y;
                List list2 = o00.j.f78916a;
                Intent intentX = i8.x("ContactSupport", null);
                intentX.setFlags(context instanceof Activity ? 0 : 268435456);
                context.startActivity(intentX);
                return Unit.f71706a;
            case 23:
                return Unit.f71706a;
            case 24:
                Intrinsics.g((Intent) obj, "it");
                return Unit.f71706a;
            case 25:
                ((k2.c) obj).drawContent();
                return Unit.f71706a;
            case 26:
                return Unit.f71706a;
            case 27:
                ((Long) obj).longValue();
                return Unit.f71706a;
            case 28:
                int i11 = e0.m.f50069a;
                z2 z2Var = AndroidCompositionLocals_androidKt.f14166b;
                n1 n1Var = (n1) obj;
                n1Var.getClass();
                Context context2 = (Context) p1.a0.h(n1Var, z2Var);
                y3.c cVar = (y3.c) p1.a0.h(n1Var, z1.f19497h);
                l1 l1Var = (l1) p1.a0.h(n1Var, m1.f50073a);
                if (l1Var == null) {
                    return null;
                }
                return new e0.l(context2, cVar, l1Var.f50067a, l1Var.f50068b);
            default:
                j3.y.i((b0) obj, j3.g.f68781d);
                return Unit.f71706a;
        }
    }
}
