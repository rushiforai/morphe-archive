package com.vungle.ads.internal.util;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.view.View;
import android.view.Window;
import android.webkit.WebView;
import com.vungle.ads.internal.util.g;
import kotlin.Lazy;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class g extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f47686a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Lazy f47687b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j f47688c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Window f47689d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f47690e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(WebView webView, Lazy lazy, j jVar, Window window, i iVar) {
        super(0);
        this.f47686a = webView;
        this.f47687b = lazy;
        this.f47688c = jVar;
        this.f47689d = window;
        this.f47690e = iVar;
    }

    public final void a() {
        final int width = this.f47686a.getWidth();
        final int height = this.f47686a.getHeight();
        int[] iArr = new int[2];
        this.f47686a.getLocationInWindow(iArr);
        int i5 = iArr[0];
        int i11 = iArr[1];
        final Rect rect = new Rect(i5, i11, i5 + width, i11 + height);
        com.vungle.ads.internal.executor.j jVar = ((com.vungle.ads.internal.executor.d) j.a(this.f47687b)).f46822c;
        final j jVar2 = this.f47688c;
        final Window window = this.f47689d;
        final Function1 function1 = this.f47690e;
        jVar.execute(new Runnable() { // from class: o40.a
            @Override // java.lang.Runnable
            public final void run() {
                g.a(width, height, jVar2, window, rect, function1);
            }
        });
    }

    @Override // kotlin.jvm.functions.Function0
    public final /* bridge */ /* synthetic */ Object invoke() {
        a();
        return Unit.f71706a;
    }

    public static final void a(int i5, int i11, j this$0, Window window, Rect rect, Function1 onComplete) {
        Bitmap bitmapCreateBitmap;
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(rect, "$rect");
        Intrinsics.g(onComplete, "$onComplete");
        try {
            bitmapCreateBitmap = Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
            try {
                j.a(this$0, window, rect, bitmapCreateBitmap, onComplete);
            } catch (Throwable th2) {
                th = th2;
                boolean z11 = u.f47714a;
                t.a("BlackScreenDetector", "Bitmap creation failed", th);
                if (bitmapCreateBitmap != null) {
                    bitmapCreateBitmap.recycle();
                }
                onComplete.invoke(null);
            }
        } catch (Throwable th3) {
            th = th3;
            bitmapCreateBitmap = null;
        }
    }
}
