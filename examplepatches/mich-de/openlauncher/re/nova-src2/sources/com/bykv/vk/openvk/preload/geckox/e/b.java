package com.bykv.vk.openvk.preload.geckox.e;

import android.content.Context;
import android.text.TextUtils;
import b.c0;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import java.io.File;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    private final Map<String, a> f22093a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    private AtomicBoolean f22094b = new AtomicBoolean(false);

    /* renamed from: c, reason: collision with root package name */
    private String f22095c;

    public b(Context context, String str, File file) {
        if (TextUtils.isEmpty(str)) {
            throw new RuntimeException("access key empty");
        }
        if (file == null) {
            this.f22095c = new File(context.getFilesDir(), c0.q(new StringBuilder("gecko_offline_res_x"), File.separator, str)).getAbsolutePath();
        } else {
            this.f22095c = new File(file, str).getAbsolutePath();
        }
    }

    private a d(String str) {
        a aVar;
        int iIndexOf = str.indexOf("/");
        if (iIndexOf == -1) {
            new RuntimeException("channel：".concat(str));
        }
        String strSubstring = str.substring(0, iIndexOf);
        synchronized (this.f22093a) {
            try {
                aVar = this.f22093a.get(strSubstring);
                if (aVar == null) {
                    aVar = new a(this.f22095c, strSubstring);
                    this.f22093a.put(strSubstring, aVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return aVar;
    }

    public final String a() {
        return this.f22095c;
    }

    public final int b(String str) throws Exception {
        if (this.f22094b.get()) {
            throw new RuntimeException("released");
        }
        if (TextUtils.isEmpty(str)) {
            throw new RuntimeException("relativePath empty");
        }
        return d(str.trim()).c(str);
    }

    public final boolean c(String str) throws Exception {
        if (this.f22094b.get()) {
            throw new RuntimeException("released");
        }
        if (TextUtils.isEmpty(str)) {
            throw new RuntimeException("relativePath empty");
        }
        return d(str.trim()).b(str);
    }

    public final InputStream a(String str) throws Exception {
        if (this.f22094b.get()) {
            throw new RuntimeException("released");
        }
        if (TextUtils.isEmpty(str)) {
            throw new RuntimeException("relativePath empty");
        }
        return d(str.trim()).a(str);
    }

    public final Map<String, Long> b() {
        HashMap map = new HashMap();
        synchronized (this.f22093a) {
            try {
                Collection<a> collectionValues = this.f22093a.values();
                if (collectionValues == null) {
                    return map;
                }
                for (a aVar : collectionValues) {
                    map.put(aVar.b(), aVar.a());
                }
                return map;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void c() throws Exception {
        if (this.f22094b.getAndSet(true)) {
            return;
        }
        GeckoLogger.d("Loader", "release version res loader");
        synchronized (this.f22093a) {
            try {
                Iterator<a> it = this.f22093a.values().iterator();
                while (it.hasNext()) {
                    it.next().c();
                }
                this.f22093a.clear();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
