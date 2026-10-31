package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.webkit.WebView;
import b.c0;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final e f39519a = new e();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final String f39520b = "WebViewRenderingChecker";

    /* renamed from: c, reason: collision with root package name */
    public static final int f39521c = 10;

    /* renamed from: d, reason: collision with root package name */
    public static final int f39522d = 200;

    /* renamed from: e, reason: collision with root package name */
    public static final int f39523e = 0;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.WebViewRenderingChecker", f = "WebViewRenderingChecker.kt", l = {34}, m = "isMostlyBlack")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f39524a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f39525b;

        /* renamed from: d, reason: collision with root package name */
        public int f39527d;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f39525b = obj;
            this.f39527d |= Integer.MIN_VALUE;
            return e.this.a(null, 0.0f, this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.WebViewRenderingChecker$isMostlyBlack$2", f = "WebViewRenderingChecker.kt", l = {}, m = "invokeSuspend")
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Boolean>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f39528a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Bitmap f39529b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ float f39530c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(Bitmap bitmap, float f11, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f39529b = bitmap;
            this.f39530c = f11;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Boolean> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new b(this.f39529b, this.f39530c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f39528a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Boolean.valueOf(e.f39519a.a(this.f39529b) >= this.f39530c);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull WebView webView, float f11, @NotNull Continuation<? super Boolean> continuation) throws Throwable {
        a aVar;
        Throwable th2;
        Bitmap bitmap;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f39527d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f39527d = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object obj = aVar.f39525b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f39527d;
        if (i11 == 0) {
            ResultKt.b(obj);
            int width = webView.getWidth();
            int height = webView.getHeight();
            if (width <= 0 || height <= 0) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, f39520b, "Skipping rendering check: WebView has zero size (" + width + 'x' + height + ')', null, false, 12, null);
                return Boolean.FALSE;
            }
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            Intrinsics.f(bitmapCreateBitmap, "createBitmap(...)");
            try {
                webView.draw(new Canvas(bitmapCreateBitmap));
                a80.e eVar = y0.f88884a;
                b bVar = new b(bitmapCreateBitmap, f11, null);
                aVar.f39524a = bitmapCreateBitmap;
                aVar.f39527d = 1;
                Object objY = m0.y(eVar, bVar, aVar);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj = objY;
                bitmap = bitmapCreateBitmap;
            } catch (Throwable th3) {
                th2 = th3;
                bitmap = bitmapCreateBitmap;
                bitmap.recycle();
                throw th2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            bitmap = (Bitmap) aVar.f39524a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th4) {
                th2 = th4;
                bitmap.recycle();
                throw th2;
            }
        }
        Boolean bool = (Boolean) obj;
        bool.getClass();
        bitmap.recycle();
        return bool;
    }

    public static /* synthetic */ Object a(e eVar, WebView webView, float f11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            f11 = 0.9f;
        }
        return eVar.a(webView, f11, continuation);
    }

    public final float a(Bitmap bitmap) {
        int height = bitmap.getHeight() * bitmap.getWidth();
        int[] iArr = new int[height];
        bitmap.getPixels(iArr, 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        for (int i13 = 0; i13 < height; i13++) {
            int i14 = iArr[i13];
            int iAlpha = Color.alpha(i14);
            boolean z11 = iAlpha >= 200;
            if (z11) {
                i11++;
            } else if (iAlpha < 50) {
                i12++;
            }
            if (z11 && Color.red(i14) < 10 && Color.green(i14) < 10 && Color.blue(i14) < 10) {
                i5++;
            }
        }
        float f11 = i5 / height;
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        StringBuilder sbT = c0.t(height, "Pixel breakdown: total=", ", opaque=", i11, ", transparent=");
        c0.A(sbT, i12, ", opaqueBlack=", i5, ", opaqueBlackRatio=");
        sbT.append(f11);
        MolocoLogger.info$default(molocoLogger, f39520b, sbT.toString(), null, false, 12, null);
        return f11;
    }
}
