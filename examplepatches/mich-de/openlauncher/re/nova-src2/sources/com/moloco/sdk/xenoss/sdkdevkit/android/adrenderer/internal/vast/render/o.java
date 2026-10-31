package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import w70.g2;
import w70.i2;
import w70.m1;
import w70.u1;
import w70.y1;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class o implements n {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final y f41859a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f41860b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a f41861c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r f41862d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final Function0<Unit> f41863e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Function0<Unit> f41864f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final m1 f41865g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final g2 f41866h;

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.VastPrivacyIconImpl$1", f = "VastPrivacyIcon.kt", l = {67}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f41867a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Context f41869c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ Integer f41870d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Integer f41871e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Context context, Integer num, Integer num2, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f41869c = context;
            this.f41870d = num;
            this.f41871e = num2;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return o.this.new a(this.f41869c, this.f41870d, this.f41871e, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            Object objA;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f41867a;
            k kVar = null;
            try {
            } catch (Exception unused) {
                if (kVar != null) {
                    kVar.destroy();
                }
                o.this.destroy();
            }
            if (i5 == 0) {
                ResultKt.b(obj);
                y yVar = o.this.f41859a;
                if (yVar != null) {
                    Context context = this.f41869c;
                    com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a aVar = o.this.f41861c;
                    com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar = o.this.f41862d;
                    Integer num = this.f41870d;
                    int iIntValue = num != null ? num.intValue() : 0;
                    Integer num2 = this.f41871e;
                    int iIntValue2 = num2 != null ? num2.intValue() : 0;
                    x xVar = new x(19);
                    com.instabridge.mobilesdk.internal.data.api.a aVar2 = new com.instabridge.mobilesdk.internal.data.api.a(27);
                    this.f41867a = 1;
                    objA = l.a(yVar, context, aVar, rVar, iIntValue, iIntValue2, xVar, aVar2, (384 & 128) != 0 ? false : false, (384 & 256) != 0 ? null : null, this);
                    if (objA == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                ((i2) o.this.f41865g).j(kVar);
                return Unit.f71706a;
            }
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objA = obj;
            kVar = (k) objA;
            ((i2) o.this.f41865g).j(kVar);
            return Unit.f71706a;
        }

        public static final Unit a() {
            return Unit.f71706a;
        }

        public static final Unit a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVar) {
            return Unit.f71706a;
        }
    }

    @SourceDebugExtension
    public static final class b implements w70.m {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ w70.m f41872a;

        @SourceDebugExtension
        public static final class a<T> implements w70.n {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ w70.n f41873a;

            @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.VastPrivacyIconImpl$special$$inlined$map$1$2", f = "VastPrivacyIcon.kt", l = {50}, m = "emit")
            /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.o$b$a$a, reason: collision with other inner class name */
            public static final class C0289a extends ContinuationImpl {

                /* renamed from: a, reason: collision with root package name */
                public /* synthetic */ Object f41874a;

                /* renamed from: b, reason: collision with root package name */
                public int f41875b;

                /* renamed from: c, reason: collision with root package name */
                public Object f41876c;

                public C0289a(Continuation continuation) {
                    super(continuation);
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Object invokeSuspend(Object obj) {
                    this.f41874a = obj;
                    this.f41875b |= Integer.MIN_VALUE;
                    return a.this.emit(null, this);
                }
            }

            public a(w70.n nVar) {
                this.f41873a = nVar;
            }

            /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
            @Override // w70.n
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object emit(Object obj, Continuation continuation) {
                C0289a c0289a;
                if (continuation instanceof C0289a) {
                    c0289a = (C0289a) continuation;
                    int i5 = c0289a.f41875b;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        c0289a.f41875b = i5 - Integer.MIN_VALUE;
                    } else {
                        c0289a = new C0289a(continuation);
                    }
                }
                Object obj2 = c0289a.f41874a;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = c0289a.f41875b;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    w70.n nVar = this.f41873a;
                    k kVar = (k) obj;
                    j jVarK = kVar != null ? kVar.k() : null;
                    c0289a.f41875b = 1;
                    if (nVar.emit(jVarK, c0289a) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            }
        }

        public b(w70.m mVar) {
            this.f41872a = mVar;
        }

        @Override // w70.m
        public Object collect(w70.n nVar, Continuation continuation) {
            Object objCollect = this.f41872a.collect(new a(nVar), continuation);
            return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
        }
    }

    public o(@Nullable y yVar, @Nullable Integer num, @Nullable Integer num2, @Nullable String str, @NotNull j0 scope, @NotNull Context context, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a customUserEventBuilderService, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r externalLinkHandler, @Nullable Function0<Unit> function0, @Nullable Function0<Unit> function02) {
        Intrinsics.g(scope, "scope");
        Intrinsics.g(context, "context");
        Intrinsics.g(customUserEventBuilderService, "customUserEventBuilderService");
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        this.f41859a = yVar;
        this.f41860b = str;
        this.f41861c = customUserEventBuilderService;
        this.f41862d = externalLinkHandler;
        this.f41863e = function0;
        this.f41864f = function02;
        i2 i2VarC = u1.c(null);
        this.f41865g = i2VarC;
        m0.t(scope, null, null, new a(context, num, num2, null), 3);
        this.f41866h = u1.z(new b(i2VarC), scope, y1.a(3), null);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.n
    @NotNull
    public g2 S() {
        return this.f41866h;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l
    public void destroy() {
        i2 i2Var = (i2) this.f41865g;
        k kVar = (k) i2Var.getValue();
        if (kVar != null) {
            kVar.destroy();
        }
        i2Var.j(null);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.n
    public void i() {
        Function0<Unit> function0 = this.f41864f;
        if (function0 != null) {
            function0.invoke();
        }
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.n
    public void x() {
        String str = this.f41860b;
        if (str != null) {
            Function0<Unit> function0 = this.f41863e;
            if (function0 != null) {
                function0.invoke();
            }
            this.f41862d.a(str);
        }
    }
}
