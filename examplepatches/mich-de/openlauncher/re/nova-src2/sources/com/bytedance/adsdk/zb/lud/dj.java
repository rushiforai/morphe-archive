package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;
import java.util.List;

/* loaded from: classes2.dex */
public class dj {
    public static com.bytedance.adsdk.zb.sya.ycx.ul dj(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.ul(ycx(jsonReader, ulVar, rmy.ycx));
    }

    public static com.bytedance.adsdk.zb.sya.ycx.jc lt(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.jc(ycx(jsonReader, com.bytedance.adsdk.zb.lt.lt.ycx(), ulVar, jw.ycx));
    }

    public static com.bytedance.adsdk.zb.sya.ycx.fby lud(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.fby(ycx(jsonReader, com.bytedance.adsdk.zb.lt.lt.ycx(), ulVar, kgy.ycx));
    }

    public static com.bytedance.adsdk.zb.sya.ycx.lt sya(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.lt(thx.ycx(jsonReader, ulVar, com.bytedance.adsdk.zb.lt.lt.ycx(), bhi.ycx, true));
    }

    public static com.bytedance.adsdk.zb.sya.ycx.ycx ul(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.ycx(ycx(jsonReader, ulVar, ul.ycx));
    }

    public static com.bytedance.adsdk.zb.sya.ycx.zb ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return ycx(jsonReader, ulVar, true);
    }

    public static com.bytedance.adsdk.zb.sya.ycx.dj zb(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.dj(ycx(jsonReader, ulVar, pmi.ycx));
    }

    public static com.bytedance.adsdk.zb.sya.ycx.zb ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, boolean z11) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.zb(ycx(jsonReader, z11 ? com.bytedance.adsdk.zb.lt.lt.ycx() : 1.0f, ulVar, ok.ycx));
    }

    public static com.bytedance.adsdk.zb.sya.ycx.sya ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, int i5) throws IOException {
        return new com.bytedance.adsdk.zb.sya.ycx.sya(ycx(jsonReader, ulVar, new syc(i5)));
    }

    private static <T> List<com.bytedance.adsdk.zb.ul.ycx<T>> ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, dc<T> dcVar) throws IOException {
        return thx.ycx(jsonReader, ulVar, 1.0f, dcVar, false);
    }

    private static <T> List<com.bytedance.adsdk.zb.ul.ycx<T>> ycx(JsonReader jsonReader, float f11, com.bytedance.adsdk.zb.ul ulVar, dc<T> dcVar) throws IOException {
        return thx.ycx(jsonReader, ulVar, f11, dcVar, false);
    }
}
