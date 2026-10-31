package com.android.launcher3.widget.custom;

import aa.d;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import o9.g3;
import o9.z0;

/* loaded from: classes.dex */
public class CustomAppWidgetProviderInfo extends LauncherAppWidgetProviderInfo implements Parcelable {
    public static final Parcelable.Creator<CustomAppWidgetProviderInfo> CREATOR = new d(6);

    /* renamed from: f, reason: collision with root package name */
    public final int f21344f;

    public CustomAppWidgetProviderInfo(Parcel parcel, boolean z11, int i5) {
        super(parcel);
        if (z11) {
            int i11 = parcel.readInt();
            this.f21344f = i11;
            ((AppWidgetProviderInfo) this).provider = new ComponentName(parcel.readString(), c0.h(i11, "#custom-widget-"));
            ((AppWidgetProviderInfo) this).label = parcel.readString();
            ((AppWidgetProviderInfo) this).initialLayout = parcel.readInt();
            ((AppWidgetProviderInfo) this).icon = parcel.readInt();
            ((AppWidgetProviderInfo) this).previewImage = parcel.readInt();
            ((AppWidgetProviderInfo) this).resizeMode = parcel.readInt();
            this.f21313a = parcel.readInt();
            this.f21314b = parcel.readInt();
            this.f21315c = parcel.readInt();
            this.f21316d = parcel.readInt();
        } else {
            this.f21344f = i5;
        }
        ((AppWidgetProviderInfo) this).configure = null;
    }

    @Override // com.android.launcher3.widget.LauncherAppWidgetProviderInfo, aa.j
    public final CharSequence a(PackageManager packageManager) {
        return g3.w(((AppWidgetProviderInfo) this).label);
    }

    @Override // com.android.launcher3.widget.LauncherAppWidgetProviderInfo
    /* renamed from: f */
    public final String a(PackageManager packageManager) {
        return g3.w(((AppWidgetProviderInfo) this).label);
    }

    @Override // com.android.launcher3.widget.LauncherAppWidgetProviderInfo
    public final void l(Context context, z0 z0Var) {
    }

    @Override // com.android.launcher3.widget.LauncherAppWidgetProviderInfo
    public final Drawable p(Context context, int i5) {
        return context.getResources().getDrawableForDensity(((AppWidgetProviderInfo) this).previewImage, i5, null);
    }

    @Override // android.appwidget.AppWidgetProviderInfo
    public final String toString() {
        return "CustomWidgetProviderInfo(" + ((AppWidgetProviderInfo) this).provider + ")";
    }

    @Override // android.appwidget.AppWidgetProviderInfo, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        super.writeToParcel(parcel, i5);
        parcel.writeInt(this.f21344f);
        parcel.writeString(((AppWidgetProviderInfo) this).provider.getPackageName());
        parcel.writeString(((AppWidgetProviderInfo) this).label);
        parcel.writeInt(((AppWidgetProviderInfo) this).initialLayout);
        parcel.writeInt(((AppWidgetProviderInfo) this).icon);
        parcel.writeInt(((AppWidgetProviderInfo) this).previewImage);
        parcel.writeInt(((AppWidgetProviderInfo) this).resizeMode);
        parcel.writeInt(this.f21313a);
        parcel.writeInt(this.f21314b);
        parcel.writeInt(this.f21315c);
        parcel.writeInt(this.f21316d);
    }
}
