package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
class aeu {
    public static com.bytedance.adsdk.zb.sya.zb.ok ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
        com.bytedance.adsdk.zb.sya.ycx.ok okVarYcx = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "c":
                    zbVarYcx = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "o":
                    zbVarYcx2 = dj.ycx(jsonReader, ulVar, false);
                    break;
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "nm":
                    strNextString = jsonReader.nextString();
                    break;
                case "tr":
                    okVarYcx = sya.ycx(jsonReader, ulVar);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        return new com.bytedance.adsdk.zb.sya.zb.ok(strNextString, zbVarYcx, zbVarYcx2, okVarYcx, zNextBoolean);
    }
}
