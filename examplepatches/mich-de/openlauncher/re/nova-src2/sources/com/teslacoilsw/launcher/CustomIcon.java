package com.teslacoilsw.launcher;

import aa.p;
import android.graphics.Bitmap;
import android.os.Parcel;
import android.os.Parcelable;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import java.io.IOException;
import kotlin.Metadata;
import mx.m;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u0000 \u00022\u00020\u0001:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/CustomIcon;", "Landroid/os/Parcelable;", "CREATOR", "mx/m", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CustomIcon implements Parcelable {

    @NotNull
    public static final m CREATOR = new m();

    /* renamed from: a, reason: collision with root package name */
    public final NovaIconSource f45596a;

    /* renamed from: b, reason: collision with root package name */
    public final BitmapInfo f45597b;

    /* renamed from: c, reason: collision with root package name */
    public final Bitmap[] f45598c;

    public CustomIcon(NovaIconSource novaIconSource, BitmapInfo bitmapInfo, Bitmap[] bitmapArr) {
        this.f45596a = novaIconSource;
        this.f45597b = bitmapInfo;
        this.f45598c = bitmapArr;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) throws IOException {
        parcel.writeParcelable(this.f45596a, i5);
        BitmapInfo bitmapInfo = this.f45597b;
        parcel.writeInt(bitmapInfo.f21152b);
        byte[] bArrA = p.a(bitmapInfo.f21151a);
        parcel.writeInt(bArrA.length);
        parcel.writeByteArray(bArrA);
        Bitmap[] bitmapArr = this.f45598c;
        if (bitmapArr == null) {
            parcel.writeInt(0);
            parcel.writeByteArray(null);
            parcel.writeInt(0);
            parcel.writeByteArray(null);
            return;
        }
        byte[] bArrA2 = p.a(bitmapArr[0]);
        parcel.writeInt(bArrA2.length);
        parcel.writeByteArray(bArrA2);
        byte[] bArrA3 = p.a(bitmapArr[1]);
        parcel.writeInt(bArrA3.length);
        parcel.writeByteArray(bArrA3);
    }
}
