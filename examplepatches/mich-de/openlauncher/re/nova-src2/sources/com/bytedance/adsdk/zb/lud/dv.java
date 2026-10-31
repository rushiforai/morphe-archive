package com.bytedance.adsdk.zb.lud;

import ads_mobile_sdk.pd;
import android.util.JsonReader;
import com.bytedance.adsdk.zb.sya.zb.fby;
import java.io.IOException;

/* loaded from: classes2.dex */
class dv {
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0020  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static com.bytedance.adsdk.zb.sya.zb.fby ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        char c11;
        jsonReader.beginObject();
        fby.ycx ycxVar = null;
        com.bytedance.adsdk.zb.sya.ycx.fby fbyVarLud = null;
        com.bytedance.adsdk.zb.sya.ycx.dj djVarZb = null;
        boolean zNextBoolean = false;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            c11 = 3;
            switch (strNextName) {
                case "o":
                    djVarZb = dj.zb(jsonReader, ulVar);
                    break;
                case "pt":
                    fbyVarLud = dj.lud(jsonReader, ulVar);
                    break;
                case "inv":
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case "mode":
                    String strNextString = jsonReader.nextString();
                    strNextString.getClass();
                    switch (strNextString.hashCode()) {
                        case pd.H0 /* 97 */:
                            if (!strNextString.equals("a")) {
                                c11 = 65535;
                                break;
                            } else {
                                c11 = 0;
                                break;
                            }
                        case 105:
                            if (strNextString.equals("i")) {
                                c11 = 1;
                                break;
                            }
                            break;
                        case 110:
                            if (strNextString.equals("n")) {
                                c11 = 2;
                                break;
                            }
                            break;
                        case 115:
                            if (!strNextString.equals("s")) {
                            }
                            break;
                    }
                    switch (c11) {
                        case 0:
                            ycxVar = fby.ycx.MASK_MODE_ADD;
                            break;
                        case 1:
                            ulVar.ycx("Animation contains intersect masks. They are not supported but will be treated like add masks.");
                            ycxVar = fby.ycx.MASK_MODE_INTERSECT;
                            break;
                        case 2:
                            ycxVar = fby.ycx.MASK_MODE_NONE;
                            break;
                        case 3:
                            ycxVar = fby.ycx.MASK_MODE_SUBTRACT;
                            break;
                        default:
                            ycxVar = fby.ycx.MASK_MODE_ADD;
                            break;
                    }
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        return new com.bytedance.adsdk.zb.sya.zb.fby(ycxVar, fbyVarLud, djVarZb, zNextBoolean);
    }
}
