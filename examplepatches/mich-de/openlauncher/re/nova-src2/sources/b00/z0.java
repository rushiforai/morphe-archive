package b00;

import a5.h2;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ShortcutInfo;
import android.os.UserHandle;
import android.util.Log;
import android.view.View;
import android.widget.RelativeLayout;
import androidx.core.graphics.Insets;
import com.android.launcher3.Workspace;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.systemui.plugins.shared.LauncherOverlayManager;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.crashlytics.CrashlyticsRegistrar;
import com.google.firebase.crashlytics.internal.CrashlyticsNativeComponentDeferredProxy;
import com.google.firebase.crashlytics.internal.CrashlyticsRemoteConfigListener;
import com.google.firebase.crashlytics.internal.RemoteConfigDeferredProxy;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorker;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.desktoppreview.DesktopPreviewPanelView;
import com.teslacoilsw.launcher.minusone.NovaFeedOverlayView;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import e10.a3;
import e10.i2;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import o9.z1;

/* loaded from: classes.dex */
public final /* synthetic */ class z0 implements LauncherOverlayManager.LauncherOverlayCallbacks, bm.e, nm.a, fi.c, mb0.b, z1, hn.p, d7.c, a5.a0, l30.p, fi.i, aa.c0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16512a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16513b;

    public /* synthetic */ z0(Object obj, int i5) {
        this.f16512a = i5;
        this.f16513b = obj;
    }

    @Override // hn.p
    public Object a() {
        int i5 = this.f16512a;
        Object obj = this.f16513b;
        switch (i5) {
            case 12:
                Constructor constructor = (Constructor) obj;
                try {
                    return constructor.newInstance(null);
                } catch (IllegalAccessException e3) {
                    ul.b bVar = kn.c.f71660a;
                    throw new RuntimeException("Unexpected IllegalAccessException occurred (Gson 2.13.2). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e3);
                } catch (InstantiationException e11) {
                    throw new RuntimeException("Failed to invoke constructor '" + kn.c.b(constructor) + "' with no args", e11);
                } catch (InvocationTargetException e12) {
                    throw new RuntimeException("Failed to invoke constructor '" + kn.c.b(constructor) + "' with no args", e12.getCause());
                }
            default:
                Class cls = (Class) obj;
                try {
                    return hn.w.f59950a.a(cls);
                } catch (Exception e13) {
                    throw new RuntimeException("Unable to create instance of " + cls + ". Registering an InstanceCreator or a TypeAdapter for this type, or adding a no-args constructor may fix this problem.", e13);
                }
        }
    }

    @Override // mb0.b
    /* renamed from: b */
    public void mo5b(Object obj) {
        SharedPreferences sharedPreferences = (SharedPreferences) this.f16513b;
        ib0.a aVar = (ib0.a) obj;
        cy.v vVar = new cy.v(aVar, 1);
        ((nb0.h) aVar).f(new i2(sharedPreferences, vVar));
        sharedPreferences.registerOnSharedPreferenceChangeListener(vVar);
    }

    @Override // o9.z1
    public void c(fa.p pVar) {
        switch (this.f16512a) {
            case 7:
                pVar.r((ya.p) ((b90.p) this.f16513b).f17729f);
                break;
            case 8:
                pVar.G((ya.r) this.f16513b);
                break;
            case 9:
                pVar.K(Collections.singletonList((ga.e) this.f16513b), false);
                break;
            default:
                pVar.J((HashMap) this.f16513b);
                break;
        }
    }

    @Override // l30.p
    public void d(float f11, int i5) {
        DesktopPreviewPanelView desktopPreviewPanelView = (DesktopPreviewPanelView) this.f16513b;
        NovaLauncher novaLauncher = desktopPreviewPanelView.f45727d;
        if (novaLauncher == null) {
            Intrinsics.m("launcher");
            throw null;
        }
        Workspace workspace = novaLauncher.O;
        int iJ = workspace.J(workspace.f80118t.g(workspace));
        v9.l lVar = desktopPreviewPanelView.f45725b;
        if (lVar != null) {
            lVar.f92439b.setChecked(iJ == workspace.K0());
        } else {
            Intrinsics.m("binding");
            throw null;
        }
    }

    @Override // d7.c
    public d7.d e(d7.b bVar) {
        Context context = (Context) this.f16513b;
        String str = bVar.f49001b;
        aa.m0 callback = bVar.f49002c;
        Intrinsics.g(callback, "callback");
        if (str == null || str.length() == 0) {
            throw new IllegalArgumentException("Must set a non-null database name to a configuration that uses the no backup directory.");
        }
        return new e7.i(context, str, callback, true, true);
    }

    public fa.w f(int i5, UserHandle userHandle, Intent intent) {
        Context context = ((fa.x) this.f16513b).f54525b;
        if (i5 == 0) {
            return new fa.w(intent.getPackage(), userHandle);
        }
        if (i5 == 4) {
            int intExtra = intent.getIntExtra("appWidgetId", 0);
            AppWidgetProviderInfo appWidgetInfo = AppWidgetManager.getInstance(context).getAppWidgetInfo(intExtra);
            if (appWidgetInfo != null && appWidgetInfo.provider.equals(intent.getComponent()) && appWidgetInfo.getProfile().equals(userHandle)) {
                return new fa.w(intExtra, appWidgetInfo);
            }
        } else {
            if (i5 != 6) {
                Log.e("InstallShortcutReceiver", "Unknown item type");
                return null;
            }
            qa.b bVarC = ShortcutKey.d(intent, userHandle).a(context).c(11);
            if (!bVarC.isEmpty()) {
                return new fa.w((ShortcutInfo) bVarC.get(0));
            }
        }
        return null;
    }

    public void g() {
        Function2 function2 = (Function2) this.f16513b;
        synchronized (z1.k.f97943c) {
            z1.k.f97948h = b70.g.p1(z1.k.f97948h, function2);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // nm.a
    public void h(nm.c cVar) {
        switch (this.f16512a) {
            case 3:
                ((CrashlyticsNativeComponentDeferredProxy) this.f16513b).lambda$new$0(cVar);
                break;
            default:
                RemoteConfigDeferredProxy.lambda$setupListener$0((CrashlyticsRemoteConfigListener) this.f16513b, cVar);
                break;
        }
    }

    public void i(int i5, View view) {
        AppSearchResultsView appSearchResultsView = (AppSearchResultsView) this.f16513b;
        b3.h0 h0Var = AppSearchResultsView.f46177o0;
        if (view == null) {
            return;
        }
        appSearchResultsView.G = new e00.q0(i5, appSearchResultsView, 4);
        SharedPreferences.Editor editorEdit = a3.f51435a.f51545a.edit();
        Object tag = view.getTag();
        Intrinsics.e(tag, "null cannot be cast to non-null type kotlin.String");
        editorEdit.putString("appsearch_default_tab", (String) tag).apply();
    }

    @Override // aa.c0
    public void n(ga.f fVar) {
        y9.a0 a0Var = (y9.a0) this.f16513b;
        ArrayList arrayList = a0Var.f96875h;
        if (arrayList.isEmpty() || fVar.f57304r.e()) {
            return;
        }
        a0Var.a(0, arrayList, false);
        a0Var.f96869b.invalidate();
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager.LauncherOverlayCallbacks
    public void onScrollChanged(float f11) {
        NovaFeedOverlayView novaFeedOverlayView = (NovaFeedOverlayView) this.f16513b;
        int i5 = NovaFeedOverlayView.f45903i;
        Context context = novaFeedOverlayView.getContext();
        kl.q0 q0Var = o9.n1.C0;
        ((NovaLauncher) o9.k.Y(context)).onScrollChanged(f11);
    }

    @Override // bm.e
    public Object q(bm.t tVar) {
        switch (this.f16512a) {
            case 1:
                return this.f16513b;
            default:
                return ((CrashlyticsRegistrar) this.f16513b).buildCrashlytics(tVar);
        }
    }

    @Override // fi.c
    public Object then(Task task) {
        return CrashlyticsWorker.lambda$submit$1((Runnable) this.f16513b, task);
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        AllAppsContainerView allAppsContainerView = (AllAppsContainerView) this.f16513b;
        if (!allAppsContainerView.M) {
            Insets insetsG = h2Var.f296a.g(8);
            RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) allAppsContainerView.L.getLayoutParams();
            layoutParams.bottomMargin = insetsG.bottom;
            allAppsContainerView.L.setLayoutParams(layoutParams);
        }
        return h2Var;
    }

    @Override // fi.i
    public Task then(Object obj) {
        wm.c cVar = (wm.c) this.f16513b;
        Task taskB = cVar.f94601d.b();
        Task taskB2 = cVar.f94602e.b();
        return Tasks.f(taskB, taskB2).k(cVar.f94600c, new be.f(12, cVar, taskB, taskB2));
    }
}
