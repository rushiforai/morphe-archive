package com.android.launcher3.dragndrop;

import android.annotation.TargetApi;
import android.content.pm.LauncherApps;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.android.launcher3.widget.WidgetAddFlowHandler;
import ga.e;
import o9.n1;
import ww.c;

@TargetApi(26)
/* loaded from: classes2.dex */
public class PinWidgetFlowHandler extends WidgetAddFlowHandler implements Parcelable {
    public static final Parcelable.Creator<PinWidgetFlowHandler> CREATOR = new c(1);

    /* renamed from: b, reason: collision with root package name */
    public final LauncherApps.PinItemRequest f21092b;

    public PinWidgetFlowHandler(LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfo, LauncherApps.PinItemRequest pinItemRequest) {
        super(launcherAppWidgetProviderInfo);
        this.f21092b = pinItemRequest;
    }

    @Override // com.android.launcher3.widget.WidgetAddFlowHandler
    public final boolean b() {
        return false;
    }

    @Override // com.android.launcher3.widget.WidgetAddFlowHandler
    public final boolean e(n1 n1Var, int i5, e eVar, int i11) {
        Bundle bundle = new Bundle();
        bundle.putInt("appWidgetId", i5);
        this.f21092b.accept(bundle);
        return false;
    }

    @Override // com.android.launcher3.widget.WidgetAddFlowHandler, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        this.f21092b.writeToParcel(parcel, i5);
    }

    public PinWidgetFlowHandler(Parcel parcel) {
        super(parcel);
        this.f21092b = (LauncherApps.PinItemRequest) LauncherApps.PinItemRequest.CREATOR.createFromParcel(parcel);
    }
}
