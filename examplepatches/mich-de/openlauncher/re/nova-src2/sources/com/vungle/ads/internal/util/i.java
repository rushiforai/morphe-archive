package com.vungle.ads.internal.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.View;
import android.webkit.WebView;
import com.instabridge.ai.chat.ui.c0;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class i extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f47692a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ j f47693b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f47694c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(WebView webView, j jVar, int i5) {
        super(1);
        this.f47692a = webView;
        this.f47693b = jVar;
        this.f47694c = i5;
    }

    public final void a(Bitmap bitmap) {
        Context context = this.f47692a.getContext();
        Intrinsics.f(context, "view.context");
        ((com.vungle.ads.internal.executor.d) ((com.vungle.ads.internal.executor.a) LazyKt.b(LazyThreadSafetyMode.f71679a, new h(context)).getValue())).d().execute(new c0(this.f47693b, bitmap, this.f47694c, 5));
    }

    @Override // kotlin.jvm.functions.Function1
    public final /* bridge */ /* synthetic */ Object invoke(Object obj) {
        a((Bitmap) obj);
        return Unit.f71706a;
    }

    public static final void a(j this$0, Bitmap bitmap, int i5) {
        Intrinsics.g(this$0, "this$0");
        try {
            Pair pairA = j.a(bitmap, i5);
            int iIntValue = ((Number) pairA.f71683a).intValue();
            String str = (String) pairA.f71684b;
            Function2 function2 = this$0.f47695a;
            if (function2 != null) {
                function2.invoke(Integer.valueOf(iIntValue), str);
            }
        } catch (Throwable th2) {
            try {
                boolean z11 = u.f47714a;
                t.a("BlackScreenDetector", "Black screen detection failed", th2);
                Function2 function22 = this$0.f47695a;
                if (function22 != null) {
                    function22.invoke(-1, "Internal calculation error: " + th2.getMessage());
                }
            } finally {
                if (bitmap != null) {
                    bitmap.recycle();
                }
                this$0.f47695a = null;
            }
        }
        if (bitmap != null) {
        }
    }
}
