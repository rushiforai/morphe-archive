package com.facebook.ads.androidx.media3.extractor.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1084Mk;
import com.facebook.ads.redexgen.X.C1434aL;
import com.facebook.ads.redexgen.X.C1436aN;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class SpliceScheduleCommand extends SpliceCommand {
    public static final Parcelable.Creator<SpliceScheduleCommand> CREATOR = new C1434aL();
    public final List<C1436aN> A00;

    public SpliceScheduleCommand(Parcel parcel) {
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            arrayList.add(C1436aN.A00(parcel));
        }
        this.A00 = Collections.unmodifiableList(arrayList);
    }

    public /* synthetic */ SpliceScheduleCommand(Parcel parcel, C1434aL c1434aL) {
        this(parcel);
    }

    public SpliceScheduleCommand(List<C1436aN> list) {
        this.A00 = Collections.unmodifiableList(list);
    }

    public static SpliceScheduleCommand A00(C1084Mk c1084Mk) {
        int iA0I = c1084Mk.A0I();
        ArrayList arrayList = new ArrayList(iA0I);
        for (int i5 = 0; i5 < iA0I; i5++) {
            arrayList.add(C1436aN.A02(c1084Mk));
        }
        return new SpliceScheduleCommand(arrayList);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int size = this.A00.size();
        parcel.writeInt(size);
        for (int i11 = 0; i11 < size; i11++) {
            this.A00.get(i11).A04(parcel);
        }
    }
}
