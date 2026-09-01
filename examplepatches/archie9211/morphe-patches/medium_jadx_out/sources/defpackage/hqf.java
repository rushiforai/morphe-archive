package defpackage;

import android.text.TextUtils;
import android.util.Log;
import androidx.core.widget.nRCC.nGxjfIr;
import com.medium.android.data.notification.YMl.DtuT;
import java.text.ParseException;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hqf {
    public final String a;
    public final String b;
    public final String c;
    public final long d;
    public final crf e;

    public hqf(String str, String str2, String str3, long j, crf crfVar) {
        if (!TextUtils.isEmpty(str) && crfVar != null) {
            Log.e("MfaInfo", "Cannot have both MFA phone_info and totp_info");
            ay0.e("Cannot have both MFA phone_info and totp_info");
            throw null;
        }
        this.a = str;
        vp7.n(str2);
        this.b = str2;
        this.c = str3;
        this.d = j;
        this.e = crfVar;
    }

    public static ArrayList a(JSONArray jSONArray) throws JSONException {
        long jW;
        if (jSONArray == null || jSONArray.length() == 0) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            String strA = luc.a(jSONObject.optString("phoneInfo"));
            String strA2 = luc.a(jSONObject.optString("mfaEnrollmentId"));
            String strA3 = luc.a(jSONObject.optString("displayName"));
            String strOptString = jSONObject.optString("enrolledAt", "");
            try {
                xuf xufVarA = cvf.a(strOptString);
                cvf.b(xufVarA);
                jW = xufVarA.w();
            } catch (ParseException e) {
                Log.w("MfaInfo", "Could not parse timestamp as ISOString. Invalid ISOString \"" + strOptString + "\"", e);
                jW = 0;
            }
            hqf hqfVar = new hqf(strA, strA2, strA3, jW, jSONObject.opt(DtuT.iKYxcuiuxOHVMj) != null ? new crf() : null);
            jSONObject.optString(nGxjfIr.Oqs);
            arrayList.add(hqfVar);
        }
        return arrayList;
    }
}
