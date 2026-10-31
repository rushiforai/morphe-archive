package com.vungle.ads.internal;

import android.graphics.Bitmap;
import android.os.Handler;
import android.widget.ImageView;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class g1 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ImageView f46841a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g1(ImageView imageView) {
        super(1);
        this.f46841a = imageView;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Bitmap it = (Bitmap) obj;
        Intrinsics.g(it, "it");
        ImageView imageView = this.f46841a;
        if (imageView != null) {
            Handler handler = com.vungle.ads.internal.util.y.f47718a;
            com.vungle.ads.internal.util.y.a(new f1(imageView, it));
        }
        return Unit.f71706a;
    }
}
