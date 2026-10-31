package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze;

import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.os.Build;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;

/* loaded from: classes4.dex */
public final class a implements d {

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final C0286a f41800b = new C0286a(null);

    /* renamed from: c, reason: collision with root package name */
    public static final int f41801c = 8;

    /* renamed from: d, reason: collision with root package name */
    @Deprecated
    @NotNull
    public static final String f41802d = "VideoFrameExtractor";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final CoroutineContext f41803a;

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.a$a, reason: collision with other inner class name */
    public static final class C0286a {
        public /* synthetic */ C0286a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public C0286a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.DefaultVideoFrameExtractor$extractFrame$2", f = "VideoFrameExtractor.kt", l = {}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Bitmap>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41804a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f41805b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f41806c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long f41807d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(String str, long j11, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f41806c = str;
            this.f41807d = j11;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Bitmap> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            b bVar = new b(this.f41806c, this.f41807d, continuation);
            bVar.f41805b = obj;
            return bVar;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Bitmap frameAtTime;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f41804a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
            try {
                try {
                    mediaMetadataRetriever.setDataSource(this.f41806c);
                    frameAtTime = mediaMetadataRetriever.getFrameAtTime(this.f41807d * 1000, Build.VERSION.SDK_INT >= 27 ? 3 : 2);
                    try {
                        int i5 = Result.f71687b;
                        mediaMetadataRetriever.release();
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        int i11 = Result.f71687b;
                        ResultKt.a(th2);
                    }
                } catch (Exception e3) {
                    MolocoLogger.warn$default(MolocoLogger.INSTANCE, a.f41802d, "Failed to extract freeze frame at " + this.f41807d + "ms", e3, false, 8, null);
                    frameAtTime = null;
                    try {
                        int i12 = Result.f71687b;
                        mediaMetadataRetriever.release();
                        Unit unit2 = Unit.f71706a;
                    } catch (Throwable th3) {
                        int i13 = Result.f71687b;
                        ResultKt.a(th3);
                    }
                }
                return frameAtTime;
            } finally {
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public a() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.d
    @Nullable
    public Object a(@NotNull String str, long j11, @NotNull Continuation<? super Bitmap> continuation) {
        return m0.y(this.f41803a, new b(str, j11, null), continuation);
    }

    public a(@NotNull CoroutineContext ioDispatcher) {
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f41803a = ioDispatcher;
    }

    public /* synthetic */ a(CoroutineContext coroutineContext, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? com.moloco.sdk.internal.scheduling.b.a().getIo() : coroutineContext);
    }
}
