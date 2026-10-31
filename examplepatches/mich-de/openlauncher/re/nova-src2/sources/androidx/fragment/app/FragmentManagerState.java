package androidx.fragment.app;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
final class FragmentManagerState implements Parcelable {
    public static final Parcelable.Creator<FragmentManagerState> CREATOR = new b(3);

    /* renamed from: a, reason: collision with root package name */
    public ArrayList f14458a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f14459b;

    /* renamed from: c, reason: collision with root package name */
    public BackStackRecordState[] f14460c;

    /* renamed from: d, reason: collision with root package name */
    public int f14461d;

    /* renamed from: e, reason: collision with root package name */
    public String f14462e = null;

    /* renamed from: f, reason: collision with root package name */
    public ArrayList f14463f = new ArrayList();

    /* renamed from: g, reason: collision with root package name */
    public ArrayList f14464g = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    public ArrayList f14465h;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeStringList(this.f14458a);
        parcel.writeStringList(this.f14459b);
        parcel.writeTypedArray(this.f14460c, i5);
        parcel.writeInt(this.f14461d);
        parcel.writeString(this.f14462e);
        parcel.writeStringList(this.f14463f);
        parcel.writeTypedList(this.f14464g);
        parcel.writeTypedList(this.f14465h);
    }
}
