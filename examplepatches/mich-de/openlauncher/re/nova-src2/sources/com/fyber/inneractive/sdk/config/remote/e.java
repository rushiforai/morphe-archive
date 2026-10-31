package com.fyber.inneractive.sdk.config.remote;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public a f27900a;

    /* renamed from: b, reason: collision with root package name */
    public List f27901b = null;

    /* renamed from: c, reason: collision with root package name */
    public String f27902c;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0172  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static e a(JSONObject jSONObject) {
        a aVar;
        JSONArray jSONArray;
        int i5;
        String str;
        String str2;
        String str3;
        ArrayList arrayList;
        int i11;
        String str4;
        g gVar;
        String str5 = null;
        String strOptString = jSONObject.optString("updateHash", null);
        if (TextUtils.isEmpty(strOptString)) {
            return null;
        }
        e eVar = new e();
        eVar.f27902c = strOptString;
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("app");
        int iOptInt = jSONObjectOptJSONObject == null ? -1 : jSONObjectOptJSONObject.optInt("id", -1);
        String str6 = "isActive";
        if (iOptInt == -1) {
            aVar = null;
        } else {
            aVar = new a();
            aVar.f27889a = String.valueOf(iOptInt);
            aVar.f27890b = jSONObjectOptJSONObject.optString("publisherId", null);
            aVar.f27891c = f.a(jSONObjectOptJSONObject.optJSONObject("monitor"));
            aVar.f27892d = j.a(jSONObjectOptJSONObject.optJSONObject("video"));
            aVar.f27893e = b.a(jSONObjectOptJSONObject.optJSONObject("display"));
            aVar.f27894f = k.a(jSONObjectOptJSONObject.optJSONObject("viewability"));
            aVar.f27895g = jSONObjectOptJSONObject.optString("isActive", null);
            JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject("native");
            if (jSONObjectOptJSONObject2 != null) {
                UnitDisplayType.fromValue(jSONObjectOptJSONObject2.optString("unitDisplayType"));
            }
        }
        if (aVar == null) {
            return null;
        }
        eVar.f27900a = aVar;
        ArrayList arrayList2 = new ArrayList();
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("spots");
        if (jSONArrayOptJSONArray != null) {
            int i12 = 0;
            while (i12 < jSONArrayOptJSONArray.length()) {
                JSONObject jSONObjectOptJSONObject3 = jSONArrayOptJSONArray.optJSONObject(i12);
                if (jSONObjectOptJSONObject3 == null) {
                    jSONArray = jSONArrayOptJSONArray;
                    String str7 = str5;
                    i5 = i12;
                    str = str6;
                    str2 = str7;
                    str3 = str7;
                } else {
                    String strOptString2 = jSONObjectOptJSONObject3.optString("id", str5);
                    if (!TextUtils.isEmpty(strOptString2)) {
                        h hVar = new h();
                        hVar.f27904a = strOptString2;
                        hVar.f27905b = jSONObjectOptJSONObject3.optString(str6, str5);
                        hVar.f27906c = b.a(jSONObjectOptJSONObject3.optJSONObject("display"));
                        hVar.f27907d = f.a(jSONObjectOptJSONObject3.optJSONObject("monitor"));
                        JSONObject jSONObjectOptJSONObject4 = jSONObjectOptJSONObject3.optJSONObject("native");
                        if (jSONObjectOptJSONObject4 != null) {
                            UnitDisplayType.fromValue(jSONObjectOptJSONObject4.optString("unitDisplayType"));
                        }
                        hVar.f27908e = j.a(jSONObjectOptJSONObject3.optJSONObject("video"));
                        hVar.f27909f = k.a(jSONObjectOptJSONObject3.optJSONObject("viewability"));
                        JSONArray jSONArrayOptJSONArray2 = jSONObjectOptJSONObject3.optJSONArray("units");
                        if (jSONArrayOptJSONArray2 == null || jSONArrayOptJSONArray2.length() == 0) {
                            jSONArray = jSONArrayOptJSONArray;
                            i5 = i12;
                            str = str6;
                            str2 = str5;
                            arrayList = new ArrayList();
                        } else {
                            arrayList = new ArrayList();
                            jSONArray = jSONArrayOptJSONArray;
                            int i13 = 0;
                            while (i13 < jSONArrayOptJSONArray2.length()) {
                                JSONObject jSONObjectOptJSONObject5 = jSONArrayOptJSONArray2.optJSONObject(i13);
                                int i14 = i13;
                                if (jSONObjectOptJSONObject5 != null) {
                                    i iVar = new i();
                                    i11 = i12;
                                    str4 = str6;
                                    iVar.f27911a = jSONObjectOptJSONObject5.optString("id", null);
                                    iVar.f27912b = jSONObjectOptJSONObject5.optString("spotId", null);
                                    iVar.f27913c = b.a(jSONObjectOptJSONObject5.optJSONObject("display"));
                                    iVar.f27914d = f.a(jSONObjectOptJSONObject5.optJSONObject("monitor"));
                                    JSONObject jSONObjectOptJSONObject6 = jSONObjectOptJSONObject5.optJSONObject("native");
                                    if (jSONObjectOptJSONObject6 == null) {
                                        gVar = null;
                                        iVar.f27915e = gVar;
                                        iVar.f27916f = j.a(jSONObjectOptJSONObject5.optJSONObject("video"));
                                        iVar.f27917g = k.a(jSONObjectOptJSONObject5.optJSONObject("viewability"));
                                        arrayList.add(iVar);
                                    } else {
                                        g gVar2 = new g();
                                        if (UnitDisplayType.fromValue(jSONObjectOptJSONObject6.optString("unitDisplayType")) != null) {
                                            gVar = gVar2;
                                        }
                                        iVar.f27915e = gVar;
                                        iVar.f27916f = j.a(jSONObjectOptJSONObject5.optJSONObject("video"));
                                        iVar.f27917g = k.a(jSONObjectOptJSONObject5.optJSONObject("viewability"));
                                        arrayList.add(iVar);
                                    }
                                } else {
                                    i11 = i12;
                                    str4 = str6;
                                }
                                i13 = i14 + 1;
                                str6 = str4;
                                i12 = i11;
                            }
                            i5 = i12;
                            str = str6;
                            str2 = null;
                        }
                        hVar.f27910g = arrayList;
                        str3 = hVar;
                    }
                }
                if (str3 != null) {
                    arrayList2.add(str3);
                }
                str5 = str2;
                str6 = str;
                i12 = i5 + 1;
                jSONArrayOptJSONArray = jSONArray;
            }
        }
        eVar.f27901b = arrayList2;
        return eVar;
    }
}
