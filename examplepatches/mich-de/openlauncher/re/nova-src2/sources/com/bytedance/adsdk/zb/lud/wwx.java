package com.bytedance.adsdk.zb.lud;

import android.graphics.Color;
import android.graphics.Rect;
import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.sya.lud;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes2.dex */
public class wwx {

    /* renamed from: com.bytedance.adsdk.zb.lud.wwx$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[lud.zb.values().length];
            ycx = iArr;
            try {
                iArr[lud.zb.LUMA.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[lud.zb.LUMA_INVERTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    public static com.bytedance.adsdk.zb.sya.sya.lud ycx(com.bytedance.adsdk.zb.ul ulVar) {
        Rect rectDj = ulVar.dj();
        List list = Collections.EMPTY_LIST;
        return new com.bytedance.adsdk.zb.sya.sya.lud(list, ulVar, "__container", -1L, lud.ycx.PRE_COMP, -1L, null, list, new com.bytedance.adsdk.zb.sya.ycx.ok(), 0, 0, 0, 0.0f, 0.0f, rectDj.width(), rectDj.height(), null, null, list, lud.zb.NONE, null, false, null, null);
    }

    public static com.bytedance.adsdk.zb.sya.sya.lud ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        Float f11;
        Float fValueOf = Float.valueOf(0.0f);
        Float fValueOf2 = Float.valueOf(1.0f);
        lud.zb zbVar = lud.zb.NONE;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        jsonReader.beginObject();
        lud.zb zbVar2 = zbVar;
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.ok okVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.jc jcVarLt = null;
        com.bytedance.adsdk.zb.sya.ycx.ea eaVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        com.bytedance.adsdk.zb.sya.zb.ycx ycxVarYcx = null;
        jc jcVarYcx = null;
        float fNextDouble = 0.0f;
        float fUl = 0.0f;
        float fNextDouble2 = 0.0f;
        float fNextDouble3 = 0.0f;
        float fNextDouble4 = 0.0f;
        long jNextInt = 0;
        long jNextInt2 = -1;
        int iYcx = 0;
        int iYcx2 = 0;
        int color = 0;
        boolean zNextBoolean = false;
        float fNextDouble5 = 1.0f;
        String strNextString2 = "UNSET";
        String strNextString3 = null;
        lud.ycx ycxVar = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "parent":
                    jNextInt2 = jsonReader.nextInt();
                    break;
                case "shapes":
                    jsonReader.beginArray();
                    while (jsonReader.hasNext()) {
                        com.bytedance.adsdk.zb.sya.zb.sya syaVarYcx = fby.ycx(jsonReader, ulVar);
                        if (syaVarYcx != null) {
                            arrayList2.add(syaVarYcx);
                        }
                    }
                    jsonReader.endArray();
                    break;
                case "h":
                    fNextDouble3 = (float) (jsonReader.nextDouble() * com.bytedance.adsdk.zb.lt.lt.ycx());
                    break;
                case "t":
                    jsonReader.beginObject();
                    while (jsonReader.hasNext()) {
                        String strNextName2 = jsonReader.nextName();
                        strNextName2.getClass();
                        if (strNextName2.equals("a")) {
                            jsonReader.beginArray();
                            if (jsonReader.hasNext()) {
                                eaVarYcx = zb.ycx(jsonReader, ulVar);
                            }
                            while (jsonReader.hasNext()) {
                                jsonReader.skipValue();
                            }
                            jsonReader.endArray();
                        } else if (!strNextName2.equals("d")) {
                            jsonReader.skipValue();
                        } else {
                            jcVarLt = dj.lt(jsonReader, ulVar);
                        }
                    }
                    jsonReader.endObject();
                    break;
                case "w":
                    fNextDouble2 = (float) (jsonReader.nextDouble() * com.bytedance.adsdk.zb.lt.lt.ycx());
                    break;
                case "cl":
                    strNextString3 = jsonReader.nextString();
                    break;
                case "ef":
                    jsonReader.beginArray();
                    ArrayList arrayList3 = new ArrayList();
                    while (jsonReader.hasNext()) {
                        jsonReader.beginObject();
                        while (jsonReader.hasNext()) {
                            String strNextName3 = jsonReader.nextName();
                            strNextName3.getClass();
                            if (strNextName3.equals("nm")) {
                                arrayList3.add(jsonReader.nextString());
                            } else if (!strNextName3.equals("ty")) {
                                jsonReader.skipValue();
                            } else {
                                int iNextInt = jsonReader.nextInt();
                                if (iNextInt == 29) {
                                    ycxVarYcx = lud.ycx(jsonReader, ulVar);
                                } else if (iNextInt == 25) {
                                    jcVarYcx = new ea().ycx(jsonReader, ulVar);
                                }
                            }
                        }
                        jsonReader.endObject();
                    }
                    jsonReader.endArray();
                    ulVar.ycx("Lottie doesn't support layer effects. If you are using them for  fills, strokes, trim paths etc. then try adding them directly as contents  in your shape. Found: ".concat(String.valueOf(arrayList3)));
                    break;
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "ip":
                    fNextDouble = (float) jsonReader.nextDouble();
                    break;
                case "ks":
                    okVarYcx = sya.ycx(jsonReader, ulVar);
                    break;
                case "nm":
                    strNextString2 = jsonReader.nextString();
                    break;
                case "op":
                    fUl = (float) jsonReader.nextDouble();
                    break;
                case "sc":
                    color = Color.parseColor(jsonReader.nextString());
                    break;
                case "sh":
                    iYcx2 = (int) (com.bytedance.adsdk.zb.lt.lt.ycx() * jsonReader.nextInt());
                    break;
                case "sr":
                    fNextDouble5 = (float) jsonReader.nextDouble();
                    break;
                case "st":
                    fNextDouble4 = (float) jsonReader.nextDouble();
                    break;
                case "sw":
                    iYcx = (int) (com.bytedance.adsdk.zb.lt.lt.ycx() * jsonReader.nextInt());
                    break;
                case "tm":
                    zbVarYcx = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "tt":
                    int iNextInt2 = jsonReader.nextInt();
                    if (iNextInt2 >= lud.zb.values().length) {
                        ulVar.ycx("Unsupported matte type: ".concat(String.valueOf(iNextInt2)));
                        break;
                    } else {
                        zbVar2 = lud.zb.values()[iNextInt2];
                        int i5 = AnonymousClass1.ycx[zbVar2.ordinal()];
                        if (i5 == 1) {
                            ulVar.ycx("Unsupported matte type: Luma");
                        } else if (i5 == 2) {
                            ulVar.ycx("Unsupported matte type: Luma Inverted");
                        }
                        ulVar.ycx(1);
                        break;
                    }
                case "ty":
                    int iNextInt3 = jsonReader.nextInt();
                    ycxVar = lud.ycx.UNKNOWN;
                    if (iNextInt3 >= ycxVar.ordinal()) {
                        break;
                    } else {
                        ycxVar = lud.ycx.values()[iNextInt3];
                        break;
                    }
                case "ind":
                    jNextInt = jsonReader.nextInt();
                    break;
                case "refId":
                    strNextString = jsonReader.nextString();
                    break;
                case "masksProperties":
                    jsonReader.beginArray();
                    while (jsonReader.hasNext()) {
                        arrayList.add(dv.ycx(jsonReader, ulVar));
                    }
                    ulVar.ycx(arrayList.size());
                    jsonReader.endArray();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        ArrayList arrayList4 = new ArrayList();
        if (fNextDouble > 0.0f) {
            f11 = fValueOf;
            arrayList4.add(new com.bytedance.adsdk.zb.ul.ycx(ulVar, fValueOf, fValueOf, null, 0.0f, Float.valueOf(fNextDouble)));
        } else {
            f11 = fValueOf;
        }
        if (fUl <= 0.0f) {
            fUl = ulVar.ul();
        }
        arrayList4.add(new com.bytedance.adsdk.zb.ul.ycx(ulVar, fValueOf2, fValueOf2, null, fNextDouble, Float.valueOf(fUl)));
        arrayList4.add(new com.bytedance.adsdk.zb.ul.ycx(ulVar, f11, f11, null, fUl, Float.valueOf(Float.MAX_VALUE)));
        if (strNextString2.endsWith(".ai") || "ai".equals(strNextString3)) {
            ulVar.ycx("Convert your Illustrator layers to shape layers.");
        }
        return new com.bytedance.adsdk.zb.sya.sya.lud(arrayList2, ulVar, strNextString2, jNextInt, ycxVar, jNextInt2, strNextString, arrayList, okVarYcx, iYcx, iYcx2, color, fNextDouble5, fNextDouble4, fNextDouble2, fNextDouble3, jcVarLt, eaVarYcx, arrayList4, zbVar2, zbVarYcx, zNextBoolean, ycxVarYcx, jcVarYcx);
    }
}
