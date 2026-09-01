package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i6g extends k2 {
    public static final Parcelable.Creator<i6g> CREATOR = new r4g(2);
    public final boolean a;
    public final a6g b;

    public i6g(boolean z, a6g a6gVar) {
        this.a = z;
        this.b = a6gVar;
    }

    public final JSONObject d() {
        try {
            JSONObject jSONObject = new JSONObject();
            if (this.a) {
                jSONObject.put("enabled", true);
            }
            a6g a6gVar = this.b;
            byte[] bArrT = a6gVar == null ? null : a6gVar.t();
            if (bArrT != null) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("first", Base64.encodeToString(Arrays.copyOf(bArrT, 32), 11));
                if (bArrT.length == 64) {
                    jSONObject2.put("second", Base64.encodeToString(Arrays.copyOfRange(bArrT, 32, 64), 11));
                }
                jSONObject.put("results", jSONObject2);
            }
            return jSONObject;
        } catch (JSONException e) {
            lg8.p("Error encoding AuthenticationExtensionsPrfOutputs to JSON object", e);
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof i6g)) {
            return false;
        }
        i6g i6gVar = (i6g) obj;
        return this.a == i6gVar.a && en7.u(this.b, i6gVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Boolean.valueOf(this.a), this.b});
    }

    public final String toString() {
        return ev6.x("AuthenticationExtensionsPrfOutputs{", d().toString(), "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.a0(parcel, 1, 4);
        parcel.writeInt(this.a ? 1 : 0);
        a6g a6gVar = this.b;
        fo7.S(parcel, 2, a6gVar == null ? null : a6gVar.t());
        fo7.d0(iC0, parcel);
    }
}
