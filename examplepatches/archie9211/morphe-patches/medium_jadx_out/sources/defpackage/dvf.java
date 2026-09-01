package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dvf extends k2 {
    public static final Parcelable.Creator<dvf> CREATOR = new rkf(22);
    public final String a;
    public final String b;
    public final String c;

    public dvf(String str, String str2, String str3) {
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public static final dvf d(JSONObject jSONObject) {
        return new dvf(jSONObject.getString("credentialId"), jSONObject.getString("name"), jSONObject.getString("displayName"));
    }

    public static ivf e(JSONArray jSONArray) throws JSONException {
        if (jSONArray == null || jSONArray.length() == 0) {
            bsf bsfVar = upf.f;
            return ivf.i;
        }
        bsf bsfVar2 = upf.f;
        Object[] objArrCopyOf = new Object[4];
        int i = 0;
        int i2 = 0;
        boolean z = false;
        while (i < jSONArray.length()) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            dvf dvfVar = new dvf(jSONObject.getString("credentialId"), jSONObject.getString("name"), jSONObject.getString("displayName"));
            int iE = qo7.E(objArrCopyOf.length, i2 + 1);
            if (iE > objArrCopyOf.length || z) {
                objArrCopyOf = Arrays.copyOf(objArrCopyOf, iE);
                z = false;
            }
            objArrCopyOf[i2] = dvfVar;
            i++;
            i2++;
        }
        return i2 == 0 ? ivf.i : new ivf(i2, objArrCopyOf);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.V(parcel, 1, this.a);
        fo7.V(parcel, 2, this.b);
        fo7.V(parcel, 3, this.c);
        fo7.d0(iC0, parcel);
    }
}
