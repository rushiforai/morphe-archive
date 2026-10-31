package x9;

import com.android.launcher3.dragndrop.PinWidgetFlowHandler;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.android.launcher3.widget.WidgetAddFlowHandler;

/* loaded from: classes2.dex */
public final class v extends ab.s {

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ PinWidgetFlowHandler f95720w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo, PinWidgetFlowHandler pinWidgetFlowHandler) {
        super(launcherAppWidgetProviderInfo, -113);
        this.f95720w = pinWidgetFlowHandler;
    }

    @Override // ab.s
    public final WidgetAddFlowHandler p0() {
        return this.f95720w;
    }
}
