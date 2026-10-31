package x00;

import android.content.Context;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b2.r;
import b3.i;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.vungle.ads.internal.protos.Sdk;
import e10.s2;
import e10.y2;
import java.util.Collection;
import java.util.List;
import k0.k;
import k0.w;
import k0.x;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.internal.Intrinsics;
import p1.a0;
import p1.e1;
import p1.g1;
import p1.n;
import p1.n1;
import p1.o;
import p1.o0;
import p1.t;
import q00.l;

/* loaded from: classes4.dex */
public final class a implements Function6 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f94905b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f94906c = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94907a;

    public /* synthetic */ a(int i5) {
        this.f94907a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0227  */
    @Override // kotlin.jvm.functions.Function6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        int i5 = this.f94907a;
        g1 g1Var = n.f81514a;
        Continuation continuation = null;
        switch (i5) {
            case 0:
                String str = (String) obj;
                String str2 = (String) obj2;
                g gVar = (g) obj3;
                ((Number) obj4).intValue();
                o oVar = (o) obj5;
                int iIntValue = ((Number) obj6).intValue();
                int i11 = (iIntValue & 6) == 0 ? (((t) oVar).f(str) ? 4 : 2) | iIntValue : iIntValue;
                if ((iIntValue & 48) == 0) {
                    i11 |= ((t) oVar).f(str2) ? 32 : 16;
                }
                if ((iIntValue & 384) == 0) {
                    i11 |= ((t) oVar).f(gVar) ? 256 : 128;
                }
                if ((i11 & 8339) == 8338) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        t tVar2 = (t) oVar;
                        Context context = (Context) tVar2.j(AndroidCompositionLocals_androidKt.f14166b);
                        l lVar = gVar.f94924d;
                        y2.f51877a.getClass();
                        s2 s2VarK = y2.k();
                        tVar2.b0(-1180187305);
                        l lVar2 = new l(s2VarK, androidx.compose.runtime.d.a(s2VarK.c(), s2VarK.l(), null, tVar2, 0, 2));
                        tVar2.p(false);
                        tVar2.b0(-1622737361);
                        boolean zH = ((i11 & 896) == 256) | tVar2.h(context);
                        Object objP = tVar2.P();
                        if (zH || objP == g1Var) {
                            objP = new a1.c(gVar, context, continuation, 7);
                            tVar2.m0(objP);
                        }
                        tVar2.p(false);
                        h.b(str, str2, lVar, lVar2, (Function1) objP, null, tVar2, i11 & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 32);
                    }
                }
                break;
            default:
                g gVar2 = (g) obj3;
                ((Number) obj4).intValue();
                o oVar2 = (o) obj5;
                int iIntValue2 = ((Number) obj6).intValue();
                if ((iIntValue2 & 384) == 0) {
                    iIntValue2 |= ((t) oVar2).f(gVar2) ? 256 : 128;
                }
                if ((iIntValue2 & 8321) == 8320) {
                    t tVar3 = (t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        t tVar4 = (t) oVar2;
                        Context context2 = (Context) tVar4.j(AndroidCompositionLocals_androidKt.f14166b);
                        x xVarA = w.a(k.f70657c, b2.d.f17009m, tVar4, 0);
                        int iHashCode = Long.hashCode(tVar4.T);
                        n1 n1VarL = tVar4.l();
                        b2.t tVarI = fg.a.I(r.f17024a, tVar4);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar4.f0();
                        if (tVar4.S) {
                            tVar4.k(function0);
                        } else {
                            tVar4.p0();
                        }
                        a0.j(xVarA, b3.k.f17275g, tVar4);
                        a0.j(n1VarL, b3.k.f17274f, tVar4);
                        i iVar = b3.k.f17278j;
                        if (tVar4.S || !Intrinsics.b(tVar4.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar4, iHashCode, iVar);
                        }
                        a0.j(tVarI, b3.k.f17272d, tVar4);
                        tVar4.b0(1542825061);
                        if (!((Collection) ((p1.s2) gVar2.f94925e).getValue()).isEmpty()) {
                            ky.l.d(null, false, null, d.f94915b, false, null, null, null, null, tVar4, 3072, PglCryptUtils.COMPRESS_FAILED);
                            for (np.d dVar : (List) ((p1.s2) gVar2.f94925e).getValue()) {
                                np.c cVar = np.d.Companion;
                                h.a(dVar, null, null, tVar4, 8, 6);
                            }
                            tVar4 = tVar4;
                        }
                        tVar4.p(false);
                        ky.l.d(null, false, null, d.f94916c, false, null, null, null, null, tVar4, 3072, PglCryptUtils.COMPRESS_FAILED);
                        tVar4.b0(1542848941);
                        Object objP2 = tVar4.P();
                        if (objP2 == g1Var) {
                            objP2 = androidx.compose.runtime.d.k(null);
                            tVar4.m0(objP2);
                        }
                        e1 e1Var = (e1) objP2;
                        tVar4.p(false);
                        Unit unit = Unit.f71706a;
                        tVar4.b0(1542852483);
                        boolean zH2 = tVar4.h(context2);
                        Object objP3 = tVar4.P();
                        if (zH2 || objP3 == g1Var) {
                            objP3 = new c(context2, null, e1Var);
                            tVar4.m0(objP3);
                        }
                        tVar4.p(false);
                        o0.f(unit, (Function2) objP3, tVar4);
                        Pair pair = (Pair) e1Var.getValue();
                        tVar4.b0(1542868934);
                        if (pair != null) {
                            np.d dVar2 = (np.d) pair.f71683a;
                            String strY = x7.f.Y(tVar4, 2132017806);
                            String strY2 = x7.f.Y(tVar4, 2132017808);
                            np.c cVar2 = np.d.Companion;
                            t tVar5 = tVar4;
                            h.a(dVar2, strY, strY2, tVar5, 8, 0);
                            h.a((np.d) pair.f71684b, x7.f.Y(tVar4, 2132017806), x7.f.Y(tVar4, 2132017807), tVar5, 8, 0);
                        }
                        tVar4.p(false);
                        tVar4.p(true);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
