package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
class dwi {
    public static com.bytedance.adsdk.zb.sya.zb.wie ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.fby fbyVarLud = null;
        int iNextInt = 0;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "ks":
                    fbyVarLud = dj.lud(jsonReader, ulVar);
                    break;
                case "nm":
                    strNextString = jsonReader.nextString();
                    break;
                case "ind":
                    iNextInt = jsonReader.nextInt();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        return new com.bytedance.adsdk.zb.sya.zb.wie(strNextString, iNextInt, fbyVarLud, zNextBoolean);
    }
}
