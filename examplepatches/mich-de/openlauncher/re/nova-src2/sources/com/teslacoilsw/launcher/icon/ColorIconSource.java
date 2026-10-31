package com.teslacoilsw.launcher.icon;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import ft.q;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/icon/ColorIconSource;", "Lcom/teslacoilsw/launcher/icon/NovaIconSource;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ColorIconSource extends NovaIconSource {

    @NotNull
    public static final Parcelable.Creator<ColorIconSource> CREATOR = new q(18);

    /* renamed from: b, reason: collision with root package name */
    public final int f45764b;

    public ColorIconSource(int i5) {
        this.f45764b = i5;
    }

    @Override // com.teslacoilsw.launcher.icon.NovaIconSource
    public final Drawable d(Context context) {
        return new ColorDrawable(this.f45764b);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    /* renamed from: e, reason: from getter */
    public final int getF45764b() {
        return this.f45764b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ColorIconSource) && this.f45764b == ((ColorIconSource) obj).f45764b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45764b);
    }

    public final String toString() {
        return c0.i(this.f45764b, "ColorIconSource(color=", ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f45764b);
    }
}
