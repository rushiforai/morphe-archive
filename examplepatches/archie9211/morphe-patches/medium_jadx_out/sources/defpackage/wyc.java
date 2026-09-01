package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wyc implements Parcelable {
    public static final Parcelable.Creator<wyc> CREATOR = new f08(29);
    public final String a;
    public final String b;
    public final zw7 c;
    public final BillingPeriod d;
    public final boolean e;
    public final String f;

    public wyc(String str, String str2, zw7 zw7Var, BillingPeriod billingPeriod, boolean z, String str3) {
        str.getClass();
        str2.getClass();
        zw7Var.getClass();
        billingPeriod.getClass();
        this.a = str;
        this.b = str2;
        this.c = zw7Var;
        this.d = billingPeriod;
        this.e = z;
        this.f = str3;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wyc)) {
            return false;
        }
        wyc wycVar = (wyc) obj;
        return g76.L(this.a, wycVar.a) && g76.L(this.b, wycVar.b) && this.c == wycVar.c && this.d == wycVar.d && this.e == wycVar.e && g76.L(this.f, wycVar.f);
    }

    public final int hashCode() {
        int iHashCode = (((this.d.hashCode() + ((this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b)) * 31)) * 31) + (this.e ? 1231 : 1237)) * 31;
        String str = this.f;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sbU = y30.u("MembershipConfirmationData(productId=", this.a, ", membershipPlanId=", this.b, ", membershipType=");
        sbU.append(this.c);
        sbU.append(", billingPeriod=");
        sbU.append(this.d);
        sbU.append(", trialEligible=");
        sbU.append(this.e);
        sbU.append(", discountCode=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.getClass();
        parcel.writeString(this.a);
        parcel.writeString(this.b);
        parcel.writeString(this.c.name());
        parcel.writeString(this.d.name());
        parcel.writeInt(this.e ? 1 : 0);
        parcel.writeString(this.f);
    }
}
