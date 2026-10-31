package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.moloco.sdk.R;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.i;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class q extends FrameLayout {

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public static final a f41355l = new a(null);

    /* renamed from: m, reason: collision with root package name */
    public static final int f41356m = 8;

    @NotNull
    public static final CoroutineContext n = com.moloco.sdk.internal.scheduling.b.a().getMain();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final w70.m f41357a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final w70.m f41358b;

    /* renamed from: c, reason: collision with root package name */
    public final int f41359c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public Function1<? super Boolean, Unit> f41360d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public Function0<Unit> f41361e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final View f41362f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final View f41363g;

    /* renamed from: h, reason: collision with root package name */
    public final long f41364h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f41365i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.i f41366j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public t70.j0 f41367k;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final CoroutineContext a() {
            return q.n;
        }

        public a() {
        }
    }

    public /* synthetic */ class b extends FunctionReferenceImpl implements Function0<Unit> {
        public b(Object obj) {
            super(0, 0, q.class, obj, "handleTap", "handleTap()V");
        }

        public final void a() {
            ((q) this.receiver).b();
        }

        @Override // kotlin.jvm.functions.Function0
        public /* bridge */ /* synthetic */ Object invoke() {
            a();
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.PlaybackControlView$onAttachedToWindow$1", f = "PlaybackControl.kt", l = {244}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41368a;

        public static final class a<T> implements w70.n {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ q f41370a;

            public a(q qVar) {
                this.f41370a = qVar;
            }

            public final Object a(boolean z11, Continuation<? super Unit> continuation) {
                this.f41370a.f41365i = z11;
                this.f41370a.a(z11);
                return Unit.f71706a;
            }

            @Override // w70.n
            public /* bridge */ /* synthetic */ Object emit(Object obj, Continuation continuation) {
                return a(((Boolean) obj).booleanValue(), continuation);
            }
        }

        public c(Continuation<? super c> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(t70.j0 j0Var, Continuation<? super Unit> continuation) {
            return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return q.this.new c(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f41368a;
            if (i5 == 0) {
                ResultKt.b(obj);
                w70.m mVar = q.this.f41357a;
                a aVar = new a(q.this);
                this.f41368a = 1;
                if (mVar.collect(aVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.PlaybackControlView$onAttachedToWindow$2", f = "PlaybackControl.kt", l = {androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION}, m = "invokeSuspend")
    public static final class d extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41371a;

        public static final class a<T> implements w70.n {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ q f41373a;

            public a(q qVar) {
                this.f41373a = qVar;
            }

            @Override // w70.n
            /* renamed from: a, reason: merged with bridge method [inline-methods] */
            public final Object emit(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.i iVar, Continuation<? super Unit> continuation) {
                this.f41373a.f41366j = iVar;
                return Unit.f71706a;
            }
        }

        public d(Continuation<? super d> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(t70.j0 j0Var, Continuation<? super Unit> continuation) {
            return ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return q.this.new d(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f41371a;
            if (i5 == 0) {
                ResultKt.b(obj);
                w70.m mVar = q.this.f41358b;
                a aVar = new a(q.this);
                this.f41371a = 1;
                if (mVar.collect(aVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException
        */
    public /* synthetic */ q(android.content.Context r13, w70.m r14, w70.m r15, int r16, int r17, java.lang.Integer r18, java.lang.Integer r19, java.lang.String r20, java.lang.String r21, int r22, kotlin.jvm.internal.DefaultConstructorMarker r23) {
        /*
            r12 = this;
            r0 = r22
            r1 = r0 & 8
            if (r1 == 0) goto Lc
            int r1 = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.theme.b.a(r13)
            r6 = r1
            goto Le
        Lc:
            r6 = r16
        Le:
            r1 = r0 & 16
            if (r1 == 0) goto L16
            r1 = 81
            r7 = r1
            goto L18
        L16:
            r7 = r17
        L18:
            r1 = r0 & 32
            r2 = 0
            if (r1 == 0) goto L1f
            r8 = r2
            goto L21
        L1f:
            r8 = r18
        L21:
            r1 = r0 & 64
            if (r1 == 0) goto L27
            r9 = r2
            goto L29
        L27:
            r9 = r19
        L29:
            r1 = r0 & 128(0x80, float:1.8E-43)
            if (r1 == 0) goto L2f
            r10 = r2
            goto L31
        L2f:
            r10 = r20
        L31:
            r0 = r0 & 256(0x100, float:3.59E-43)
            if (r0 == 0) goto L3b
            r11 = r2
            r3 = r13
            r4 = r14
            r5 = r15
            r2 = r12
            goto L41
        L3b:
            r11 = r21
            r2 = r12
            r3 = r13
            r4 = r14
            r5 = r15
        L41:
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.q.<init>(android.content.Context, w70.m, w70.m, int, int, java.lang.Integer, java.lang.Integer, java.lang.String, java.lang.String, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    @Nullable
    public final Function1<Boolean, Unit> getOnShouldPlay() {
        return this.f41360d;
    }

    @Nullable
    public final Function0<Unit> getOnShouldReplay() {
        return this.f41361e;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        y70.d dVarA = t70.k0.a(CoroutineContext.Element.DefaultImpls.d(t70.m0.c(), n));
        this.f41367k = dVarA;
        t70.m0.t(dVarA, null, null, new c(null), 3);
        t70.m0.t(dVarA, null, null, new d(null), 3);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        t70.j0 j0Var = this.f41367k;
        if (j0Var != null) {
            t70.k0.c(j0Var, null);
        }
        this.f41367k = null;
    }

    public final void setOnShouldPlay(@Nullable Function1<? super Boolean, Unit> function1) {
        this.f41360d = function1;
    }

    public final void setOnShouldReplay(@Nullable Function0<Unit> function0) {
        this.f41361e = function0;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(@NotNull Context context, @NotNull w70.m isPlaying, @NotNull w70.m progress, int i5, int i11, @Nullable Integer num, @Nullable Integer num2, @Nullable String str, @Nullable String str2) throws Resources.NotFoundException {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(isPlaying, "isPlaying");
        Intrinsics.g(progress, "progress");
        this.f41357a = isPlaying;
        this.f41358b = progress;
        this.f41359c = i11;
        this.f41364h = getResources().getInteger(R.integer.moloco_playback_control_fade_duration_ms);
        this.f41366j = i.b.f41679b;
        setLayoutParams(new FrameLayout.LayoutParams(-1, -2, i11));
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.moloco_playback_control_padding);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.moloco_playback_control_horizontal_padding);
        boolean z11 = (num == null || num2 == null) ? false : true;
        if (z11) {
            Intrinsics.d(num);
            this.f41362f = a(num.intValue(), i5, str);
            Intrinsics.d(num2);
            this.f41363g = a(num2.intValue(), i5, str);
        } else {
            this.f41362f = a(R.string.moloco_playback_control_play, i5, dimensionPixelSize2, dimensionPixelSize);
            this.f41363g = a(R.string.moloco_playback_control_pause, i5, dimensionPixelSize2, dimensionPixelSize);
        }
        this.f41363g.setAlpha(0.0f);
        addView(this.f41362f, a(z11, this, dimensionPixelSize));
        addView(this.f41363g, a(z11, this, dimensionPixelSize));
        if (str2 != null) {
            setContentDescription(str2);
            setTag(str2);
        }
    }

    public final void b() {
        if (this.f41366j instanceof i.a) {
            Function0<Unit> function0 = this.f41361e;
            if (function0 != null) {
                function0.invoke();
                return;
            }
            return;
        }
        Function1<? super Boolean, Unit> function1 = this.f41360d;
        if (function1 != null) {
            function1.invoke(Boolean.valueOf(!this.f41365i));
        }
    }

    public static final FrameLayout.LayoutParams a(boolean z11, q qVar, int i5) throws Resources.NotFoundException {
        if (z11) {
            int dimensionPixelSize = qVar.getResources().getDimensionPixelSize(R.dimen.moloco_default_button_size);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(dimensionPixelSize, dimensionPixelSize, 81);
            layoutParams.setMargins(i5, i5, i5, i5);
            return layoutParams;
        }
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-2, -2, 81);
        layoutParams2.setMargins(i5, i5, i5, i5);
        return layoutParams2;
    }

    public final TextView a(int i5, int i11, int i12, int i13) {
        TextView textView = new TextView(getContext());
        textView.setText(textView.getContext().getString(i5));
        textView.setAllCaps(true);
        textView.setTextColor(i11);
        textView.setPadding(i12, i13, i12, i13);
        a(textView);
        textView.setOnClickListener(new ay.k(this, 8));
        return textView;
    }

    public static final void a(q qVar, View view) {
        qVar.b();
    }

    public final ImageView a(int i5, int i11, String str) throws Resources.NotFoundException {
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.moloco_default_button_size);
        Context context = getContext();
        Intrinsics.f(context, "getContext(...)");
        return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.u.a(context, i5, i11, dimensionPixelSize, dimensionPixelSize, false, str, null, new b(this), 32, null);
    }

    public final void a(View view) {
        view.setClickable(true);
        view.setFocusable(true);
        TypedArray typedArrayObtainStyledAttributes = view.getContext().obtainStyledAttributes(new int[]{16843534});
        Intrinsics.f(typedArrayObtainStyledAttributes, "obtainStyledAttributes(...)");
        view.setBackground(typedArrayObtainStyledAttributes.getDrawable(0));
        typedArrayObtainStyledAttributes.recycle();
    }

    public final void a(boolean z11) {
        View view = z11 ? this.f41363g : this.f41362f;
        View view2 = z11 ? this.f41362f : this.f41363g;
        view.bringToFront();
        view.animate().alpha(1.0f).setDuration(this.f41364h).start();
        view2.animate().alpha(0.0f).setDuration(this.f41364h).start();
    }
}
