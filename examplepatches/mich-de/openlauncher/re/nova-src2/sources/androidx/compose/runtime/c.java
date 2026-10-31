package androidx.compose.runtime;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import p1.g1;

/* loaded from: classes.dex */
public final class c implements Parcelable.ClassLoaderCreator {
    public static ParcelableSnapshotMutableState a(Parcel parcel, ClassLoader classLoader) {
        g1 g1Var;
        if (classLoader == null) {
            classLoader = c.class.getClassLoader();
        }
        Object value = parcel.readValue(classLoader);
        int i5 = parcel.readInt();
        if (i5 == 0) {
            g1Var = g1.f81422b;
        } else if (i5 == 1) {
            g1Var = g1.f81425e;
        } else {
            if (i5 != 2) {
                throw new IllegalStateException(c0.i(i5, "Unsupported MutableState policy ", " was restored"));
            }
            g1Var = g1.f81423c;
        }
        return new ParcelableSnapshotMutableState(value, g1Var);
    }

    @Override // android.os.Parcelable.ClassLoaderCreator
    public final /* bridge */ /* synthetic */ Object createFromParcel(Parcel parcel, ClassLoader classLoader) {
        return a(parcel, classLoader);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ParcelableSnapshotMutableState[i5];
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        return a(parcel, null);
    }
}
