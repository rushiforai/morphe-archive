package ps;

import android.content.Context;
import android.icu.text.MessageFormat;
import android.text.TextUtils;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import c3.c3;
import c3.z1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.desktoppreview.DesktopLockBottomSheet;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import e10.y2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import l1.g4;
import o9.n1;
import p1.e1;
import p1.t1;
import p6.z0;
import r10.y1;
import w70.q1;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static ph.d f82912a;

    public static final void a(final b2.t modifier, final lw.l bottomSheetState, final es.z initialDestination, final m appBarState, ru.d eventReporter, final Function0 onBackPressed, final Function1 moveToWeb, final Function0 goBack, final Function1 onNavBackStackEntryChanged, final q1 navigationChannel, final Function1 handleViewAction, final Function2 navigate, final Function0 dismiss, final Function1 dismissWithResult, final Function0 getLinkAccount, final Function0 changeEmail, p1.o oVar, final int i5, final int i11) {
        int i12;
        int i13;
        p1.t tVar;
        final ru.d dVar;
        Intrinsics.g(modifier, "modifier");
        Intrinsics.g(bottomSheetState, "bottomSheetState");
        Intrinsics.g(initialDestination, "initialDestination");
        Intrinsics.g(appBarState, "appBarState");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(onBackPressed, "onBackPressed");
        Intrinsics.g(moveToWeb, "moveToWeb");
        Intrinsics.g(goBack, "goBack");
        Intrinsics.g(onNavBackStackEntryChanged, "onNavBackStackEntryChanged");
        Intrinsics.g(navigationChannel, "navigationChannel");
        Intrinsics.g(handleViewAction, "handleViewAction");
        Intrinsics.g(navigate, "navigate");
        Intrinsics.g(dismiss, "dismiss");
        Intrinsics.g(dismissWithResult, "dismissWithResult");
        Intrinsics.g(getLinkAccount, "getLinkAccount");
        Intrinsics.g(changeEmail, "changeEmail");
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(498725081);
        if ((i5 & 6) == 0) {
            i12 = i5 | (tVar2.f(modifier) ? 4 : 2);
        } else {
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= (i5 & 64) == 0 ? tVar2.f(bottomSheetState) : tVar2.h(bottomSheetState) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i12 |= tVar2.h(initialDestination) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i12 |= tVar2.h(appBarState) ? 2048 : 1024;
        }
        int i14 = i5 & 24576;
        int i15 = UserMetadata.MAX_INTERNAL_KEY_SIZE;
        if (i14 == 0) {
            i12 |= (32768 & i5) == 0 ? tVar2.f(eventReporter) : tVar2.h(eventReporter) ? 16384 : 8192;
        }
        int i16 = 196608 & i5;
        int i17 = SQLiteDatabase.OPEN_FULLMUTEX;
        if (i16 == 0) {
            i12 |= tVar2.h(onBackPressed) ? 131072 : 65536;
        }
        if ((1572864 & i5) == 0) {
            i12 |= tVar2.h(moveToWeb) ? 1048576 : 524288;
        }
        if ((12582912 & i5) == 0) {
            i12 |= tVar2.h(goBack) ? 8388608 : 4194304;
        }
        if ((100663296 & i5) == 0) {
            i12 |= tVar2.h(onNavBackStackEntryChanged) ? 67108864 : 33554432;
        }
        if ((805306368 & i5) == 0) {
            i12 |= tVar2.h(navigationChannel) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456;
        }
        if ((i11 & 6) == 0) {
            i13 = i11 | (tVar2.h(handleViewAction) ? 4 : 2);
        } else {
            i13 = i11;
        }
        if ((i11 & 48) == 0) {
            i13 |= tVar2.h(navigate) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i13 |= tVar2.h(dismiss) ? 256 : 128;
        }
        if ((i11 & 3072) == 0) {
            i13 |= tVar2.h(dismissWithResult) ? 2048 : 1024;
        }
        if ((i11 & 24576) == 0) {
            if (tVar2.h(getLinkAccount)) {
                i15 = 16384;
            }
            i13 |= i15;
        }
        if (tVar2.h(changeEmail)) {
            i17 = 131072;
        }
        int i18 = i13 | i17;
        if ((i12 & 306783379) == 306783378 && (74899 & i18) == 74898 && tVar2.E()) {
            tVar2.V();
            dVar = eventReporter;
            tVar = tVar2;
        } else {
            p6.l0 l0VarP = i0.p(new z0[0], tVar2);
            tVar2.b0(-443494456);
            Object obj = (c3) tVar2.j(z1.f19503p);
            tVar2.b0(-1707824022);
            Object obj2 = (View) tVar2.j(AndroidCompositionLocals_androidKt.f14170f);
            tVar2.b0(-411248270);
            Object objP = tVar2.P();
            Object obj3 = p1.n.f81514a;
            if (objP == obj3) {
                objP = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar2.m0(objP);
            }
            e1 e1Var = (e1) objP;
            tVar2.p(false);
            tVar2.b0(-411245819);
            boolean zH = tVar2.h(obj2);
            Object objP2 = tVar2.P();
            if (zH || objP2 == obj3) {
                objP2 = new pu.f0(4, obj2, e1Var);
                tVar2.m0(objP2);
            }
            tVar2.p(false);
            p1.o0.b(obj2, (Function1) objP2, tVar2);
            tVar2.p(false);
            tVar2.b0(-268282668);
            boolean zF = tVar2.f(obj);
            Object objP3 = tVar2.P();
            if (zF || objP3 == obj3) {
                objP3 = new n0.w(obj, 15);
                tVar2.m0(objP3);
            }
            tVar2.p(false);
            m.w wVar = new m.w((Function0) objP3, e1Var);
            tVar2.p(false);
            tVar2.b0(-12391521);
            boolean z11 = (i18 & 896) == 256;
            Object objP4 = tVar2.P();
            if (z11 || objP4 == obj3) {
                objP4 = new dv.z(dismiss, 9);
                tVar2.m0(objP4);
            }
            tVar2.p(false);
            int i19 = i12 >> 12;
            rw.f.a(navigationChannel, l0VarP, wVar, (Function1) objP4, onNavBackStackEntryChanged, tVar2, ((i12 >> 27) & 14) | (i19 & 57344));
            tVar2.b0(-12387077);
            Object objP5 = tVar2.P();
            Continuation continuation = null;
            if (objP5 == obj3) {
                objP5 = androidx.compose.runtime.d.k(null);
                tVar2.m0(objP5);
            }
            e1 e1Var2 = (e1) objP5;
            tVar2.p(false);
            lw.l lVarS = zg.a.S(null, tVar2, 3);
            Function3 function3 = (Function3) e1Var2.getValue();
            tVar2.b0(-12381382);
            boolean zH2 = tVar2.h(lVarS);
            Object objP6 = tVar2.P();
            if (zH2 || objP6 == obj3) {
                objP6 = new g4(lVarS, e1Var2, continuation, 28);
                tVar2.m0(objP6);
            }
            tVar2.p(false);
            p1.o0.f(function3, (Function2) objP6, tVar2);
            tVar = tVar2;
            dVar = eventReporter;
            android.support.v4.media.session.b.k(dVar, x1.f.d(1093060281, new i(bottomSheetState, dismiss, modifier, l0VarP, appBarState, lVarS, handleViewAction, navigate, dismissWithResult, getLinkAccount, onBackPressed, moveToWeb, goBack, changeEmail, initialDestination, e1Var2), tVar), tVar, (i19 & 14) | 48);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2() { // from class: ps.g
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj4, Object obj5) {
                    ((Integer) obj5).getClass();
                    int iL = p1.a0.l(i5 | 1);
                    int iL2 = p1.a0.l(i11);
                    j.a(modifier, bottomSheetState, initialDestination, appBarState, dVar, onBackPressed, moveToWeb, goBack, onNavBackStackEntryChanged, navigationChannel, handleViewAction, navigate, dismiss, dismissWithResult, getLinkAccount, changeEmail, (p1.o) obj4, iL, iL2);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static Object[] b(Throwable th2, nc.b bVar) {
        ArrayList arrayList = new ArrayList(3);
        arrayList.add(new Pair("exception_name", th2.getClass().getSimpleName()));
        arrayList.add(new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, th2.getMessage()));
        StringWriter stringWriter = new StringWriter();
        th2.printStackTrace(new PrintWriter(stringWriter));
        String string = stringWriter.getBuffer().toString();
        if (!TextUtils.isEmpty(string)) {
            arrayList.add(new Pair("stack_trace", string));
        }
        if (bVar != null) {
            arrayList.add(new Pair("error_code", bVar.f78191a));
        }
        Object[] objArr = new Object[arrayList.size() * 2];
        int i5 = 1;
        int i11 = 0;
        for (int i12 = 0; i12 < arrayList.size(); i12++) {
            Pair pair = (Pair) arrayList.get(i12);
            objArr[i11] = pair.first;
            objArr[i5] = pair.second;
            i11 += 2;
            i5 += 2;
        }
        return objArr;
    }

    public static final y1 c(r10.b0 b0Var, NovaLauncher novaLauncher) {
        return new y1(b0Var.f85241a, b0Var.f85243c, new k5.d(27, b0Var, novaLauncher), b0Var.f85118i, b0Var.f85116g);
    }

    public static final String d(String str) {
        Intrinsics.g(str, "<this>");
        char[] charArray = str.toCharArray();
        Intrinsics.f(charArray, "toCharArray(...)");
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        int i5 = 0;
        for (char c11 : charArray) {
            i5++;
            if (i5 > 1) {
                sb2.append((CharSequence) " ");
            }
            sb2.append(c11);
        }
        sb2.append((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        return sb2.toString();
    }

    public static final boolean e(m3.l0 l0Var, m3.g gVar, m3.p0 p0Var, List list, int i5, boolean z11, int i11, y3.c cVar, y3.n nVar, q3.o oVar, long j11) {
        m3.k0 k0Var = l0Var.f75927a;
        if (l0Var.f75928b.f75947a.a()) {
            return false;
        }
        m3.g gVar2 = k0Var.f75914a;
        long j12 = k0Var.f75923j;
        if (!Intrinsics.b(gVar2, gVar) || !k0Var.f75915b.c(p0Var) || !Intrinsics.b(k0Var.f75916c, list) || k0Var.f75917d != i5 || k0Var.f75918e != z11 || k0Var.f75919f != i11 || !Intrinsics.b(k0Var.f75920g, cVar) || k0Var.f75921h != nVar || !Intrinsics.b(k0Var.f75922i, oVar) || y3.a.j(j11) != y3.a.j(j12)) {
            return false;
        }
        if (z11 || i11 == 2) {
            return y3.a.h(j11) == y3.a.h(j12) && y3.a.g(j11) == y3.a.g(j12);
        }
        return true;
    }

    public static void f(long j11, String str) {
        if (j11 < 0) {
            throw new IllegalArgumentException(str);
        }
    }

    public static final String g(Context context, int i5, int i11) {
        MessageFormat messageFormat = new MessageFormat(context.getResources().getString(i5), Locale.getDefault());
        HashMap map = new HashMap();
        map.put("count", Integer.valueOf(i11));
        return messageFormat.format(map);
    }

    public static boolean i(double d5, int i5, int i11) {
        return d5 >= ((double) i5) && d5 < ((double) i11);
    }

    public static final q3.b0 j(q3.b0 b0Var, q3.b0 b0Var2, float f11) {
        return new q3.b0(kotlin.ranges.a.e0(bh.g.e0(f11, b0Var.f83539a, b0Var2.f83539a), 1, 1000));
    }

    public static final pp.f0 k(String str) {
        y2.f51877a.getClass();
        return str.equals(y2.v0().d()) ? pp.f0.f82726e : str.equals(y2.B0().d()) ? pp.f0.f82727f : str.equals(y2.z0().d()) ? pp.f0.f82728g : str.equals(y2.A0().d()) ? pp.f0.f82729h : str.equals(y2.u0().d()) ? pp.f0.f82730i : str.equals(y2.t0().d()) ? pp.f0.f82731j : str.equals(y2.r0().d()) ? pp.f0.f82732k : str.equals(y2.s0().d()) ? pp.f0.f82733l : str.equals(y2.m0().d()) ? pp.f0.f82725d : str.equals(y2.p0().d()) ? pp.f0.f82724c : str.equals(y2.q0().d()) ? pp.f0.f82734m : str.equals(y2.n0().d()) ? pp.f0.n : str.equals(y2.o0().d()) ? pp.f0.f82727f : str.equals(y2.x0().d()) ? pp.f0.o : str.equals(y2.y0().d()) ? pp.f0.f82735p : pp.f0.f82736q;
    }

    public static DesktopLockBottomSheet l(n1 n1Var) {
        View viewInflate = LayoutInflater.from(n1Var).inflate(2131624089, (ViewGroup) n1Var.P, false);
        Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.desktoppreview.DesktopLockBottomSheet");
        DesktopLockBottomSheet desktopLockBottomSheet = (DesktopLockBottomSheet) viewInflate;
        int dimensionPixelSize = n1Var.getResources().getDimensionPixelSize(2131165420);
        int i5 = DesktopLockBottomSheet.f45718z;
        desktopLockBottomSheet.n = dimensionPixelSize;
        desktopLockBottomSheet.U();
        desktopLockBottomSheet.f79742a = true;
        desktopLockBottomSheet.post(new ry.a(desktopLockBottomSheet, 3));
        return desktopLockBottomSheet;
    }

    public static void m(Context context) {
        context.getSharedPreferences("nova_ai_surfaces", 0).edit().putBoolean("left_swipe_disabled_by_user", false).apply();
        try {
            if (!fo.d.j() || fo.d.g().a() == null) {
                return;
            }
            fo.d.g().c("left_swipe", true);
        } catch (Exception unused) {
        }
    }

    public static void o(NovaLauncher novaLauncher) {
        View viewInflate = LayoutInflater.from(novaLauncher).inflate(2131624089, (ViewGroup) novaLauncher.P, false);
        Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.desktoppreview.DesktopLockBottomSheet");
        DesktopLockBottomSheet desktopLockBottomSheet = (DesktopLockBottomSheet) viewInflate;
        int i5 = DesktopLockBottomSheet.f45718z;
        desktopLockBottomSheet.U();
        desktopLockBottomSheet.f79742a = false;
        desktopLockBottomSheet.post(new ry.a(desktopLockBottomSheet, 2));
    }

    public static byte p(Boolean bool) {
        if (bool != null) {
            return !bool.booleanValue() ? (byte) 0 : (byte) 1;
        }
        return (byte) -1;
    }

    public static Boolean q(byte b11) {
        if (b11 == 0) {
            return Boolean.FALSE;
        }
        if (b11 != 1) {
            return null;
        }
        return Boolean.TRUE;
    }

    public abstract float h(Object obj);

    public abstract void n(Object obj, float f11);
}
