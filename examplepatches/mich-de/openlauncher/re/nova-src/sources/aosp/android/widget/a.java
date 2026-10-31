package aosp.android.widget;

import android.os.Parcel;
import android.os.Parcelable;
import aosp.android.widget.ProgressBar;

/* loaded from: classes2.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        ProgressBar.SavedState savedState = new ProgressBar.SavedState(parcel);
        savedState.f15397a = parcel.readInt();
        savedState.f15398b = parcel.readInt();
        return savedState;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ProgressBar.SavedState[i5];
    }
}
