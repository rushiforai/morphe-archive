package com.facebook.ads.internal.util.parcelable;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.infer.annotation.Nullsafe;
import ww.c;

@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public class WrappedParcelable implements Parcelable {
    public static final Parcelable.Creator<WrappedParcelable> CREATOR = new c(21);

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f27527a;

    public WrappedParcelable(Parcel parcel) {
        this.f27527a = parcel.createByteArray();
    }

    public static byte[] marshallParcelable(Parcelable parcelable) {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.writeParcelable(parcelable, 0);
        byte[] bArrMarshall = parcelObtain.marshall();
        parcelObtain.recycle();
        return bArrMarshall;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public Parcelable unwrap(ClassLoader classLoader) {
        Parcel parcelObtain = Parcel.obtain();
        byte[] bArr = this.f27527a;
        if (bArr == null) {
            return null;
        }
        parcelObtain.unmarshall(bArr, 0, bArr.length);
        parcelObtain.setDataPosition(0);
        Parcelable parcelable = parcelObtain.readParcelable(classLoader);
        parcelObtain.recycle();
        return parcelable;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        parcel.writeByteArray(this.f27527a);
    }

    public WrappedParcelable(Parcelable parcelable) {
        this.f27527a = marshallParcelable(parcelable);
    }

    public WrappedParcelable(byte[] bArr) {
        this.f27527a = bArr;
    }
}
