package s10;

import b.u4;
import com.instabridge.ai.proactive.AiInsightData;
import com.teslacoilsw.launcher.NovaLauncher;
import com.tiktok.util.TTConst;
import e1.o0;
import i2.u0;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.JsonBuilder;
import m3.g0;
import m3.l0;
import m3.m0;
import tx.f4;
import tx.i1;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86603a;

    public /* synthetic */ i(int i5) {
        this.f86603a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        m0 m0VarB;
        g0 g0Var;
        NovaLauncher novaLauncher;
        boolean z11 = true;
        switch (this.f86603a) {
            case 0:
                BranchEntity branchEntity = (BranchEntity) obj;
                if (!(branchEntity instanceof BranchEntity.HeroAd) ? !(branchEntity instanceof BranchEntity.HeroV2) || ((BranchEntity.HeroV2) branchEntity).f66431e != 1 : ((BranchEntity.HeroAd) branchEntity).f66424g != 1) {
                    z11 = false;
                }
                return Boolean.valueOf(z11);
            case 1:
                return Boolean.TRUE;
            case 2:
                return Boolean.TRUE;
            case 3:
                return ((BranchContainer) obj).getContainerType();
            case 4:
                return Unit.f71706a;
            case 5:
                o0 o0Var = (o0) obj;
                String str = o0Var.f51358g.f75880b;
                long j11 = o0Var.f51357f;
                int i5 = m3.o0.f75945c;
                int i11 = (int) (j11 & 4294967295L);
                int iOffsetByCodePoints = (i11 > 0 && i11 > 0) ? Character.offsetByCodePoints(str, i11, -1) : -1;
                if (iOffsetByCodePoints == -1) {
                    return null;
                }
                return new r3.f(((int) (o0Var.f51357f & 4294967295L)) - iOffsetByCodePoints, 0);
            case 6:
                o0 o0Var2 = (o0) obj;
                int iE = o0Var2.e();
                if (iE == -1) {
                    return null;
                }
                long jH = o0Var2.h();
                int i12 = m3.o0.f75945c;
                return new r3.f(0, iE - ((int) (jH & 4294967295L)));
            case 7:
                o0 o0Var3 = (o0) obj;
                Integer numG = o0Var3.g();
                if (numG == null) {
                    return null;
                }
                int iIntValue = numG.intValue();
                long jH2 = o0Var3.h();
                int i13 = m3.o0.f75945c;
                return new r3.f(((int) (jH2 & 4294967295L)) - iIntValue, 0);
            case 8:
                o0 o0Var4 = (o0) obj;
                Integer numF = o0Var4.f();
                if (numF == null) {
                    return null;
                }
                int iIntValue2 = numF.intValue();
                long jH3 = o0Var4.h();
                int i14 = m3.o0.f75945c;
                return new r3.f(0, iIntValue2 - ((int) (jH3 & 4294967295L)));
            case 9:
                o0 o0Var5 = (o0) obj;
                Integer numD = o0Var5.d();
                if (numD == null) {
                    return null;
                }
                int iIntValue3 = numD.intValue();
                long jH4 = o0Var5.h();
                int i15 = m3.o0.f75945c;
                return new r3.f(((int) (jH4 & 4294967295L)) - iIntValue3, 0);
            case 10:
                o0 o0Var6 = (o0) obj;
                Integer numC = o0Var6.c();
                if (numC == null) {
                    return null;
                }
                int iIntValue4 = numC.intValue();
                long jH5 = o0Var6.h();
                int i16 = m3.o0.f75945c;
                return new r3.f(0, iIntValue4 - ((int) (jH5 & 4294967295L)));
            case 11:
                m3.e eVar = (m3.e) obj;
                Object obj2 = eVar.f75852a;
                if (!(obj2 instanceof m3.n) || (m0VarB = ((m3.n) obj2).b()) == null || (m0VarB.f75936a == null && m0VarB.f75937b == null && m0VarB.f75938c == null && m0VarB.f75939d == null)) {
                    return ul.b.h(eVar);
                }
                Object obj3 = eVar.f75852a;
                Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.LinkAnnotation");
                m0 m0VarB2 = ((m3.n) obj3).b();
                if (m0VarB2 == null || (g0Var = m0VarB2.f75936a) == null) {
                    g0Var = new g0(0L, 0L, (q3.b0) null, (q3.v) null, (q3.w) null, (q3.p) null, (String) null, 0L, (x3.a) null, (x3.p) null, (t3.b) null, 0L, (x3.l) null, (u0) null, 65535);
                }
                return ul.b.h(eVar, new m3.e(g0Var, eVar.f75853b, eVar.f75854c));
            case 12:
                j3.a0 a0Var = j3.w.f68875z;
                Unit unit = Unit.f71706a;
                ((j3.k) ((j3.b0) obj)).f(a0Var, unit);
                return unit;
            case 13:
                return Boolean.TRUE;
            case 14:
                List list = t00.q.f88399a;
                return Boolean.TRUE;
            case 15:
                List list2 = (List) obj;
                Object obj4 = list2.get(0);
                Intrinsics.e(obj4, "null cannot be cast to non-null type kotlin.Int");
                int iIntValue5 = ((Integer) obj4).intValue();
                Object obj5 = list2.get(1);
                Intrinsics.e(obj5, "null cannot be cast to non-null type kotlin.Int");
                int iIntValue6 = ((Integer) obj5).intValue();
                String str2 = (String) list2.get(2);
                Object obj6 = list2.get(3);
                Intrinsics.e(obj6, "null cannot be cast to non-null type kotlin.Boolean");
                return new t00.a0(iIntValue5, iIntValue6, str2, ((Boolean) obj6).booleanValue());
            case 16:
                List list3 = (List) obj;
                Object obj7 = list3.get(0);
                Intrinsics.e(obj7, "null cannot be cast to non-null type kotlin.Int");
                int iIntValue7 = ((Integer) obj7).intValue();
                Object obj8 = list3.get(1);
                Intrinsics.e(obj8, "null cannot be cast to non-null type kotlin.Int");
                int iIntValue8 = ((Integer) obj8).intValue();
                String str3 = (String) list3.get(2);
                Object obj9 = list3.get(3);
                Intrinsics.e(obj9, "null cannot be cast to non-null type kotlin.Boolean");
                return new t00.c0(iIntValue7, iIntValue8, str3, ((Boolean) obj9).booleanValue());
            case 17:
                JsonBuilder Json = (JsonBuilder) obj;
                Intrinsics.g(Json, "$this$Json");
                Json.setIgnoreUnknownKeys(true);
                return Unit.f71706a;
            case 18:
                Pair pair = (Pair) obj;
                Intrinsics.g(pair, "<destruct>");
                return u4.m((String) pair.f71683a, "=", (String) pair.f71684b);
            case 19:
                j3.b0 semantics = (j3.b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                return Unit.f71706a;
            case 20:
                l0 it = (l0) obj;
                Intrinsics.g(it, "it");
                return Unit.f71706a;
            case 21:
                AiInsightData aiInsightData = (AiInsightData) obj;
                zy.c cVar = zy.c.f98823a;
                zy.c.i("ai_insight_feedback", MapsKt.j0(new Pair("surface", "left_swipe"), new Pair(TTConst.TRACK_TYPE, "negative"), new Pair("trigger", "dismiss")));
                AiInsightData aiInsightData2 = i1.f89804c;
                if (aiInsightData2 != null && Intrinsics.b(aiInsightData2.getText(), aiInsightData.getText())) {
                    i1.f89804c = null;
                    WeakReference weakReference = i1.f89802a;
                    if (weakReference != null && (novaLauncher = (NovaLauncher) weakReference.get()) != null) {
                        novaLauncher.runOnUiThread(new kz.j(novaLauncher, 6));
                    }
                }
                return Unit.f71706a;
            case 22:
                Map.Entry entry = (Map.Entry) obj;
                return entry.getKey() + "=" + entry.getValue();
            case 23:
                int iByteValue = (((Byte) obj).byteValue() & 255) + 256;
                kotlin.text.a.a(16);
                String string = Integer.toString(iByteValue, 16);
                Intrinsics.f(string, "toString(...)");
                String strSubstring = string.substring(1);
                Intrinsics.f(strSubstring, "substring(...)");
                return strSubstring;
            case 24:
                return ((o20.m) obj).f79442a;
            case 25:
                o20.n nVar = (o20.n) obj;
                return a80.m.h(nVar.f79445a, " (", nVar.f79446b, ")");
            case 26:
                o20.o oVar = (o20.o) obj;
                return oVar.f79450b + " (" + oVar.f79452d + " members)";
            case 27:
                return ((f4) obj).f89741a;
            case 28:
                Byte b11 = (Byte) obj;
                b11.byteValue();
                return String.format("%02x", Arrays.copyOf(new Object[]{b11}, 1));
            default:
                AiInsightData aiInsightData3 = (AiInsightData) obj;
                return aiInsightData3.getFetchedAt() + "_" + aiInsightData3.getCat() + "_" + aiInsightData3.getText().hashCode();
        }
    }
}
