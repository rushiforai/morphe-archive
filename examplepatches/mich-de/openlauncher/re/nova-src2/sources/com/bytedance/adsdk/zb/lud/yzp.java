package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: classes2.dex */
class yzp {
    public static com.bytedance.adsdk.zb.sya.zb.dy ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        ArrayList arrayList = new ArrayList();
        String strNextString = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "it":
                    jsonReader.beginArray();
                    while (jsonReader.hasNext()) {
                        com.bytedance.adsdk.zb.sya.zb.sya syaVarYcx = fby.ycx(jsonReader, ulVar);
                        if (syaVarYcx != null) {
                            arrayList.add(syaVarYcx);
                        }
                    }
                    jsonReader.endArray();
                    break;
                case "nm":
                    strNextString = jsonReader.nextString();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        return new com.bytedance.adsdk.zb.sya.zb.dy(strNextString, arrayList, zNextBoolean);
    }
}
