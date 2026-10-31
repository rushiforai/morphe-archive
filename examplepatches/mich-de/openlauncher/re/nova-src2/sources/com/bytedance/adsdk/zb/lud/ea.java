package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;

/* loaded from: classes2.dex */
public class ea {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.adsdk.zb.sya.ycx.zb f22932dj;
    private com.bytedance.adsdk.zb.sya.ycx.zb lud;
    private com.bytedance.adsdk.zb.sya.ycx.zb sya;
    private com.bytedance.adsdk.zb.sya.ycx.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.adsdk.zb.sya.ycx.zb f22933zb;

    private void zb(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        jsonReader.beginObject();
        String strNextString = b.f42142b;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (strNextName.equals("v")) {
                strNextString.getClass();
                switch (strNextString) {
                    case "Distance":
                        this.f22932dj = dj.ycx(jsonReader, ulVar);
                        break;
                    case "Opacity":
                        this.f22933zb = dj.ycx(jsonReader, ulVar, false);
                        break;
                    case "Direction":
                        this.sya = dj.ycx(jsonReader, ulVar, false);
                        break;
                    case "Shadow Color":
                        this.ycx = dj.ul(jsonReader, ulVar);
                        break;
                    case "Softness":
                        this.lud = dj.ycx(jsonReader, ulVar);
                        break;
                    default:
                        jsonReader.skipValue();
                        break;
                }
            } else if (strNextName.equals("nm")) {
                strNextString = jsonReader.nextString();
            } else {
                jsonReader.skipValue();
            }
        }
        jsonReader.endObject();
    }

    public jc ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar2;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar3;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVar4;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (strNextName.equals("ef")) {
                jsonReader.beginArray();
                while (jsonReader.hasNext()) {
                    zb(jsonReader, ulVar);
                }
                jsonReader.endArray();
            } else {
                jsonReader.skipValue();
            }
        }
        com.bytedance.adsdk.zb.sya.ycx.ycx ycxVar = this.ycx;
        if (ycxVar == null || (zbVar = this.f22933zb) == null || (zbVar2 = this.sya) == null || (zbVar3 = this.f22932dj) == null || (zbVar4 = this.lud) == null) {
            return null;
        }
        return new jc(ycxVar, zbVar, zbVar2, zbVar3, zbVar4);
    }
}
