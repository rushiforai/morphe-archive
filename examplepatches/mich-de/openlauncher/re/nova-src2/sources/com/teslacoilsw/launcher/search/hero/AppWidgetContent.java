package com.teslacoilsw.launcher.search.hero;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import nova.branch.engage.sesame_lite.internal.IdHash;
import org.jetbrains.annotations.NotNull;
import u10.h;
import u10.i;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/teslacoilsw/launcher/search/hero/AppWidgetContent;", "Lcom/teslacoilsw/launcher/search/hero/c;", "Landroid/os/Parcelable;", k.O, "u10/h", "u10/i", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public final /* data */ class AppWidgetContent extends c implements Parcelable {

    /* renamed from: b, reason: collision with root package name */
    public final String f46236b;

    /* renamed from: c, reason: collision with root package name */
    public final String f46237c;

    /* renamed from: d, reason: collision with root package name */
    public final long f46238d;

    /* renamed from: e, reason: collision with root package name */
    public final int f46239e;

    /* renamed from: f, reason: collision with root package name */
    public final int f46240f;

    @NotNull
    public static final i Companion = new i();

    @NotNull
    public static final Parcelable.Creator<AppWidgetContent> CREATOR = new sv.b(7);

    public AppWidgetContent(int i5, int i11, long j11, String str, String str2) {
        this.f46236b = str;
        this.f46237c = str2;
        this.f46238d = j11;
        this.f46239e = i5;
        this.f46240f = i11;
    }

    public static AppWidgetContent d(AppWidgetContent appWidgetContent, int i5, int i11, int i12) {
        String str = appWidgetContent.f46236b;
        String str2 = appWidgetContent.f46237c;
        long j11 = appWidgetContent.f46238d;
        if ((i12 & 8) != 0) {
            i5 = appWidgetContent.f46239e;
        }
        int i13 = i5;
        if ((i12 & 16) != 0) {
            i11 = appWidgetContent.f46240f;
        }
        appWidgetContent.getClass();
        return new AppWidgetContent(i13, i11, j11, str, str2);
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return new IdHash((short) 0, 0L, 0L, null);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AppWidgetContent)) {
            return false;
        }
        AppWidgetContent appWidgetContent = (AppWidgetContent) obj;
        return Intrinsics.b(this.f46236b, appWidgetContent.f46236b) && Intrinsics.b(this.f46237c, appWidgetContent.f46237c) && this.f46238d == appWidgetContent.f46238d && this.f46239e == appWidgetContent.f46239e && this.f46240f == appWidgetContent.f46240f;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f46240f) + u4.a(this.f46239e, c0.d(c0.e(this.f46236b.hashCode() * 31, 31, this.f46237c), 31, this.f46238d), 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("AppWidgetContent(packageName=", this.f46236b, ", className=", this.f46237c, ", userSerial=");
        sbW.append(this.f46238d);
        sbW.append(", appWidgetId=");
        sbW.append(this.f46239e);
        sbW.append(", widgetHeightDp=");
        sbW.append(this.f46240f);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f46236b);
        parcel.writeString(this.f46237c);
        parcel.writeLong(this.f46238d);
        parcel.writeInt(this.f46239e);
        parcel.writeInt(this.f46240f);
    }

    public /* synthetic */ AppWidgetContent(String str, String str2, int i5, int i11, long j11, int i12) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, h.f90381a.getDescriptor());
        }
        this.f46236b = str;
        this.f46237c = str2;
        this.f46238d = j11;
        this.f46239e = i11;
        if ((i5 & 16) == 0) {
            this.f46240f = 160;
        } else {
            this.f46240f = i12;
        }
    }
}
