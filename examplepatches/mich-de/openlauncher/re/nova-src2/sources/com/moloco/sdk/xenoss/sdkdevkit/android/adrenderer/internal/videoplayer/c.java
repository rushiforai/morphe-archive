package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer;

import android.net.Uri;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Collections;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import vf.g0;
import vf.k;
import vf.l;

/* loaded from: classes4.dex */
public final class c implements k {

    /* renamed from: h, reason: collision with root package name */
    public static final int f41902h = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f41903a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i f41904b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f41905c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public RandomAccessFile f41906d;

    /* renamed from: e, reason: collision with root package name */
    public long f41907e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f41908f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f41909g;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer.ProgressiveMediaFileDataSource$open$1", f = "ProgressiveMediaFileDataSource.kt", l = {}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Long>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41910a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ l f41912c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(l lVar, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f41912c = lVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Long> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return c.this.new a(this.f41912c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws IOException {
            File fileC;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f41910a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            try {
                c cVar = c.this;
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c cVarA = cVar.a(cVar.f41903a);
                if (cVarA instanceof c.a) {
                    fileC = ((c.a) cVarA).b();
                } else {
                    if (!(cVarA instanceof c.C0208c)) {
                        c.this.f41909g = true;
                        MolocoLogger.error$default(MolocoLogger.INSTANCE, c.this.f41905c, "Failed to download file: " + c.this.f41903a, null, false, 12, null);
                        throw new IOException("Cannot read file: " + c.this.f41903a);
                    }
                    fileC = ((c.C0208c) cVarA).c();
                }
                if (!fileC.exists()) {
                    throw new IOException("Cannot read file, does not exist yet: " + c.this.f41903a);
                }
                c cVar2 = c.this;
                RandomAccessFile randomAccessFile = new RandomAccessFile(fileC, "r");
                randomAccessFile.seek(this.f41912c.f92695e);
                cVar2.a(randomAccessFile);
                c cVar3 = c.this;
                long length = this.f41912c.f92696f;
                if (length == -1) {
                    length = fileC.length() - this.f41912c.f92695e;
                }
                cVar3.f41907e = length;
                if (c.this.f41907e == 0 && c.this.a(cVarA)) {
                    MolocoLogger.info$default(MolocoLogger.INSTANCE, c.this.f41905c, "Streaming error likely detected", null, false, 12, null);
                    c.this.f41909g = true;
                }
                return new Long(c.this.f41907e);
            } catch (IOException e3) {
                MolocoLogger.error$default(MolocoLogger.INSTANCE, c.this.f41905c, "Failed to open file: " + c.this.f41903a, e3, false, 8, null);
                throw e3;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.videoplayer.ProgressiveMediaFileDataSource$streamingStatus$1", f = "ProgressiveMediaFileDataSource.kt", l = {}, m = "invokeSuspend")
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41913a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ String f41915c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(String str, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f41915c = str;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return c.this.new b(this.f41915c, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f41913a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return c.this.f41904b.a(this.f41915c);
        }
    }

    public c(@NotNull String url, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i mediaCacheRepository) {
        Intrinsics.g(url, "url");
        Intrinsics.g(mediaCacheRepository, "mediaCacheRepository");
        this.f41903a = url;
        this.f41904b = mediaCacheRepository;
        this.f41905c = "ProgressiveMediaFileDataSource";
    }

    public static /* synthetic */ void c() {
    }

    @Override // vf.k
    public void addTransferListener(@NotNull g0 transferListener) {
        Intrinsics.g(transferListener, "transferListener");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, this.f41905c, "addTransferListener", null, false, 12, null);
    }

    @Override // vf.k
    public void close() {
        try {
            RandomAccessFile randomAccessFile = this.f41906d;
            if (randomAccessFile != null) {
                randomAccessFile.close();
            }
        } finally {
            this.f41906d = null;
        }
    }

    @Override // vf.k
    public Map getResponseHeaders() {
        return Collections.EMPTY_MAP;
    }

    @Override // vf.k
    @Nullable
    public Uri getUri() {
        return Uri.parse(this.f41903a);
    }

    @Override // vf.k
    public long open(@NotNull l dataSpec) {
        Intrinsics.g(dataSpec, "dataSpec");
        return ((Number) m0.u(EmptyCoroutineContext.f71803a, new a(dataSpec, null))).longValue();
    }

    @Override // vf.h
    public int read(@NotNull byte[] buffer, int i5, int i11) throws IOException {
        IOException iOException;
        int i12;
        Intrinsics.g(buffer, "buffer");
        try {
            if (i11 == 0) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, this.f41905c, "Read length is 0", null, false, 12, null);
                return 0;
            }
            if (this.f41907e == 0 && (a(this.f41903a) instanceof c.a)) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, this.f41905c, "Media stream is complete", null, false, 12, null);
                return -1;
            }
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c cVarA = a(this.f41903a);
            if (cVarA instanceof c.b) {
                MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f41905c, "Streaming failed: " + this.f41903a, null, false, 12, null);
                this.f41909g = true;
                return 0;
            }
            if (cVarA instanceof c.a) {
                RandomAccessFile randomAccessFile = this.f41906d;
                i = randomAccessFile != null ? randomAccessFile.read(buffer, i5, i11) : 0;
                if (i > 0) {
                    this.f41908f = true;
                    this.f41907e -= i;
                }
                return i;
            }
            loop0: while (true) {
                i12 = 0;
                while (i12 <= 0) {
                    try {
                        if (!(a(this.f41903a) instanceof c.C0208c)) {
                            break loop0;
                        }
                        RandomAccessFile randomAccessFile2 = this.f41906d;
                        if (randomAccessFile2 != null) {
                            i12 = randomAccessFile2.read(buffer, i5, i11);
                        }
                    } catch (IOException e3) {
                        iOException = e3;
                        i = i12;
                        MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f41905c, "Waiting for more data", iOException, false, 8, null);
                        return i;
                    }
                }
            }
            if (i12 > 0) {
                this.f41908f = true;
                this.f41907e -= i12;
            }
            return i12;
        } catch (IOException e11) {
            iOException = e11;
        }
    }

    @Nullable
    public final RandomAccessFile b() {
        return this.f41906d;
    }

    public final void a(@Nullable RandomAccessFile randomAccessFile) {
        this.f41906d = randomAccessFile;
    }

    public final boolean a() {
        return this.f41909g;
    }

    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c a(String str) {
        return (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c) m0.u(EmptyCoroutineContext.f71803a, new b(str, null));
    }

    public final boolean a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.c cVar) {
        return this.f41908f && (cVar instanceof c.C0208c) && Intrinsics.b(((c.C0208c) cVar).d(), com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.stream.d.a());
    }
}
