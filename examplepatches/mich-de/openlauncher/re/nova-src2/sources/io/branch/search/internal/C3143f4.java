package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.internal.Rb;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.retry.ClickTracker$addClick$1", f = "ClickTracker.kt", l = {Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.f4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3143f4 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f64467a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3160g4 f64468b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f64469c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f64470d;

    /* renamed from: io.branch.search.internal.f4$a */
    public static final class a extends Lambda implements Function0<Unit> {

        /* renamed from: a, reason: collision with root package name */
        public static final a f64471a = new a();

        public a() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final /* bridge */ /* synthetic */ Object invoke() {
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.f4$b */
    public static final class b extends Lambda implements Function0<Unit> {

        /* renamed from: a, reason: collision with root package name */
        public static final b f64472a = new b();

        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final /* bridge */ /* synthetic */ Object invoke() {
            return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3143f4(C3160g4 c3160g4, String str, String str2, Continuation<? super C3143f4> continuation) {
        super(2, continuation);
        this.f64468b = c3160g4;
        this.f64469c = str;
        this.f64470d = str2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3143f4(this.f64468b, this.f64469c, this.f64470d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3143f4) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64467a;
        if (i5 == 0) {
            ResultKt.b(obj);
            C3160g4 c3160g4 = this.f64468b;
            InterfaceC3092c4 interfaceC3092c4 = c3160g4.f64564c;
            String str = this.f64469c;
            Rb.a aVar = new Rb.a(0L, ((Number) c3160g4.f64566e.invoke()).longValue(), Wb.NEW, this.f64470d, 0, 0);
            a aVar2 = a.f64471a;
            b bVar = b.f64472a;
            this.f64467a = 1;
            if (interfaceC3092c4.a(str, aVar, aVar2, bVar, this) == coroutineSingletons) {
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
