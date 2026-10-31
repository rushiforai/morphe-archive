package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;

/* loaded from: classes2.dex */
public class bhi implements dc<PointF> {
    public static final bhi ycx = new bhi();

    private bhi() {
    }

    @Override // com.bytedance.adsdk.zb.lud.dc
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public PointF zb(JsonReader jsonReader, float f11) throws IOException {
        JsonToken jsonTokenPeek = jsonReader.peek();
        if (jsonTokenPeek != JsonToken.BEGIN_ARRAY && jsonTokenPeek != JsonToken.BEGIN_OBJECT) {
            if (jsonTokenPeek != JsonToken.NUMBER) {
                throw new IllegalArgumentException("Cannot convert json to point. Next token is ".concat(String.valueOf(jsonTokenPeek)));
            }
            PointF pointF = new PointF(((float) jsonReader.nextDouble()) * f11, ((float) jsonReader.nextDouble()) * f11);
            while (jsonReader.hasNext()) {
                jsonReader.skipValue();
            }
            return pointF;
        }
        return uh.zb(jsonReader, f11);
    }
}
