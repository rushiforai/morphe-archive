package com.bytedance.adsdk.zb.lud;

import ads_mobile_sdk.pd;
import android.graphics.PointF;
import android.util.JsonReader;
import android.util.JsonToken;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes2.dex */
public class kgy implements dc<com.bytedance.adsdk.zb.sya.zb.xkz> {
    public static final kgy ycx = new kgy();

    private kgy() {
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0029  */
    @Override // com.bytedance.adsdk.zb.lud.dc
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public com.bytedance.adsdk.zb.sya.zb.xkz zb(JsonReader jsonReader, float f11) throws IOException {
        if (jsonReader.peek() == JsonToken.BEGIN_ARRAY) {
            jsonReader.beginArray();
        }
        jsonReader.beginObject();
        List<PointF> listYcx = null;
        List<PointF> listYcx2 = null;
        List<PointF> listYcx3 = null;
        boolean zNextBoolean = false;
        while (true) {
            char c11 = 1;
            if (!jsonReader.hasNext()) {
                jsonReader.endObject();
                if (jsonReader.peek() == JsonToken.END_ARRAY) {
                    jsonReader.endArray();
                }
                if (listYcx == null || listYcx2 == null || listYcx3 == null) {
                    throw new IllegalArgumentException("Shape data was missing information.");
                }
                if (listYcx.isEmpty()) {
                    return new com.bytedance.adsdk.zb.sya.zb.xkz(new PointF(), false, Collections.EMPTY_LIST);
                }
                int size = listYcx.size();
                PointF pointF = listYcx.get(0);
                ArrayList arrayList = new ArrayList(size);
                for (int i5 = 1; i5 < size; i5++) {
                    PointF pointF2 = listYcx.get(i5);
                    int i11 = i5 - 1;
                    arrayList.add(new com.bytedance.adsdk.zb.sya.ycx(com.bytedance.adsdk.zb.lt.lud.ycx(listYcx.get(i11), listYcx3.get(i11)), com.bytedance.adsdk.zb.lt.lud.ycx(pointF2, listYcx2.get(i5)), pointF2));
                }
                if (zNextBoolean) {
                    PointF pointF3 = listYcx.get(0);
                    int i12 = size - 1;
                    arrayList.add(new com.bytedance.adsdk.zb.sya.ycx(com.bytedance.adsdk.zb.lt.lud.ycx(listYcx.get(i12), listYcx3.get(i12)), com.bytedance.adsdk.zb.lt.lud.ycx(pointF3, listYcx2.get(0)), pointF3));
                }
                return new com.bytedance.adsdk.zb.sya.zb.xkz(pointF, zNextBoolean, arrayList);
            }
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName.hashCode()) {
                case pd.R0 /* 99 */:
                    if (strNextName.equals("c")) {
                        c11 = 0;
                        break;
                    } else {
                        c11 = 65535;
                        break;
                    }
                case 105:
                    if (!strNextName.equals("i")) {
                    }
                    break;
                case 111:
                    if (strNextName.equals("o")) {
                        c11 = 2;
                        break;
                    }
                    break;
                case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                    if (strNextName.equals("v")) {
                        c11 = 3;
                        break;
                    }
                    break;
            }
            switch (c11) {
                case 0:
                    zNextBoolean = jsonReader.nextBoolean();
                    break;
                case 1:
                    listYcx2 = uh.ycx(jsonReader, f11);
                    break;
                case 2:
                    listYcx3 = uh.ycx(jsonReader, f11);
                    break;
                case 3:
                    listYcx = uh.ycx(jsonReader, f11);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
    }
}
