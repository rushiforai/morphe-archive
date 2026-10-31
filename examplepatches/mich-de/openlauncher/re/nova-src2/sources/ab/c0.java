package ab;

import ads_mobile_sdk.ji;
import ads_mobile_sdk.qu0;
import ads_mobile_sdk.tu0;
import ads_mobile_sdk.uq;
import ads_mobile_sdk.wd1;
import ads_mobile_sdk.xu0;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.os.Bundle;
import android.os.SystemClock;
import android.os.UserHandle;
import b.i8;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.google.android.gms.appset.AppSetIdInfo;
import com.google.android.gms.internal.measurement.v6;
import com.google.android.gms.tasks.Task;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.concurrent.CancellationException;
import kl.k0;
import kl.m0;
import kl.n0;
import kotlin.Result;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import z.o0;

/* loaded from: classes.dex */
public final class c0 implements fi.e, vd.b, y1.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f690a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f691b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f692c;

    public /* synthetic */ c0(int i5, Object obj, Object obj2) {
        this.f690a = i5;
        this.f691b = obj;
        this.f692c = obj2;
    }

    @Override // y1.i
    public Object a(y1.b bVar, Object obj) {
        return ((Function2) this.f691b).invoke(bVar, obj);
    }

    @Override // y1.i
    public Object b(Object obj) {
        return ((Function1) this.f692c).invoke(obj);
    }

    public boolean c(int i5, AppWidgetProviderInfo appWidgetProviderInfo, Bundle bundle) {
        if (i5 <= -100) {
            return true;
        }
        return ((AppWidgetManager) this.f691b).bindAppWidgetIdIfAllowed(i5, appWidgetProviderInfo.getProfile(), appWidgetProviderInfo.provider, bundle);
    }

    public LauncherAppWidgetProviderInfo d(ComponentName componentName, UserHandle userHandle) {
        ya.g0 g0Var = new ya.g0(componentName.getPackageName(), userHandle);
        for (AppWidgetProviderInfo appWidgetProviderInfo : ((AppWidgetManager) this.f691b).getInstalledProvidersForPackage(g0Var.f97138a, g0Var.f97140c)) {
            if (appWidgetProviderInfo.provider.equals(componentName)) {
                return LauncherAppWidgetProviderInfo.e((Context) this.f692c, appWidgetProviderInfo);
            }
        }
        return null;
    }

    public LauncherAppWidgetProviderInfo e(int i5) {
        Context context = (Context) this.f692c;
        if (i5 <= -100) {
            return ((bb.b) bb.b.f17790h.h(context)).a(i5);
        }
        AppWidgetProviderInfo appWidgetInfo = ((AppWidgetManager) this.f691b).getAppWidgetInfo(i5);
        if (appWidgetInfo == null) {
            return null;
        }
        return LauncherAppWidgetProviderInfo.e(context, appWidgetInfo);
    }

    public void f(k0 k0Var) throws GeneralSecurityException {
        HashMap map = (HashMap) this.f691b;
        if (k0Var == null) {
            throw new NullPointerException("primitive constructor must be non-null");
        }
        m0 m0Var = new m0(k0Var.f71609a, k0Var.f71610b);
        if (!map.containsKey(m0Var)) {
            map.put(m0Var, k0Var);
            return;
        }
        k0 k0Var2 = (k0) map.get(m0Var);
        if (k0Var2.equals(k0Var) && k0Var.equals(k0Var2)) {
            return;
        }
        throw new GeneralSecurityException("Attempt to register non-equal PrimitiveConstructor object for already existing object of type: " + m0Var);
    }

    @Override // w60.a
    public Object get() {
        switch (this.f690a) {
            case 2:
                i8 i8Var = new i8(19);
                lm.e eVar = new lm.e(18);
                Object obj = ((w60.a) this.f691b).get();
                w60.a aVar = (w60.a) this.f692c;
                return new be.k(i8Var, eVar, be.a.f17825f, (be.m) obj, aVar);
            default:
                return new ud.e((Context) ((v6) this.f691b).f33136b, (i50.c) ((vm.c) this.f692c).get());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // fi.e
    public void onComplete(Task appSetIdInfoTask) {
        t70.m mVar = (t70.m) this.f692c;
        ji jiVar = (ji) this.f691b;
        Intrinsics.g(appSetIdInfoTask, "appSetIdInfoTask");
        if (appSetIdInfoTask.q()) {
            AppSetIdInfo appSetIdInfo = (AppSetIdInfo) appSetIdInfoTask.m();
            Duration.Companion companion = Duration.f72038b;
            jiVar.f5246c.getClass();
            uq uqVar = new uq(appSetIdInfo, DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d));
            int i5 = Result.f71687b;
            mVar.resumeWith(new xu0(uqVar));
            return;
        }
        if (appSetIdInfoTask.o()) {
            jiVar.f5245b.a("AppSet Id task was cancelled", (Throwable) new CancellationException("AppSet Id task was cancelled"));
            int i11 = Result.f71687b;
            mVar.resumeWith(new tu0("Gms Task for getting AppSetId was cancelled", wd1.f11213a));
            return;
        }
        Exception excL = appSetIdInfoTask.l();
        if (excL == null) {
            excL = new Exception("AppSet Id task wasn't successful or cancelled, but had no exception.");
        }
        jiVar.f5245b.a("Task failed while getting AppSet Id", (Throwable) excL);
        int i12 = Result.f71687b;
        mVar.resumeWith(new qu0(excL, null, 0 == true ? 1 : 0, 6));
    }

    public c0(String str, ul.b bVar, o2.f fVar) {
        this.f690a = 5;
        this.f692c = str;
        this.f691b = bVar;
    }

    public c0(int i5) {
        this.f690a = i5;
        switch (i5) {
            case 4:
                this.f691b = new o0();
                this.f692c = new o0();
                break;
            default:
                this.f691b = new HashMap();
                this.f692c = new HashMap();
                break;
        }
    }

    public c0(n0 n0Var) {
        this.f690a = 3;
        this.f691b = new HashMap(n0Var.f71618a);
        this.f692c = new HashMap(n0Var.f71619b);
    }

    public c0(Context context) {
        this.f690a = 0;
        this.f692c = context;
        this.f691b = AppWidgetManager.getInstance(context);
    }
}
