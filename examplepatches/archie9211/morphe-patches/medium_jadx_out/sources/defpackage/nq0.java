package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nq0 extends k2 {
    public static final Parcelable.Creator<nq0> CREATOR = new tfd(23);
    public final boolean a;
    public final String b;
    public final String c;
    public final boolean d;
    public final String e;
    public final ArrayList f;
    public final boolean g;

    public nq0(boolean z, String str, String str2, boolean z2, String str3, ArrayList arrayList, boolean z3) {
        boolean z4 = true;
        if (z2 && z3) {
            z4 = false;
        }
        vp7.k("filterByAuthorizedAccounts and requestVerifiedPhoneNumber must not both be true; the Verified Phone Number feature only works in sign-ups.", z4);
        this.a = z;
        if (z) {
            vp7.q("serverClientId must be provided if Google ID tokens are requested", str);
        }
        this.b = str;
        this.c = str2;
        this.d = z2;
        ArrayList arrayList2 = null;
        if (arrayList != null && !arrayList.isEmpty()) {
            arrayList2 = new ArrayList(arrayList);
            Collections.sort(arrayList2);
        }
        this.f = arrayList2;
        this.e = str3;
        this.g = z3;
    }

    public static mq0 d() {
        mq0 mq0Var = new mq0();
        mq0Var.a = false;
        mq0Var.b = null;
        mq0Var.c = true;
        return mq0Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof nq0)) {
            return false;
        }
        nq0 nq0Var = (nq0) obj;
        return this.a == nq0Var.a && en7.u(this.b, nq0Var.b) && en7.u(this.c, nq0Var.c) && this.d == nq0Var.d && en7.u(this.e, nq0Var.e) && en7.u(this.f, nq0Var.f) && this.g == nq0Var.g;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Boolean.valueOf(this.a), this.b, this.c, Boolean.valueOf(this.d), this.e, this.f, Boolean.valueOf(this.g)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a ? 1 : 0);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.a0(parcel, 4, 4);
        parcel.writeInt(this.d ? 1 : 0);
        fo7.V(parcel, 5, this.e);
        fo7.W(parcel, 6, this.f);
        fo7.a0(parcel, 7, 4);
        parcel.writeInt(this.g ? 1 : 0);
        fo7.d0(iC0, parcel);
    }
}
