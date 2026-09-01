package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.susi.data.CreateAccountData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dd0 implements kd0 {
    public final CreateAccountData a;
    public final SusiDestination b;
    public final String c;

    public dd0(String str, CreateAccountData createAccountData, SusiDestination susiDestination) {
        createAccountData.getClass();
        this.a = createAccountData;
        this.b = susiDestination;
        this.c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dd0)) {
            return false;
        }
        dd0 dd0Var = (dd0) obj;
        return g76.L(this.a, dd0Var.a) && g76.L(this.b, dd0Var.b) && this.c.equals(dd0Var.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        SusiDestination susiDestination = this.b;
        return this.c.hashCode() + ((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NavigateToAddInformation(createAccountData=");
        sb.append(this.a);
        sb.append(", susiDestination=");
        sb.append(this.b);
        sb.append(", source=");
        return ka1.v(sb, this.c, ")");
    }
}
