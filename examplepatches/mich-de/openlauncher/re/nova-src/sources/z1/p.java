package z1;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.compose.runtime.snapshots.SnapshotStateList;
import androidx.customview.view.AbsSavedState;
import com.google.android.material.stateful.ExtendableSavedState;
import ninja.sesame.lib.bridge.v1.SesameShortcut;
import ninja.sesame.lib.bridge.v1.ShortcutAction;

/* loaded from: classes2.dex */
public final class p implements Parcelable.ClassLoaderCreator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97954a;

    public static SnapshotStateList a(Parcel parcel, ClassLoader classLoader) {
        if (classLoader == null) {
            classLoader = p.class.getClassLoader();
        }
        int i5 = parcel.readInt();
        if (i5 == 0) {
            return new SnapshotStateList();
        }
        t1.f fVarBuilder = t1.i.f88455c.builder();
        for (int i11 = 0; i11 < i5; i11++) {
            fVarBuilder.add(parcel.readValue(classLoader));
        }
        return new SnapshotStateList(fVarBuilder.e());
    }

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f97954a) {
            case 0:
                return a(parcel, null);
            case 1:
                return new ExtendableSavedState(parcel, null);
            case 2:
                return new SesameShortcut(parcel);
            case 3:
                return new ShortcutAction(parcel);
            default:
                if (parcel.readParcelable(null) == null) {
                    return AbsSavedState.f14271b;
                }
                throw new IllegalStateException("superState must be null");
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f97954a) {
            case 0:
                return new SnapshotStateList[i5];
            case 1:
                return new ExtendableSavedState[i5];
            case 2:
                return new SesameShortcut[i5];
            case 3:
                return new ShortcutAction[i5];
            default:
                return new AbsSavedState[i5];
        }
    }

    @Override // android.os.Parcelable.ClassLoaderCreator
    public final Object createFromParcel(Parcel parcel, ClassLoader classLoader) {
        switch (this.f97954a) {
            case 0:
                return a(parcel, classLoader);
            case 1:
                return new ExtendableSavedState(parcel, classLoader);
            case 2:
                return new SesameShortcut(parcel, classLoader);
            case 3:
                return new ShortcutAction(parcel, classLoader);
            default:
                if (parcel.readParcelable(classLoader) == null) {
                    return AbsSavedState.f14271b;
                }
                throw new IllegalStateException("superState must be null");
        }
    }
}
