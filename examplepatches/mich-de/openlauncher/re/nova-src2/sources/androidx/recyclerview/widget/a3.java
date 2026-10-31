package androidx.recyclerview.widget;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes2.dex */
public final class a3 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem staggeredGridLayoutManager$LazySpanLookup$FullSpanItem = new StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem();
        staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14859a = parcel.readInt();
        staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14860b = parcel.readInt();
        staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14862d = parcel.readInt() == 1;
        int i5 = parcel.readInt();
        if (i5 > 0) {
            int[] iArr = new int[i5];
            staggeredGridLayoutManager$LazySpanLookup$FullSpanItem.f14861c = iArr;
            parcel.readIntArray(iArr);
        }
        return staggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem[i5];
    }
}
