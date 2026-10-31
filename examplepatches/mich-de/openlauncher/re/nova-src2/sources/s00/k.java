package s00;

import android.content.Context;
import android.provider.Settings;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b10.j0;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.ui.screens.k0;
import com.teslacoilsw.launcher.novasettings.gestures.ChooseActionIntentContract;
import com.teslacoilsw.launcher.util.NamedIntent;
import cw.r3;
import e00.p;
import e00.r0;
import e00.r5;
import e10.a3;
import e10.s2;
import e10.y2;
import e10.z2;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import mx.c0;
import p1.a0;
import p1.e1;
import p1.g1;
import p1.n;
import p1.o;
import p1.o0;
import p1.t;
import p1.t1;
import pu.f0;
import q00.l;
import t00.y;

/* loaded from: classes4.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final List f86560a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f86561b;

    static {
        r5 r5VarI = e0.i(d.f86531a);
        r5 r5VarJ = e0.j(2132019165, 0, d.f86532b, 14);
        y2.f51877a.getClass();
        f86560a = ul.b.Q(r5VarI, r5VarJ, d(2132019238, 2131231574, y2.p0(), 16), e0.j(2132019239, 2132019240, d.f86534d, 12), e0.j(2132019261, 0, d.f86535e, 14), e0.i(d.f86536f), e0.i(d.f86537g), d(2132017948, 2131231582, y2.B0(), 24), d(2132017944, 2131231573, y2.v0(), 24), e0.j(0, 0, d.f86540j, 14), d(2132017935, 2131231570, y2.m0(), 24), d(2132017937, 2131231572, y2.o0(), 24), d(2132017936, 2131231571, y2.n0(), 24), d(2132017949, 2131231581, y2.A0(), 24), d(2132017945, 2131231580, y2.z0(), 24), d(2132017940, 2131231577, y2.r0(), 24), d(2132017941, 2131231578, y2.s0(), 24), d(2132017942, 2131231569, y2.t0(), 24), d(2132017943, 2131231568, y2.u0(), 24));
        f86561b = v30.e.q(Settings.System.class, "KEY_MENU_LONG_PRESS_ACTION", null) != null;
    }

    public static final void a(final int i5, int i11, s2 s2Var, boolean z11, Function0 function0, o oVar, final int i12, final int i13) {
        int i14;
        final int i15;
        final s2 s2Var2;
        final boolean z12;
        final Function0 function02;
        t tVar = (t) oVar;
        tVar.d0(535901195);
        int i16 = (tVar.d(i5) ? 4 : 2) | i12 | (tVar.d(i11) ? 32 : 16) | (tVar.h(s2Var) ? 256 : 128);
        if ((i12 & 3072) == 0) {
            i16 |= ((i13 & 8) == 0 && tVar.g(z11)) ? 2048 : 1024;
        }
        int i17 = i13 & 16;
        if (i17 != 0) {
            i14 = i16 | 24576;
        } else {
            i14 = i16 | (tVar.h(function0) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE);
        }
        if ((i14 & 9363) == 9362 && tVar.E()) {
            tVar.V();
            function02 = function0;
            z12 = z11;
            s2Var2 = s2Var;
            i15 = i11;
        } else {
            tVar.X();
            if ((i12 & 1) == 0 || tVar.B()) {
                if ((i13 & 8) != 0) {
                    z11 = !a3.f51435a.f51552h;
                    i14 &= -7169;
                }
                if (i17 != 0) {
                    function0 = null;
                }
            } else {
                tVar.V();
                if ((i13 & 8) != 0) {
                    i14 &= -7169;
                }
            }
            boolean z13 = z11;
            Function0 function03 = function0;
            tVar.q();
            b(x7.f.Y(tVar, i5), i11, s2Var, z13, function03, tVar, i14 & 65520);
            i15 = i11;
            s2Var2 = s2Var;
            z12 = z13;
            function02 = function03;
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2() { // from class: s00.g
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    k.a(i5, i15, s2Var2, z12, function02, (o) obj, a0.l(i12 | 1), i13);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void b(String str, int i5, s2 s2Var, boolean z11, Function0 function0, o oVar, int i11) {
        int i12;
        x1.e eVar;
        t tVar = (t) oVar;
        tVar.d0(-1407423339);
        if ((i11 & 6) == 0) {
            i12 = (tVar.f(str) ? 4 : 2) | i11;
        } else {
            i12 = i11;
        }
        if ((i11 & 48) == 0) {
            i12 |= tVar.d(i5) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i12 |= tVar.h(s2Var) ? 256 : 128;
        }
        if ((i11 & 3072) == 0) {
            i12 |= tVar.g(z11) ? 2048 : 1024;
        }
        if ((i11 & 24576) == 0) {
            i12 |= tVar.h(function0) ? 16384 : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((i12 & 9363) == 9362 && tVar.E()) {
            tVar.V();
        } else {
            tVar.X();
            if ((i11 & 1) != 0 && !tVar.B()) {
                tVar.V();
            }
            tVar.q();
            tVar.b0(-1180187305);
            e1 e1VarA = androidx.compose.runtime.d.a(s2Var.c(), s2Var.l(), null, tVar, 0, 2);
            l lVar = new l(s2Var, e1VarA);
            tVar.p(false);
            String strA = ((NamedIntent) e1VarA.getValue()).a((Context) tVar.j(AndroidCompositionLocals_androidKt.f14166b));
            if (c0.c(((NamedIntent) s2Var.l()).f46369b) == c0.SCREEN_OFF) {
                eVar = d.f86542l;
            } else {
                String strD = s2Var.d();
                y2.f51877a.getClass();
                eVar = (strD.equals(y2.v0().d()) && c0.c(((NamedIntent) s2Var.l()).f46369b) == c0.EXPAND_STATUS_BAR) ? d.o : null;
            }
            ChooseActionIntentContract chooseActionIntentContract = new ChooseActionIntentContract();
            tVar.b0(450803343);
            boolean zF = ((i12 & 57344) == 16384) | tVar.f(lVar);
            Object objP = tVar.P();
            g1 g1Var = n.f81514a;
            if (zF || objP == g1Var) {
                objP = new f0(6, function0, lVar);
                tVar.m0(objP);
            }
            tVar.p(false);
            h.k kVarA0 = z2.A0(chooseActionIntentContract, (Function1) objP, tVar, 0);
            x1.e eVarD = x1.f.d(761208659, new j0(i5, 5), tVar);
            x1.e eVarD2 = x1.f.d(-1847858702, new r0(str, strA, 16), tVar);
            tVar.b0(450817916);
            boolean zH = tVar.h(kVarA0) | ((i12 & 14) == 4);
            Object objP2 = tVar.P();
            if (zH || objP2 == g1Var) {
                objP2 = new k5.d(29, kVarA0, str);
                tVar.m0(objP2);
            }
            tVar.p(false);
            ky.l.d(null, false, eVarD, eVarD2, z11, (Function0) objP2, null, eVar, null, tVar, ((i12 << 3) & 57344) | 3456, 323);
            tVar = tVar;
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new k0(str, i5, s2Var, z11, function0, i11);
        }
    }

    public static final void c(p6.t tVar, r3 r3Var, String str, o oVar, int i5) {
        t tVar2 = (t) oVar;
        tVar2.d0(1734839768);
        int i11 = (tVar2.h(tVar) ? 4 : 2) | i5 | (tVar2.h(r3Var) ? 32 : 16) | (tVar2.f(str) ? 256 : 128);
        if ((i11 & 147) == 146 && tVar2.E()) {
            tVar2.V();
        } else {
            t00.a0 a0VarP = ps.j0.p(str, tVar2);
            Object objP = tVar2.P();
            if (objP == n.f81514a) {
                objP = o0.i(EmptyCoroutineContext.f71803a, tVar2);
                tVar2.m0(objP);
            }
            a0VarP.a((t70.j0) objP, tVar2, 0);
            z2.h(2132019223, tVar, null, null, null, null, x1.f.d(-1448482597, new i(new y(tVar, a0VarP, r3Var), 0), tVar2), tVar2, ((i11 << 3) & 112) | 1572864, 60);
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p(tVar, r3Var, str, i5, 6);
        }
    }

    public static r5 d(int i5, int i11, s2 s2Var, int i12) {
        return e0.j(i5, 0, new x1.e(new j(i11, s2Var, (i12 & 8) == 0), true, -335294327), 14);
    }
}
