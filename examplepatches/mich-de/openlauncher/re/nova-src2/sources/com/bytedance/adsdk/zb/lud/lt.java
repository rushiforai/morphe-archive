package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
class lt {
    public static com.bytedance.adsdk.zb.sya.zb.zb ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, int i5) throws IOException {
        boolean z11 = i5 == 3;
        boolean zNextBoolean = false;
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVarZb = null;
        com.bytedance.adsdk.zb.sya.ycx.lt ltVarSya = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "d":
                    if (jsonReader.nextInt() != 3) {
                        z11 = false;
                        break;
                    } else {
                        z11 = true;
                        break;
                    }
                case "p":
                    ryVarZb = ycx.zb(jsonReader, ulVar);
                    break;
                case "s":
                    ltVarSya = dj.sya(jsonReader, ulVar);
                    break;
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "nm":
                    strNextString = jsonReader.nextString();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        return new com.bytedance.adsdk.zb.sya.zb.zb(strNextString, ryVarZb, ltVarSya, z11, zNextBoolean);
    }
}
