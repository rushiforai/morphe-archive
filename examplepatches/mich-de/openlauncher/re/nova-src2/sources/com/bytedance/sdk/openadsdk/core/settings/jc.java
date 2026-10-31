package com.bytedance.sdk.openadsdk.core.settings;

import android.content.Context;
import android.os.SystemClock;
import b.c0;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.lud;
import com.bytedance.sdk.openadsdk.utils.ry;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public abstract class jc implements lud {

    /* renamed from: ea, reason: collision with root package name */
    private boolean f26112ea;

    /* renamed from: jc, reason: collision with root package name */
    private final ycx f26113jc;

    /* renamed from: ul, reason: collision with root package name */
    private final String f26116ul;
    private final ConcurrentHashMap<String, Object> sya = new ConcurrentHashMap<>();

    /* renamed from: dj, reason: collision with root package name */
    private final Object f26111dj = new Object();
    private final Object lud = new Object();

    /* renamed from: lt, reason: collision with root package name */
    private final CountDownLatch f26115lt = new CountDownLatch(1);
    private Properties fby = new Properties();

    /* renamed from: jw, reason: collision with root package name */
    private volatile boolean f26114jw = false;

    public interface ycx {
        void ycx();

        void zb();
    }

    public jc(ycx ycxVar) {
        String strYcx = ycx();
        this.f26116ul = strYcx;
        this.f26113jc = ycxVar;
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya(c0.k("SetL_", strYcx)) { // from class: com.bytedance.sdk.openadsdk.core.settings.jc.1
            @Override // java.lang.Runnable
            public void run() {
                jc.this.ycx(false);
            }
        });
    }

    private void lt() throws InterruptedException {
        if (this.f26112ea && pmi.ycx() != null) {
            ycx(true);
        }
        if (this.f26114jw) {
            return;
        }
        try {
            SystemClock.elapsedRealtime();
            this.f26115lt.await(yzp.lt() ? 4 : 8, TimeUnit.SECONDS);
        } catch (InterruptedException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "WvksnBeQZsaET9NxgxKrLV8=", 91);
            htf.ycx("SdkSettings.Prop", "awaitLoadedLocked: ", e3);
        }
    }

    private File ul() {
        Context contextYcx = pmi.ycx();
        if (contextYcx != null) {
            return new File(contextYcx.getFilesDir(), this.f26116ul);
        }
        return null;
    }

    public void dj() {
        File fileUl = ul();
        if (fileUl == null || !fileUl.exists()) {
            return;
        }
        fileUl.delete();
    }

    public void lud() {
        ycx ycxVar = this.f26113jc;
        if (ycxVar != null) {
            ycxVar.zb();
        }
    }

    public boolean sya() {
        return this.f26114jw;
    }

    public abstract String ycx();

    public lud.ycx zb() {
        return new zb();
    }

    public String ycx(String str, String str2) {
        if (str == null || str.isEmpty()) {
            return str2;
        }
        lt();
        return this.fby.getProperty(str, str2);
    }

    public int ycx(String str, int i5) {
        if (str != null && !str.isEmpty()) {
            lt();
            try {
                return Integer.parseInt(this.fby.getProperty(str, String.valueOf(i5)));
            } catch (NumberFormatException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "XOs5vA2o", 108);
                htf.ycx("SdkSettings.Prop", b.f42142b, e3);
            }
        }
        return i5;
    }

    public long ycx(String str, long j11) {
        if (str != null && !str.isEmpty()) {
            lt();
            try {
                return Long.parseLong(this.fby.getProperty(str, String.valueOf(j11)));
            } catch (NumberFormatException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "XOs5uQyybg==", Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
                htf.ycx("SdkSettings.Prop", b.f42142b, e3);
            }
        }
        return j11;
    }

    public float ycx(String str, float f11) throws InterruptedException {
        if (str != null && !str.isEmpty()) {
            lt();
            try {
                return Float.parseFloat(this.fby.getProperty(str, String.valueOf(f11)));
            } catch (NumberFormatException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "XOs5sw+zaNM=", 142);
                htf.ycx("SdkSettings.Prop", b.f42142b, e3);
            }
        }
        return f11;
    }

    public class zb implements lud.ycx {

        /* renamed from: zb, reason: collision with root package name */
        private final Map<String, Object> f26117zb = new HashMap();
        private final Object sya = new Object();

        public zb() {
        }

        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.ycx
        public void ycx() {
            Object obj;
            Properties properties = new Properties();
            synchronized (this.sya) {
                try {
                    properties.putAll(jc.this.fby);
                    boolean z11 = false;
                    for (Map.Entry<String, Object> entry : this.f26117zb.entrySet()) {
                        String key = entry.getKey();
                        Object value = entry.getValue();
                        if (value != this && value != null) {
                            if (properties.containsKey(key) && (obj = properties.get(key)) != null && obj.equals(value)) {
                            }
                            properties.put(key, String.valueOf(value));
                            z11 = true;
                        } else if (properties.containsKey(key)) {
                            properties.remove(key);
                            z11 = true;
                        }
                    }
                    this.f26117zb.clear();
                    if (z11) {
                        jc.this.ycx(properties);
                        jc.this.fby = properties;
                        jc.this.sya.clear();
                        jc.this.f26112ea = false;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }

        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.ycx
        public lud.ycx ycx(String str, String str2) {
            synchronized (this.sya) {
                this.f26117zb.put(str, str2);
            }
            return this;
        }

        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.ycx
        public lud.ycx ycx(String str, int i5) {
            synchronized (this.sya) {
                this.f26117zb.put(str, Integer.valueOf(i5));
            }
            return this;
        }

        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.ycx
        public lud.ycx ycx(String str, long j11) {
            synchronized (this.sya) {
                this.f26117zb.put(str, Long.valueOf(j11));
            }
            return this;
        }

        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.ycx
        public lud.ycx ycx(String str) {
            synchronized (this.sya) {
                this.f26117zb.put(str, this);
            }
            return this;
        }

        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.ycx
        public lud.ycx ycx(String str, float f11) {
            synchronized (this.sya) {
                this.f26117zb.put(str, Float.valueOf(f11));
            }
            return this;
        }

        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.ycx
        public lud.ycx ycx(String str, boolean z11) {
            synchronized (this.sya) {
                this.f26117zb.put(str, Boolean.valueOf(z11));
            }
            return this;
        }
    }

    public boolean ycx(String str, boolean z11) throws InterruptedException {
        if (str != null && !str.isEmpty()) {
            lt();
            try {
                return Boolean.parseBoolean(this.fby.getProperty(str, String.valueOf(z11)));
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "XOs5twyzZcKBRA==", 159);
                htf.ycx("SdkSettings.Prop", b.f42142b, e3);
            }
        }
        return z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x00bf A[Catch: all -> 0x000b, TryCatch #2 {all -> 0x000b, blocks: (B:4:0x0003, B:7:0x0009, B:11:0x000e, B:13:0x0015, B:15:0x001e, B:17:0x0024, B:28:0x0057, B:38:0x007a, B:29:0x005b, B:37:0x0077, B:50:0x00a9, B:51:0x00ac, B:52:0x00b1, B:48:0x00a3, B:54:0x00b4, B:56:0x00bf, B:58:0x00c3, B:59:0x00c6, B:53:0x00b2, B:35:0x0063, B:42:0x007f, B:46:0x008f), top: B:63:0x0003, inners: #3 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(boolean z11) {
        boolean z12;
        ycx ycxVar;
        synchronized (this.f26111dj) {
            try {
                if (!this.f26114jw || z11) {
                    if (pmi.ycx() != null) {
                        this.f26112ea = false;
                        File fileUl = ul();
                        if (fileUl != null && fileUl.exists()) {
                            Properties properties = new Properties();
                            FileInputStream fileInputStream = null;
                            try {
                                try {
                                    FileInputStream fileInputStream2 = new FileInputStream(fileUl);
                                    try {
                                        properties.load(fileInputStream2);
                                        properties.size();
                                        new StringBuilder("items from ").append(fileUl.getAbsolutePath());
                                        if (!properties.isEmpty()) {
                                            this.fby = properties;
                                            this.sya.clear();
                                        }
                                        ry.ycx(fileInputStream2);
                                    } catch (OutOfMemoryError e3) {
                                        e = e3;
                                        fileInputStream = fileInputStream2;
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "SeshmgK4", 190);
                                        try {
                                            com.bytedance.sdk.component.utils.ul.sya(fileUl);
                                        } catch (Throwable th2) {
                                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "SeshmgK4", 193);
                                            htf.ycx("SdkSettings.Prop", "delete: ", th2);
                                        }
                                        if (fileInputStream != null) {
                                            ry.ycx(fileInputStream);
                                        }
                                        this.f26111dj.notifyAll();
                                        z12 = this.f26114jw;
                                        this.f26115lt.countDown();
                                        this.f26114jw = true;
                                        if (!z12) {
                                            ycxVar.ycx();
                                        }
                                    } catch (Throwable th3) {
                                        th = th3;
                                        fileInputStream = fileInputStream2;
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "SeshmgK4", 196);
                                        htf.ycx("SdkSettings.Prop", "reload: ", th);
                                        if (fileInputStream != null) {
                                            ry.ycx(fileInputStream);
                                        }
                                        this.f26111dj.notifyAll();
                                        z12 = this.f26114jw;
                                        this.f26115lt.countDown();
                                        this.f26114jw = true;
                                        if (!z12) {
                                        }
                                    }
                                } catch (Throwable th4) {
                                    if (fileInputStream != null) {
                                        ry.ycx(fileInputStream);
                                    }
                                    this.f26111dj.notifyAll();
                                    throw th4;
                                }
                            } catch (OutOfMemoryError e11) {
                                e = e11;
                            } catch (Throwable th5) {
                                th = th5;
                            }
                            this.f26111dj.notifyAll();
                        }
                    } else {
                        this.f26112ea = true;
                    }
                    z12 = this.f26114jw;
                    this.f26115lt.countDown();
                    this.f26114jw = true;
                    if (!z12 && (ycxVar = this.f26113jc) != null) {
                        ycxVar.ycx();
                    }
                }
            } catch (Throwable th6) {
                throw th6;
            }
        }
    }

    public <T> T ycx(String str, T t6, lud.zb<T> zbVar) throws InterruptedException {
        T tZb;
        if (str != null && !str.isEmpty()) {
            T t9 = (T) this.sya.get(str);
            if (t9 != null) {
                return t9;
            }
            lt();
            String property = this.fby.getProperty(str, null);
            if (property != null && zbVar != null && (tZb = zbVar.zb(property)) != null) {
                this.sya.put(str, tZb);
                return tZb;
            }
        }
        return t6;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(Properties properties) {
        FileOutputStream fileOutputStream;
        synchronized (this.lud) {
            FileOutputStream fileOutputStream2 = null;
            try {
                try {
                    fileOutputStream = new FileOutputStream(ul());
                } catch (Exception e3) {
                    e = e3;
                }
            } catch (Throwable th2) {
                th = th2;
            }
            try {
                properties.store(fileOutputStream, (String) null);
                ry.ycx(fileOutputStream);
            } catch (Exception e11) {
                e = e11;
                fileOutputStream2 = fileOutputStream;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "aOs5gQqybtSwWNhNvhSwJ0jnOZoRpQ==", "SO87kDezRciDS9s=", 277);
                htf.ycx("SdkSettings.Prop", "saveToLocal: ", e);
                if (fileOutputStream2 != null) {
                    ry.ycx(fileOutputStream2);
                }
            } catch (Throwable th3) {
                th = th3;
                fileOutputStream2 = fileOutputStream;
                if (fileOutputStream2 != null) {
                    ry.ycx(fileOutputStream2);
                }
                throw th;
            }
        }
    }
}
