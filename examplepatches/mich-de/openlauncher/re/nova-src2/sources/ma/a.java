package ma;

import ab.x;
import android.app.Activity;
import android.appwidget.AppWidgetHost;
import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import com.android.launcher3.qsb.QsbContainerView;
import ge.d;
import k30.e;

/* loaded from: classes2.dex */
public final class a extends AppWidgetHost {

    /* renamed from: a, reason: collision with root package name */
    public final d f76178a;

    /* renamed from: b, reason: collision with root package name */
    public final e f76179b;

    public a(Activity activity, d dVar, e eVar) {
        super(activity, 1026);
        this.f76178a = dVar;
        this.f76179b = eVar;
    }

    @Override // android.appwidget.AppWidgetHost
    public final AppWidgetHostView onCreateView(Context context, int i5, AppWidgetProviderInfo appWidgetProviderInfo) {
        this.f76178a.getClass();
        int i11 = QsbContainerView.QsbFragment.f21233c;
        x xVar = new x(context, 1);
        xVar.setFocusable(true);
        xVar.setBackgroundResource(2131232099);
        return xVar;
    }

    @Override // android.appwidget.AppWidgetHost
    public final void onProvidersChanged() {
        super.onProvidersChanged();
        e eVar = this.f76179b;
        if (eVar != null) {
            QsbContainerView.QsbFragment qsbFragment = (QsbContainerView.QsbFragment) eVar.f70933b;
            int i5 = QsbContainerView.QsbFragment.f21233c;
            qsbFragment.getClass();
        }
    }
}
