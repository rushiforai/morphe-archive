package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.touch;

import androidx.compose.foundation.gestures.GestureCancellationException;
import c80.d;
import com.vungle.ads.internal.protos.Sdk;
import g0.e1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import y3.c;
import y3.h;

/* loaded from: classes4.dex */
public final class a implements e1, c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c f41423a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f41424b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f41425c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final c80.a f41426d;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.touch.PressGestureScopeImpl2", f = "Tap.kt", l = {128}, m = "awaitRelease")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.touch.a$a, reason: collision with other inner class name */
    public static final class C0277a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f41427a;

        /* renamed from: c, reason: collision with root package name */
        public int f41429c;

        public C0277a(Continuation<? super C0277a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f41427a = obj;
            this.f41429c |= Integer.MIN_VALUE;
            return a.this.awaitRelease(this);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.touch.PressGestureScopeImpl2", f = "Tap.kt", l = {Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE}, m = "tryAwaitRelease")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f41430a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f41431b;

        /* renamed from: d, reason: collision with root package name */
        public int f41433d;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f41431b = obj;
            this.f41433d |= Integer.MIN_VALUE;
            return a.this.tryAwaitRelease(this);
        }
    }

    public a(@NotNull c density) {
        Intrinsics.g(density, "density");
        this.f41423a = density;
        this.f41426d = new d();
    }

    public final void a() {
        this.f41425c = true;
        ((d) this.f41426d).g(null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object awaitRelease(@NotNull Continuation<? super Unit> continuation) {
        C0277a c0277a;
        if (continuation instanceof C0277a) {
            c0277a = (C0277a) continuation;
            int i5 = c0277a.f41429c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0277a.f41429c = i5 - Integer.MIN_VALUE;
            } else {
                c0277a = new C0277a(continuation);
            }
        }
        Object objTryAwaitRelease = c0277a.f41427a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c0277a.f41429c;
        if (i11 == 0) {
            ResultKt.b(objTryAwaitRelease);
            c0277a.f41429c = 1;
            objTryAwaitRelease = tryAwaitRelease(c0277a);
            if (objTryAwaitRelease == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objTryAwaitRelease);
        }
        if (((Boolean) objTryAwaitRelease).booleanValue()) {
            return Unit.f71706a;
        }
        throw new GestureCancellationException("The press gesture was canceled.");
    }

    public final void b() {
        this.f41424b = true;
        ((d) this.f41426d).g(null);
    }

    public final void c() {
        ((d) this.f41426d).f();
        this.f41424b = false;
        this.f41425c = false;
    }

    @Override // y3.c
    public float getDensity() {
        return this.f41423a.getDensity();
    }

    @Override // y3.c
    public float getFontScale() {
        return this.f41423a.getFontScale();
    }

    @Override // y3.c
    /* renamed from: roundToPx--R2X_6o */
    public int mo95roundToPxR2X_6o(long j11) {
        return this.f41423a.mo95roundToPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: roundToPx-0680j_4 */
    public int mo96roundToPx0680j_4(float f11) {
        return this.f41423a.mo96roundToPx0680j_4(f11);
    }

    @Override // y3.c
    /* renamed from: toDp-GaN1DYA */
    public float mo97toDpGaN1DYA(long j11) {
        return this.f41423a.mo97toDpGaN1DYA(j11);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public float mo98toDpu2uoSUM(float f11) {
        return this.f41423a.mo98toDpu2uoSUM(f11);
    }

    @Override // y3.c
    /* renamed from: toDpSize-k-rfVVM */
    public long mo100toDpSizekrfVVM(long j11) {
        return this.f41423a.mo100toDpSizekrfVVM(j11);
    }

    @Override // y3.c
    /* renamed from: toPx--R2X_6o */
    public float mo101toPxR2X_6o(long j11) {
        return this.f41423a.mo101toPxR2X_6o(j11);
    }

    @Override // y3.c
    /* renamed from: toPx-0680j_4 */
    public float mo102toPx0680j_4(float f11) {
        return this.f41423a.mo102toPx0680j_4(f11);
    }

    @NotNull
    public h2.c toRect(@NotNull h hVar) {
        Intrinsics.g(hVar, "<this>");
        throw null;
    }

    @Override // y3.c
    /* renamed from: toSize-XkaWNTQ */
    public long mo103toSizeXkaWNTQ(long j11) {
        return this.f41423a.mo103toSizeXkaWNTQ(j11);
    }

    @Override // y3.c
    /* renamed from: toSp-0xMU5do */
    public long mo104toSp0xMU5do(float f11) {
        return this.f41423a.mo104toSp0xMU5do(f11);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public long mo105toSpkPz2Gy4(float f11) {
        return this.f41423a.mo105toSpkPz2Gy4(f11);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // g0.e1
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object tryAwaitRelease(@NotNull Continuation<? super Boolean> continuation) {
        b bVar;
        a aVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f41433d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f41433d = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj = bVar.f41431b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f41433d;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!this.f41424b && !this.f41425c) {
                c80.a aVar2 = this.f41426d;
                bVar.f41430a = this;
                bVar.f41433d = 1;
                if (((d) aVar2).e(bVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            aVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = (a) bVar.f41430a;
            ResultKt.b(obj);
        }
        return Boolean.valueOf(aVar.f41424b);
    }

    @Override // y3.c
    /* renamed from: toDp-u2uoSUM */
    public float mo99toDpu2uoSUM(int i5) {
        return this.f41423a.mo99toDpu2uoSUM(i5);
    }

    @Override // y3.c
    /* renamed from: toSp-kPz2Gy4 */
    public long mo106toSpkPz2Gy4(int i5) {
        return this.f41423a.mo106toSpkPz2Gy4(i5);
    }
}
