package com.bytedance.sdk.openadsdk.zb;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.ul;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public final class ycx {
    private static final AtomicBoolean ycx = new AtomicBoolean(false);

    private static long dj() {
        try {
            String strUl = oby.ul();
            if (TextUtils.isEmpty(strUl)) {
                return -1L;
            }
            return Long.parseLong(strUl);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyNY7y6dBg==", "ev49vACzZ+OJWdx+jRKoLQ==", "WPs/hwayffGFWMRUgx+DJ1/r", 114);
            return -1L;
        }
    }

    private static File sya() {
        File fileYcx;
        Context contextYcx = pmi.ycx();
        if (contextYcx == null || (fileYcx = ul.ycx(contextYcx, "tt_ad/app_icon")) == null) {
            return null;
        }
        return new File(fileYcx, "app_icon.webp");
    }

    public static void ycx(final int i5) {
        if (i5 != 0 && ycx.compareAndSet(false, true)) {
            final long jDj = dj();
            long jYcx = com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_global_file", "app_icon_cached_version_code", -1L);
            int iYcx = com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_global_file", "app_icon_cached_icon_id", 0);
            if (jYcx == jDj && iYcx == i5) {
                return;
            }
            try {
                yzp.sya(new Runnable() { // from class: com.bytedance.sdk.openadsdk.zb.ycx.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (ycx.sya(i5)) {
                            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_global_file", "app_icon_cached_version_code", Long.valueOf(jDj));
                            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_global_file", "app_icon_cached_icon_id", Integer.valueOf(i5));
                        }
                    }
                });
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyNY7y6dBg==", "ev49vACzZ+OJWdx+jRKoLQ==", "S/wohQKubA==", 73);
                th2.getMessage();
            }
        }
    }

    public static InputStream zb() {
        File fileSya = sya();
        if (fileSya != null && fileSya.exists() && fileSya.length() > 0) {
            try {
                return new FileInputStream(fileSya);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyNY7y6dBg==", "ev49vACzZ+OJWdx+jRKoLQ==", "VP4omyq/ZsmzXsVYjRw=", 93);
                th2.getMessage();
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean sya(int i5) {
        File fileYcx;
        Bitmap bitmapCreateBitmap;
        FileOutputStream fileOutputStream;
        boolean zIsRecycled;
        Context contextYcx = pmi.ycx();
        if (contextYcx != null && (fileYcx = ul.ycx(contextYcx, "tt_ad/app_icon")) != null && (fileYcx.exists() || fileYcx.mkdirs())) {
            File file = new File(fileYcx, "app_icon.webp");
            File file2 = new File(fileYcx, "app_icon.webp.tmp");
            FileOutputStream fileOutputStream2 = null;
            try {
                Drawable drawable = contextYcx.getDrawable(i5);
                if (drawable == null) {
                    ycx((Closeable) null);
                    return false;
                }
                int iZb = dc.zb(contextYcx, 24.0f);
                if (iZb <= 0) {
                    ycx((Closeable) null);
                    return false;
                }
                bitmapCreateBitmap = Bitmap.createBitmap(iZb, iZb, Bitmap.Config.ARGB_8888);
                try {
                    Canvas canvas = new Canvas(bitmapCreateBitmap);
                    drawable.setBounds(0, 0, iZb, iZb);
                    drawable.draw(canvas);
                    file2.delete();
                    fileOutputStream = new FileOutputStream(file2);
                } catch (Throwable th2) {
                    th = th2;
                }
                try {
                    if (Build.VERSION.SDK_INT >= 30) {
                        bitmapCreateBitmap.compress(Bitmap.CompressFormat.WEBP_LOSSLESS, 100, fileOutputStream);
                    } else {
                        bitmapCreateBitmap.compress(Bitmap.CompressFormat.WEBP, 100, fileOutputStream);
                    }
                    fileOutputStream.flush();
                    ycx(fileOutputStream);
                    file.delete();
                    if (!file2.renameTo(file)) {
                        file2.delete();
                        if (bitmapCreateBitmap != null) {
                            if (!zIsRecycled) {
                                return false;
                            }
                        }
                    } else {
                        ycx((Closeable) null);
                        if (bitmapCreateBitmap == null || bitmapCreateBitmap.isRecycled()) {
                            return true;
                        }
                        bitmapCreateBitmap.recycle();
                        return true;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    fileOutputStream2 = fileOutputStream;
                    try {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyNY7y6dBg==", "ev49vACzZ+OJWdx+jRKoLQ==", "TPwkgQY=", 167);
                        th.getMessage();
                        file2.delete();
                        ycx(fileOutputStream2);
                        if (bitmapCreateBitmap != null && !bitmapCreateBitmap.isRecycled()) {
                            bitmapCreateBitmap.recycle();
                        }
                        return false;
                    } finally {
                        ycx(fileOutputStream2);
                        if (bitmapCreateBitmap != null && !bitmapCreateBitmap.isRecycled()) {
                            bitmapCreateBitmap.recycle();
                        }
                    }
                }
            } catch (Throwable th4) {
                th = th4;
                bitmapCreateBitmap = null;
            }
        }
        return false;
    }

    public static boolean ycx() {
        File fileSya = sya();
        return fileSya != null && fileSya.exists() && fileSya.length() > 0;
    }

    private static void ycx(Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyNY7y6dBg==", "ev49vACzZ+OJWdx+jRKoLQ==", "WOIihgaNfM6FXttE", ModuleDescriptor.MODULE_VERSION);
        }
    }
}
