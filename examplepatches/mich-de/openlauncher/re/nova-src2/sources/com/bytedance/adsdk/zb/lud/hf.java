package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;

/* loaded from: classes2.dex */
class hf {
    public static com.bytedance.adsdk.zb.ycx.zb.jw ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return new com.bytedance.adsdk.zb.ycx.zb.jw(ulVar, htf.ycx(jsonReader, ulVar, com.bytedance.adsdk.zb.lt.lt.ycx(), tru.ycx, jsonReader.peek() == JsonToken.BEGIN_OBJECT, false));
    }
}
