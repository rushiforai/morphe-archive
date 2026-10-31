package androidx.compose.runtime;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes.dex */
public final class b implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14110a;

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f14110a) {
            case 0:
                return new ParcelableSnapshotMutableFloatState(parcel.readFloat());
            case 1:
                return new ParcelableSnapshotMutableIntState(parcel.readInt());
            default:
                return new ParcelableSnapshotMutableLongState(parcel.readLong());
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f14110a) {
            case 0:
                return new ParcelableSnapshotMutableFloatState[i5];
            case 1:
                return new ParcelableSnapshotMutableIntState[i5];
            default:
                return new ParcelableSnapshotMutableLongState[i5];
        }
    }
}
