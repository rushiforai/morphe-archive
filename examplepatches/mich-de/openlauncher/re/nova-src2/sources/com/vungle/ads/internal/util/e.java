package com.vungle.ads.internal.util;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.View;
import android.webkit.WebView;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class e extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f47683a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f47684b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(WebView webView, i iVar) {
        super(0);
        this.f47683a = webView;
        this.f47684b = iVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        try {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(this.f47683a.getWidth(), this.f47683a.getHeight(), Bitmap.Config.ARGB_8888);
            this.f47683a.draw(new Canvas(bitmapCreateBitmap));
            this.f47684b.invoke(bitmapCreateBitmap);
        } catch (Throwable th2) {
            boolean z11 = u.f47714a;
            t.a("BlackScreenDetector", "Bitmap capture failed", th2);
            this.f47684b.invoke(null);
        }
        return Unit.f71706a;
    }
}
