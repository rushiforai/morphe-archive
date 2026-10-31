package com.bytedance.adsdk.zb.lud;

import android.graphics.Rect;
import android.util.JsonReader;
import android.util.LongSparseArray;
import android.util.SparseArray;
import com.bytedance.adsdk.zb.jc;
import com.bytedance.adsdk.zb.sya.sya.lud;
import com.bytedance.adsdk.zb.ul;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class tn {
    private static List<jc.ycx> dj(JsonReader jsonReader) throws IOException {
        try {
            ArrayList arrayList = new ArrayList();
            while (jsonReader.hasNext()) {
                jc.ycx ycxVar = new jc.ycx();
                jsonReader.beginObject();
                while (jsonReader.hasNext()) {
                    String strNextName = jsonReader.nextName();
                    int iHashCode = strNextName.hashCode();
                    if (iHashCode != 99) {
                        if (iHashCode != 102) {
                            if (iHashCode != 108) {
                                if (iHashCode != 115) {
                                    if (iHashCode != 3153) {
                                        if (iHashCode != 3449) {
                                            if (iHashCode == 96670 && strNextName.equals("ali")) {
                                                ycxVar.f22853ul = jsonReader.nextString();
                                            } else {
                                                jsonReader.skipValue();
                                            }
                                        } else if (strNextName.equals("le")) {
                                            ycxVar.f22854zb = jsonReader.nextInt();
                                        } else {
                                            jsonReader.skipValue();
                                        }
                                    } else if (strNextName.equals("bs")) {
                                        ycxVar.f22852lt = jsonReader.nextInt();
                                    } else {
                                        jsonReader.skipValue();
                                    }
                                } else if (strNextName.equals("s")) {
                                    ycxVar.lud = jsonReader.nextInt();
                                } else {
                                    jsonReader.skipValue();
                                }
                            } else if (strNextName.equals("l")) {
                                ycxVar.ycx = jsonReader.nextInt();
                            } else {
                                jsonReader.skipValue();
                            }
                        } else if (strNextName.equals(InneractiveMediationDefs.GENDER_FEMALE)) {
                            ycxVar.f22851dj = jsonReader.nextString();
                        } else {
                            jsonReader.skipValue();
                        }
                    } else if (strNextName.equals("c")) {
                        ycxVar.sya = jsonReader.nextString();
                    } else {
                        jsonReader.skipValue();
                    }
                }
                jsonReader.endObject();
                arrayList.add(ycxVar);
            }
            return arrayList;
        } catch (Exception unused) {
            return null;
        }
    }

    private static JSONArray sya(JsonReader jsonReader) throws JSONException, IOException {
        JSONArray jSONArray = new JSONArray();
        try {
            jsonReader.beginArray();
            while (jsonReader.hasNext()) {
                JSONObject jSONObject = new JSONObject();
                jSONArray.put(jSONObject);
                jsonReader.beginObject();
                while (jsonReader.hasNext()) {
                    String strNextName = jsonReader.nextName();
                    int iHashCode = strNextName.hashCode();
                    if (iHashCode != 3324) {
                        if (iHashCode == 116753 && strNextName.equals("vid")) {
                            try {
                                jSONObject.put("vid", jsonReader.nextString());
                            } catch (JSONException unused) {
                            }
                        } else {
                            jsonReader.skipValue();
                        }
                    } else if (strNextName.equals("hd")) {
                        jSONObject.put("hd", jsonReader.nextInt());
                    } else {
                        jsonReader.skipValue();
                    }
                }
                jsonReader.endObject();
            }
            jsonReader.endArray();
        } catch (Exception unused2) {
        }
        return jSONArray;
    }

    public static com.bytedance.adsdk.zb.ul ycx(JsonReader jsonReader) throws JSONException, IOException {
        float f11;
        float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx();
        LongSparseArray<com.bytedance.adsdk.zb.sya.sya.lud> longSparseArray = new LongSparseArray<>();
        ArrayList arrayList = new ArrayList();
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        HashMap map3 = new HashMap();
        ArrayList arrayList2 = new ArrayList();
        SparseArray<com.bytedance.adsdk.zb.sya.dj> sparseArray = new SparseArray<>();
        ul.sya syaVar = new ul.sya();
        ul.ycx ycxVar = new ul.ycx();
        ul.zb zbVar = new ul.zb();
        com.bytedance.adsdk.zb.ul ulVar = new com.bytedance.adsdk.zb.ul();
        jsonReader.beginObject();
        float fNextDouble = 0.0f;
        float fNextDouble2 = 0.0f;
        String strNextString = null;
        int iNextInt = 0;
        int iNextInt2 = 0;
        float fNextDouble3 = 0.0f;
        while (jsonReader.hasNext()) {
            float f12 = fNextDouble;
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            char c11 = 65535;
            switch (strNextName.hashCode()) {
                case -1408207997:
                    f11 = fNextDouble3;
                    if (strNextName.equals("assets")) {
                        c11 = 0;
                        break;
                    }
                    break;
                case -1109732030:
                    f11 = fNextDouble3;
                    if (strNextName.equals("layers")) {
                        c11 = 1;
                        break;
                    }
                    break;
                case -865448777:
                    f11 = fNextDouble3;
                    if (strNextName.equals("globalEvent")) {
                        c11 = 2;
                        break;
                    }
                    break;
                case 104:
                    f11 = fNextDouble3;
                    if (strNextName.equals("h")) {
                        c11 = 3;
                        break;
                    }
                    break;
                case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                    f11 = fNextDouble3;
                    if (strNextName.equals("v")) {
                        c11 = 4;
                        break;
                    }
                    break;
                case JSON_ENCODE_ERROR_VALUE:
                    f11 = fNextDouble3;
                    if (strNextName.equals("w")) {
                        c11 = 5;
                        break;
                    }
                    break;
                case 3208:
                    f11 = fNextDouble3;
                    if (strNextName.equals("dl")) {
                        c11 = 6;
                        break;
                    }
                    break;
                case 3276:
                    f11 = fNextDouble3;
                    if (strNextName.equals("fr")) {
                        c11 = 7;
                        break;
                    }
                    break;
                case 3292:
                    f11 = fNextDouble3;
                    if (strNextName.equals("gc")) {
                        c11 = '\b';
                        break;
                    }
                    break;
                case 3367:
                    f11 = fNextDouble3;
                    if (strNextName.equals("ip")) {
                        c11 = '\t';
                        break;
                    }
                    break;
                case 3553:
                    f11 = fNextDouble3;
                    if (strNextName.equals("op")) {
                        c11 = '\n';
                        break;
                    }
                    break;
                case 94623709:
                    f11 = fNextDouble3;
                    if (strNextName.equals("chars")) {
                        c11 = 11;
                        break;
                    }
                    break;
                case 97615364:
                    f11 = fNextDouble3;
                    if (strNextName.equals("fonts")) {
                        c11 = '\f';
                        break;
                    }
                    break;
                case 110364485:
                    f11 = fNextDouble3;
                    if (strNextName.equals("timer")) {
                        c11 = '\r';
                        break;
                    }
                    break;
                case 839250809:
                    f11 = fNextDouble3;
                    if (strNextName.equals("markers")) {
                        c11 = 14;
                        break;
                    }
                    break;
                default:
                    f11 = fNextDouble3;
                    break;
            }
            switch (c11) {
                case 0:
                    ycx(jsonReader, ulVar, map, map2);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 1:
                    ycx(jsonReader, ulVar, arrayList, longSparseArray);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 2:
                    ycx(jsonReader, zbVar);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 3:
                    iNextInt = jsonReader.nextInt();
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 4:
                    String[] strArrSplit = jsonReader.nextString().split("\\.");
                    if (!com.bytedance.adsdk.zb.lt.lt.ycx(Integer.parseInt(strArrSplit[0]), Integer.parseInt(strArrSplit[1]), Integer.parseInt(strArrSplit[2]), 4, 4, 0)) {
                        ulVar.ycx("Lottie only supports bodymovin >= 4.4.0");
                    }
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 5:
                    iNextInt2 = jsonReader.nextInt();
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 6:
                    strNextString = jsonReader.nextString();
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 7:
                    fNextDouble2 = (float) jsonReader.nextDouble();
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case '\b':
                    ycx(jsonReader, ycxVar);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case '\t':
                    fNextDouble = (float) jsonReader.nextDouble();
                    fNextDouble3 = f11;
                    break;
                case '\n':
                    fNextDouble3 = ((float) jsonReader.nextDouble()) - 0.01f;
                    fNextDouble = f12;
                    break;
                case 11:
                    ycx(jsonReader, ulVar, sparseArray);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case '\f':
                    ycx(jsonReader, map3);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case '\r':
                    ycx(jsonReader, syaVar);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                case 14:
                    ycx(jsonReader, arrayList2);
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
                default:
                    jsonReader.skipValue();
                    fNextDouble = f12;
                    fNextDouble3 = f11;
                    break;
            }
        }
        jsonReader.endObject();
        ulVar.ycx(new Rect(0, 0, (int) (iNextInt2 * fYcx), (int) (iNextInt * fYcx)), fNextDouble, fNextDouble3, fNextDouble2, arrayList, longSparseArray, map, map2, sparseArray, map3, arrayList2, syaVar, strNextString, ycxVar, zbVar);
        return ulVar;
    }

    private static void zb(JsonReader jsonReader, ul.ycx ycxVar) throws IOException {
        try {
            jsonReader.beginObject();
            while (jsonReader.hasNext()) {
                String strNextName = jsonReader.nextName();
                int iHashCode = strNextName.hashCode();
                if (iHashCode != 3239) {
                    if (iHashCode != 3276) {
                        if (iHashCode == 107027 && strNextName.equals("lel")) {
                            ycxVar.f23127ul = sya(jsonReader);
                        } else {
                            jsonReader.skipValue();
                        }
                    } else if (strNextName.equals("fr")) {
                        ycxVar.lud = jsonReader.nextInt();
                    } else {
                        jsonReader.skipValue();
                    }
                } else if (strNextName.equals("el")) {
                    ycxVar.f23126lt = jsonReader.nextString();
                } else {
                    jsonReader.skipValue();
                }
            }
            jsonReader.endObject();
        } catch (IOException unused) {
        }
    }

    private static Map<String, Object> zb(JsonReader jsonReader) throws JSONException, IOException {
        HashMap map = new HashMap();
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (strNextName.equals("lel")) {
                map.put("lel", sya(jsonReader));
            } else if (!strNextName.equals("lottie_back")) {
                jsonReader.skipValue();
            } else {
                JSONObject jSONObject = new JSONObject();
                map.put("lottie_back", jSONObject);
                jsonReader.beginObject();
                while (jsonReader.hasNext()) {
                    String strNextName2 = jsonReader.nextName();
                    strNextName2.getClass();
                    if (!strNextName2.equals("hd")) {
                        jsonReader.skipValue();
                    } else {
                        try {
                            jSONObject.putOpt("hd", Integer.valueOf(jsonReader.nextInt()));
                            jSONObject.putOpt("vid", "lottie_back");
                        } catch (JSONException unused) {
                        }
                    }
                }
                jsonReader.endObject();
            }
        }
        jsonReader.endObject();
        Object objRemove = map.remove("lottie_back");
        if (objRemove instanceof JSONObject) {
            Object obj = map.get("lel");
            if (obj instanceof JSONArray) {
                ((JSONArray) obj).put(objRemove);
            } else {
                JSONArray jSONArray = new JSONArray();
                jSONArray.put(objRemove);
                map.put("lel", jSONArray);
            }
        }
        return map;
    }

    private static void ycx(JsonReader jsonReader, ul.zb zbVar) throws IOException {
        try {
            jsonReader.beginObject();
            while (jsonReader.hasNext()) {
                String strNextName = jsonReader.nextName();
                int iHashCode = strNextName.hashCode();
                if (iHashCode != 3239) {
                    if (iHashCode != 107027) {
                        if (iHashCode == 3237004 && strNextName.equals("inel")) {
                            zbVar.f23139zb = new int[][]{new int[]{-1, -1}};
                            jsonReader.beginArray();
                            if (jsonReader.hasNext()) {
                                jsonReader.beginArray();
                                for (int i5 = 0; i5 < 2; i5++) {
                                    if (jsonReader.hasNext()) {
                                        zbVar.f23139zb[0][i5] = jsonReader.nextInt();
                                    }
                                }
                                jsonReader.endArray();
                            }
                            jsonReader.endArray();
                        } else {
                            jsonReader.skipValue();
                        }
                    } else if (strNextName.equals("lel")) {
                        zbVar.sya = sya(jsonReader);
                    } else {
                        jsonReader.skipValue();
                    }
                } else if (strNextName.equals("el")) {
                    zbVar.ycx = jsonReader.nextString();
                } else {
                    jsonReader.skipValue();
                }
            }
            jsonReader.endObject();
        } catch (Exception unused) {
        }
    }

    private static void ycx(JsonReader jsonReader, ul.ycx ycxVar) throws IOException {
        try {
            jsonReader.beginObject();
            while (jsonReader.hasNext()) {
                String strNextName = jsonReader.nextName();
                int iHashCode = strNextName.hashCode();
                if (iHashCode != 3139) {
                    if (iHashCode != 3232) {
                        if (iHashCode != 3571) {
                            if (iHashCode != 3666) {
                                if (iHashCode == 98713 && strNextName.equals("cpf")) {
                                    zb(jsonReader, ycxVar);
                                } else {
                                    jsonReader.skipValue();
                                }
                            } else if (strNextName.equals("se")) {
                                ycxVar.ycx = jsonReader.nextInt();
                            } else {
                                jsonReader.skipValue();
                            }
                        } else if (strNextName.equals("pc")) {
                            ycxVar.f23125dj = jsonReader.nextInt();
                        } else {
                            jsonReader.skipValue();
                        }
                    } else if (strNextName.equals("ee")) {
                        ycxVar.sya = zb(jsonReader);
                    } else {
                        jsonReader.skipValue();
                    }
                } else if (strNextName.equals("be")) {
                    ycxVar.f23128zb = zb(jsonReader);
                } else {
                    jsonReader.skipValue();
                }
            }
            jsonReader.endObject();
        } catch (Exception unused) {
        }
    }

    private static void ycx(JsonReader jsonReader, ul.sya syaVar) throws IOException {
        try {
            jsonReader.beginObject();
            while (jsonReader.hasNext()) {
                String strNextName = jsonReader.nextName();
                int iHashCode = strNextName.hashCode();
                if (iHashCode != 3123) {
                    if (iHashCode != 3239) {
                        if (iHashCode != 3355) {
                            if (iHashCode != 3418) {
                                if (iHashCode != 3704) {
                                    if (iHashCode != 107027) {
                                        if (iHashCode == 3237004 && strNextName.equals("inel")) {
                                            syaVar.lud = new int[]{-1, -1};
                                            jsonReader.beginArray();
                                            for (int i5 = 0; i5 < 2; i5++) {
                                                if (jsonReader.hasNext()) {
                                                    syaVar.lud[i5] = jsonReader.nextInt();
                                                }
                                            }
                                            jsonReader.endArray();
                                        } else {
                                            jsonReader.skipValue();
                                        }
                                    } else if (strNextName.equals("lel")) {
                                        syaVar.f23122ul = sya(jsonReader);
                                    } else {
                                        jsonReader.skipValue();
                                    }
                                } else if (strNextName.equals("tl")) {
                                    syaVar.sya = jsonReader.nextString();
                                } else {
                                    jsonReader.skipValue();
                                }
                            } else if (strNextName.equals("ke")) {
                                syaVar.ycx = jsonReader.nextInt();
                            } else {
                                jsonReader.skipValue();
                            }
                        } else if (strNextName.equals("id")) {
                            syaVar.f23123zb = jsonReader.nextString();
                        } else {
                            jsonReader.skipValue();
                        }
                    } else if (strNextName.equals("el")) {
                        syaVar.f23121lt = jsonReader.nextString();
                    } else {
                        jsonReader.skipValue();
                    }
                } else if (strNextName.equals("at")) {
                    syaVar.f23120dj = jsonReader.nextString();
                } else {
                    jsonReader.skipValue();
                }
            }
            jsonReader.endObject();
        } catch (Exception unused) {
        }
    }

    private static void ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, List<com.bytedance.adsdk.zb.sya.sya.lud> list, LongSparseArray<com.bytedance.adsdk.zb.sya.sya.lud> longSparseArray) throws IOException {
        jsonReader.beginArray();
        while (jsonReader.hasNext()) {
            com.bytedance.adsdk.zb.sya.sya.lud ludVarYcx = wwx.ycx(jsonReader, ulVar);
            ludVarYcx.ea();
            lud.ycx ycxVar = lud.ycx.PRE_COMP;
            list.add(ludVarYcx);
            longSparseArray.put(ludVarYcx.lud(), ludVarYcx);
        }
        jsonReader.endArray();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0039  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static void ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, Map<String, List<com.bytedance.adsdk.zb.sya.sya.lud>> map, Map<String, com.bytedance.adsdk.zb.jc> map2) throws JSONException, IOException {
        jsonReader.beginArray();
        while (jsonReader.hasNext()) {
            ArrayList arrayList = new ArrayList();
            LongSparseArray longSparseArray = new LongSparseArray();
            jsonReader.beginObject();
            String strNextString = null;
            String strNextString2 = null;
            String strNextString3 = null;
            String strNextString4 = null;
            List<jc.ycx> listDj = null;
            String strNextString5 = null;
            int[][] iArr = null;
            JSONArray jSONArraySya = null;
            int iNextInt = 0;
            int iNextInt2 = 0;
            while (jsonReader.hasNext()) {
                String strNextName = jsonReader.nextName();
                strNextName.getClass();
                switch (strNextName) {
                    case "layers":
                        jsonReader.beginArray();
                        while (jsonReader.hasNext()) {
                            com.bytedance.adsdk.zb.sya.sya.lud ludVarYcx = wwx.ycx(jsonReader, ulVar);
                            longSparseArray.put(ludVarYcx.lud(), ludVarYcx);
                            arrayList.add(ludVarYcx);
                        }
                        jsonReader.endArray();
                        break;
                    case "h":
                        iNextInt2 = jsonReader.nextInt();
                        break;
                    case "p":
                        strNextString2 = jsonReader.nextString();
                        break;
                    case "u":
                        strNextString3 = jsonReader.nextString();
                        break;
                    case "w":
                        iNextInt = jsonReader.nextInt();
                        break;
                    case "el":
                        strNextString5 = jsonReader.nextString();
                        break;
                    case "id":
                        strNextString = jsonReader.nextString();
                        break;
                    case "tc":
                        jsonReader.beginArray();
                        listDj = dj(jsonReader);
                        jsonReader.endArray();
                        break;
                    case "lel":
                        jSONArraySya = sya(jsonReader);
                        break;
                    case "rel":
                        strNextString4 = jsonReader.nextString();
                        break;
                    case "inel":
                        iArr = new int[][]{new int[]{-1, -1}};
                        jsonReader.beginArray();
                        if (jsonReader.hasNext()) {
                            jsonReader.beginArray();
                            for (int i5 = 0; i5 < 2; i5++) {
                                if (jsonReader.hasNext()) {
                                    iArr[0][i5] = jsonReader.nextInt();
                                }
                            }
                            jsonReader.endArray();
                        }
                        jsonReader.endArray();
                        break;
                    default:
                        jsonReader.skipValue();
                        break;
                }
            }
            jsonReader.endObject();
            if (strNextString2 != null) {
                com.bytedance.adsdk.zb.jc jcVar = new com.bytedance.adsdk.zb.jc(iNextInt, iNextInt2, strNextString, strNextString2, strNextString3, strNextString4, listDj, strNextString5, iArr, jSONArraySya);
                map2.put(jcVar.fby(), jcVar);
            } else {
                map.put(strNextString, arrayList);
            }
        }
        jsonReader.endArray();
    }

    private static void ycx(JsonReader jsonReader, Map<String, com.bytedance.adsdk.zb.sya.sya> map) throws IOException {
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (!strNextName.equals("list")) {
                jsonReader.skipValue();
            } else {
                jsonReader.beginArray();
                while (jsonReader.hasNext()) {
                    com.bytedance.adsdk.zb.sya.sya syaVarYcx = xkz.ycx(jsonReader);
                    map.put(syaVarYcx.zb(), syaVarYcx);
                }
                jsonReader.endArray();
            }
        }
        jsonReader.endObject();
    }

    private static void ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, SparseArray<com.bytedance.adsdk.zb.sya.dj> sparseArray) throws IOException {
        jsonReader.beginArray();
        while (jsonReader.hasNext()) {
            com.bytedance.adsdk.zb.sya.dj djVarYcx = ry.ycx(jsonReader, ulVar);
            sparseArray.put(djVarYcx.hashCode(), djVarYcx);
        }
        jsonReader.endArray();
    }

    private static void ycx(JsonReader jsonReader, List<com.bytedance.adsdk.zb.sya.lt> list) throws IOException {
        jsonReader.beginArray();
        while (jsonReader.hasNext()) {
            jsonReader.beginObject();
            float fNextDouble = 0.0f;
            String strNextString = null;
            float fNextDouble2 = 0.0f;
            while (jsonReader.hasNext()) {
                String strNextName = jsonReader.nextName();
                strNextName.getClass();
                switch (strNextName) {
                    case "cm":
                        strNextString = jsonReader.nextString();
                        break;
                    case "dr":
                        fNextDouble2 = (float) jsonReader.nextDouble();
                        break;
                    case "tm":
                        fNextDouble = (float) jsonReader.nextDouble();
                        break;
                    default:
                        jsonReader.skipValue();
                        break;
                }
            }
            jsonReader.endObject();
            list.add(new com.bytedance.adsdk.zb.sya.lt(strNextString, fNextDouble, fNextDouble2));
        }
        jsonReader.endArray();
    }
}
