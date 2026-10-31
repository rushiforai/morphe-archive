package s00;

import android.content.Context;
import android.view.ViewConfiguration;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b2.r;
import b3.l;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.teslacoilsw.launcher.preferences.fragments.SettingsGestures;
import e10.s2;
import e10.y2;
import e10.z2;
import k0.w;
import k0.x;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import p1.a0;
import p1.n;
import p1.n1;
import p1.o;
import p1.t;
import t00.y;

/* loaded from: classes4.dex */
public final class b implements Function6 {

    /* renamed from: b, reason: collision with root package name */
    public static final b f86523b = new b(0);

    /* renamed from: c, reason: collision with root package name */
    public static final b f86524c = new b(1);

    /* renamed from: d, reason: collision with root package name */
    public static final b f86525d = new b(2);

    /* renamed from: e, reason: collision with root package name */
    public static final b f86526e = new b(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86527a;

    public /* synthetic */ b(int i5) {
        this.f86527a = i5;
    }

    @Override // kotlin.jvm.functions.Function6
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        t tVar;
        switch (this.f86527a) {
            case 0:
                y yVar = (y) obj3;
                ((Number) obj4).intValue();
                o oVar = (o) obj5;
                ((Number) obj6).intValue();
                x xVarA = w.a(k0.k.f70657c, b2.d.f17009m, oVar, 0);
                t tVar2 = (t) oVar;
                int iHashCode = Long.hashCode(tVar2.T);
                n1 n1VarL = tVar2.l();
                b2.t tVarI = fg.a.I(r.f17024a, oVar);
                l.Po.getClass();
                Function0 function0 = b3.k.f17270b;
                tVar2.f0();
                if (tVar2.S) {
                    tVar2.k(function0);
                } else {
                    tVar2.p0();
                }
                a0.j(xVarA, b3.k.f17275g, oVar);
                a0.j(n1VarL, b3.k.f17274f, oVar);
                b3.i iVar = b3.k.f17278j;
                if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                    a2.c.u(iHashCode, tVar2, iHashCode, iVar);
                }
                a0.j(tVarI, b3.k.f17272d, oVar);
                if (((Boolean) y2.f51877a.w().l()).booleanValue()) {
                    tVar2.b0(-1824913041);
                    tVar = tVar2;
                    ky.l.d(null, false, d.f86538h, d.f86539i, false, null, null, null, null, oVar, 3456, 499);
                    tVar.p(false);
                } else {
                    tVar2.b0(-1825376615);
                    k.a(2132017946, 2131231575, y2.x0(), false, yVar.f88425b, oVar, 0, 8);
                    k.a(2132017947, 2131231579, y2.y0(), false, yVar.f88425b, oVar, 0, 8);
                    tVar2.p(false);
                    tVar = tVar2;
                }
                tVar.p(true);
                break;
            case 1:
                ((Number) obj4).intValue();
                z2.c(((Number) obj6).intValue() & 14, 2, null, (String) obj, (o) obj5);
                break;
            case 2:
                ((Number) obj4).intValue();
                int iIntValue = ((Number) obj6).intValue();
                y2.f51877a.getClass();
                s2 s2Var = y2.i1;
                KProperty kProperty = y2.f51881b[108];
                s2Var.getClass();
                bh.g.b((String) obj, s2Var, null, false, false, (String) obj2, d.f86533c, null, null, (o) obj5, (iIntValue & 14) | 1572864 | ((iIntValue << 12) & 458752), TTAdConstant.IMAGE_URL_CODE);
                break;
            default:
                ((Number) obj4).intValue();
                ((Number) obj6).intValue();
                t tVar3 = (t) ((o) obj5);
                Context context = (Context) tVar3.j(AndroidCompositionLocals_androidKt.f14166b);
                tVar3.b0(-1337724251);
                Object objP = tVar3.P();
                if (objP == n.f81514a) {
                    objP = Boolean.valueOf(ViewConfiguration.get(context).hasPermanentMenuKey() || k.f86561b || SettingsGestures.f46097k);
                    tVar3.m0(objP);
                }
                boolean zBooleanValue = ((Boolean) objP).booleanValue();
                tVar3.p(false);
                if (zBooleanValue) {
                    y2.f51877a.getClass();
                    k.a(2132019261, 2131231576, y2.q0(), false, null, tVar3, 3072, 16);
                }
                break;
        }
        return Unit.f71706a;
    }
}
