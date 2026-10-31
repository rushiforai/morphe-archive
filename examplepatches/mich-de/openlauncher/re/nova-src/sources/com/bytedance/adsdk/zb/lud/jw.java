package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.zb;
import java.io.IOException;

/* loaded from: classes2.dex */
public class jw implements dc<com.bytedance.adsdk.zb.sya.zb> {
    public static final jw ycx = new jw();

    private jw() {
    }

    @Override // com.bytedance.adsdk.zb.lud.dc
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public com.bytedance.adsdk.zb.sya.zb zb(JsonReader jsonReader, float f11) throws IOException {
        zb.ycx ycxVar = zb.ycx.CENTER;
        jsonReader.beginObject();
        zb.ycx ycxVar2 = ycxVar;
        String strNextString = null;
        String strNextString2 = null;
        PointF pointF = null;
        PointF pointF2 = null;
        float fNextDouble = 0.0f;
        float fNextDouble2 = 0.0f;
        float fNextDouble3 = 0.0f;
        float fNextDouble4 = 0.0f;
        int iNextInt = 0;
        int iYcx = 0;
        int iYcx2 = 0;
        boolean zNextBoolean = true;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "f":
                    strNextString2 = jsonReader.nextString();
                    break;
                case "j":
                    int iNextInt2 = jsonReader.nextInt();
                    ycxVar2 = zb.ycx.CENTER;
                    if (iNextInt2 <= ycxVar2.ordinal() && iNextInt2 >= 0) {
                        ycxVar2 = zb.ycx.values()[iNextInt2];
                        break;
                    } else {
                        break;
                    }
                    break;
                case "s":
                    fNextDouble = (float) jsonReader.nextDouble();
                    break;
                case "t":
                    strNextString = jsonReader.nextString();
                    break;
                case "fc":
                    iYcx = uh.ycx(jsonReader);
                    break;
                case "lh":
                    fNextDouble2 = (float) jsonReader.nextDouble();
                    break;
                case "ls":
                    fNextDouble3 = (float) jsonReader.nextDouble();
                    break;
                case "of":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "ps":
                    jsonReader.beginArray();
                    PointF pointF3 = new PointF(((float) jsonReader.nextDouble()) * f11, ((float) jsonReader.nextDouble()) * f11);
                    jsonReader.endArray();
                    pointF = pointF3;
                    break;
                case "sc":
                    iYcx2 = uh.ycx(jsonReader);
                    break;
                case "sw":
                    fNextDouble4 = (float) jsonReader.nextDouble();
                    break;
                case "sz":
                    jsonReader.beginArray();
                    PointF pointF4 = new PointF(((float) jsonReader.nextDouble()) * f11, ((float) jsonReader.nextDouble()) * f11);
                    jsonReader.endArray();
                    pointF2 = pointF4;
                    break;
                case "tr":
                    iNextInt = jsonReader.nextInt();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        return new com.bytedance.adsdk.zb.sya.zb(strNextString, strNextString2, fNextDouble, ycxVar2, iNextInt, fNextDouble2, fNextDouble3, iYcx, iYcx2, fNextDouble4, zNextBoolean, pointF, pointF2);
    }
}
