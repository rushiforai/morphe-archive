package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
public class xz {
    public static com.bytedance.adsdk.zb.sya.zb.ry ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "r":
                    zbVarYcx = dj.ycx(jsonReader, ulVar, true);
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
        if (zNextBoolean) {
            return null;
        }
        return new com.bytedance.adsdk.zb.sya.zb.ry(strNextString, zbVarYcx);
    }
}
