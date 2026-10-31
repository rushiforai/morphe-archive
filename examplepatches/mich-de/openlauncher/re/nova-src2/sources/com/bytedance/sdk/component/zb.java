package com.bytedance.sdk.component;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.HandlerThread;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.Log;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: ok, reason: collision with root package name */
    private static ArrayMap<String, File> f24156ok = null;

    /* renamed from: ry, reason: collision with root package name */
    private static ArrayMap<File, zb> f24157ry = null;
    protected static ycx ycx = null;

    /* renamed from: zb, reason: collision with root package name */
    private static boolean f24158zb = false;

    /* renamed from: dj, reason: collision with root package name */
    private final Object f24159dj;

    /* renamed from: ea, reason: collision with root package name */
    private final File f24160ea;
    private long fby;

    /* renamed from: jc, reason: collision with root package name */
    private final File f24161jc;

    /* renamed from: jw, reason: collision with root package name */
    private long f24162jw;

    /* renamed from: lt, reason: collision with root package name */
    private volatile boolean f24163lt;
    private Properties lud;
    private final Object sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f24164ul;

    public interface ycx {
        HandlerThread ycx(String str, int i5);

        ExecutorService ycx();
    }

    /* renamed from: com.bytedance.sdk.component.zb$zb, reason: collision with other inner class name */
    public static class C0047zb {

        /* renamed from: dj, reason: collision with root package name */
        volatile boolean f24233dj;
        boolean lud;
        final CountDownLatch sya;
        final long ycx;

        /* renamed from: zb, reason: collision with root package name */
        final Properties f24234zb;

        public void ycx(boolean z11, boolean z12) {
            this.lud = z11;
            this.f24233dj = z12;
            this.sya.countDown();
        }

        private C0047zb(long j11, Properties properties) {
            this.sya = new CountDownLatch(1);
            this.f24233dj = false;
            this.lud = false;
            this.ycx = j11;
            this.f24234zb = properties;
        }
    }

    private zb(File file) {
        Object obj = new Object();
        this.sya = obj;
        this.f24159dj = new Object();
        this.lud = new Properties();
        this.f24163lt = false;
        this.f24164ul = 0;
        this.f24161jc = file;
        this.f24160ea = ycx(file);
        synchronized (obj) {
            this.f24163lt = false;
        }
        ycx ycxVar = ycx;
        if (ycxVar == null || ycxVar.ycx() == null) {
            new Thread("TTPropHelper") { // from class: com.bytedance.sdk.component.zb.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    zb.this.ycx();
                }
            }.start();
        } else {
            ycx.ycx().execute(new Runnable() { // from class: com.bytedance.sdk.component.zb.2
                @Override // java.lang.Runnable
                public void run() {
                    zb.this.ycx();
                }
            });
        }
    }

    public static /* synthetic */ int jw(zb zbVar) {
        int i5 = zbVar.f24164ul;
        zbVar.f24164ul = i5 - 1;
        return i5;
    }

    public static /* synthetic */ long lt(zb zbVar) {
        long j11 = zbVar.fby;
        zbVar.fby = 1 + j11;
        return j11;
    }

    public static /* synthetic */ int lud(zb zbVar) {
        int i5 = zbVar.f24164ul;
        zbVar.f24164ul = i5 + 1;
        return i5;
    }

    private void dj() throws InterruptedException {
        while (!this.f24163lt) {
            try {
                this.sya.wait();
            } catch (InterruptedException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "WvksnBeQZsaET9NxgxKrLV8=", 196);
            }
        }
    }

    public sya zb() {
        return new sya();
    }

    public class sya implements SharedPreferences.Editor {

        /* renamed from: zb, reason: collision with root package name */
        private final Object f24167zb = new Object();
        private final Map<String, Object> sya = new HashMap();

        /* renamed from: dj, reason: collision with root package name */
        private boolean f24166dj = false;

        public sya() {
        }

        private C0047zb zb() {
            Properties properties;
            long j11;
            Object obj;
            boolean z11;
            synchronized (zb.this.sya) {
                try {
                    if (zb.this.f24164ul > 0) {
                        Properties properties2 = new Properties();
                        properties2.putAll(zb.this.lud);
                        zb.this.lud = properties2;
                    }
                    properties = zb.this.lud;
                    zb.lud(zb.this);
                    synchronized (this.f24167zb) {
                        try {
                            boolean z12 = false;
                            if (this.f24166dj) {
                                if (properties.isEmpty()) {
                                    z11 = false;
                                } else {
                                    properties.clear();
                                    z11 = true;
                                }
                                this.f24166dj = false;
                                z12 = z11;
                            }
                            for (Map.Entry<String, Object> entry : this.sya.entrySet()) {
                                String key = entry.getKey();
                                Object value = entry.getValue();
                                if (value == this || value == null) {
                                    if (properties.containsKey(key)) {
                                        properties.remove(key);
                                        z12 = true;
                                    }
                                } else if (!properties.containsKey(key) || (obj = properties.get(key)) == null || !obj.equals(String.valueOf(value))) {
                                    properties.put(key, String.valueOf(value));
                                    z12 = true;
                                }
                            }
                            this.sya.clear();
                            if (z12) {
                                zb.lt(zb.this);
                            }
                            j11 = zb.this.fby;
                        } finally {
                        }
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return new C0047zb(j11, properties);
        }

        @Override // android.content.SharedPreferences.Editor
        public void apply() {
            zb.this.ycx(zb(), false);
        }

        @Override // android.content.SharedPreferences.Editor
        public boolean commit() {
            boolean unused = zb.f24158zb;
            C0047zb c0047zbZb = zb();
            zb.this.ycx(c0047zbZb, true);
            try {
                try {
                    c0047zbZb.sya.await();
                    if (zb.f24158zb) {
                        zb.this.f24161jc.getName();
                    }
                    return c0047zbZb.f24233dj;
                } catch (InterruptedException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJPyCGyJ0vLKZwXs3s=", "WOEgmAqo", TTAdConstant.DEEPLINK_UNAVAILABLE_CODE);
                    if (!zb.f24158zb) {
                        return false;
                    }
                    zb.this.f24161jc.getName();
                    long j11 = c0047zbZb.ycx;
                    return false;
                }
            } catch (Throwable th2) {
                if (zb.f24158zb) {
                    zb.this.f24161jc.getName();
                    long j12 = c0047zbZb.ycx;
                }
                throw th2;
            }
        }

        @Override // android.content.SharedPreferences.Editor
        public /* synthetic */ SharedPreferences.Editor putStringSet(String str, Set set) {
            return ycx(str, (Set<String>) set);
        }

        public sya ycx(String str, Set<String> set) {
            synchronized (this.f24167zb) {
                this.sya.put(str, set == null ? null : new HashSet(set));
            }
            return this;
        }

        @Override // android.content.SharedPreferences.Editor
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya putInt(String str, int i5) {
            synchronized (this.f24167zb) {
                this.sya.put(str, Integer.valueOf(i5));
            }
            return this;
        }

        @Override // android.content.SharedPreferences.Editor
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya putLong(String str, long j11) {
            synchronized (this.f24167zb) {
                this.sya.put(str, Long.valueOf(j11));
            }
            return this;
        }

        @Override // android.content.SharedPreferences.Editor
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya putFloat(String str, float f11) {
            synchronized (this.f24167zb) {
                this.sya.put(str, Float.valueOf(f11));
            }
            return this;
        }

        @Override // android.content.SharedPreferences.Editor
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya putString(String str, String str2) {
            synchronized (this.f24167zb) {
                this.sya.put(str, str2);
            }
            return this;
        }

        @Override // android.content.SharedPreferences.Editor
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya putBoolean(String str, boolean z11) {
            synchronized (this.f24167zb) {
                this.sya.put(str, Boolean.valueOf(z11));
            }
            return this;
        }

        @Override // android.content.SharedPreferences.Editor
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya remove(String str) {
            synchronized (this.f24167zb) {
                this.sya.put(str, this);
            }
            return this;
        }

        @Override // android.content.SharedPreferences.Editor
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public sya clear() {
            synchronized (this.f24167zb) {
                this.f24166dj = true;
            }
            return this;
        }
    }

    public static void ycx(@NotNull ycx ycxVar) {
        ycx = ycxVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:91:0x00eb A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void zb(C0047zb c0047zb, boolean z11) {
        FileOutputStream fileOutputStream;
        Throwable th2;
        Exception e3;
        String str;
        boolean z12;
        if (this.f24161jc.exists()) {
            if (this.f24162jw >= c0047zb.ycx) {
                z12 = false;
            } else if (z11) {
                z12 = true;
            } else {
                synchronized (this.sya) {
                    z12 = this.fby == c0047zb.ycx;
                }
            }
            if (!z12) {
                c0047zb.ycx(false, true);
                return;
            }
            if (!this.f24160ea.exists()) {
                if (!this.f24161jc.renameTo(this.f24160ea)) {
                    Log.e("TTPropHelper", "Couldn't rename file " + this.f24161jc + " to backup file " + this.f24160ea);
                    c0047zb.ycx(false, false);
                    return;
                }
            } else {
                this.f24161jc.delete();
            }
        }
        try {
            synchronized (this.f24159dj) {
                try {
                    fileOutputStream = new FileOutputStream(this.f24161jc);
                    try {
                        try {
                            c0047zb.f24234zb.store(fileOutputStream, (String) null);
                            if (f24158zb) {
                                Objects.toString(c0047zb.f24234zb);
                                this.f24161jc.getAbsolutePath();
                            }
                            try {
                                fileOutputStream.close();
                            } catch (Throwable th3) {
                                th = th3;
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "TPwkgQaIZuGJRtI=", 615);
                                str = "TTPropHelper";
                                Log.w(str, th.getMessage());
                                this.f24160ea.delete();
                                this.f24162jw = c0047zb.ycx;
                                c0047zb.ycx(true, true);
                            }
                        } catch (Exception e11) {
                            e3 = e11;
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "TPwkgQaIZuGJRtI=", 608);
                            Log.e("TTPropHelper", "saveToLocal: ", e3);
                            c0047zb.ycx(false, false);
                            if (fileOutputStream != null) {
                                try {
                                    fileOutputStream.close();
                                } catch (Throwable th4) {
                                    th = th4;
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "TPwkgQaIZuGJRtI=", 615);
                                    str = "TTPropHelper";
                                    Log.w(str, th.getMessage());
                                    this.f24160ea.delete();
                                    this.f24162jw = c0047zb.ycx;
                                    c0047zb.ycx(true, true);
                                }
                            }
                            this.f24160ea.delete();
                            this.f24162jw = c0047zb.ycx;
                            c0047zb.ycx(true, true);
                        }
                    } catch (Throwable th5) {
                        th2 = th5;
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.close();
                            } catch (Throwable th6) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "TPwkgQaIZuGJRtI=", 615);
                                Log.w("TTPropHelper", th6.getMessage());
                            }
                        }
                        throw th2;
                    }
                } catch (Exception e12) {
                    fileOutputStream = null;
                    e3 = e12;
                } catch (Throwable th7) {
                    fileOutputStream = null;
                    th2 = th7;
                    if (fileOutputStream != null) {
                    }
                    throw th2;
                }
            }
            this.f24160ea.delete();
            this.f24162jw = c0047zb.ycx;
            c0047zb.ycx(true, true);
        } catch (Throwable th8) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th8, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "TPwkgQaIZuGJRtI=", 646);
            Log.w("TTPropHelper", "writeToFile: Got exception:", th8);
            if (this.f24161jc.exists() && !this.f24161jc.delete()) {
                Log.e("TTPropHelper", "Couldn't clean up partially-written file " + this.f24161jc);
            }
            c0047zb.ycx(false, false);
        }
    }

    public static zb ycx(@NotNull Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            str = "tt_prop";
        }
        synchronized (zb.class) {
            try {
                if (f24156ok == null) {
                    f24156ok = new ArrayMap<>();
                }
                File file = f24156ok.get(str);
                if (file == null) {
                    file = new File(context.getFilesDir(), str);
                    f24156ok.put(str, file);
                }
                if (f24157ry == null) {
                    f24157ry = new ArrayMap<>();
                }
                zb zbVar = f24157ry.get(file);
                if (zbVar != null) {
                    return zbVar;
                }
                zb zbVar2 = new zb(file);
                f24157ry.put(file, zbVar2);
                return zbVar2;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static File ycx(File file) {
        return new File(file.getPath() + ".bak");
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00a9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx() {
        FileInputStream fileInputStream;
        Throwable th2;
        synchronized (this.sya) {
            try {
                if (this.f24163lt) {
                    return;
                }
                if (this.f24160ea.exists()) {
                    this.f24161jc.delete();
                    this.f24160ea.renameTo(this.f24161jc);
                }
                if (f24158zb) {
                    this.f24161jc.getAbsolutePath();
                    this.f24161jc.exists();
                }
                Properties properties = null;
                if (this.f24161jc.exists()) {
                    Properties properties2 = new Properties();
                    try {
                        fileInputStream = new FileInputStream(this.f24161jc);
                    } catch (Throwable th3) {
                        fileInputStream = null;
                        th2 = th3;
                    }
                    try {
                        properties2.load(fileInputStream);
                        if (f24158zb) {
                            properties2.size();
                            this.f24161jc.getAbsolutePath();
                        }
                    } catch (Throwable th4) {
                        th2 = th4;
                        try {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "V+EskSWuZsqkQ8RW", 171);
                            Log.e("TTPropHelper", "reload: ", th2);
                            properties = properties2;
                            synchronized (this.sya) {
                            }
                        } finally {
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (Throwable th5) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "V+EskSWuZsqkQ8RW", 177);
                                    Log.w("TTPropHelper", th5.getMessage());
                                }
                            }
                        }
                    }
                    properties = properties2;
                }
                synchronized (this.sya) {
                    if (properties != null) {
                        try {
                            if (!properties.isEmpty()) {
                                this.lud = properties;
                            }
                        } catch (Throwable th6) {
                            throw th6;
                        }
                    }
                    this.f24163lt = true;
                    this.sya.notifyAll();
                }
            } catch (Throwable th7) {
                throw th7;
            }
        }
    }

    public String ycx(String str, String str2) {
        String property;
        if (TextUtils.isEmpty(str)) {
            return str2;
        }
        synchronized (this.sya) {
            dj();
            property = this.lud.getProperty(str, str2);
        }
        return property;
    }

    public int ycx(String str, int i5) {
        int i11;
        if (!TextUtils.isEmpty(str)) {
            synchronized (this.sya) {
                try {
                    try {
                        dj();
                        i11 = Integer.parseInt(this.lud.getProperty(str, String.valueOf(i5)));
                    } catch (NumberFormatException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "XOs5vA2o", Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE);
                        Log.e("TTPropHelper", e3.getMessage());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return i11;
        }
        return i5;
    }

    public long ycx(String str, long j11) {
        long j12;
        if (!TextUtils.isEmpty(str)) {
            synchronized (this.sya) {
                try {
                    try {
                        dj();
                        j12 = Long.parseLong(this.lud.getProperty(str, String.valueOf(j11)));
                    } catch (NumberFormatException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "XOs5uQyybg==", 236);
                        Log.e("TTPropHelper", e3.getMessage());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return j12;
        }
        return j11;
    }

    public boolean ycx(String str, boolean z11) {
        boolean z12;
        if (!TextUtils.isEmpty(str)) {
            synchronized (this.sya) {
                try {
                    try {
                        dj();
                        z12 = Boolean.parseBoolean(this.lud.getProperty(str, String.valueOf(z11)));
                    } catch (NumberFormatException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJP", "XOs5twyzZcKBRA==", 267);
                        Log.e("TTPropHelper", e3.getMessage());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return z12;
        }
        return z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(final C0047zb c0047zb, final boolean z11) {
        boolean z12;
        Runnable runnable = new Runnable() { // from class: com.bytedance.sdk.component.zb.3
            @Override // java.lang.Runnable
            public void run() {
                synchronized (zb.this.f24159dj) {
                    try {
                        zb.this.zb(c0047zb, z11);
                    } catch (OutOfMemoryError e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9odhwysQcKMWtJPyEI=", "Sfsj", 500);
                    }
                }
                synchronized (zb.this.sya) {
                    zb.jw(zb.this);
                }
            }
        };
        if (z11) {
            synchronized (this.sya) {
                z12 = this.f24164ul == 1;
            }
            if (z12) {
                runnable.run();
                return;
            }
        }
        com.bytedance.sdk.component.sya.ycx(runnable, true ^ z11);
    }
}
