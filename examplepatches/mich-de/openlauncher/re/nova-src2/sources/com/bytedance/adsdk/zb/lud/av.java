package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.zb.jc;
import java.io.IOException;

/* loaded from: classes2.dex */
class av {
    public static com.bytedance.adsdk.zb.sya.zb.jc ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, int i5) throws IOException {
        boolean zNextBoolean = false;
        boolean z11 = i5 == 3;
        String strNextString = null;
        jc.ycx ycxVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> ryVarZb = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx3 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx4 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx5 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx6 = null;
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
                case "r":
                    zbVarYcx2 = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "ir":
                    zbVarYcx3 = dj.ycx(jsonReader, ulVar);
                    break;
                case "is":
                    zbVarYcx5 = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "nm":
                    strNextString = jsonReader.nextString();
                    break;
                case "or":
                    zbVarYcx4 = dj.ycx(jsonReader, ulVar);
                    break;
                case "os":
                    zbVarYcx6 = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "pt":
                    zbVarYcx = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "sy":
                    ycxVarYcx = jc.ycx.ycx(jsonReader.nextInt());
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        return new com.bytedance.adsdk.zb.sya.zb.jc(strNextString, ycxVarYcx, zbVarYcx, ryVarZb, zbVarYcx2, zbVarYcx3, zbVarYcx4, zbVarYcx5, zbVarYcx6, zNextBoolean, z11);
    }
}
