package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
class lud {
    public static com.bytedance.adsdk.zb.sya.zb.ycx ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        com.bytedance.adsdk.zb.sya.zb.ycx ycxVar = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (strNextName.equals("ef")) {
                jsonReader.beginArray();
                while (jsonReader.hasNext()) {
                    com.bytedance.adsdk.zb.sya.zb.ycx ycxVarZb = zb(jsonReader, ulVar);
                    if (ycxVarZb != null) {
                        ycxVar = ycxVarZb;
                    }
                }
                jsonReader.endArray();
            } else {
                jsonReader.skipValue();
            }
        }
        return ycxVar;
    }

    private static com.bytedance.adsdk.zb.sya.zb.ycx zb(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        jsonReader.beginObject();
        com.bytedance.adsdk.zb.sya.zb.ycx ycxVar = null;
        while (true) {
            boolean z11 = false;
            while (jsonReader.hasNext()) {
                String strNextName = jsonReader.nextName();
                strNextName.getClass();
                if (strNextName.equals("v")) {
                    if (z11) {
                        ycxVar = new com.bytedance.adsdk.zb.sya.zb.ycx(dj.ycx(jsonReader, ulVar));
                    } else {
                        jsonReader.skipValue();
                    }
                } else if (!strNextName.equals("ty")) {
                    jsonReader.skipValue();
                } else if (jsonReader.nextInt() == 0) {
                    z11 = true;
                }
            }
            jsonReader.endObject();
            return ycxVar;
        }
    }
}
