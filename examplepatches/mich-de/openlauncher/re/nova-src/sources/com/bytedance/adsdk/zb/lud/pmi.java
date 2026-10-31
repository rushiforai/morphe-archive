package com.bytedance.adsdk.zb.lud;

import android.util.JsonReader;
import java.io.IOException;

/* loaded from: classes2.dex */
public class pmi implements dc<Integer> {
    public static final pmi ycx = new pmi();

    private pmi() {
    }

    @Override // com.bytedance.adsdk.zb.lud.dc
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public Integer zb(JsonReader jsonReader, float f11) throws IOException {
        return Integer.valueOf(Math.round(uh.zb(jsonReader) * f11));
    }
}
