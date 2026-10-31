package com.google.android.gms.common;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import fg.a;
import java.util.Arrays;
import og.i;
import sg.w;

/* loaded from: classes.dex */
public class Feature extends AbstractSafeParcelable {
    public static final Parcelable.Creator<Feature> CREATOR = new d(13);

    /* renamed from: f, reason: collision with root package name */
    public final String f31786f;

    /* renamed from: g, reason: collision with root package name */
    public final int f31787g;

    /* renamed from: h, reason: collision with root package name */
    public final long f31788h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f31789i;

    public Feature(int i5, long j11, String str, boolean z11) {
        this.f31786f = str;
        this.f31787g = i5;
        this.f31788h = j11;
        this.f31789i = z11;
    }

    public final long d() {
        long j11 = this.f31788h;
        return j11 == -1 ? this.f31787g : j11;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof Feature) {
            Feature feature = (Feature) obj;
            if (w.k(this.f31786f, feature.f31786f) && d() == feature.d() && this.f31789i == feature.f31789i) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f31786f, Long.valueOf(d()), Boolean.valueOf(this.f31789i)});
    }

    public final String toString() {
        i iVar = new i(this);
        iVar.c(this.f31786f, PendingUpgradeStore.KEY_NAME);
        iVar.c(Long.valueOf(d()), "version");
        iVar.c(Boolean.valueOf(this.f31789i), "is_fully_rolled_out");
        return iVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.c0(parcel, 1, this.f31786f);
        a.i0(parcel, 2, 4);
        parcel.writeInt(this.f31787g);
        long jD = d();
        a.i0(parcel, 3, 8);
        parcel.writeLong(jD);
        a.i0(parcel, 4, 4);
        parcel.writeInt(this.f31789i ? 1 : 0);
        a.k0(parcel, iJ0);
    }

    public Feature(String str, long j11) {
        this(-1, j11, str, false);
    }
}
