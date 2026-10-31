package androidx.fragment.app;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class b implements Parcelable.Creator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14493a;

    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        switch (this.f14493a) {
            case 0:
                return new BackStackRecordState(parcel);
            case 1:
                return new BackStackState(parcel);
            case 2:
                FragmentManager$LaunchedFragmentInfo fragmentManager$LaunchedFragmentInfo = new FragmentManager$LaunchedFragmentInfo();
                fragmentManager$LaunchedFragmentInfo.f14456a = parcel.readString();
                fragmentManager$LaunchedFragmentInfo.f14457b = parcel.readInt();
                return fragmentManager$LaunchedFragmentInfo;
            case 3:
                FragmentManagerState fragmentManagerState = new FragmentManagerState();
                fragmentManagerState.f14462e = null;
                fragmentManagerState.f14463f = new ArrayList();
                fragmentManagerState.f14464g = new ArrayList();
                fragmentManagerState.f14458a = parcel.createStringArrayList();
                fragmentManagerState.f14459b = parcel.createStringArrayList();
                fragmentManagerState.f14460c = (BackStackRecordState[]) parcel.createTypedArray(BackStackRecordState.CREATOR);
                fragmentManagerState.f14461d = parcel.readInt();
                fragmentManagerState.f14462e = parcel.readString();
                fragmentManagerState.f14463f = parcel.createStringArrayList();
                fragmentManagerState.f14464g = parcel.createTypedArrayList(BackStackState.CREATOR);
                fragmentManagerState.f14465h = parcel.createTypedArrayList(FragmentManager$LaunchedFragmentInfo.CREATOR);
                return fragmentManagerState;
            default:
                return new FragmentState(parcel);
        }
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        switch (this.f14493a) {
            case 0:
                return new BackStackRecordState[i5];
            case 1:
                return new BackStackState[i5];
            case 2:
                return new FragmentManager$LaunchedFragmentInfo[i5];
            case 3:
                return new FragmentManagerState[i5];
            default:
                return new FragmentState[i5];
        }
    }
}
