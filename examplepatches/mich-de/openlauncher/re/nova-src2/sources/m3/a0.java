package m3;

import ads_mobile_sdk.ti3;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import g0.d1;
import i2.u0;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.SesameLiteImpl;
import p1.s2;
import t0.u1;
import t70.j2;

/* loaded from: classes.dex */
public final /* synthetic */ class a0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75840a;

    public /* synthetic */ a0(int i5) {
        this.f75840a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00be  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        i iVar;
        Object objA;
        switch (this.f75840a) {
            case 0:
                x3.i iVar2 = (x3.i) obj2;
                return ul.b.h(new x3.f(iVar2.f95014a), new x3.h(iVar2.f95015b), new x3.g());
            case 1:
                y1.b bVar = (y1.b) obj;
                e eVar = (e) obj2;
                Object obj3 = eVar.f75852a;
                if (obj3 instanceof u) {
                    iVar = i.f75902a;
                } else if (obj3 instanceof g0) {
                    iVar = i.f75903b;
                } else if (obj3 instanceof r0) {
                    iVar = i.f75904c;
                } else if (obj3 instanceof q0) {
                    iVar = i.f75905d;
                } else if (obj3 instanceof m) {
                    iVar = i.f75906e;
                } else if (obj3 instanceof l) {
                    iVar = i.f75907f;
                } else {
                    if (!(obj3 instanceof i0)) {
                        throw new UnsupportedOperationException();
                    }
                    iVar = i.f75908g;
                }
                switch (iVar.ordinal()) {
                    case 0:
                        Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.ParagraphStyle");
                        objA = e0.a((u) obj3, e0.f75862g, bVar);
                        break;
                    case 1:
                        Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.SpanStyle");
                        objA = e0.a((g0) obj3, e0.f75863h, bVar);
                        break;
                    case 2:
                        Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.VerbatimTtsAnnotation");
                        objA = e0.a((r0) obj3, e0.f75858c, bVar);
                        break;
                    case 3:
                        Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.UrlAnnotation");
                        objA = e0.a((q0) obj3, e0.f75859d, bVar);
                        break;
                    case 4:
                        Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.LinkAnnotation.Url");
                        objA = e0.a((m) obj3, e0.f75860e, bVar);
                        break;
                    case 5:
                        Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.LinkAnnotation.Clickable");
                        objA = e0.a((l) obj3, e0.f75861f, bVar);
                        break;
                    case 6:
                        Intrinsics.e(obj3, "null cannot be cast to non-null type androidx.compose.ui.text.StringAnnotation");
                        objA = ((i0) obj3).b();
                        break;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
                return ul.b.h(iVar, objA, Integer.valueOf(eVar.f75853b), Integer.valueOf(eVar.f75854c), eVar.f75855d);
            case 2:
                l lVar = (l) obj2;
                return ul.b.h(lVar.c(), e0.a(lVar.b(), e0.f75864i, (y1.b) obj));
            case 3:
                return ((r0) obj2).a();
            case 4:
                return ((q0) obj2).a();
            case 5:
                y1.b bVar2 = (y1.b) obj;
                u uVar = (u) obj2;
                x3.k kVar = new x3.k(uVar.f75973a);
                x3.m mVar = new x3.m(uVar.f75974b);
                Object objA2 = e0.a(new y3.p(uVar.f75975c), e0.f75870q, bVar2);
                x3.q qVar = uVar.f75976d;
                x3.q qVar2 = x3.q.f95029c;
                Object objA3 = e0.a(qVar, e0.f75867l, bVar2);
                Object objA4 = e0.a(uVar.f75977e, f0.f75876a, bVar2);
                x3.i iVar3 = uVar.f75978f;
                x3.i iVar4 = x3.i.f95013c;
                return ul.b.h(kVar, mVar, objA2, objA3, objA4, e0.a(iVar3, e0.f75874u, bVar2), e0.a(new x3.e(uVar.f75979g), f0.f75877b, bVar2), new x3.d(uVar.f75980h), e0.a(uVar.f75981i, f0.f75878c, bVar2));
            case 6:
                y1.b bVar3 = (y1.b) obj;
                g0 g0Var = (g0) obj2;
                i2.s sVar = new i2.s(g0Var.f75883a.b());
                d0 d0Var = e0.f75869p;
                Object objA5 = e0.a(sVar, d0Var, bVar3);
                y3.p pVar = new y3.p(g0Var.f75884b);
                d0 d0Var2 = e0.f75870q;
                Object objA6 = e0.a(pVar, d0Var2, bVar3);
                q3.b0 b0Var = g0Var.f75885c;
                q3.b0 b0Var2 = q3.b0.f83528b;
                Object objA7 = e0.a(b0Var, e0.f75868m, bVar3);
                q3.v vVar = g0Var.f75886d;
                q3.w wVar = g0Var.f75887e;
                String str = g0Var.f75889g;
                Object objA8 = e0.a(new y3.p(g0Var.f75890h), d0Var2, bVar3);
                Object objA9 = e0.a(g0Var.f75891i, e0.n, bVar3);
                Object objA10 = e0.a(g0Var.f75892j, e0.f75866k, bVar3);
                t3.b bVar4 = g0Var.f75893k;
                t3.b bVar5 = t3.b.f88510c;
                Object objA11 = e0.a(bVar4, e0.f75872s, bVar3);
                Object objA12 = e0.a(new i2.s(g0Var.f75894l), d0Var, bVar3);
                Object objA13 = e0.a(g0Var.f75895m, e0.f75865j, bVar3);
                u0 u0Var = g0Var.n;
                u0 u0Var2 = u0.f61170d;
                return ul.b.h(objA5, objA6, objA7, vVar, wVar, -1, str, objA8, objA9, objA10, objA11, objA12, objA13, e0.a(u0Var, e0.o, bVar3));
            case 7:
                y1.b bVar6 = (y1.b) obj;
                m0 m0Var = (m0) obj2;
                g0 g0VarD = m0Var.d();
                ab.c0 c0Var = e0.f75863h;
                return ul.b.h(e0.a(g0VarD, c0Var, bVar6), e0.a(m0Var.a(), c0Var, bVar6), e0.a(m0Var.b(), c0Var, bVar6), e0.a(m0Var.c(), c0Var, bVar6));
            case 8:
                return Integer.valueOf(SesameLiteImpl.getSuggestedLinkResults$lambda$40((SesameLiteImpl.JoinedResult) obj, (SesameLiteImpl.JoinedResult) obj2));
            case 9:
                o0.u uVar2 = ((o0.z) obj2).f78835c;
                return ul.b.Q(uVar2.f78815b, uVar2.f78817d);
            case 10:
                b3.h0 h0Var = AppSearchResultsView.f46177o0;
                return Integer.valueOf(Intrinsics.h(((r10.q0) obj).f(), ((r10.q0) obj2).f()));
            case 11:
                u1 u1Var = (u1) obj2;
                return ul.b.Q(Float.valueOf(u1Var.a()), Boolean.valueOf(((d1) ((s2) u1Var.f88231f).getValue()) == d1.f56493a));
            case 12:
                return Boolean.valueOf(((Boolean) obj).booleanValue() || (((CoroutineContext.Element) obj2) instanceof t70.x));
            case 13:
                CoroutineContext coroutineContext = (CoroutineContext) obj;
                CoroutineContext.Element element = (CoroutineContext.Element) obj2;
                return element instanceof t70.x ? coroutineContext.plus(((ti3) ((t70.x) element)).copyForChild()) : coroutineContext.plus(element);
            case 14:
                return Integer.valueOf(((Integer) obj).intValue() + 1);
            case 15:
                y1.d dVar = (y1.d) obj2;
                Map map = dVar.f96563a;
                z.o0 o0Var = dVar.f96564b;
                Object[] objArr = o0Var.f97867b;
                Object[] objArr2 = o0Var.f97868c;
                long[] jArr = o0Var.f97866a;
                int length = jArr.length - 2;
                if (length >= 0) {
                    int i5 = 0;
                    while (true) {
                        long j11 = jArr[i5];
                        if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                            int i11 = 8 - ((~(i5 - length)) >>> 31);
                            for (int i12 = 0; i12 < i11; i12++) {
                                if ((255 & j11) < 128) {
                                    int i13 = (i5 << 3) + i12;
                                    Object obj4 = objArr[i13];
                                    Map mapD = ((y1.e) objArr2[i13]).d();
                                    if (mapD.isEmpty()) {
                                        map.remove(obj4);
                                    } else {
                                        map.put(obj4, mapD);
                                    }
                                }
                                j11 >>= 8;
                            }
                            if (i11 == 8) {
                                if (i5 != length) {
                                    i5++;
                                }
                            }
                        }
                    }
                }
                if (map.isEmpty()) {
                    return null;
                }
                return map;
            case 16:
                return obj2;
            case 17:
                CoroutineContext.Element element2 = (CoroutineContext.Element) obj2;
                if (!(element2 instanceof j2)) {
                    return obj;
                }
                Integer num = obj instanceof Integer ? (Integer) obj : null;
                int iIntValue = num != null ? num.intValue() : 1;
                return iIntValue == 0 ? element2 : Integer.valueOf(iIntValue + 1);
            case 18:
                j2 j2Var = (j2) obj;
                CoroutineContext.Element element3 = (CoroutineContext.Element) obj2;
                if (j2Var != null) {
                    return j2Var;
                }
                if (element3 instanceof j2) {
                    return (j2) element3;
                }
                return null;
            default:
                y70.a0 a0Var = (y70.a0) obj;
                CoroutineContext.Element element4 = (CoroutineContext.Element) obj2;
                if (element4 instanceof j2) {
                    j2 j2Var2 = (j2) element4;
                    Object objUpdateThreadContext = j2Var2.updateThreadContext(a0Var.f96783a);
                    Object[] objArr3 = a0Var.f96784b;
                    int i14 = a0Var.f96786d;
                    objArr3[i14] = objUpdateThreadContext;
                    j2[] j2VarArr = a0Var.f96785c;
                    a0Var.f96786d = i14 + 1;
                    j2VarArr[i14] = j2Var2;
                }
                return a0Var;
        }
    }
}
