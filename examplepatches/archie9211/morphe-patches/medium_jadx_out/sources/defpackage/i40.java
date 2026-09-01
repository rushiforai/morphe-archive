package defpackage;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashSet;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i40 implements Serializable {
    public static final HashSet f = new HashSet();
    public final JSONObject a;
    public final JSONObject b;
    public final boolean c;
    public final boolean d;
    public final String e;

    /* JADX WARN: Removed duplicated region for block: B:155:0x02f1  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0300  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x0309  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x030f  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00b6 A[PHI: r12
      0x00b6: PHI (r12v5 java.lang.String) = (r12v1 java.lang.String), (r12v1 java.lang.String), (r12v4 java.lang.String) binds: [B:36:0x00b4, B:56:0x00f7, B:53:0x00f3] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x011c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public i40(java.lang.String r8, java.lang.String r9, java.lang.Double r10, android.os.Bundle r11, boolean r12, boolean r13, java.util.UUID r14, defpackage.ov8 r15) throws org.json.JSONException {
        /*
            Method dump skipped, instruction units count: 808
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.i40.<init>(java.lang.String, java.lang.String, java.lang.Double, android.os.Bundle, boolean, boolean, java.util.UUID, ov8):void");
    }

    private final Object writeReplace() {
        String string = this.a.toString();
        string.getClass();
        String string2 = this.b.toString();
        string2.getClass();
        return new h40(string, string2, this.c, this.d);
    }

    public final String toString() {
        JSONObject jSONObject = this.a;
        return String.format("\"%s\", implicit: %b, json: %s", Arrays.copyOf(new Object[]{jSONObject.optString("_eventName"), Boolean.valueOf(this.c), jSONObject.toString()}, 3));
    }

    public i40(String str, String str2, boolean z, boolean z2) {
        JSONObject jSONObject = new JSONObject(str);
        this.a = jSONObject;
        this.b = new JSONObject(str2);
        this.c = z;
        String strOptString = jSONObject.optString("_eventName");
        strOptString.getClass();
        this.e = strOptString;
        this.d = z2;
    }
}
