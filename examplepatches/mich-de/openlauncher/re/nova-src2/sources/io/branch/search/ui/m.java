package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import io.branch.search.internal.InterfaceC3331q6;
import io.branch.search.ui.BranchEntity;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        InterfaceC3331q6 interfaceC3331q6 = (InterfaceC3331q6) parcel.readParcelable(BranchEntity.Contact.class.getClassLoader());
        String string = parcel.readString();
        Image image = (Image) parcel.readParcelable(BranchEntity.Contact.class.getClassLoader());
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        int iB = 0;
        while (iB != i5) {
            iB = fq.c.b(ContactAction.CREATOR, parcel, arrayList, iB, 1);
        }
        return new BranchEntity.Contact(interfaceC3331q6, string, image, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BranchEntity.Contact[i5];
    }
}
