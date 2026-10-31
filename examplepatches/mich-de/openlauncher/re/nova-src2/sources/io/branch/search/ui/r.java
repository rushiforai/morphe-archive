package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        InterfaceC3331q6 interfaceC3331q6 = (InterfaceC3331q6) parcel.readParcelable(BranchEntity.HeroV2.class.getClassLoader());
        String string = parcel.readString();
        String string2 = parcel.readString();
        Image image = (Image) parcel.readParcelable(BranchEntity.HeroV2.class.getClassLoader());
        int iB = 0;
        int iC = parcel.readInt() == 0 ? 0 : b50.e.c(parcel.readString());
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        while (iB != i5) {
            iB = fq.c.b(BranchEntity.Shortcut.CREATOR, parcel, arrayList, iB, 1);
        }
        return new BranchEntity.HeroV2(interfaceC3331q6, string, string2, image, iC, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.HeroV2[i5];
    }
}
