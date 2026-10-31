package xe;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.exoplayer2.metadata.Metadata;

/* loaded from: classes3.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        return new Metadata(parcel);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new Metadata[i5];
    }
}
