package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import androidx.compose.ui.platform.ComposeView;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2972b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.m0;
import w70.g2;
import w70.i2;
import w70.j1;
import w70.m1;
import w70.u1;
import w70.y1;

/* loaded from: classes4.dex */
public abstract class C<T extends e> extends FrameLayout implements k, InterfaceC2972b, InterfaceC2971a, l {

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final a f38336g = new a(null);

    /* renamed from: h, reason: collision with root package name */
    public static final int f38337h = 8;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final String f38338i = "XenossBannerView";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final j0 f38339a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public T f38340b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public View f38341c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Lazy f38342d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final m1 f38343e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Lazy f38344f;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.XenossBannerView$isAdDisplaying$2$1", f = "XenossBannerView.kt", l = {}, m = "invokeSuspend")
    public static final class b extends SuspendLambda implements Function3<Boolean, Boolean, Continuation<? super Boolean>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38345a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ boolean f38346b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ boolean f38347c;

        public b(Continuation<? super b> continuation) {
            super(3, continuation);
        }

        public final Object a(boolean z11, boolean z12, Continuation<? super Boolean> continuation) {
            b bVar = new b(continuation);
            bVar.f38346b = z11;
            bVar.f38347c = z12;
            return bVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.jvm.functions.Function3
        public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2, Object obj3) {
            return a(((Boolean) obj).booleanValue(), ((Boolean) obj2).booleanValue(), (Continuation) obj3);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f38345a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Boolean.valueOf(this.f38346b && this.f38347c);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.XenossBannerView$load$1", f = "XenossBannerView.kt", l = {70}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38348a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C<T> f38349b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ long f38350c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ InterfaceC2972b.a f38351d;

        @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.XenossBannerView$load$1$1", f = "XenossBannerView.kt", l = {}, m = "invokeSuspend")
        public static final class a extends SuspendLambda implements Function2<Boolean, Continuation<? super Boolean>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f38352a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ boolean f38353b;

            public a(Continuation<? super a> continuation) {
                super(2, continuation);
            }

            public final Object a(boolean z11, Continuation<? super Boolean> continuation) {
                return ((a) create(Boolean.valueOf(z11), continuation)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                a aVar = new a(continuation);
                aVar.f38353b = ((Boolean) obj).booleanValue();
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
                return a(((Boolean) obj).booleanValue(), (Continuation) obj2);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Object invokeSuspend(Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                if (this.f38352a != 0) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Boolean.valueOf(this.f38353b);
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(C<T> c11, long j11, InterfaceC2972b.a aVar, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f38349b = c11;
            this.f38350c = j11;
            this.f38351d = aVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new c(this.f38349b, this.f38350c, this.f38351d, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f38348a;
            if (i5 == 0) {
                ResultKt.b(obj);
                this.f38349b.getAdLoader().a(this.f38350c, this.f38351d);
                g2 g2VarIsLoaded = this.f38349b.isLoaded();
                a aVar = new a(null);
                this.f38348a = 1;
                if (u1.p(g2VarIsLoaded, aVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            this.f38349b.k();
            return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C(@NotNull Context context, @NotNull j0 scope) {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(scope, "scope");
        this.f38339a = scope;
        final int i5 = 0;
        this.f38342d = LazyKt.a(new Function0(this) { // from class: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.a0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ C f38355b;

            {
                this.f38355b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        return C.b(this.f38355b);
                    default:
                        return C.a(this.f38355b);
                }
            }
        });
        this.f38343e = u1.c(Boolean.FALSE);
        final int i11 = 1;
        this.f38344f = LazyKt.a(new Function0(this) { // from class: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.a0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ C f38355b;

            {
                this.f38355b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return C.b(this.f38355b);
                    default:
                        return C.a(this.f38355b);
                }
            }
        });
    }

    public static final g2 b(C c11) {
        return c11.getAdLoader().isLoaded();
    }

    public static /* synthetic */ void getAdView$annotations() {
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2972b
    public void a(long j11, @Nullable InterfaceC2972b.a aVar) {
        m0.t(this.f38339a, null, null, new c(this, j11, aVar, null), 3);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l
    public void destroy() {
        k0.c(this.f38339a, null);
        setAdView(null);
        ViewParent parent = getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeView(this);
        }
    }

    @NotNull
    public abstract InterfaceC2972b getAdLoader();

    @Nullable
    public T getAdShowListener() {
        return this.f38340b;
    }

    @Nullable
    public final View getAdView() {
        return this.f38341c;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2972b
    @NotNull
    public g2 isLoaded() {
        return (g2) this.f38342d.getValue();
    }

    public abstract void k();

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.InterfaceC2971a
    @NotNull
    public g2 l() {
        return (g2) this.f38344f.getValue();
    }

    @Override // android.view.View
    public void onVisibilityChanged(@NotNull View changedView, int i5) {
        Intrinsics.g(changedView, "changedView");
        super.onVisibilityChanged(changedView, i5);
        m1 m1Var = this.f38343e;
        Boolean boolValueOf = Boolean.valueOf(i5 == 0);
        i2 i2Var = (i2) m1Var;
        i2Var.getClass();
        i2Var.k(null, boolValueOf);
    }

    public void setAdShowListener(@Nullable T t6) {
        this.f38340b = t6;
    }

    public final void setAdView(@Nullable View view) {
        View view2 = this.f38341c;
        this.f38341c = view;
        removeAllViews();
        try {
            ComposeView composeView = view2 instanceof ComposeView ? (ComposeView) view2 : null;
            if (composeView != null) {
                composeView.disposeComposition();
            }
        } catch (ClassNotFoundException e3) {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, f38338i, "Compose not available, skipping ComposeView disposeComposition", e3, false, 8, null);
        } catch (NoClassDefFoundError e11) {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, f38338i, "Compose not available, skipping ComposeView disposeComposition", e11, false, 8, null);
        }
        if (view != null) {
            addView(view, new ViewGroup.LayoutParams(-1, -1));
        }
    }

    public static final g2 a(C c11) {
        return u1.z(new j1(c11.isLoaded(), c11.f38343e, new b(null)), c11.f38339a, y1.f94086a, Boolean.FALSE);
    }
}
