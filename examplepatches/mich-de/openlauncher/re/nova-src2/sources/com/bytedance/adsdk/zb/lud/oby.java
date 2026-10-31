package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.zb.pmi;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: classes2.dex */
class oby {
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static com.bytedance.adsdk.zb.sya.zb.pmi ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        int i5;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx;
        int i11;
        ArrayList arrayList = new ArrayList();
        float fNextDouble = 0.0f;
        com.bytedance.adsdk.zb.sya.ycx.dj djVar = null;
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar = null;
        com.bytedance.adsdk.zb.sya.ycx.ycx ycxVarUl = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
        pmi.ycx ycxVar = null;
        pmi.zb zbVar2 = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            i5 = 1;
            switch (strNextName) {
                case "c":
                    ycxVarUl = dj.ul(jsonReader, ulVar);
                    continue;
                case "d":
                    jsonReader.beginArray();
                    while (jsonReader.hasNext()) {
                        jsonReader.beginObject();
                        String strNextString2 = null;
                        zbVarYcx = null;
                        while (jsonReader.hasNext()) {
                            String strNextName2 = jsonReader.nextName();
                            strNextName2.getClass();
                            if (strNextName2.equals("n")) {
                                strNextString2 = jsonReader.nextString();
                            } else if (strNextName2.equals("v")) {
                                zbVarYcx = dj.ycx(jsonReader, ulVar);
                            } else {
                                jsonReader.skipValue();
                            }
                        }
                        jsonReader.endObject();
                        strNextString2.getClass();
                        switch (strNextString2) {
                            case "d":
                            case "g":
                                i11 = 1;
                                ulVar.ycx(true);
                                arrayList.add(zbVarYcx);
                                i5 = i11;
                                break;
                            case "o":
                                zbVar = zbVarYcx;
                                i5 = 1;
                                break;
                            default:
                                i11 = 1;
                                i5 = i11;
                                break;
                        }
                    }
                    int i12 = i5;
                    jsonReader.endArray();
                    if (arrayList.size() != i12) {
                        break;
                    } else {
                        arrayList.add(arrayList.get(0));
                    }
                case "o":
                    djVar = dj.zb(jsonReader, ulVar);
                    continue;
                case "w":
                    zbVarYcx2 = dj.ycx(jsonReader, ulVar);
                    continue;
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    continue;
                case "lc":
                    ycxVar = pmi.ycx.values()[jsonReader.nextInt() - 1];
                    continue;
                case "lj":
                    zbVar2 = pmi.zb.values()[jsonReader.nextInt() - 1];
                    continue;
                case "ml":
                    fNextDouble = (float) jsonReader.nextDouble();
                    continue;
                case "nm":
                    strNextString = jsonReader.nextString();
                    continue;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        if (djVar == null) {
            djVar = new com.bytedance.adsdk.zb.sya.ycx.dj(Collections.singletonList(new com.bytedance.adsdk.zb.ul.ycx(100)));
        }
        return new com.bytedance.adsdk.zb.sya.zb.pmi(strNextString, zbVar, arrayList, ycxVarUl, djVar, zbVarYcx2, ycxVar, zbVar2, fNextDouble, zNextBoolean);
    }
}
