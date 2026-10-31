package a7;

import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import b00.p1;
import b3.h0;
import b3.o;
import c0.c2;
import c0.n;
import com.moloco.sdk.internal.C2928b;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.services.C2961i;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.teslacoilsw.launcher.search.shortcutchips.ShortcutChipsRowView;
import d1.i;
import ey.p;
import g0.a2;
import g20.w;
import h6.o1;
import h6.y0;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Result;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlinx.serialization.descriptors.SerialDescriptorImpl;
import p1.s2;
import p1.t;
import p1.w1;
import p1.y1;
import qx.i1;
import t70.l;
import t70.m;
import t70.m0;
import w70.g2;
import x7.u;

/* loaded from: classes.dex */
public final /* synthetic */ class f implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f439a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f440b;

    public /* synthetic */ f(Object obj, int i5) {
        this.f439a = i5;
        this.f440b = obj;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws InterruptedException, PackageManager.NameNotFoundException {
        PackageInfo packageInfo;
        ApplicationInfo applicationInfo;
        l lVarW;
        Continuation continuation = null;
        int i5 = 0;
        switch (this.f439a) {
            case 0:
                h hVar = (h) this.f440b;
                hVar.getLifecycle().a(new b(hVar, i5));
                return Unit.f71706a;
            case 1:
                p1 p1Var = (p1) this.f440b;
                p1Var.f16436c.g(p1Var.f16435b);
                return Unit.f71706a;
            case 2:
                return ArrayIteratorKt.a((Object[]) this.f440b);
            case 3:
                ((n) this.f440b).f18882f = false;
                return Unit.f71706a;
            case 4:
                return Long.valueOf(((c2) this.f440b).b());
            case 5:
                ((cn.a) this.f440b).f20131a.await();
                return Unit.f71706a;
            case 6:
                return MolocoLogger.b.a((MolocoLogger.b) this.f440b);
            case 7:
                return Boolean.valueOf(C2928b.a((C2928b) this.f440b));
            case 8:
                return Boolean.valueOf(C2961i.a((C2961i) this.f440b));
            case 9:
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.c.a((com.moloco.sdk.xenoss.sdkdevkit.android.core.c) this.f440b);
            case 10:
                i iVar = (i) this.f440b;
                iVar.f48797p = null;
                o.f(iVar).invalidateSemantics$ui_release();
                o.f(iVar).invalidateMeasurements$ui_release();
                b3.g.d(iVar);
                return Boolean.TRUE;
            case 11:
                ((e0.g) this.f440b).f49986g.invoke();
                return Boolean.TRUE;
            case 12:
                ((Function1) this.f440b).invoke(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                return Unit.f71706a;
            case 13:
                ShortcutChipsRowView shortcutChipsRowView = (ShortcutChipsRowView) this.f440b;
                int i11 = ShortcutChipsRowView.f46266l;
                ((s2) shortcutChipsRowView.f46272k).setValue(null);
                return Unit.f71706a;
            case 14:
                return Boolean.valueOf(((a2) this.f440b).getIsAttached());
            case 15:
                return (g2) m0.u(EmptyCoroutineContext.f71803a, new g20.l((w) this.f440b, continuation, i5));
            case 16:
                return y0.e((o1) this.f440b);
            case 17:
                return (BluetoothManager) ((Context) ((u) this.f440b).f95208a).getApplicationContext().getSystemService(BluetoothManager.class);
            case 18:
                return Integer.valueOf(SerialDescriptorImpl._hashCode_delegate$lambda$1((SerialDescriptorImpl) this.f440b));
            case 19:
                b80.a aVar = (b80.a) this.f440b;
                Boolean bool = NovaApplication.f45635g;
                aVar.run();
                return Unit.f71706a;
            case 20:
                NovaApplication novaApplication = (NovaApplication) this.f440b;
                Boolean bool2 = NovaApplication.f45635g;
                try {
                    packageInfo = novaApplication.getPackageManager().getPackageInfo("com.teslacoilsw.launcher", 0);
                } catch (PackageManager.NameNotFoundException unused) {
                }
                boolean z11 = (((packageInfo == null || (applicationInfo = packageInfo.applicationInfo) == null) ? 0 : applicationInfo.flags) & 1) != 0;
                return Boolean.valueOf(z11);
            case 21:
                mz.g gVar = (mz.g) this.f440b;
                return new mz.b(gVar.f77325g, gVar.f77324f);
            case 22:
                ArrayList arrayList = (ArrayList) this.f440b;
                if (arrayList.isEmpty()) {
                    return EmptyList.f71733a;
                }
                if (((CharSequence) b70.g.W0(arrayList)).length() == 0 && arrayList.size() > 1) {
                    i5 = 1;
                }
                return arrayList.subList(i5, ((CharSequence) b70.g.h1(arrayList)).length() == 0 ? ul.b.K(arrayList) : 1 + ul.b.K(arrayList));
            case 23:
                ((b80.a) this.f440b).run();
                return Unit.f71706a;
            case 24:
                return ((t) this.f440b).m();
            case 25:
                y1 y1Var = (y1) this.f440b;
                synchronized (y1Var.f81647b) {
                    lVarW = y1Var.w();
                    if (((w1) y1Var.f81663t.getValue()).compareTo(w1.f81614b) <= 0) {
                        throw ph.a.a("Recomposer shutdown; frame clock awaiter will never resume", y1Var.f81649d);
                    }
                }
                if (lVarW != null) {
                    int i12 = Result.f71687b;
                    ((m) lVarW).resumeWith(Unit.f71706a);
                }
                return Unit.f71706a;
            case 26:
                return this.f440b;
            case 27:
                return sx.i.f87782i.q(((i1) this.f440b).f84517a);
            case 28:
                p pVar = (p) this.f440b;
                h0 h0Var = AppSearchResultsView.f46177o0;
                Iterator it = pVar.a().iterator();
                while (it.hasNext() && !((ey.n) it.next()).a()) {
                }
                return Unit.f71706a;
            default:
                AppSearchResultsView appSearchResultsView = (AppSearchResultsView) this.f440b;
                if (appSearchResultsView.f46190g.length() > 0) {
                    appSearchResultsView.h(null);
                    appSearchResultsView.L(appSearchResultsView.f46190g, true);
                }
                return Unit.f71706a;
        }
    }
}
