package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.zb.uh;
import java.io.IOException;

/* loaded from: classes2.dex */
class nji {
    public static com.bytedance.adsdk.zb.sya.zb.uh ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        String strNextString = null;
        uh.ycx ycxVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx3 = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "e":
                    zbVarYcx2 = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "m":
                    ycxVarYcx = uh.ycx.ycx(jsonReader.nextInt());
                    break;
                case "o":
                    zbVarYcx3 = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "s":
                    zbVarYcx = dj.ycx(jsonReader, ulVar, false);
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
        return new com.bytedance.adsdk.zb.sya.zb.uh(strNextString, ycxVarYcx, zbVarYcx, zbVarYcx2, zbVarYcx3, zNextBoolean);
    }
}
