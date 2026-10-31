package com.fyber.inneractive.sdk.nativead;

import android.content.Context;
import android.os.Environment;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.player.cache.f;
import com.fyber.inneractive.sdk.player.cache.g;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.o;
import java.io.File;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public final class b implements f {

    /* renamed from: f, reason: collision with root package name */
    public static final b f28680f = new b();

    /* renamed from: a, reason: collision with root package name */
    public Context f28681a;

    /* renamed from: b, reason: collision with root package name */
    public g f28682b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f28683c = false;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArrayList f28684d = new CopyOnWriteArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final a f28685e = new a(this);

    public static File a(b bVar) {
        String externalStorageState;
        File externalCacheDir;
        String externalStorageState2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        Context context = bVar.f28681a;
        if (context != null && !TextUtils.isEmpty("fyb.native.cache")) {
            if (o.f31210a != null && o.a("android.permission.WRITE_EXTERNAL_STORAGE")) {
                try {
                    externalStorageState = Environment.getExternalStorageState();
                } catch (Throwable unused) {
                    externalStorageState = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                if ("mounted".equals(externalStorageState)) {
                    try {
                        externalStorageState2 = Environment.getExternalStorageState();
                    } catch (Throwable unused2) {
                    }
                    if (("mounted".equals(externalStorageState2) || "mounted_ro".equals(externalStorageState2)) && (externalCacheDir = context.getExternalCacheDir()) != null && externalCacheDir.getFreeSpace() > 41943040) {
                        return new File(context.getExternalCacheDir(), "fyb.native.cache");
                    }
                }
            }
            File cacheDir = context.getCacheDir();
            if (cacheDir != null && cacheDir.getFreeSpace() > 41943040) {
                return new File(context.getCacheDir(), "fyb.native.cache");
            }
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.cache.f
    public final boolean a(String str) {
        Iterator it = this.f28684d.iterator();
        while (it.hasNext()) {
            if (((String) it.next()).equalsIgnoreCase(str)) {
                return false;
            }
        }
        return true;
    }

    public final void a() {
        boolean z11;
        g gVar = this.f28682b;
        if (gVar != null) {
            synchronized (gVar) {
                z11 = gVar.f28860i == null;
            }
            if (!z11) {
                try {
                    this.f28682b.close();
                    this.f28683c = false;
                    return;
                } catch (Throwable th2) {
                    IAlog.f("%s: destroy: Error closing cache: %s", "NativeCache", th2);
                    return;
                }
            }
        }
        IAlog.c("%s: destroy: cache already closed or not exists", "NativeCache");
    }
}
