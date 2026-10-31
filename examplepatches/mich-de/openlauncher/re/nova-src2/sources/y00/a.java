package y00;

import android.appwidget.AppWidgetHostView;
import androidx.compose.ui.node.LayoutNode;
import com.android.systemui.plugins.CustomWidgetPlugin;

/* loaded from: classes.dex */
public final class a implements CustomWidgetPlugin {

    /* renamed from: a, reason: collision with root package name */
    public static final a f96546a = new a();

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final String getLabel() {
        return "KeepDesktopWidgetPlugin";
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getMinSpanX() {
        return LayoutNode.NotPlacedPlaceOrder;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getMinSpanY() {
        return LayoutNode.NotPlacedPlaceOrder;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getPreviewImageResourceId() {
        return 0;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getResizeMode() {
        return 0;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getSpanX() {
        return LayoutNode.NotPlacedPlaceOrder;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final int getSpanY() {
        return LayoutNode.NotPlacedPlaceOrder;
    }

    @Override // com.android.systemui.plugins.CustomWidgetPlugin
    public final void onViewCreated(AppWidgetHostView appWidgetHostView) {
    }
}
