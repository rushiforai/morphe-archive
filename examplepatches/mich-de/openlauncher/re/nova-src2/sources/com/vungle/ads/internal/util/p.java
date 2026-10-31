package com.vungle.ads.internal.util;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.vungle.ads.internal.g1;
import com.vungle.ads.internal.k1;
import java.util.concurrent.Executor;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: b, reason: collision with root package name */
    public static final p f47699b = new p();

    /* renamed from: a, reason: collision with root package name */
    public Executor f47700a;

    public final void a(com.vungle.ads.internal.executor.j ioExecutor) {
        Intrinsics.g(ioExecutor, "ioExecutor");
        this.f47700a = ioExecutor;
    }

    public final void a(String str, g1 onImageLoaded) {
        Intrinsics.g(onImageLoaded, "onImageLoaded");
        if (this.f47700a == null) {
            boolean z11 = u.f47714a;
            t.c("p", "ImageLoader not initialized.");
        } else if (str.length() == 0) {
            boolean z12 = u.f47714a;
            t.c("p", "the uri is required.");
        } else {
            Executor executor = this.f47700a;
            if (executor != null) {
                executor.execute(new kz.c(9, str, onImageLoaded));
            }
        }
    }

    public static final void a(String str, Function1 onImageLoaded) {
        Intrinsics.g(onImageLoaded, "$onImageLoaded");
        if (r70.j.I0(str, "file://", false)) {
            String strSubstring = str.substring(7);
            Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
            Bitmap bitmapDecodeFile = BitmapFactory.decodeFile(strSubstring);
            if (bitmapDecodeFile != null) {
                onImageLoaded.invoke(bitmapDecodeFile);
            } else {
                boolean z11 = u.f47714a;
                t.c("p", "decode bitmap failed.");
            }
        }
    }

    public static void a(String str, k1 onImageSizeLoaded) {
        Intrinsics.g(onImageSizeLoaded, "onImageSizeLoaded");
        if (str.length() == 0 || !r70.j.I0(str, "file://", false)) {
            boolean z11 = u.f47714a;
            t.c("p", "the valid uri is required.");
            return;
        }
        String strSubstring = str.substring(7);
        Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(strSubstring, options);
        onImageSizeLoaded.invoke(Integer.valueOf(options.outWidth), Integer.valueOf(options.outHeight));
    }
}
