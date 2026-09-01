package defpackage;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h42 extends k2 {
    public final int a;
    public final int b;
    public final PendingIntent c;
    public final String d;
    public final Integer e;
    public static final h42 f = new h42(0, null, null);
    public static final Parcelable.Creator<h42> CREATOR = new rkf(2);

    public h42(int i, int i2, PendingIntent pendingIntent, String str, Integer num) {
        this.a = i;
        this.b = i2;
        this.c = pendingIntent;
        this.d = str;
        this.e = num;
    }

    public static String d(int i) {
        if (i == 99) {
            return "UNFINISHED";
        }
        if (i == 1500) {
            return "DRIVE_EXTERNAL_STORAGE_REQUIRED";
        }
        switch (i) {
            case -1:
                return "UNKNOWN";
            case 0:
                return "SUCCESS";
            case 1:
                return "SERVICE_MISSING";
            case 2:
                return "SERVICE_VERSION_UPDATE_REQUIRED";
            case 3:
                return "SERVICE_DISABLED";
            case 4:
                return "SIGN_IN_REQUIRED";
            case 5:
                return "INVALID_ACCOUNT";
            case 6:
                return "RESOLUTION_REQUIRED";
            case 7:
                return "NETWORK_ERROR";
            case 8:
                return "INTERNAL_ERROR";
            case 9:
                return "SERVICE_INVALID";
            case 10:
                return "DEVELOPER_ERROR";
            case 11:
                return "LICENSE_CHECK_FAILED";
            default:
                switch (i) {
                    case 13:
                        return "CANCELED";
                    case 14:
                        return "TIMEOUT";
                    case 15:
                        return "INTERRUPTED";
                    case 16:
                        return "API_UNAVAILABLE";
                    case 17:
                        return "SIGN_IN_FAILED";
                    case 18:
                        return "SERVICE_UPDATING";
                    case 19:
                        return "SERVICE_MISSING_PERMISSION";
                    case 20:
                        return "RESTRICTED_PROFILE";
                    case 21:
                        return "API_VERSION_UPDATE_REQUIRED";
                    case 22:
                        return "RESOLUTION_ACTIVITY_NOT_FOUND";
                    case 23:
                        return "API_DISABLED";
                    case 24:
                        return "API_DISABLED_FOR_CONNECTION";
                    case 25:
                        return "API_INSTALL_REQUIRED";
                    default:
                        StringBuilder sb = new StringBuilder(String.valueOf(i).length() + 20);
                        sb.append("UNKNOWN_ERROR_CODE(");
                        sb.append(i);
                        sb.append(")");
                        return sb.toString();
                }
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof h42)) {
            return false;
        }
        h42 h42Var = (h42) obj;
        return this.b == h42Var.b && en7.u(this.c, h42Var.c) && en7.u(this.d, h42Var.d) && en7.u(this.e, h42Var.e);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.b), this.c, this.d, this.e});
    }

    public final String toString() {
        hx4 hx4Var = new hx4(this);
        hx4Var.a("statusCode", d(this.b));
        hx4Var.a("resolution", this.c);
        hx4Var.a("message", this.d);
        hx4Var.a("clientMethodKey", this.e);
        return hx4Var.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.a0(parcel, 2, 4);
        parcel.writeInt(this.b);
        fo7.U(parcel, 3, this.c, i);
        fo7.V(parcel, 4, this.d);
        fo7.T(parcel, 5, this.e);
        fo7.d0(iC0, parcel);
    }

    public h42(int i, PendingIntent pendingIntent, String str) {
        this(1, i, pendingIntent, str, null);
    }
}
