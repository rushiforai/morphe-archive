package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;

/* loaded from: classes2.dex */
public class sya {
    /* JADX WARN: Multi-variable type inference failed */
    private static boolean sya(com.bytedance.adsdk.zb.sya.ycx.zb zbVar) {
        if (zbVar != null) {
            return zbVar.zb() && ((Float) ((com.bytedance.adsdk.zb.ul.ycx) zbVar.sya().get(0)).ycx).floatValue() == 0.0f;
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:115:0x00ec A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0109  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static com.bytedance.adsdk.zb.sya.ycx.ok ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx;
        com.bytedance.adsdk.zb.ul ulVar2 = ulVar;
        Float fValueOf = Float.valueOf(0.0f);
        boolean z11 = jsonReader.peek() == JsonToken.BEGIN_OBJECT;
        if (z11) {
            jsonReader.beginObject();
        }
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar = null;
        com.bytedance.adsdk.zb.sya.ycx.lud ludVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVarZb = null;
        com.bytedance.adsdk.zb.sya.ycx.ul ulVarDj = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx3 = null;
        com.bytedance.adsdk.zb.sya.ycx.dj djVarZb = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx4 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx5 = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "a":
                    jsonReader.beginObject();
                    while (jsonReader.hasNext()) {
                        String strNextName2 = jsonReader.nextName();
                        strNextName2.getClass();
                        if (strNextName2.equals("k")) {
                            ludVarYcx = ycx.ycx(jsonReader, ulVar);
                        } else {
                            jsonReader.skipValue();
                        }
                    }
                    jsonReader.endObject();
                    ulVar2 = ulVar;
                    break;
                case "o":
                    djVarZb = dj.zb(jsonReader, ulVar);
                    ulVar2 = ulVar;
                    break;
                case "p":
                    ryVarZb = ycx.zb(jsonReader, ulVar);
                    ulVar2 = ulVar;
                    break;
                case "r":
                    zbVarYcx = dj.ycx(jsonReader, ulVar2, false);
                    if (!zbVarYcx.sya().isEmpty()) {
                        zbVarYcx.sya().add(new com.bytedance.adsdk.zb.ul.ycx(ulVar2, fValueOf, fValueOf, null, 0.0f, Float.valueOf(ulVar2.ul())));
                    } else if (((com.bytedance.adsdk.zb.ul.ycx) zbVarYcx.sya().get(0)).ycx != 0) {
                        zbVar = zbVarYcx;
                        ulVar2 = ulVar;
                        break;
                    } else {
                        zbVarYcx.sya().set(0, new com.bytedance.adsdk.zb.ul.ycx(ulVar, fValueOf, fValueOf, null, 0.0f, Float.valueOf(ulVar.ul())));
                    }
                    ulVar2 = ulVar;
                    zbVar = zbVarYcx;
                    break;
                case "s":
                    ulVarDj = dj.dj(jsonReader, ulVar);
                    break;
                case "eo":
                    zbVarYcx5 = dj.ycx(jsonReader, ulVar2, false);
                    break;
                case "rz":
                    ulVar2.ycx("Lottie doesn't support 3D layers.");
                    zbVarYcx = dj.ycx(jsonReader, ulVar2, false);
                    if (!zbVarYcx.sya().isEmpty()) {
                    }
                    ulVar2 = ulVar;
                    zbVar = zbVarYcx;
                    break;
                case "sa":
                    zbVarYcx3 = dj.ycx(jsonReader, ulVar2, false);
                    break;
                case "sk":
                    zbVarYcx2 = dj.ycx(jsonReader, ulVar2, false);
                    break;
                case "so":
                    zbVarYcx4 = dj.ycx(jsonReader, ulVar2, false);
                    break;
                default:
                    jsonReader.skipValue();
                    ulVar2 = ulVar;
                    break;
            }
        }
        if (z11) {
            jsonReader.endObject();
        }
        return new com.bytedance.adsdk.zb.sya.ycx.ok(ycx(ludVarYcx) ? null : ludVarYcx, ycx(ryVarZb) ? null : ryVarZb, ycx(ulVarDj) ? null : ulVarDj, ycx(zbVar) ? null : zbVar, djVarZb, zbVarYcx4, zbVarYcx5, zb(zbVarYcx2) ? null : zbVarYcx2, sya(zbVarYcx3) ? null : zbVarYcx3);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static boolean zb(com.bytedance.adsdk.zb.sya.ycx.zb zbVar) {
        if (zbVar != null) {
            return zbVar.zb() && ((Float) ((com.bytedance.adsdk.zb.ul.ycx) zbVar.sya().get(0)).ycx).floatValue() == 0.0f;
        }
        return true;
    }

    private static boolean ycx(com.bytedance.adsdk.zb.sya.ycx.lud ludVar) {
        if (ludVar != null) {
            return ludVar.zb() && ludVar.sya().get(0).ycx.equals(0.0f, 0.0f);
        }
        return true;
    }

    private static boolean ycx(com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVar) {
        if (ryVar != null) {
            return !(ryVar instanceof com.bytedance.adsdk.zb.sya.ycx.jw) && ryVar.zb() && ryVar.sya().get(0).ycx.equals(0.0f, 0.0f);
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static boolean ycx(com.bytedance.adsdk.zb.sya.ycx.zb zbVar) {
        if (zbVar != null) {
            return zbVar.zb() && ((Float) ((com.bytedance.adsdk.zb.ul.ycx) zbVar.sya().get(0)).ycx).floatValue() == 0.0f;
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static boolean ycx(com.bytedance.adsdk.zb.sya.ycx.ul ulVar) {
        if (ulVar != null) {
            return ulVar.zb() && ((com.bytedance.adsdk.zb.ul.sya) ((com.bytedance.adsdk.zb.ul.ycx) ulVar.sya().get(0)).ycx).zb(1.0f, 1.0f);
        }
        return true;
    }
}
