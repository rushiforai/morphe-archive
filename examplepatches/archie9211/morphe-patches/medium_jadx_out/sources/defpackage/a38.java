package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a38 {
    public final List a;

    public a38(ArrayList arrayList) {
        if (arrayList.isEmpty()) {
            this.a = Collections.EMPTY_LIST;
        } else {
            this.a = DesugarCollections.unmodifiableList(arrayList);
        }
    }

    public static a38 a(JSONArray jSONArray) throws JSONException {
        fqf fqfVar;
        if (jSONArray == null || jSONArray.length() == 0) {
            return new a38(new ArrayList());
        }
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            if (jSONObject == null) {
                fqfVar = new fqf();
            } else {
                String strA = luc.a(jSONObject.optString("federatedId"));
                String strA2 = luc.a(jSONObject.optString("displayName"));
                String strA3 = luc.a(jSONObject.optString("photoUrl"));
                String strA4 = luc.a(jSONObject.optString("providerId"));
                String strA5 = luc.a(jSONObject.optString("phoneNumber"));
                String strA6 = luc.a(jSONObject.optString("email"));
                fqf fqfVar2 = new fqf();
                fqfVar2.a = strA;
                fqfVar2.b = strA2;
                fqfVar2.c = strA3;
                fqfVar2.d = strA4;
                fqfVar2.e = null;
                fqfVar2.f = strA5;
                fqfVar2.g = strA6;
                fqfVar = fqfVar2;
            }
            arrayList.add(fqfVar);
        }
        return new a38(arrayList);
    }

    public a38() {
        this.a = new ArrayList();
    }

    public a38(List list) {
        this.a = list;
    }
}
