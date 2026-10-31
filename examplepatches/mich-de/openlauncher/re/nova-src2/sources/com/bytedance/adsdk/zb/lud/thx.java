package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
class thx {
    public static <T> List<com.bytedance.adsdk.zb.ul.ycx<T>> ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, float f11, dc<T> dcVar, boolean z11) throws IOException {
        JsonReader jsonReader2;
        com.bytedance.adsdk.zb.ul ulVar2;
        float f12;
        dc<T> dcVar2;
        boolean z12;
        ArrayList arrayList = new ArrayList();
        if (jsonReader.peek() == JsonToken.STRING) {
            ulVar.ycx("Lottie doesn't support expressions.");
            return arrayList;
        }
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (!strNextName.equals("k")) {
                jsonReader.skipValue();
            } else if (jsonReader.peek() == JsonToken.BEGIN_ARRAY) {
                jsonReader.beginArray();
                if (jsonReader.peek() == JsonToken.NUMBER) {
                    JsonReader jsonReader3 = jsonReader;
                    com.bytedance.adsdk.zb.ul ulVar3 = ulVar;
                    float f13 = f11;
                    dc<T> dcVar3 = dcVar;
                    boolean z13 = z11;
                    com.bytedance.adsdk.zb.ul.ycx ycxVarYcx = htf.ycx(jsonReader3, ulVar3, f13, dcVar3, false, z13);
                    jsonReader2 = jsonReader3;
                    ulVar2 = ulVar3;
                    f12 = f13;
                    dcVar2 = dcVar3;
                    z12 = z13;
                    arrayList.add(ycxVarYcx);
                } else {
                    jsonReader2 = jsonReader;
                    ulVar2 = ulVar;
                    f12 = f11;
                    dcVar2 = dcVar;
                    z12 = z11;
                    while (jsonReader2.hasNext()) {
                        arrayList.add(htf.ycx(jsonReader2, ulVar2, f12, dcVar2, true, z12));
                    }
                }
                jsonReader2.endArray();
                jsonReader = jsonReader2;
                ulVar = ulVar2;
                f11 = f12;
                dcVar = dcVar2;
                z11 = z12;
            } else {
                JsonReader jsonReader4 = jsonReader;
                arrayList.add(htf.ycx(jsonReader4, ulVar, f11, dcVar, false, z11));
                jsonReader = jsonReader4;
            }
        }
        jsonReader.endObject();
        ycx(arrayList);
        return arrayList;
    }

    public static <T> void ycx(List<? extends com.bytedance.adsdk.zb.ul.ycx<T>> list) {
        int i5;
        T t6;
        int size = list.size();
        int i11 = 0;
        while (true) {
            i5 = size - 1;
            if (i11 >= i5) {
                break;
            }
            com.bytedance.adsdk.zb.ul.ycx<T> ycxVar = list.get(i11);
            i11++;
            com.bytedance.adsdk.zb.ul.ycx<T> ycxVar2 = list.get(i11);
            ycxVar.f23137ul = Float.valueOf(ycxVar2.f23134lt);
            if (ycxVar.f23138zb == null && (t6 = ycxVar2.ycx) != null) {
                ycxVar.f23138zb = t6;
                if (ycxVar instanceof com.bytedance.adsdk.zb.ycx.zb.jw) {
                    ((com.bytedance.adsdk.zb.ycx.zb.jw) ycxVar).ycx();
                }
            }
        }
        com.bytedance.adsdk.zb.ul.ycx<T> ycxVar3 = list.get(i5);
        if ((ycxVar3.ycx == null || ycxVar3.f23138zb == null) && list.size() > 1) {
            list.remove(ycxVar3);
        }
    }
}
