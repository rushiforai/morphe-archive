package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
class rmf {
    public static com.bytedance.adsdk.zb.sya.zb.ea ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVarZb = null;
        com.bytedance.adsdk.zb.sya.ycx.lt ltVarSya = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "p":
                    ryVarZb = ycx.zb(jsonReader, ulVar);
                    break;
                case "r":
                    zbVarYcx = dj.ycx(jsonReader, ulVar);
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
        return new com.bytedance.adsdk.zb.sya.zb.ea(strNextString, ryVarZb, ltVarSya, zbVarYcx, zNextBoolean);
    }
}
