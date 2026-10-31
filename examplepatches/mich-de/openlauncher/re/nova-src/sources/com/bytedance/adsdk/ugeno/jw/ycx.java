package com.bytedance.adsdk.ugeno.jw;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes2.dex */
public abstract class ycx implements Parcelable {

    /* renamed from: zb, reason: collision with root package name */
    private final Parcelable f22390zb;
    public static final ycx ycx = new ycx() { // from class: com.bytedance.adsdk.ugeno.jw.ycx.1
    };
    public static final Parcelable.Creator<ycx> CREATOR = new Parcelable.ClassLoaderCreator<ycx>() { // from class: com.bytedance.adsdk.ugeno.jw.ycx.2
        @Override // android.os.Parcelable.Creator
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public ycx createFromParcel(Parcel parcel) {
            return createFromParcel(parcel, null);
        }

        @Override // android.os.Parcelable.ClassLoaderCreator
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public ycx createFromParcel(Parcel parcel, ClassLoader classLoader) {
            if (parcel.readParcelable(classLoader) == null) {
                return ycx.ycx;
            }
            throw new IllegalStateException("superState must be null");
        }

        @Override // android.os.Parcelable.Creator
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public ycx[] newArray(int i5) {
            return new ycx[i5];
        }
    };

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i5) {
        parcel.writeParcelable(this.f22390zb, i5);
    }

    public final Parcelable ycx() {
        return this.f22390zb;
    }

    private ycx() {
        this.f22390zb = null;
    }

    public ycx(Parcelable parcelable) {
        if (parcelable != null) {
            this.f22390zb = parcelable == ycx ? null : parcelable;
            return;
        }
        throw new IllegalArgumentException("superState must not be null");
    }

    public ycx(Parcel parcel, ClassLoader classLoader) {
        Parcelable parcelable = parcel.readParcelable(classLoader);
        this.f22390zb = parcelable == null ? ycx : parcelable;
    }
}
