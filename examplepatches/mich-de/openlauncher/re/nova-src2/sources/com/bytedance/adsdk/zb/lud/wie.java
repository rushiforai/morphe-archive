package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.zb.pmi;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: classes2.dex */
class wie {
    /* JADX WARN: Removed duplicated region for block: B:54:0x00dd A[PHI: r17
      0x00dd: PHI (r17v12 int) = 
      (r17v1 int)
      (r17v2 int)
      (r17v3 int)
      (r17v4 int)
      (r17v5 int)
      (r17v6 int)
      (r17v7 int)
      (r17v8 int)
      (r17v9 int)
      (r17v10 int)
      (r17v11 int)
      (r17v13 int)
     binds: [B:53:0x00db, B:49:0x00cf, B:45:0x00c2, B:41:0x00b7, B:37:0x00ac, B:33:0x009f, B:29:0x0092, B:25:0x0085, B:21:0x0075, B:17:0x0065, B:13:0x0055, B:9:0x0045] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static com.bytedance.adsdk.zb.sya.zb.lt ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        int i5;
        char c11;
        com.bytedance.adsdk.zb.sya.ycx.sya syaVar;
        com.bytedance.adsdk.zb.sya.ycx.lt ltVar;
        ArrayList arrayList = new ArrayList();
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.zb.ul ulVar2 = null;
        com.bytedance.adsdk.zb.sya.ycx.sya syaVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.lt ltVarSya = null;
        com.bytedance.adsdk.zb.sya.ycx.lt ltVarSya2 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        pmi.ycx ycxVar = null;
        pmi.zb zbVar = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar2 = null;
        float fNextDouble = 0.0f;
        boolean zNextBoolean = false;
        com.bytedance.adsdk.zb.sya.ycx.dj djVarZb = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            String str = strNextString;
            com.bytedance.adsdk.zb.sya.ycx.dj djVar = djVarZb;
            com.bytedance.adsdk.zb.sya.zb.ul ulVar3 = ulVar2;
            switch (strNextName.hashCode()) {
                case 100:
                    i5 = 1;
                    if (!strNextName.equals("d")) {
                        c11 = 65535;
                        break;
                    } else {
                        c11 = 0;
                        break;
                    }
                case 101:
                    i5 = 1;
                    if (strNextName.equals("e")) {
                        c11 = 1;
                        break;
                    }
                    break;
                case 103:
                    i5 = 1;
                    if (strNextName.equals("g")) {
                        c11 = 2;
                        break;
                    }
                    break;
                case 111:
                    i5 = 1;
                    if (strNextName.equals("o")) {
                        c11 = 3;
                        break;
                    }
                    break;
                case 115:
                    i5 = 1;
                    if (strNextName.equals("s")) {
                        c11 = 4;
                        break;
                    }
                    break;
                case GZIP_ENCODE_ERROR_VALUE:
                    i5 = 1;
                    if (strNextName.equals("t")) {
                        c11 = 5;
                        break;
                    }
                    break;
                case JSON_ENCODE_ERROR_VALUE:
                    i5 = 1;
                    if (strNextName.equals("w")) {
                        c11 = 6;
                        break;
                    }
                    break;
                case 3324:
                    i5 = 1;
                    if (strNextName.equals("hd")) {
                        c11 = 7;
                        break;
                    }
                    break;
                case 3447:
                    i5 = 1;
                    if (strNextName.equals("lc")) {
                        c11 = '\b';
                        break;
                    }
                    break;
                case 3454:
                    i5 = 1;
                    if (strNextName.equals("lj")) {
                        c11 = '\t';
                        break;
                    }
                    break;
                case 3487:
                    i5 = 1;
                    if (strNextName.equals("ml")) {
                        c11 = '\n';
                        break;
                    }
                    break;
                case 3519:
                    i5 = 1;
                    if (strNextName.equals("nm")) {
                        c11 = 11;
                        break;
                    }
                    break;
                default:
                    c11 = 65535;
                    i5 = 1;
                    break;
            }
            switch (c11) {
                case 0:
                    JsonReader jsonReader2 = jsonReader;
                    jsonReader2.beginArray();
                    while (jsonReader2.hasNext()) {
                        jsonReader2.beginObject();
                        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
                        String strNextString2 = null;
                        while (jsonReader.hasNext()) {
                            com.bytedance.adsdk.zb.sya.ycx.sya syaVar2 = syaVarYcx;
                            String strNextName2 = jsonReader.nextName();
                            strNextName2.getClass();
                            com.bytedance.adsdk.zb.sya.ycx.lt ltVar2 = ltVarSya;
                            if (strNextName2.equals("n")) {
                                strNextString2 = jsonReader.nextString();
                            } else if (strNextName2.equals("v")) {
                                zbVarYcx2 = dj.ycx(jsonReader, ulVar);
                            } else {
                                jsonReader.skipValue();
                            }
                            syaVarYcx = syaVar2;
                            ltVarSya = ltVar2;
                        }
                        com.bytedance.adsdk.zb.sya.ycx.sya syaVar3 = syaVarYcx;
                        com.bytedance.adsdk.zb.sya.ycx.lt ltVar3 = ltVarSya;
                        jsonReader.endObject();
                        if (strNextString2.equals("o")) {
                            zbVar2 = zbVarYcx2;
                            syaVarYcx = syaVar3;
                            ltVarSya = ltVar3;
                            jsonReader2 = jsonReader;
                        } else {
                            if (strNextString2.equals("d") || strNextString2.equals("g")) {
                                ulVar.ycx(true);
                                arrayList.add(zbVarYcx2);
                            }
                            jsonReader2 = jsonReader;
                            syaVarYcx = syaVar3;
                            ltVarSya = ltVar3;
                        }
                    }
                    syaVar = syaVarYcx;
                    ltVar = ltVarSya;
                    jsonReader.endArray();
                    if (arrayList.size() == 1) {
                        arrayList.add(arrayList.get(0));
                    }
                    strNextString = str;
                    djVarZb = djVar;
                    syaVarYcx = syaVar;
                    ulVar2 = ulVar3;
                    ltVarSya = ltVar;
                    break;
                case 1:
                    ltVarSya2 = dj.sya(jsonReader, ulVar);
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case 2:
                    jsonReader.beginObject();
                    int iNextInt = -1;
                    while (jsonReader.hasNext()) {
                        String strNextName3 = jsonReader.nextName();
                        strNextName3.getClass();
                        if (strNextName3.equals("k")) {
                            syaVarYcx = dj.ycx(jsonReader, ulVar, iNextInt);
                        } else if (strNextName3.equals("p")) {
                            iNextInt = jsonReader.nextInt();
                        } else {
                            jsonReader.skipValue();
                        }
                    }
                    jsonReader.endObject();
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case 3:
                    djVarZb = dj.zb(jsonReader, ulVar);
                    strNextString = str;
                    ulVar2 = ulVar3;
                    break;
                case 4:
                    ltVarSya = dj.sya(jsonReader, ulVar);
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case 5:
                    ulVar2 = jsonReader.nextInt() == i5 ? com.bytedance.adsdk.zb.sya.zb.ul.LINEAR : com.bytedance.adsdk.zb.sya.zb.ul.RADIAL;
                    strNextString = str;
                    djVarZb = djVar;
                    break;
                case 6:
                    zbVarYcx = dj.ycx(jsonReader, ulVar);
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case 7:
                    zNextBoolean = jsonReader.nextBoolean();
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case '\b':
                    ycxVar = pmi.ycx.values()[jsonReader.nextInt() - 1];
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case '\t':
                    zbVar = pmi.zb.values()[jsonReader.nextInt() - 1];
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case '\n':
                    fNextDouble = (float) jsonReader.nextDouble();
                    strNextString = str;
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                case 11:
                    strNextString = jsonReader.nextString();
                    djVarZb = djVar;
                    ulVar2 = ulVar3;
                    break;
                default:
                    jsonReader.skipValue();
                    syaVar = syaVarYcx;
                    ltVar = ltVarSya;
                    strNextString = str;
                    djVarZb = djVar;
                    syaVarYcx = syaVar;
                    ulVar2 = ulVar3;
                    ltVarSya = ltVar;
                    break;
            }
        }
        com.bytedance.adsdk.zb.sya.ycx.dj djVar2 = djVarZb;
        return new com.bytedance.adsdk.zb.sya.zb.lt(strNextString, ulVar2, syaVarYcx, djVar2 == null ? new com.bytedance.adsdk.zb.sya.ycx.dj(Collections.singletonList(new com.bytedance.adsdk.zb.ul.ycx(100))) : djVar2, ltVarSya, ltVarSya2, zbVarYcx, ycxVar, zbVar, fNextDouble, arrayList, zbVar2, zNextBoolean);
    }
}
