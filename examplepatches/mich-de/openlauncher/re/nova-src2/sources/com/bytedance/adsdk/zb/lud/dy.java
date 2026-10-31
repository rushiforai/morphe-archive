package com.bytedance.adsdk.zb.lud;

import android.graphics.Path;
import android.util.JsonReader;
import java.io.IOException;
import java.util.Collections;

/* loaded from: classes2.dex */
class dy {
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static com.bytedance.adsdk.zb.sya.zb.lud ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        int iNextInt;
        com.bytedance.adsdk.zb.sya.ycx.dj djVar = null;
        Path.FillType fillType = Path.FillType.WINDING;
        String strNextString = null;
        com.bytedance.adsdk.zb.sya.zb.ul ulVar2 = null;
        com.bytedance.adsdk.zb.sya.ycx.sya syaVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.lt ltVarSya = null;
        com.bytedance.adsdk.zb.sya.ycx.lt ltVarSya2 = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            iNextInt = -1;
            switch (strNextName) {
                case "e":
                    ltVarSya2 = dj.sya(jsonReader, ulVar);
                    break;
                case "g":
                    jsonReader.beginObject();
                    while (jsonReader.hasNext()) {
                        String strNextName2 = jsonReader.nextName();
                        strNextName2.getClass();
                        if (strNextName2.equals("k")) {
                            syaVarYcx = dj.ycx(jsonReader, ulVar, iNextInt);
                        } else if (strNextName2.equals("p")) {
                            iNextInt = jsonReader.nextInt();
                        } else {
                            jsonReader.skipValue();
                        }
                    }
                    jsonReader.endObject();
                    break;
                case "o":
                    djVar = dj.zb(jsonReader, ulVar);
                    break;
                case "r":
                    fillType = jsonReader.nextInt() == 1 ? Path.FillType.WINDING : Path.FillType.EVEN_ODD;
                    break;
                case "s":
                    ltVarSya = dj.sya(jsonReader, ulVar);
                    break;
                case "t":
                    ulVar2 = jsonReader.nextInt() == 1 ? com.bytedance.adsdk.zb.sya.zb.ul.LINEAR : com.bytedance.adsdk.zb.sya.zb.ul.RADIAL;
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
        if (djVar == null) {
            djVar = new com.bytedance.adsdk.zb.sya.ycx.dj(Collections.singletonList(new com.bytedance.adsdk.zb.ul.ycx(100)));
        }
        return new com.bytedance.adsdk.zb.sya.zb.lud(strNextString, ulVar2, fillType, syaVarYcx, djVar, ltVarSya, ltVarSya2, null, null, zNextBoolean);
    }
}
