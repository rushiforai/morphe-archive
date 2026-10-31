package com.google.android.gms.common;

import aa.d;
import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import fg.a;
import java.util.Arrays;
import og.i;
import sg.w;

/* loaded from: classes.dex */
public final class ConnectionResult extends AbstractSafeParcelable {

    /* renamed from: f, reason: collision with root package name */
    public final int f31778f;

    /* renamed from: g, reason: collision with root package name */
    public final int f31779g;

    /* renamed from: h, reason: collision with root package name */
    public final PendingIntent f31780h;

    /* renamed from: i, reason: collision with root package name */
    public final String f31781i;

    /* renamed from: j, reason: collision with root package name */
    public final Integer f31782j;

    /* renamed from: k, reason: collision with root package name */
    public static final ConnectionResult f31777k = new ConnectionResult(0, null, null);
    public static final Parcelable.Creator<ConnectionResult> CREATOR = new d(12);

    public ConnectionResult(int i5, int i11, PendingIntent pendingIntent, String str, Integer num) {
        this.f31778f = i5;
        this.f31779g = i11;
        this.f31780h = pendingIntent;
        this.f31781i = str;
        this.f31782j = num;
    }

    public static String d(int i5) {
        if (i5 == 99) {
            return "UNFINISHED";
        }
        if (i5 == 1500) {
            return "DRIVE_EXTERNAL_STORAGE_REQUIRED";
        }
        switch (i5) {
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
                switch (i5) {
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
                        StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 20);
                        sb2.append("UNKNOWN_ERROR_CODE(");
                        sb2.append(i5);
                        sb2.append(")");
                        return sb2.toString();
                }
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ConnectionResult)) {
            return false;
        }
        ConnectionResult connectionResult = (ConnectionResult) obj;
        return this.f31779g == connectionResult.f31779g && w.k(this.f31780h, connectionResult.f31780h) && w.k(this.f31781i, connectionResult.f31781i) && w.k(this.f31782j, connectionResult.f31782j);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(this.f31779g), this.f31780h, this.f31781i, this.f31782j});
    }

    public final String toString() {
        i iVar = new i(this);
        iVar.c(d(this.f31779g), "statusCode");
        iVar.c(this.f31780h, "resolution");
        iVar.c(this.f31781i, PglCryptUtils.KEY_MESSAGE);
        iVar.c(this.f31782j, "clientMethodKey");
        return iVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = a.j0(parcel, 20293);
        a.i0(parcel, 1, 4);
        parcel.writeInt(this.f31778f);
        a.i0(parcel, 2, 4);
        parcel.writeInt(this.f31779g);
        a.b0(parcel, 3, this.f31780h, i5);
        a.c0(parcel, 4, this.f31781i);
        a.a0(parcel, 5, this.f31782j);
        a.k0(parcel, iJ0);
    }

    public ConnectionResult(int i5, PendingIntent pendingIntent, String str) {
        this(1, i5, pendingIntent, str, null);
    }
}
