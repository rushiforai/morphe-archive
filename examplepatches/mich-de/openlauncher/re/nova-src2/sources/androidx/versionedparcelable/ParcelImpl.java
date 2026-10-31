package androidx.versionedparcelable;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import java.lang.reflect.InvocationTargetException;
import ji.a;
import k7.b;
import k7.c;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
public class ParcelImpl implements Parcelable {
    public static final Parcelable.Creator<ParcelImpl> CREATOR = new a(11);

    /* renamed from: a, reason: collision with root package name */
    public final c f15308a;

    public ParcelImpl(Parcel parcel) {
        this.f15308a = new b(parcel).h();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        new b(parcel).l(this.f15308a);
    }
}
