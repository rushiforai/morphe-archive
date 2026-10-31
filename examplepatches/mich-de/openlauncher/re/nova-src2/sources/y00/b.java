package y00;

import android.appwidget.AppWidgetHostView;
import android.content.Context;
import android.view.LayoutInflater;
import com.android.systemui.plugins.CustomWidgetPlugin;

/* loaded from: classes.dex */
public final class b implements CustomWidgetPlugin {

    /* renamed from: a, reason: collision with root package name */
    public final String f96547a;

    public b(Context context) {
        this.f96547a = context.getString(2132019304);
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final String getLabel() {
        return this.f96547a;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getMinSpanX() {
        return 1;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getMinSpanY() {
        return 1;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getPreviewImageResourceId() {
        return 2131232100;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getResizeMode() {
        return 1;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getSpanX() {
        return 4;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getSpanY() {
        return 1;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final void onViewCreated(AppWidgetHostView appWidgetHostView) {
        LayoutInflater.from(appWidgetHostView.getContext()).inflate(2131624288, appWidgetHostView);
    }
}
