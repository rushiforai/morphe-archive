package com.fyber.inneractive.sdk.player.exoplayer2.metadata;

import android.os.Parcel;
import android.os.Parcelable;
import com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.o;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b implements Parcelable {
    public static final Parcelable.Creator<b> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final o[] f30087a;

    public b(ArrayList arrayList) {
        o[] oVarArr = new o[arrayList.size()];
        this.f30087a = oVarArr;
        arrayList.toArray(oVarArr);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || b.class != obj.getClass()) {
            return false;
        }
        return Arrays.equals(this.f30087a, ((b) obj).f30087a);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f30087a);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f30087a.length);
        for (o oVar : this.f30087a) {
            parcel.writeParcelable(oVar, 0);
        }
    }

    public b(Parcel parcel) {
        this.f30087a = new o[parcel.readInt()];
        int i5 = 0;
        while (true) {
            o[] oVarArr = this.f30087a;
            if (i5 >= oVarArr.length) {
                return;
            }
            oVarArr[i5] = (o) parcel.readParcelable(o.class.getClassLoader());
            i5++;
        }
    }
}
