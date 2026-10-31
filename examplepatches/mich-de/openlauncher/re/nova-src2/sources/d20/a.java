package d20;

import ab.c0;
import android.appwidget.AppWidgetHost;
import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.util.SparseArray;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.android.launcher3.widget.custom.CustomAppWidgetProviderInfo;
import com.android.systemui.plugins.CustomWidgetPlugin;
import java.util.LinkedHashSet;
import o9.g3;

/* loaded from: classes.dex */
public final class a extends AppWidgetHost implements i {

    /* renamed from: a, reason: collision with root package name */
    public final c0 f48874a;

    /* renamed from: b, reason: collision with root package name */
    public final SparseArray f48875b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashSet f48876c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f48877d;

    public a(Context context) {
        super(context, 2048);
        this.f48874a = new c0(context);
        this.f48875b = new SparseArray();
        this.f48876c = new LinkedHashSet();
    }

    @Override // d20.i
    public final boolean b() {
        return true;
    }

    @Override // d20.i
    public final LauncherAppWidgetProviderInfo c(int i5) {
        return this.f48874a.e(i5);
    }

    @Override // d20.i
    public final AppWidgetHostView d(Context context, int i5, LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo) {
        if (!this.f48877d) {
            startListening();
        }
        if (launcherAppWidgetProviderInfo.m()) {
            j jVar = new j(context, this);
            jVar.setAppWidget(0, launcherAppWidgetProviderInfo);
            bb.b bVar = (bb.b) bb.b.f17790h.h(context);
            bVar.getClass();
            CustomWidgetPlugin customWidgetPlugin = (CustomWidgetPlugin) bVar.f17794c.get(((CustomAppWidgetProviderInfo) jVar.getAppWidgetInfo()).f21344f);
            if (customWidgetPlugin == null) {
                return jVar;
            }
            customWidgetPlugin.onViewCreated(jVar);
            return jVar;
        }
        try {
            return createView(context, i5, launcherAppWidgetProviderInfo);
        } catch (Exception e3) {
            if (!g3.n(e3)) {
                throw new RuntimeException(e3);
            }
            SparseArray sparseArray = this.f48875b;
            j jVar2 = (j) sparseArray.get(i5);
            if (jVar2 == null) {
                com.teslacoilsw.launcher.appwidget.b bVar2 = context instanceof com.teslacoilsw.launcher.appwidget.b ? (com.teslacoilsw.launcher.appwidget.b) context : null;
                if (bVar2 == null) {
                    bVar2 = new com.teslacoilsw.launcher.appwidget.b(context);
                }
                j jVar3 = new j(bVar2, this);
                sparseArray.put(i5, jVar3);
                jVar2 = jVar3;
            }
            jVar2.setAppWidget(i5, launcherAppWidgetProviderInfo);
            jVar2.u();
            return jVar2;
        }
    }

    @Override // android.appwidget.AppWidgetHost
    public final AppWidgetHostView onCreateView(Context context, int i5, AppWidgetProviderInfo appWidgetProviderInfo) {
        com.teslacoilsw.launcher.appwidget.b bVar = context instanceof com.teslacoilsw.launcher.appwidget.b ? (com.teslacoilsw.launcher.appwidget.b) context : null;
        if (bVar == null) {
            bVar = new com.teslacoilsw.launcher.appwidget.b(context);
        }
        j jVar = new j(bVar, this);
        this.f48875b.put(i5, jVar);
        return jVar;
    }

    @Override // android.appwidget.AppWidgetHost
    public final void startListening() {
        this.f48877d = true;
        super.startListening();
    }

    @Override // android.appwidget.AppWidgetHost
    public final void stopListening() {
        this.f48877d = false;
        super.stopListening();
    }
}
