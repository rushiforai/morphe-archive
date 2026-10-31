package androidx.fragment.app;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
class FragmentManager$LaunchedFragmentInfo implements Parcelable {
    public static final Parcelable.Creator<FragmentManager$LaunchedFragmentInfo> CREATOR = new b(2);

    /* renamed from: a, reason: collision with root package name */
    public String f14456a;

    /* renamed from: b, reason: collision with root package name */
    public int f14457b;

    public FragmentManager$LaunchedFragmentInfo(String str, int i5) {
        this.f14456a = str;
        this.f14457b = i5;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f14456a);
        parcel.writeInt(this.f14457b);
    }
}
