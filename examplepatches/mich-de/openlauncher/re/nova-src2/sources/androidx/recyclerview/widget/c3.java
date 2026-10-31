package androidx.recyclerview.widget;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;

/* loaded from: classes2.dex */
public final class c3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        StaggeredGridLayoutManager.SavedState savedState = new StaggeredGridLayoutManager.SavedState();
        savedState.f14863a = parcel.readInt();
        savedState.f14864b = parcel.readInt();
        int i5 = parcel.readInt();
        savedState.f14865c = i5;
        if (i5 > 0) {
            int[] iArr = new int[i5];
            savedState.f14866d = iArr;
            parcel.readIntArray(iArr);
        }
        int i11 = parcel.readInt();
        savedState.f14867e = i11;
        if (i11 > 0) {
            int[] iArr2 = new int[i11];
            savedState.f14868f = iArr2;
            parcel.readIntArray(iArr2);
        }
        savedState.f14870h = parcel.readInt() == 1;
        savedState.f14871i = parcel.readInt() == 1;
        savedState.f14872j = parcel.readInt() == 1;
        savedState.f14869g = parcel.readArrayList(StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem.class.getClassLoader());
        return savedState;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new StaggeredGridLayoutManager.SavedState[i5];
    }
}
