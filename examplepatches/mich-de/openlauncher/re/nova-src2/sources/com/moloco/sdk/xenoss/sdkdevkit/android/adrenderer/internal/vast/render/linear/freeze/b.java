package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.widget.ImageView;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.m0;
import w70.g2;
import w70.n;

@SuppressLint({"ViewConstructor"})
/* loaded from: classes4.dex */
public final class b extends ImageView {

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final a f41808i = new a(null);

    /* renamed from: j, reason: collision with root package name */
    public static final int f41809j = 8;

    /* renamed from: k, reason: collision with root package name */
    @Deprecated
    @NotNull
    public static final String f41810k = "FreezeFrameOverlay";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f41811a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function0<Long> f41812b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final g2 f41813c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final d f41814d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final CoroutineContext f41815e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public j0 f41816f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public Bitmap f41817g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f41818h;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.FreezeFrameOverlayView$onAttachedToWindow$1", f = "FreezeFrameOverlayView.kt", l = {78}, m = "invokeSuspend")
    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.b$b, reason: collision with other inner class name */
    public static final class C0287b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41819a;

        /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.b$b$a */
        public static final class a<T> implements n {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ b f41821a;

            public a(b bVar) {
                this.f41821a = bVar;
            }

            public final Object a(boolean z11, Continuation<? super Unit> continuation) {
                if (z11) {
                    this.f41821a.b();
                } else {
                    this.f41821a.a();
                }
                return Unit.f71706a;
            }

            @Override // w70.n
            public /* bridge */ /* synthetic */ Object emit(Object obj, Continuation continuation) {
                return a(((Boolean) obj).booleanValue(), continuation);
            }
        }

        public C0287b(Continuation<? super C0287b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((C0287b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return b.this.new C0287b(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f41819a;
            if (i5 == 0) {
                ResultKt.b(obj);
                g2 g2Var = b.this.f41813c;
                a aVar = new a(b.this);
                this.f41819a = 1;
                if (g2Var.collect(aVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            throw new KotlinNothingValueException();
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.FreezeFrameOverlayView$showFreezeFrame$2", f = "FreezeFrameOverlayView.kt", l = {102}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41822a;

        public c(Continuation<? super c> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return b.this.new c(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f41822a;
            if (i5 == 0) {
                ResultKt.b(obj);
                d dVar = b.this.f41814d;
                String str = b.this.f41811a;
                long jLongValue = ((Number) b.this.f41812b.invoke()).longValue();
                this.f41822a = 1;
                obj = dVar.a(str, jLongValue, this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            Bitmap bitmap = (Bitmap) obj;
            b.this.f41818h = false;
            if (bitmap == null) {
                MolocoLogger.info$default(MolocoLogger.INSTANCE, b.f41810k, "[freeze] no frame extracted — overlay stays hidden", null, false, 12, null);
                return Unit.f71706a;
            }
            if (!((Boolean) b.this.f41813c.getValue()).booleanValue()) {
                return Unit.f71706a;
            }
            b.this.f41817g = bitmap;
            b.this.setImageBitmap(bitmap);
            b.this.setVisibility(0);
            return Unit.f71706a;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public /* synthetic */ b(Context context, String str, Function0 function0, g2 g2Var, d dVar, CoroutineContext coroutineContext, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, str, function0, g2Var, (i5 & 16) != 0 ? new com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.a(null, 1, 0 == true ? 1 : 0) : dVar, (i5 & 32) != 0 ? com.moloco.sdk.internal.scheduling.b.a().getMainImmediate() : coroutineContext);
    }

    public static /* synthetic */ void getCapturedFrame$moloco_sdk_release$annotations() {
    }

    @Nullable
    public final Bitmap getCapturedFrame$moloco_sdk_release() {
        return this.f41817g;
    }

    @Override // android.widget.ImageView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        y70.d dVarA = k0.a(CoroutineContext.Element.DefaultImpls.d(m0.c(), this.f41815e));
        this.f41816f = dVarA;
        m0.t(dVarA, null, null, new C0287b(null), 3);
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        j0 j0Var = this.f41816f;
        if (j0Var != null) {
            k0.c(j0Var, null);
        }
        this.f41816f = null;
        this.f41818h = false;
    }

    public final void b() {
        j0 j0Var;
        Bitmap bitmap = this.f41817g;
        if (bitmap != null) {
            setImageBitmap(bitmap);
            setVisibility(0);
        } else {
            if (this.f41818h || (j0Var = this.f41816f) == null) {
                return;
            }
            this.f41818h = true;
            m0.t(j0Var, null, null, new c(null), 3);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(@NotNull Context context, @NotNull String localMediaResourcePath, @NotNull Function0<Long> freezePositionProvider, @NotNull g2 isCompleted, @NotNull d frameExtractor, @NotNull CoroutineContext dispatcher) {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(localMediaResourcePath, "localMediaResourcePath");
        Intrinsics.g(freezePositionProvider, "freezePositionProvider");
        Intrinsics.g(isCompleted, "isCompleted");
        Intrinsics.g(frameExtractor, "frameExtractor");
        Intrinsics.g(dispatcher, "dispatcher");
        this.f41811a = localMediaResourcePath;
        this.f41812b = freezePositionProvider;
        this.f41813c = isCompleted;
        this.f41814d = frameExtractor;
        this.f41815e = dispatcher;
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(2);
        setScaleType(ImageView.ScaleType.FIT_CENTER);
        setVisibility(4);
    }

    public final void a() {
        setVisibility(4);
    }
}
