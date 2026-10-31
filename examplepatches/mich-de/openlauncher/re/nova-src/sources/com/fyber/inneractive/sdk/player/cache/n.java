package com.fyber.inneractive.sdk.player.cache;

import android.content.Context;
import android.os.Environment;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.o;
import java.io.File;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public final class n implements f {

    /* renamed from: f, reason: collision with root package name */
    public static final n f28874f = new n();

    /* renamed from: a, reason: collision with root package name */
    public Context f28875a;

    /* renamed from: b, reason: collision with root package name */
    public g f28876b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f28877c = false;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArrayList f28878d = new CopyOnWriteArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final m f28879e = new m(this);

    public static File a(Context context, String str) {
        String externalStorageState;
        File externalCacheDir;
        String externalStorageState2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (context != null && !TextUtils.isEmpty(str)) {
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
                    if (("mounted".equals(externalStorageState2) || "mounted_ro".equals(externalStorageState2)) && (externalCacheDir = context.getExternalCacheDir()) != null && externalCacheDir.getFreeSpace() > 52428800) {
                        return new File(context.getExternalCacheDir(), str);
                    }
                }
            }
            File cacheDir = context.getCacheDir();
            if (cacheDir != null && cacheDir.getFreeSpace() > 52428800) {
                return new File(context.getCacheDir(), str);
            }
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.cache.f
    public final boolean a(String str) {
        Iterator it = this.f28878d.iterator();
        while (it.hasNext()) {
            if (((String) it.next()).equalsIgnoreCase(str)) {
                return false;
            }
        }
        return true;
    }
}
