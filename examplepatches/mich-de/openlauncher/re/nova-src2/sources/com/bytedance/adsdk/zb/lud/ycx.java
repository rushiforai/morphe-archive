package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public class ycx {
    public static com.bytedance.adsdk.zb.sya.ycx.lud ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        ArrayList arrayList = new ArrayList();
        if (jsonReader.peek() == JsonToken.BEGIN_ARRAY) {
            jsonReader.beginArray();
            while (jsonReader.hasNext()) {
                arrayList.add(hf.ycx(jsonReader, ulVar));
            }
            jsonReader.endArray();
            thx.ycx(arrayList);
        } else {
            arrayList.add(new com.bytedance.adsdk.zb.ul.ycx(uh.zb(jsonReader, com.bytedance.adsdk.zb.lt.lt.ycx())));
        }
        return new com.bytedance.adsdk.zb.sya.ycx.lud(arrayList);
    }

    public static com.bytedance.adsdk.zb.sya.ycx.ry<PointF, PointF> zb(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        jsonReader.beginObject();
        com.bytedance.adsdk.zb.sya.ycx.lud ludVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx = null;
        com.bytedance.adsdk.zb.sya.ycx.zb zbVarYcx2 = null;
        boolean z11 = false;
        while (jsonReader.peek() != JsonToken.END_OBJECT) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "k":
                    ludVarYcx = ycx(jsonReader, ulVar);
                    break;
                case "x":
                    if (jsonReader.peek() != JsonToken.STRING) {
                        zbVarYcx = dj.ycx(jsonReader, ulVar);
                        break;
                    } else {
                        z11 = true;
                        jsonReader.skipValue();
                        break;
                    }
                case "y":
                    if (jsonReader.peek() != JsonToken.STRING) {
                        zbVarYcx2 = dj.ycx(jsonReader, ulVar);
                        break;
                    } else {
                        z11 = true;
                        jsonReader.skipValue();
                        break;
                    }
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        if (z11) {
            ulVar.ycx("Lottie doesn't support expressions.");
        }
        return ludVarYcx != null ? ludVarYcx : new com.bytedance.adsdk.zb.sya.ycx.jw(zbVarYcx, zbVarYcx2);
    }
}
