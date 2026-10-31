package com.bytedance.adsdk.zb.lud;

import android.graphics.Path;
import android.util.JsonReader;
import java.io.IOException;
import java.util.Collections;

/* loaded from: classes2.dex */
class ifb {
    public static com.bytedance.adsdk.zb.sya.zb.syc ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        com.bytedance.adsdk.zb.sya.ycx.dj djVar = null;
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.ycx.ycx ycxVarUl = null;
        boolean zNextBoolean = false;
        boolean zNextBoolean2 = false;
        int iNextInt = 1;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "fillEnabled":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "c":
                    ycxVarUl = dj.ul(jsonReader, ulVar);
                    break;
                case "o":
                    djVar = dj.zb(jsonReader, ulVar);
                    break;
                case "r":
                    iNextInt = jsonReader.nextInt();
                    break;
                case "hd":
                    zNextBoolean2 = jsonReader.nextBoolean();
                    break;
                case "nm":
                    strNextString = jsonReader.nextString();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        if (djVar == null) {
            djVar = new com.bytedance.adsdk.zb.sya.ycx.dj(Collections.singletonList(new com.bytedance.adsdk.zb.ul.ycx(100)));
        }
        return new com.bytedance.adsdk.zb.sya.zb.syc(strNextString, zNextBoolean, iNextInt == 1 ? Path.FillType.WINDING : Path.FillType.EVEN_ODD, ycxVarUl, djVar, zNextBoolean2);
    }
}
