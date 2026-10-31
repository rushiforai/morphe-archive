package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import a2.c;
import android.text.TextUtils;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.fby;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.ry;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class zb implements com.bytedance.sdk.component.zb.ycx.zb {
    private static List<Object> lud;

    /* renamed from: dj, reason: collision with root package name */
    private AtomicBoolean f24220dj = new AtomicBoolean(false);
    private final String sya = System.identityHashCode(this) + Identify.UNSET_VALUE + System.currentTimeMillis();
    ok ycx;

    /* renamed from: zb, reason: collision with root package name */
    com.bytedance.sdk.component.zb.ycx.dj f24221zb;

    static {
        try {
            lud = new ArrayList();
            Class<?> cls = Class.forName("com.android.okhttp.Protocol");
            Enum enumValueOf = Enum.valueOf(cls, "HTTP_1_1");
            if (enumValueOf != null) {
                lud.add(enumValueOf);
            }
            Enum enumValueOf2 = Enum.valueOf(cls, "HTTP_2");
            if (enumValueOf2 != null) {
                lud.add(enumValueOf2);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "B+0hnA21fZk=", 53);
            th2.getMessage();
        }
    }

    public zb(ok okVar, com.bytedance.sdk.component.zb.ycx.dj djVar) {
        this.ycx = okVar;
        this.f24221zb = djVar;
    }

    private boolean lud() {
        if (this.ycx.lt() == null) {
            return false;
        }
        return this.ycx.lt().containsKey("Content-Type");
    }

    private static void sya(HttpURLConnection httpURLConnection) throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException, InvocationTargetException {
        try {
            Field declaredField = httpURLConnection.getClass().getDeclaredField("delegate");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(httpURLConnection);
            Field declaredField2 = obj.getClass().getDeclaredField("client");
            declaredField2.setAccessible(true);
            Object obj2 = declaredField2.get(obj);
            obj2.getClass().getDeclaredMethod("setRetryOnConnectionFailure", Boolean.TYPE).invoke(obj2, Boolean.FALSE);
        } catch (Exception unused) {
        }
    }

    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public com.bytedance.sdk.component.zb.ycx.zb clone() {
        return new zb(this.ycx, this.f24221zb);
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb
    public ok ycx() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb
    public xkz zb() throws IOException {
        List<com.bytedance.sdk.component.zb.ycx.fby> list;
        com.bytedance.sdk.component.sya.ycx.ycx ycxVar;
        ok okVar = this.ycx;
        if (okVar != null && (ycxVar = okVar.f24184zb) != null) {
            if (ycxVar.xkz() == 0) {
                this.ycx.f24184zb.syc();
            }
            this.ycx.f24184zb.ycx();
        }
        this.f24221zb.sya().remove(this);
        this.f24221zb.dj().add(this);
        com.bytedance.sdk.component.zb.ycx.dj djVar = this.f24221zb;
        if (djVar instanceof lt) {
            if (this.f24221zb.dj().size() + djVar.sya().size() > this.f24221zb.ycx() || this.f24220dj.get()) {
                this.f24221zb.dj().remove(this);
                return new fby(fby.ycx, "Maximum number of requests exceeded", this.ycx);
            }
        }
        try {
            ea eaVar = this.ycx.ycx;
            if (eaVar == null || (list = eaVar.ycx) == null || list.size() <= 0) {
                return ycx(this.ycx);
            }
            ArrayList arrayList = new ArrayList(this.ycx.ycx.ycx);
            arrayList.add(new com.bytedance.sdk.component.zb.ycx.fby() { // from class: com.bytedance.sdk.component.zb.ycx.ycx.ycx.zb.1
                @Override // com.bytedance.sdk.component.zb.ycx.fby
                public xkz ycx(fby.ycx ycxVar2) throws IOException {
                    return zb.this.ycx(ycxVar2.ycx());
                }
            });
            return ((com.bytedance.sdk.component.zb.ycx.fby) arrayList.get(0)).ycx(new sya(arrayList, this.ycx));
        } finally {
        }
    }

    private boolean ycx(ry ryVar) {
        ok okVar;
        byte[] bArr;
        return ryVar != null && (okVar = this.ycx) != null && "POST".equalsIgnoreCase(okVar.lud()) && ryVar.f24192lt == ry.ycx.BYTE_ARRAY_TYPE && (bArr = ryVar.lud) != null && bArr.length > 0;
    }

    public xkz ycx(ok okVar) throws IOException {
        return ycx(okVar, com.bytedance.sdk.component.ul.ycx.lud());
    }

    public xkz ycx(ok okVar, boolean z11) throws IOException {
        boolean zLt = com.bytedance.sdk.component.ul.ycx.lt();
        List<String> listYcx = okVar != null ? okVar.ycx() : null;
        boolean z12 = (listYcx == null || listYcx.isEmpty()) ? false : true;
        if (zLt && z12) {
            return ycx(okVar, listYcx);
        }
        return zb(okVar, z11);
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb
    public void sya() {
        this.f24220dj.set(true);
    }

    private ok ycx(ok okVar, String str) {
        return okVar.ea().zb(str).zb();
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x0148  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x014b A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private xkz ycx(ok okVar, List<String> list) throws IOException {
        long j11;
        boolean z11;
        int i5;
        xkz xkzVarZb;
        xkz xkzVar;
        String string = okVar.dj().ycx().toString();
        List<String> listYcx = com.bytedance.sdk.component.ul.sya.sya.ycx().ycx(string, list);
        long jCurrentTimeMillis = System.currentTimeMillis();
        long jZb = okVar.zb();
        int size = listYcx.size();
        boolean z12 = false;
        xkz xkzVar2 = null;
        int i11 = 0;
        while (i11 < size) {
            String str = listYcx.get(i11);
            boolean z13 = (str == null || !str.equals(string)) ? z12 : true;
            if (System.currentTimeMillis() - jCurrentTimeMillis > jZb) {
                com.bytedance.sdk.component.ul.ycx.ycx(this.sya, string, str, -1, "Total timeout", false, i11 + 1, size);
                return xkzVar2 != null ? xkzVar2 : new fby(-1, "Total timeout", okVar, str);
            }
            int i12 = i11;
            if (this.f24220dj.get()) {
                com.bytedance.sdk.component.ul.ycx.ycx(this.sya, string, str, fby.f24209zb, "Request canceled", false, 1 + i12, size);
                return new fby(fby.f24209zb, "Request canceled", okVar, str);
            }
            int i13 = i12 + 1;
            try {
                listYcx.size();
                xkzVarZb = zb(z13 ? okVar : ycx(okVar, str), com.bytedance.sdk.component.ul.ycx.lud());
                if (xkzVarZb instanceof fby) {
                    ((fby) xkzVarZb).ycx(str);
                }
                try {
                } catch (IOException e3) {
                    e = e3;
                    xkzVar = xkzVarZb;
                    j11 = jCurrentTimeMillis;
                    z11 = z12;
                }
            } catch (IOException e11) {
                e = e11;
            }
            if (xkzVarZb.dj()) {
                try {
                    com.bytedance.sdk.component.ul.sya.sya.ycx().ycx(str, string, true);
                    return xkzVarZb;
                } catch (IOException e12) {
                    e = e12;
                    xkzVar2 = xkzVarZb;
                    j11 = jCurrentTimeMillis;
                    z11 = z12;
                    i5 = i12;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "X+EOlA+wXs6UQuVYmAO5", Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE);
                    e.getMessage();
                    com.bytedance.sdk.component.ul.sya.sya.ycx().ycx(str, string, z11);
                    com.bytedance.sdk.component.ul.ycx.ycx(this.sya, string, str, fby.ycx, e.getMessage(), true, i5 + 1, size);
                    if (i5 == listYcx.size() - 1) {
                    }
                    i11 = i5 + 1;
                    z12 = z11;
                    jCurrentTimeMillis = j11;
                }
            } else {
                com.bytedance.sdk.component.ul.sya.sya.ycx().ycx(str, string, z12);
                boolean z14 = z12;
                try {
                    try {
                        try {
                            xkzVar = xkzVarZb;
                            j11 = jCurrentTimeMillis;
                            z11 = z14;
                            i5 = i12;
                            try {
                                com.bytedance.sdk.component.ul.ycx.ycx(this.sya, string, str, xkzVarZb.sya(), xkzVarZb.lud(), true, i13, size);
                                xkzVar.sya();
                            } catch (IOException e13) {
                                e = e13;
                                xkzVar2 = xkzVar;
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "X+EOlA+wXs6UQuVYmAO5", Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE);
                                e.getMessage();
                                com.bytedance.sdk.component.ul.sya.sya.ycx().ycx(str, string, z11);
                                com.bytedance.sdk.component.ul.ycx.ycx(this.sya, string, str, fby.ycx, e.getMessage(), true, i5 + 1, size);
                                if (i5 == listYcx.size() - 1) {
                                    e.getMessage();
                                }
                                i11 = i5 + 1;
                                z12 = z11;
                                jCurrentTimeMillis = j11;
                            }
                        } catch (IOException e14) {
                            e = e14;
                            xkzVar = xkzVarZb;
                            j11 = jCurrentTimeMillis;
                            z11 = z14;
                            i5 = i12;
                        }
                    } catch (IOException e15) {
                        e = e15;
                        xkzVar = xkzVarZb;
                        j11 = jCurrentTimeMillis;
                        z11 = z14;
                        i5 = i12;
                        xkzVar2 = xkzVar;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "X+EOlA+wXs6UQuVYmAO5", Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE);
                        e.getMessage();
                        com.bytedance.sdk.component.ul.sya.sya.ycx().ycx(str, string, z11);
                        com.bytedance.sdk.component.ul.ycx.ycx(this.sya, string, str, fby.ycx, e.getMessage(), true, i5 + 1, size);
                        if (i5 == listYcx.size() - 1) {
                        }
                        i11 = i5 + 1;
                        z12 = z11;
                        jCurrentTimeMillis = j11;
                    }
                } catch (IOException e16) {
                    e = e16;
                    xkzVar = xkzVarZb;
                }
                if (i5 == listYcx.size() - 1) {
                    return xkzVar;
                }
                xkzVar2 = xkzVar;
                i11 = i5 + 1;
                z12 = z11;
                jCurrentTimeMillis = j11;
            }
        }
        return xkzVar2 != null ? xkzVar2 : new fby(fby.ycx, "No URLs to try", okVar, (String) c.e(1, listYcx));
    }

    private boolean zb(ry ryVar) {
        ok okVar;
        return (ryVar == null || (okVar = this.ycx) == null || !"POST".equalsIgnoreCase(okVar.lud()) || ryVar.f24192lt != ry.ycx.STRING_TYPE || TextUtils.isEmpty(ryVar.f24191dj)) ? false : true;
    }

    private xkz zb(ok okVar, boolean z11) throws IOException {
        HttpURLConnection httpURLConnection;
        IOException e3;
        String strYcx;
        int responseCode;
        int i5 = fby.ycx;
        HttpURLConnection httpURLConnection2 = null;
        try {
            httpURLConnection = (HttpURLConnection) new URL(okVar.dj().ycx().toString()).openConnection();
            if (z11) {
                try {
                    if (!"setting".equals(okVar.fby()) && !"gecko".equals(okVar.fby()) && !"load_ug_t".equals(okVar.fby()) && !"pixel_web".equals(okVar.fby())) {
                        zb(httpURLConnection);
                    }
                } catch (IOException e11) {
                    e3 = e11;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "X+EOlA+wRtWJTd5TjR0=", 301);
                    if (i5 == -1 && z11) {
                        okVar.dj().ycx().toString();
                        return zb(okVar, false);
                    }
                    strYcx = ycx(httpURLConnection, e3);
                    return new fby(i5, strYcx, okVar);
                } catch (Exception e12) {
                    e = e12;
                    httpURLConnection2 = httpURLConnection;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "X+EOlA+wRtWJTd5TjR0=", Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE);
                    strYcx = ycx(httpURLConnection2, e);
                    return new fby(i5, strYcx, okVar);
                }
            }
            if (okVar.lt() != null && !okVar.lt().isEmpty()) {
                for (Map.Entry<String, List<String>> entry : okVar.lt().entrySet()) {
                    String key = entry.getKey();
                    for (String str : entry.getValue()) {
                        if ("_disable_retry".equals(key) && "1".equals(str)) {
                            sya(httpURLConnection);
                        } else {
                            httpURLConnection.addRequestProperty(key, str);
                        }
                    }
                }
            }
            ea eaVar = okVar.ycx;
            if (eaVar != null) {
                TimeUnit timeUnit = eaVar.sya;
                if (timeUnit != null) {
                    httpURLConnection.setConnectTimeout((int) timeUnit.toMillis(eaVar.f24171zb));
                }
                ea eaVar2 = okVar.ycx;
                TimeUnit timeUnit2 = eaVar2.lud;
                if (timeUnit2 != null) {
                    httpURLConnection.setReadTimeout((int) timeUnit2.toMillis(eaVar2.f24168dj));
                }
            }
            if (okVar.jc() == null) {
                httpURLConnection.setRequestMethod("GET");
            } else {
                if (!lud() && okVar.jc().sya != null) {
                    httpURLConnection.addRequestProperty("Content-Type", okVar.jc().sya.ycx());
                }
                httpURLConnection.setRequestMethod(okVar.lud());
                if ("POST".equalsIgnoreCase(okVar.lud())) {
                    OutputStream outputStream = httpURLConnection.getOutputStream();
                    if (ycx(okVar.jc())) {
                        outputStream.write(okVar.jc().lud);
                    } else if (zb(okVar.jc())) {
                        outputStream.write(okVar.jc().f24191dj.getBytes());
                    }
                    outputStream.flush();
                    outputStream.close();
                }
            }
            com.bytedance.sdk.component.sya.ycx.ycx ycxVar = okVar.f24184zb;
            if (ycxVar != null) {
                ycxVar.zb();
            }
            httpURLConnection.connect();
            com.bytedance.sdk.component.sya.ycx.ycx ycxVar2 = okVar.f24184zb;
            if (ycxVar2 != null) {
                ycxVar2.sya();
            }
            responseCode = httpURLConnection.getResponseCode();
            com.bytedance.sdk.component.sya.ycx.ycx ycxVar3 = okVar.f24184zb;
            if (ycxVar3 != null) {
                ycxVar3.lud();
            }
        } catch (IOException e13) {
            httpURLConnection = null;
            e3 = e13;
        } catch (Exception e14) {
            e = e14;
        }
        if (this.f24220dj.get()) {
            i5 = fby.f24209zb;
            ycx(httpURLConnection);
            strYcx = "internal error";
            return new fby(i5, strYcx, okVar);
        }
        return new fby(httpURLConnection, okVar, responseCode);
    }

    private void ycx(HttpURLConnection httpURLConnection) {
        if (httpURLConnection != null) {
            try {
                httpURLConnection.disconnect();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "SO8rkCe1esSPRNlYjwU=", Sdk.SDKError.Reason.MRAID_UNRECOGNIZED_COMMAND_VALUE);
                e3.getMessage();
            }
        }
    }

    private static String ycx(HttpURLConnection httpURLConnection, Exception exc) {
        if (httpURLConnection != null) {
            try {
                InputStream errorStream = httpURLConnection.getErrorStream();
                if (errorStream != null) {
                    return errorStream.toString();
                }
                return "connection is null or errorStream is null";
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "XOs5sBu/bNeUQ9hToQKn", 337);
                return exc.getMessage();
            }
        }
        return "connection is null or errorStream is null";
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb
    public void ycx(final com.bytedance.sdk.component.zb.ycx.sya syaVar) {
        com.bytedance.sdk.component.sya.ycx.ycx ycxVar;
        ok okVar = this.ycx;
        if (okVar != null && (ycxVar = okVar.f24184zb) != null) {
            ycxVar.syc();
        }
        this.f24221zb.zb().submit(new com.bytedance.sdk.component.fby.zb.sya(this.ycx.fby(), this.ycx.jw()) { // from class: com.bytedance.sdk.component.zb.ycx.ycx.ycx.zb.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    xkz xkzVarZb = zb.this.zb();
                    if (xkzVarZb == null) {
                        syaVar.ycx(zb.this, new IOException("response is null"));
                    } else {
                        syaVar.ycx(zb.this, xkzVarZb);
                    }
                } catch (IOException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZYPS", "Sfsj", 393);
                    syaVar.ycx(zb.this, e3);
                }
            }
        });
    }

    private static void zb(HttpURLConnection httpURLConnection) {
        try {
            Field declaredField = httpURLConnection.getClass().getDeclaredField("delegate");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(httpURLConnection);
            Field declaredField2 = obj.getClass().getDeclaredField("client");
            declaredField2.setAccessible(true);
            Object obj2 = declaredField2.get(obj);
            if (lud.size() == 2) {
                obj2.getClass().getDeclaredMethod("setProtocols", List.class).invoke(obj2, lud);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VryMV5X7bArho15RPxROCFLQ=", "des5tgKwZQ==", "VP4omyuofdfS", 353);
            th2.getMessage();
        }
    }
}
