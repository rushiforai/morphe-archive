package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
public class zb {
    public static com.bytedance.adsdk.zb.sya.ycx.ea ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        jsonReader.beginObject();
        com.bytedance.adsdk.zb.sya.ycx.ea eaVarZb = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (strNextName.equals("a")) {
                eaVarZb = zb(jsonReader, ulVar);
            } else {
                jsonReader.skipValue();
            }
        }
        jsonReader.endObject();
        return eaVarZb == null ? new com.bytedance.adsdk.zb.sya.ycx.ea(null, null, null, null) : eaVarZb;
    }

    private static com.bytedance.adsdk.zb.sya.ycx.ea zb(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        jsonReader.beginObject();
        com.bytedance.adsdk.zb.sya.ycx.ycx ycxVarUl = null;
        com.bytedance.adsdk.zb.sya.ycx.ycx ycxVarUl2 = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "t":
                    zbVarYcx2 = dj.ycx(jsonReader, ulVar);
                    break;
                case "fc":
                    ycxVarUl = dj.ul(jsonReader, ulVar);
                    break;
                case "sc":
                    ycxVarUl2 = dj.ul(jsonReader, ulVar);
                    break;
                case "sw":
                    zbVarYcx = dj.ycx(jsonReader, ulVar);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        return new com.bytedance.adsdk.zb.sya.ycx.ea(ycxVarUl, ycxVarUl2, zbVarYcx, zbVarYcx2);
    }
}
