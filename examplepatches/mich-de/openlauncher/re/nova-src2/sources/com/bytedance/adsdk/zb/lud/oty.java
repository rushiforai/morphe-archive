package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.zb.jw;
import java.io.IOException;

/* loaded from: classes2.dex */
class oty {
    public static com.bytedance.adsdk.zb.sya.zb.jw ycx(JsonReader jsonReader) throws IOException {
        String strNextString = null;
        jw.ycx ycxVarYcx = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "hd":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "mm":
                    ycxVarYcx = jw.ycx.ycx(jsonReader.nextInt());
                    break;
                case "nm":
                    strNextString = jsonReader.nextString();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        return new com.bytedance.adsdk.zb.sya.zb.jw(strNextString, ycxVarYcx, zNextBoolean);
    }
}
