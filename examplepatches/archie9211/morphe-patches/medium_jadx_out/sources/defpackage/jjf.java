package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Status;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jjf extends k2 implements cjb {
    public static final Parcelable.Creator<jjf> CREATOR = new tfd(14);
    public final List a;
    public final String b;

    public jjf(String str, ArrayList arrayList) {
        this.a = arrayList;
        this.b = str;
    }

    @Override // defpackage.cjb
    public final Status c() {
        return this.b != null ? Status.e : Status.i;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.W(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.d0(iC0, parcel);
    }
}
