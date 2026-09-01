package com.google.android.gms.common.api;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import defpackage.b09;
import defpackage.cjb;
import defpackage.en7;
import defpackage.fo7;
import defpackage.h42;
import defpackage.hx4;
import defpackage.k2;
import defpackage.lvf;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class Status extends k2 implements cjb, ReflectedParcelable {
    public final int a;
    public final String b;
    public final PendingIntent c;
    public final h42 d;
    public static final Status e = new Status(0, null, null, null);
    public static final Status f = new Status(14, null, null, null);
    public static final Status g = new Status(8, null, null, null);
    public static final Status h = new Status(15, null, null, null);
    public static final Status i = new Status(16, null, null, null);
    public static final Parcelable.Creator<Status> CREATOR = new lvf(25);

    public Status(int i2, String str, PendingIntent pendingIntent, h42 h42Var) {
        this.a = i2;
        this.b = str;
        this.c = pendingIntent;
        this.d = h42Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof Status)) {
            return false;
        }
        Status status = (Status) obj;
        return this.a == status.a && en7.u(this.b, status.b) && en7.u(this.c, status.c) && en7.u(this.d, status.d);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.a), this.b, this.c, this.d});
    }

    public final String toString() {
        hx4 hx4Var = new hx4(this);
        String strA = this.b;
        if (strA == null) {
            int i2 = this.a;
            switch (i2) {
                case -1:
                    strA = "SUCCESS_CACHE";
                    break;
                case 0:
                    strA = "SUCCESS";
                    break;
                case 1:
                case 9:
                case 11:
                case 12:
                default:
                    strA = b09.A(new StringBuilder(String.valueOf(i2).length() + 21), i2, "unknown status code: ");
                    break;
                case 2:
                    strA = "SERVICE_VERSION_UPDATE_REQUIRED";
                    break;
                case 3:
                    strA = "SERVICE_DISABLED";
                    break;
                case 4:
                    strA = "SIGN_IN_REQUIRED";
                    break;
                case 5:
                    strA = "INVALID_ACCOUNT";
                    break;
                case 6:
                    strA = "RESOLUTION_REQUIRED";
                    break;
                case 7:
                    strA = "NETWORK_ERROR";
                    break;
                case 8:
                    strA = "INTERNAL_ERROR";
                    break;
                case 10:
                    strA = "DEVELOPER_ERROR";
                    break;
                case 13:
                    strA = "ERROR";
                    break;
                case 14:
                    strA = "INTERRUPTED";
                    break;
                case 15:
                    strA = "TIMEOUT";
                    break;
                case 16:
                    strA = "CANCELED";
                    break;
                case 17:
                    strA = "API_NOT_CONNECTED";
                    break;
                case 18:
                    strA = "DEAD_CLIENT";
                    break;
                case 19:
                    strA = "REMOTE_EXCEPTION";
                    break;
                case 20:
                    strA = "CONNECTION_SUSPENDED_DURING_CALL";
                    break;
                case 21:
                    strA = "RECONNECTION_TIMED_OUT_DURING_UPDATE";
                    break;
                case 22:
                    strA = "RECONNECTION_TIMED_OUT";
                    break;
            }
        }
        hx4Var.a("statusCode", strA);
        hx4Var.a("resolution", this.c);
        return hx4Var.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i2) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a);
        fo7.V(parcel, 2, this.b);
        fo7.U(parcel, 3, this.c, i2);
        fo7.U(parcel, 4, this.d, i2);
        fo7.d0(iC0, parcel);
    }

    @Override // defpackage.cjb
    public final Status c() {
        return this;
    }
}
