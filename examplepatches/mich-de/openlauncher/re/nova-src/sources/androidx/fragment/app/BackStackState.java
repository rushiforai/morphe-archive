package androidx.fragment.app;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
class BackStackState implements Parcelable {
    public static final Parcelable.Creator<BackStackState> CREATOR = new b(1);

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f14449a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f14450b;

    public BackStackState(Parcel parcel) {
        this.f14449a = parcel.createStringArrayList();
        this.f14450b = parcel.createTypedArrayList(BackStackRecordState.CREATOR);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeStringList(this.f14449a);
        parcel.writeTypedList(this.f14450b);
    }
}
