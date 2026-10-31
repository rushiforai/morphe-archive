package ab;

import android.app.ActivityOptions;
import android.appwidget.AppWidgetHost;
import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.util.SparseArray;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.android.launcher3.widget.custom.CustomAppWidgetProviderInfo;
import com.android.systemui.plugins.CustomWidgetPlugin;
import com.google.android.gms.internal.consent_sdk.k0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.function.IntConsumer;
import o9.f1;
import o9.g3;
import o9.n1;
import o9.t1;

/* loaded from: classes.dex */
public final class m extends AppWidgetHost {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f731a;

    /* renamed from: b, reason: collision with root package name */
    public final SparseArray f732b;

    /* renamed from: c, reason: collision with root package name */
    public final SparseArray f733c;

    /* renamed from: d, reason: collision with root package name */
    public final Context f734d;

    /* renamed from: e, reason: collision with root package name */
    public int f735e;

    /* renamed from: f, reason: collision with root package name */
    public final IntConsumer f736f;

    public m(Context context, f1 f1Var) {
        super(context, 1024);
        this.f731a = new ArrayList();
        this.f732b = new SparseArray();
        this.f733c = new SparseArray();
        this.f735e = 2;
        this.f734d = context;
        this.f736f = f1Var;
    }

    public static void e(o9.k kVar, int i5, AppWidgetProviderInfo appWidgetProviderInfo, int i11) {
        try {
            kVar.startActivityForResult(new Intent("android.appwidget.action.APPWIDGET_BIND").putExtra("appWidgetId", i5).putExtra("appWidgetProvider", appWidgetProviderInfo.provider).putExtra("appWidgetProviderProfile", appWidgetProviderInfo.getProfile()), i11);
        } catch (ActivityNotFoundException e3) {
            mc0.d.b(e3);
            new Handler().post(new k(kVar, i11, 0));
        }
    }

    public final AppWidgetHostView a(n1 n1Var, int i5, LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo) {
        if (launcherAppWidgetProviderInfo.m()) {
            o oVar = new o(n1Var);
            oVar.setAppWidget(0, launcherAppWidgetProviderInfo);
            bb.b bVar = (bb.b) bb.b.f17790h.h(n1Var);
            bVar.getClass();
            CustomWidgetPlugin customWidgetPlugin = (CustomWidgetPlugin) bVar.f17794c.get(((CustomAppWidgetProviderInfo) oVar.getAppWidgetInfo()).f21344f);
            if (customWidgetPlugin == null) {
                return oVar;
            }
            customWidgetPlugin.onViewCreated(oVar);
            return oVar;
        }
        int i11 = this.f735e & 1;
        SparseArray sparseArray = this.f732b;
        if (i11 == 0) {
            i iVar = new i(n1Var);
            iVar.setAppWidget(i5, launcherAppWidgetProviderInfo);
            sparseArray.put(i5, iVar);
            return iVar;
        }
        try {
            return createView(n1Var, i5, launcherAppWidgetProviderInfo);
        } catch (Exception e3) {
            if (!g3.n(e3)) {
                throw new RuntimeException(e3);
            }
            o oVarC = (o) sparseArray.get(i5);
            if (oVarC == null) {
                oVarC = c(this.f734d, i5);
            }
            oVarC.setAppWidget(i5, launcherAppWidgetProviderInfo);
            oVarC.u();
            return oVarC;
        }
    }

    public final Bundle b(o9.l lVar, int i5) {
        o oVar = (o) this.f732b.get(i5);
        ActivityOptions activityOptionsMakeBasic = ActivityOptions.makeBasic();
        if (oVar != null && (oVar.getTag() instanceof ga.e)) {
            activityOptionsMakeBasic = (ActivityOptions) lVar.m0(oVar).f97028a;
        }
        if (Build.VERSION.SDK_INT >= 34) {
            activityOptionsMakeBasic.setPendingIntentBackgroundActivityStartMode(1);
        }
        Bundle bundle = activityOptionsMakeBasic.toBundle();
        bundle.putInt("android.activity.splashScreenStyle", 0);
        return bundle;
    }

    public final o c(Context context, int i5) {
        o oVar;
        if (!(context instanceof com.teslacoilsw.launcher.appwidget.b)) {
            context = new com.teslacoilsw.launcher.appwidget.b(context);
        }
        SparseArray sparseArray = this.f733c;
        if (sparseArray.get(i5) != null) {
            oVar = (o) sparseArray.get(i5);
            sparseArray.remove(i5);
        } else {
            oVar = new o(context);
        }
        this.f732b.put(i5, oVar);
        return oVar;
    }

    @Override // android.appwidget.AppWidgetHost
    public final void clearViews() {
        super.clearViews();
        this.f732b.clear();
    }

    public final void d(int i5, boolean z11) {
        if (z11) {
            this.f735e = i5 | this.f735e;
        } else {
            this.f735e = (~i5) & this.f735e;
        }
        int i11 = this.f735e;
        boolean z12 = (i11 & 1) != 0;
        if (!z12 && (i11 & 14) == 14) {
            startListening();
        } else if (z12 && (i11 & 4) == 0) {
            stopListening();
        }
    }

    @Override // android.appwidget.AppWidgetHost
    public final void deleteAppWidgetId(int i5) {
        super.deleteAppWidgetId(i5);
        this.f732b.remove(i5);
    }

    public final void f(o9.l lVar, int i5, int i11) {
        o9.l lVar2;
        int i12;
        try {
            ps.k.t();
            lVar2 = lVar;
            i12 = i11;
        } catch (ActivityNotFoundException | SecurityException unused) {
            lVar2 = lVar;
            i12 = i11;
        }
        try {
            startAppWidgetConfigureActivityForResult(lVar2, i5, 0, i12, b(lVar, i5));
        } catch (ActivityNotFoundException | SecurityException unused2) {
            k0.w(lVar2, 2132017222, 0).show();
            new Handler().post(new k(lVar2, i12, 0));
        }
    }

    @Override // android.appwidget.AppWidgetHost
    public final void onAppWidgetRemoved(int i5) {
        IntConsumer intConsumer = this.f736f;
        if (intConsumer == null) {
            return;
        }
        intConsumer.accept(i5);
    }

    @Override // android.appwidget.AppWidgetHost
    public final /* bridge */ /* synthetic */ AppWidgetHostView onCreateView(Context context, int i5, AppWidgetProviderInfo appWidgetProviderInfo) {
        return c(context, i5);
    }

    @Override // android.appwidget.AppWidgetHost
    public final void onProviderChanged(int i5, AppWidgetProviderInfo appWidgetProviderInfo) {
        Context context = this.f734d;
        LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfoE = LauncherAppWidgetProviderInfo.e(context, appWidgetProviderInfo);
        super.onProviderChanged(i5, launcherAppWidgetProviderInfoE);
        launcherAppWidgetProviderInfoE.l(context, t1.a(context));
    }

    @Override // android.appwidget.AppWidgetHost
    public final void onProvidersChanged() {
        ArrayList arrayList = this.f731a;
        if (arrayList.isEmpty()) {
            return;
        }
        Iterator it = new ArrayList(arrayList).iterator();
        while (it.hasNext()) {
            ((l) it.next()).e();
        }
    }

    @Override // android.appwidget.AppWidgetHost
    public final void startListening() {
        this.f735e |= 1;
        try {
            super.startListening();
        } catch (Exception e3) {
            if (!g3.n(e3)) {
                throw new RuntimeException(e3);
            }
        }
        SparseArray sparseArray = this.f732b;
        for (int size = sparseArray.size() - 1; size >= 0; size--) {
            o oVar = (o) sparseArray.valueAt(size);
            if (oVar instanceof i) {
                oVar.A();
            }
        }
    }

    @Override // android.appwidget.AppWidgetHost
    public final void stopListening() {
        this.f735e &= -2;
        try {
            super.stopListening();
        } catch (NullPointerException e3) {
            String message = e3.getMessage();
            if (message == null) {
                message = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (!message.contains("com.android.server.appwidget.AppWidgetServiceImpl$ProviderId")) {
                throw e3;
            }
            if (Build.VERSION.SDK_INT > 34) {
                mc0.d.f76206a.f(e3, "Ignoring stopListening crash", new Object[0]);
            } else {
                mc0.d.f76206a.p(e3, "Ignoring stopListening crash", new Object[0]);
            }
        }
    }
}
