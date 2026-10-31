package com.fyber.inneractive.sdk.player.exoplayer2.drm;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;
import java.util.Comparator;
import java.util.UUID;

/* loaded from: classes3.dex */
public final class d implements Comparator, Parcelable {
    public static final Parcelable.Creator<d> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final c[] f29121a;

    /* renamed from: b, reason: collision with root package name */
    public int f29122b;

    /* renamed from: c, reason: collision with root package name */
    public final int f29123c;

    public d(boolean z11, c... cVarArr) {
        cVarArr = z11 ? (c[]) cVarArr.clone() : cVarArr;
        Arrays.sort(cVarArr, this);
        for (int i5 = 1; i5 < cVarArr.length; i5++) {
            if (cVarArr[i5 - 1].f29117b.equals(cVarArr[i5].f29117b)) {
                throw new IllegalArgumentException("Duplicate data for uuid: " + cVarArr[i5].f29117b);
            }
        }
        this.f29121a = cVarArr;
        this.f29123c = cVarArr.length;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        c cVar = (c) obj;
        c cVar2 = (c) obj2;
        UUID uuid = com.fyber.inneractive.sdk.player.exoplayer2.b.f29096b;
        return uuid.equals(cVar.f29117b) ? uuid.equals(cVar2.f29117b) ? 0 : 1 : cVar.f29117b.compareTo(cVar2.f29117b);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || d.class != obj.getClass()) {
            return false;
        }
        return Arrays.equals(this.f29121a, ((d) obj).f29121a);
    }

    public final int hashCode() {
        if (this.f29122b == 0) {
            this.f29122b = Arrays.hashCode(this.f29121a);
        }
        return this.f29122b;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeTypedArray(this.f29121a, 0);
    }

    public d(Parcel parcel) {
        c[] cVarArr = (c[]) parcel.createTypedArray(c.CREATOR);
        this.f29121a = cVarArr;
        this.f29123c = cVarArr.length;
    }
}
