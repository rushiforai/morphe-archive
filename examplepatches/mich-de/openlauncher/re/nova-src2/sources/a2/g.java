package a2;

import ai.r4;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.os.Build;
import android.view.View;
import android.widget.Toast;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import b.u4;
import b10.k2;
import c3.m3;
import com.moloco.sdk.internal.D;
import com.moloco.sdk.internal.publisher.y;
import com.moloco.sdk.publisher.MolocoInitStatus;
import com.moloco.sdk.publisher.MolocoInitializationListener;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.U;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.w;
import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingActivity;
import com.teslacoilsw.launcher.NovaApplication;
import cy.v;
import d00.x;
import e0.l0;
import e10.a3;
import h6.u;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import p1.a2;
import p1.e1;
import p1.f2;
import p1.g2;
import p1.i2;
import p1.o2;
import p1.t;
import p1.y2;
import pp.r;
import t70.j0;
import t70.m0;
import u10.e0;
import u10.p0;
import z2.g1;

/* loaded from: classes2.dex */
public final /* synthetic */ class g implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f108a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f109b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f110c;

    public /* synthetic */ g(int i5, Object obj, Object obj2) {
        this.f108a = i5;
        this.f109b = obj;
        this.f110c = obj2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0325 A[LOOP:2: B:121:0x02f6->B:138:0x0325, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0316 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:165:0x02ce A[SYNTHETIC] */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() throws FileNotFoundException {
        Collection collection;
        Object[] objArr;
        Object[] objArr2;
        int i5 = this.f108a;
        n nVar = null;
        Object[] objArr3 = 0;
        int i11 = 1;
        Object obj = this.f110c;
        Object obj2 = this.f109b;
        switch (i5) {
            case 0:
                t tVar = ((i) obj2).f112a;
                g2 g2Var = tVar.f81555c;
                if (!tVar.C) {
                    return EmptyList.f71733a;
                }
                f2 f2VarD = g2Var.d();
                try {
                    Ref.IntRef intRef = new Ref.IntRef();
                    while (true) {
                        int i12 = intRef.f71861a;
                        if (i12 >= g2Var.f81428b) {
                            Unit unit = Unit.f71706a;
                            break;
                        } else {
                            if (f2VarD.l(i12)) {
                                Object objN = f2VarD.n(intRef.f71861a);
                                if (objN == obj) {
                                    objArr2 = true;
                                    if (objArr2 != false) {
                                        n nVar2 = new n(intRef.f71861a, null);
                                        f2VarD.c();
                                        nVar = nVar2;
                                    }
                                } else {
                                    a2 a2Var = objN instanceof a2 ? (a2) objN : null;
                                    if ((a2Var != null ? a2Var.f81381a : null) == obj) {
                                        objArr2 = true;
                                        if (objArr2 != false) {
                                        }
                                    } else {
                                        objArr2 = false;
                                        if (objArr2 != false) {
                                        }
                                    }
                                }
                            }
                            int i13 = intRef.f71861a;
                            int[] iArr = f2VarD.f81410b;
                            int iC = i2.c(iArr, i13);
                            int i14 = i13 + 1;
                            int i15 = (i14 < f2VarD.f81411c ? iArr[(i14 * 5) + 4] : f2VarD.f81413e) - iC;
                            for (int i16 = 0; i16 < i15; i16++) {
                                Object objH = f2VarD.h(intRef.f71861a, i16);
                                if (objH == obj) {
                                    objArr = true;
                                    if (objArr == true) {
                                        nVar = new n(intRef.f71861a, Integer.valueOf(i16));
                                        break;
                                    }
                                } else {
                                    a2 a2Var2 = objH instanceof a2 ? (a2) objH : null;
                                    if ((a2Var2 != null ? a2Var2.f81381a : null) == obj) {
                                        objArr = true;
                                        if (objArr == true) {
                                        }
                                    } else {
                                        objArr = false;
                                        if (objArr == true) {
                                        }
                                    }
                                }
                            }
                            intRef.f71861a++;
                        }
                    }
                    if (nVar == null) {
                        return EmptyList.f71733a;
                    }
                    int i17 = nVar.f116a;
                    Integer num = nVar.f117b;
                    if (tVar.C) {
                        f2 f2VarD2 = g2Var.d();
                        try {
                            ArrayList arrayListF = b.f(f2VarD2, i17, num);
                            f2VarD2.c();
                            collection = arrayListF;
                        } finally {
                        }
                    } else {
                        collection = EmptyList.f71733a;
                    }
                    return b70.g.t1(tVar.I(), collection);
                } finally {
                }
            case 1:
                ((h.k) obj2).a(((SnapshotStateList) obj).toArray(new String[0]), null);
                return Unit.f71706a;
            case 2:
                m0.t((j0) obj2, null, null, new b10.j((k2) obj, objArr3 == true ? 1 : 0, i11), 3);
                return Unit.f71706a;
            case 3:
                ((Function1) obj2).invoke((cy.m0) obj);
                return Unit.f71706a;
            case 4:
                ((Context) obj2).unregisterReceiver((b30.b) obj);
                return Unit.f71706a;
            case 5:
                ((Context) obj2).unregisterReceiver((r4) obj);
                return Unit.f71706a;
            case 6:
                ((v70.m) obj2).j(obj);
                return Unit.f71706a;
            case 7:
                return D.a((View) obj2, (D) obj);
            case 8:
                return y.b((MolocoInitializationListener) obj2, (MolocoInitStatus) obj);
            case 9:
                return U.a.a((View) obj2, (U.a.ViewOnAttachStateChangeListenerC0194a) obj);
            case 10:
                return U.b.a((u) obj2, (m3) obj);
            case 11:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.a.a((String) obj2, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.ad.a) obj);
            case 12:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.e.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.e) obj2, (e.a) obj);
            case 13:
                return k.b.a.a((View) obj2, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.k) obj);
            case 14:
                return w.a.a((View) obj2, (c0) obj);
            case 15:
                ((cw.h) obj2).getClass();
                t3.a aVarC = t3.c.f88513a.p().c();
                String language = aVarC.f88509a.getLanguage();
                Locale locale = Locale.ROOT;
                String lowerCase = language.toLowerCase(locale);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                String upperCase = aVarC.f88509a.getCountry().toUpperCase(locale);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                ((Context) obj).startActivity(new Intent("android.intent.action.VIEW", Uri.parse(String.format("https://static.afterpay.com/modal/%s.html", Arrays.copyOf(new Object[]{u4.m(lowerCase, "_", upperCase)}, 1)))));
                return Unit.f71706a;
            case 16:
                ((bw.e) obj2).a((Context) obj);
                return Unit.f71706a;
            case 17:
                ((SharedPreferences) obj2).unregisterOnSharedPreferenceChangeListener((v) obj);
                return Unit.f71706a;
            case 18:
                try {
                    ((d00.g) obj2).f48687a.startActivity((Intent) obj);
                } catch (Exception e3) {
                    mc0.d.f76206a.p(e3, "NovaMobile: failed to launch eSIM activation", new Object[0]);
                }
                return Unit.f71706a;
            case 19:
                ((NovaApplication) obj2).registerActivityLifecycleCallbacks(new x((Context) obj));
                return Unit.f71706a;
            case 20:
                e1 e1Var = (e1) obj;
                ArrayList arrayListU1 = b70.g.u1(wh.f.P(), (g20.a) obj2);
                SharedPreferences.Editor editorEdit = a3.f51435a.f51545a.edit();
                ArrayList arrayList = new ArrayList(b70.c.u0(arrayListU1, 10));
                Iterator it = arrayListU1.iterator();
                while (it.hasNext()) {
                    arrayList.add(((g20.a) it.next()).toString());
                }
                editorEdit.putStringSet("ignored_card_nag_integration", b70.g.N1(arrayList)).apply();
                e1Var.setValue(Boolean.TRUE);
                return Unit.f71706a;
            case 21:
                p0 p0Var = (p0) ((e0) obj);
                ((b20.e) obj2).i(x10.a.f94977a.c(p0Var.f90406c, p0Var.f90407d), r.f82773j, null);
                return Unit.f71706a;
            case 22:
                PollingActivity pollingActivity = (PollingActivity) obj2;
                if (((dv.n) ((y2) obj).getValue()).f49623c == dv.m.f49618c) {
                    ((dv.w) pollingActivity.f44937q.getValue()).f();
                }
                return Unit.f71706a;
            case 23:
                ((Ref.ObjectRef) obj2).f71863a = b3.g.c((l0) obj, g1.f98069a);
                return Unit.f71706a;
            case 24:
                Context context = (Context) obj;
                ((q2.a) obj2).a(0);
                e10.y2.f51877a.getClass();
                e10.y2.H0().i(Boolean.valueOf(!((Boolean) e10.y2.H0().l()).booleanValue()));
                Toast.makeText(context.getApplicationContext(), context.getString(((Boolean) e10.y2.H0().l()).booleanValue() ? 2132019253 : 2132019252), 0).show();
                return Unit.f71706a;
            case 25:
                Object obj3 = ((List) obj2).get(3);
                Intrinsics.e(obj3, "null cannot be cast to non-null type kotlin.String");
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse((String) obj3));
                intent.addFlags(268435456);
                ((Context) obj).startActivity(intent);
                return Unit.f71706a;
            case 26:
                ((ay.r) obj2).c((Context) obj);
                return Unit.f71706a;
            case 27:
                w20.l lVar = (w20.l) obj2;
                Context context2 = (Context) obj;
                if (Build.VERSION.SDK_INT < 33 || lVar.a(context2)) {
                    e00.t.c(context2);
                } else {
                    lVar.c();
                }
                return Unit.f71706a;
            case 28:
                zy.c cVar = zy.c.f98823a;
                ((e1) obj2).setValue(zy.c.b());
                ((o2) obj).p(0);
                return Unit.f71706a;
            default:
                Context context3 = (Context) obj;
                if (((PackageInfo) obj2) != null) {
                    Intent intent2 = new Intent("ninja.sesame.app.action.OPEN_SETTINGS");
                    intent2.setPackage("ninja.sesame.app.edge");
                    cl.l0.Q(context3, intent2);
                } else {
                    Intent intentN = ps.c.n("ninja.sesame.app.edge");
                    intentN.addFlags(268468224);
                    cl.l0.Q(context3, intentN);
                }
                return Unit.f71706a;
        }
    }
}
