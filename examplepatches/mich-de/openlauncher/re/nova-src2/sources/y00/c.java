package y00;

import android.appwidget.AppWidgetHostView;
import android.content.Context;
import android.view.LayoutInflater;
import com.android.systemui.plugins.CustomWidgetPlugin;

/* loaded from: classes4.dex */
public final class c implements CustomWidgetPlugin {

    /* renamed from: a, reason: collision with root package name */
    public final String f96548a;

    public c(Context context) {
        this.f96548a = context.getString(2132020354);
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final String getLabel() {
        return this.f96548a;
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
        return 2131231862;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getResizeMode() {
        return 3;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getSpanX() {
        return 3;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getSpanY() {
        return 2;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final void onViewCreated(AppWidgetHostView appWidgetHostView) {
        LayoutInflater.from(appWidgetHostView.getContext()).inflate(2131624289, appWidgetHostView);
    }
}
