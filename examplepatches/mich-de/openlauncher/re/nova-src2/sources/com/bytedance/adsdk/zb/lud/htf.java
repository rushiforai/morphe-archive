package com.bytedance.adsdk.zb.lud;

import android.graphics.PointF;
import android.util.JsonReader;
import android.util.JsonToken;
import android.util.SparseArray;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import java.io.IOException;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
class htf {
    private static final Interpolator ycx = new LinearInterpolator();

    /* renamed from: zb, reason: collision with root package name */
    private static SparseArray<WeakReference<Interpolator>> f22934zb;

    private static SparseArray<WeakReference<Interpolator>> ycx() {
        if (f22934zb == null) {
            f22934zb = new SparseArray<>();
        }
        return f22934zb;
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x0263 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0276  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static <T> com.bytedance.adsdk.zb.ul.ycx<T> zb(com.bytedance.adsdk.zb.ul ulVar, JsonReader jsonReader, float f11, dc<T> dcVar) throws IOException {
        Interpolator interpolatorYcx;
        Interpolator interpolatorYcx2;
        T t6;
        Interpolator interpolator;
        Interpolator interpolatorYcx3;
        PointF pointF;
        PointF pointF2;
        com.bytedance.adsdk.zb.ul.ycx<T> ycxVar;
        T t9;
        PointF pointF3;
        PointF pointF4;
        PointF pointF5;
        PointF pointF6;
        jsonReader.beginObject();
        boolean z11 = false;
        PointF pointFZb = null;
        PointF pointFZb2 = null;
        PointF pointF7 = null;
        T tZb = null;
        PointF pointF8 = null;
        PointF pointF9 = null;
        PointF pointF10 = null;
        PointF pointFZb3 = null;
        PointF pointFZb4 = null;
        float fNextDouble = 0.0f;
        T tZb2 = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "e":
                    tZb2 = dcVar.zb(jsonReader, f11);
                    continue;
                case "h":
                    t9 = tZb;
                    pointF3 = pointFZb3;
                    pointF4 = pointFZb4;
                    if (jsonReader.nextInt() != 1) {
                        z11 = false;
                        break;
                    } else {
                        z11 = true;
                        break;
                    }
                case "i":
                    boolean z12 = z11;
                    t9 = tZb;
                    pointF3 = pointFZb3;
                    pointF4 = pointFZb4;
                    if (jsonReader.peek() == JsonToken.BEGIN_OBJECT) {
                        jsonReader.beginObject();
                        float fNextDouble2 = 0.0f;
                        float fNextDouble3 = 0.0f;
                        float fNextDouble4 = 0.0f;
                        float fNextDouble5 = 0.0f;
                        while (jsonReader.hasNext()) {
                            String strNextName2 = jsonReader.nextName();
                            strNextName2.getClass();
                            if (strNextName2.equals("x")) {
                                JsonToken jsonTokenPeek = jsonReader.peek();
                                JsonToken jsonToken = JsonToken.NUMBER;
                                if (jsonTokenPeek == jsonToken) {
                                    fNextDouble4 = (float) jsonReader.nextDouble();
                                    fNextDouble2 = fNextDouble4;
                                } else {
                                    jsonReader.beginArray();
                                    fNextDouble2 = (float) jsonReader.nextDouble();
                                    fNextDouble4 = jsonReader.peek() == jsonToken ? (float) jsonReader.nextDouble() : fNextDouble2;
                                    jsonReader.endArray();
                                }
                            } else if (strNextName2.equals("y")) {
                                JsonToken jsonTokenPeek2 = jsonReader.peek();
                                JsonToken jsonToken2 = JsonToken.NUMBER;
                                if (jsonTokenPeek2 == jsonToken2) {
                                    fNextDouble5 = (float) jsonReader.nextDouble();
                                    fNextDouble3 = fNextDouble5;
                                } else {
                                    jsonReader.beginArray();
                                    fNextDouble3 = (float) jsonReader.nextDouble();
                                    fNextDouble5 = jsonReader.peek() == jsonToken2 ? (float) jsonReader.nextDouble() : fNextDouble3;
                                    jsonReader.endArray();
                                }
                            } else {
                                jsonReader.skipValue();
                            }
                        }
                        PointF pointF11 = new PointF(fNextDouble2, fNextDouble3);
                        pointF10 = new PointF(fNextDouble4, fNextDouble5);
                        jsonReader.endObject();
                        pointF9 = pointF11;
                    } else {
                        pointFZb2 = uh.zb(jsonReader, f11);
                    }
                    z11 = z12;
                    break;
                case "o":
                    boolean z13 = z11;
                    if (jsonReader.peek() == JsonToken.BEGIN_OBJECT) {
                        jsonReader.beginObject();
                        float fNextDouble6 = 0.0f;
                        float fNextDouble7 = 0.0f;
                        float fNextDouble8 = 0.0f;
                        float fNextDouble9 = 0.0f;
                        while (jsonReader.hasNext()) {
                            T t10 = tZb;
                            String strNextName3 = jsonReader.nextName();
                            strNextName3.getClass();
                            if (strNextName3.equals("x")) {
                                pointF5 = pointFZb3;
                                pointF6 = pointFZb4;
                                JsonToken jsonTokenPeek3 = jsonReader.peek();
                                JsonToken jsonToken3 = JsonToken.NUMBER;
                                if (jsonTokenPeek3 == jsonToken3) {
                                    fNextDouble8 = (float) jsonReader.nextDouble();
                                    fNextDouble6 = fNextDouble8;
                                } else {
                                    jsonReader.beginArray();
                                    fNextDouble6 = (float) jsonReader.nextDouble();
                                    fNextDouble8 = jsonReader.peek() == jsonToken3 ? (float) jsonReader.nextDouble() : fNextDouble6;
                                    jsonReader.endArray();
                                }
                            } else {
                                if (strNextName3.equals("y")) {
                                    JsonToken jsonTokenPeek4 = jsonReader.peek();
                                    JsonToken jsonToken4 = JsonToken.NUMBER;
                                    if (jsonTokenPeek4 == jsonToken4) {
                                        fNextDouble9 = (float) jsonReader.nextDouble();
                                        fNextDouble7 = fNextDouble9;
                                    } else {
                                        jsonReader.beginArray();
                                        pointF5 = pointFZb3;
                                        pointF6 = pointFZb4;
                                        fNextDouble7 = (float) jsonReader.nextDouble();
                                        fNextDouble9 = jsonReader.peek() == jsonToken4 ? (float) jsonReader.nextDouble() : fNextDouble7;
                                        jsonReader.endArray();
                                    }
                                } else {
                                    jsonReader.skipValue();
                                }
                                tZb = t10;
                            }
                            tZb = t10;
                            pointFZb3 = pointF5;
                            pointFZb4 = pointF6;
                        }
                        PointF pointF12 = new PointF(fNextDouble6, fNextDouble7);
                        PointF pointF13 = new PointF(fNextDouble8, fNextDouble9);
                        jsonReader.endObject();
                        pointF7 = pointF12;
                        pointF8 = pointF13;
                    } else {
                        pointFZb = uh.zb(jsonReader, f11);
                    }
                    z11 = z13;
                    continue;
                case "s":
                    tZb = dcVar.zb(jsonReader, f11);
                    continue;
                case "t":
                    fNextDouble = (float) jsonReader.nextDouble();
                    continue;
                case "ti":
                    pointFZb4 = uh.zb(jsonReader, f11);
                    continue;
                case "to":
                    pointFZb3 = uh.zb(jsonReader, f11);
                    continue;
                default:
                    jsonReader.skipValue();
                    continue;
            }
            tZb = t9;
            pointFZb3 = pointF3;
            pointFZb4 = pointF4;
        }
        boolean z14 = z11;
        T t11 = tZb;
        PointF pointF14 = pointFZb3;
        PointF pointF15 = pointFZb4;
        jsonReader.endObject();
        if (z14) {
            tZb2 = t11;
        } else {
            if (pointFZb != null && pointFZb2 != null) {
                interpolatorYcx3 = ycx(pointFZb, pointFZb2);
                interpolator = interpolatorYcx3;
                t6 = tZb2;
                interpolatorYcx = null;
                interpolatorYcx2 = null;
                if (interpolatorYcx == null) {
                    pointF = pointF14;
                    pointF2 = pointF15;
                    ycxVar = new com.bytedance.adsdk.zb.ul.ycx<>(ulVar, t11, t6, interpolator, fNextDouble, null);
                }
                ycxVar.fby = pointF;
                ycxVar.f23133jw = pointF2;
                return ycxVar;
            }
            if (pointF7 != null && pointF8 != null && pointF9 != null && pointF10 != null) {
                interpolatorYcx = ycx(pointF7, pointF9);
                interpolatorYcx2 = ycx(pointF8, pointF10);
                t6 = tZb2;
                interpolator = null;
                if (interpolatorYcx == null || interpolatorYcx2 == null) {
                    pointF = pointF14;
                    pointF2 = pointF15;
                    ycxVar = new com.bytedance.adsdk.zb.ul.ycx<>(ulVar, t11, t6, interpolator, fNextDouble, null);
                } else {
                    pointF = pointF14;
                    pointF2 = pointF15;
                    ycxVar = new com.bytedance.adsdk.zb.ul.ycx<>(ulVar, t11, t6, interpolatorYcx, interpolatorYcx2, fNextDouble, null);
                }
                ycxVar.fby = pointF;
                ycxVar.f23133jw = pointF2;
                return ycxVar;
            }
        }
        interpolatorYcx3 = ycx;
        interpolator = interpolatorYcx3;
        t6 = tZb2;
        interpolatorYcx = null;
        interpolatorYcx2 = null;
        if (interpolatorYcx == null) {
        }
        ycxVar.fby = pointF;
        ycxVar.f23133jw = pointF2;
        return ycxVar;
    }

    private static WeakReference<Interpolator> ycx(int i5) {
        WeakReference<Interpolator> weakReference;
        synchronized (htf.class) {
            weakReference = ycx().get(i5);
        }
        return weakReference;
    }

    private static void ycx(int i5, WeakReference<Interpolator> weakReference) {
        synchronized (htf.class) {
            f22934zb.put(i5, weakReference);
        }
    }

    public static <T> com.bytedance.adsdk.zb.ul.ycx<T> ycx(JsonReader jsonReader, com.bytedance.adsdk.zb.ul ulVar, float f11, dc<T> dcVar, boolean z11, boolean z12) throws IOException {
        if (z11 && z12) {
            return zb(ulVar, jsonReader, f11, dcVar);
        }
        if (z11) {
            return ycx(ulVar, jsonReader, f11, dcVar);
        }
        return ycx(jsonReader, f11, dcVar);
    }

    private static <T> com.bytedance.adsdk.zb.ul.ycx<T> ycx(com.bytedance.adsdk.zb.ul ulVar, JsonReader jsonReader, float f11, dc<T> dcVar) throws IOException {
        Interpolator interpolatorYcx;
        jsonReader.beginObject();
        PointF pointFZb = null;
        T tZb = null;
        T tZb2 = null;
        PointF pointFZb2 = null;
        PointF pointFZb3 = null;
        float fNextDouble = 0.0f;
        boolean z11 = false;
        PointF pointFZb4 = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "e":
                    tZb = dcVar.zb(jsonReader, f11);
                    break;
                case "h":
                    if (jsonReader.nextInt() != 1) {
                        z11 = false;
                        break;
                    } else {
                        z11 = true;
                        break;
                    }
                case "i":
                    pointFZb4 = uh.zb(jsonReader, 1.0f);
                    break;
                case "o":
                    pointFZb = uh.zb(jsonReader, 1.0f);
                    break;
                case "s":
                    tZb2 = dcVar.zb(jsonReader, f11);
                    break;
                case "t":
                    fNextDouble = (float) jsonReader.nextDouble();
                    break;
                case "ti":
                    pointFZb3 = uh.zb(jsonReader, f11);
                    break;
                case "to":
                    pointFZb2 = uh.zb(jsonReader, f11);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        if (!z11) {
            if (pointFZb != null && pointFZb4 != null) {
                interpolatorYcx = ycx(pointFZb, pointFZb4);
            }
            com.bytedance.adsdk.zb.ul.ycx<T> ycxVar = new com.bytedance.adsdk.zb.ul.ycx<>(ulVar, tZb2, tZb, interpolatorYcx, fNextDouble, null);
            ycxVar.fby = pointFZb2;
            ycxVar.f23133jw = pointFZb3;
            return ycxVar;
        }
        tZb = tZb2;
        interpolatorYcx = ycx;
        com.bytedance.adsdk.zb.ul.ycx<T> ycxVar2 = new com.bytedance.adsdk.zb.ul.ycx<>(ulVar, tZb2, tZb, interpolatorYcx, fNextDouble, null);
        ycxVar2.fby = pointFZb2;
        ycxVar2.f23133jw = pointFZb3;
        return ycxVar2;
    }

    private static Interpolator ycx(PointF pointF, PointF pointF2) {
        Interpolator linearInterpolator;
        pointF.x = com.bytedance.adsdk.zb.lt.lud.zb(pointF.x, -1.0f, 1.0f);
        pointF.y = com.bytedance.adsdk.zb.lt.lud.zb(pointF.y, -100.0f, 100.0f);
        pointF2.x = com.bytedance.adsdk.zb.lt.lud.zb(pointF2.x, -1.0f, 1.0f);
        float fZb = com.bytedance.adsdk.zb.lt.lud.zb(pointF2.y, -100.0f, 100.0f);
        pointF2.y = fZb;
        int iYcx = com.bytedance.adsdk.zb.lt.lt.ycx(pointF.x, pointF.y, pointF2.x, fZb);
        WeakReference<Interpolator> weakReferenceYcx = com.bytedance.adsdk.zb.lud.ycx() ? null : ycx(iYcx);
        Interpolator interpolator = weakReferenceYcx != null ? weakReferenceYcx.get() : null;
        if (weakReferenceYcx != null && interpolator != null) {
            return interpolator;
        }
        try {
            linearInterpolator = com.bytedance.adsdk.zb.wie.ycx(pointF.x, pointF.y, pointF2.x, pointF2.y);
        } catch (IllegalArgumentException e3) {
            if ("The Path cannot loop back on itself.".equals(e3.getMessage())) {
                linearInterpolator = com.bytedance.adsdk.zb.wie.ycx(Math.min(pointF.x, 1.0f), pointF.y, Math.max(pointF2.x, 0.0f), pointF2.y);
            } else {
                linearInterpolator = new LinearInterpolator();
            }
        }
        if (!com.bytedance.adsdk.zb.lud.ycx()) {
            try {
                ycx(iYcx, (WeakReference<Interpolator>) new WeakReference(linearInterpolator));
            } catch (ArrayIndexOutOfBoundsException unused) {
            }
        }
        return linearInterpolator;
    }

    private static <T> com.bytedance.adsdk.zb.ul.ycx<T> ycx(JsonReader jsonReader, float f11, dc<T> dcVar) throws IOException {
        return new com.bytedance.adsdk.zb.ul.ycx<>(dcVar.zb(jsonReader, f11));
    }
}
