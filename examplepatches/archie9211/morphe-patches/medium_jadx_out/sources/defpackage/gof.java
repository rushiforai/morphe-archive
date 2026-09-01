package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gof implements qnb {
    public static final Parcelable.Creator<gof> CREATOR = new rkf(15);
    public final long a;
    public final long b;

    public gof(long j, long j2) {
        this.a = j;
        this.b = j2;
    }

    public static gof a(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        try {
            return new gof(jSONObject.getLong("lastSignInTimestamp"), jSONObject.getLong("creationTimestamp"));
        } catch (JSONException unused) {
            return null;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 8);
        parcel.writeLong(this.a);
        fo7.a0(parcel, 2, 8);
        parcel.writeLong(this.b);
        fo7.d0(iC0, parcel);
    }
}
