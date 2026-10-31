package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class W0 implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w70.m f63551a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ U0 f63552b;

    public static final class a<T> implements w70.n {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ w70.n f63553a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ U0 f63554b;

        @DebugMetadata(c = "io.branch.search.internal.util.AtMaxTimeoutMethodDebouncer$special$$inlined$map$1$2", f = "Coros.kt", l = {Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE}, m = "emit")
        /* renamed from: io.branch.search.internal.W0$a$a, reason: collision with other inner class name */
        public static final class C0328a extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public /* synthetic */ Object f63555a;

            /* renamed from: b, reason: collision with root package name */
            public int f63556b;

            public C0328a(Continuation continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f63555a = obj;
                this.f63556b |= Integer.MIN_VALUE;
                return a.this.emit(null, this);
            }
        }

        public a(w70.n nVar, U0 u02) {
            this.f63553a = nVar;
            this.f63554b = u02;
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Override // w70.n
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object emit(Object obj, @NotNull Continuation continuation) {
            C0328a c0328a;
            if (continuation instanceof C0328a) {
                c0328a = (C0328a) continuation;
                int i5 = c0328a.f63556b;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    c0328a.f63556b = i5 - Integer.MIN_VALUE;
                } else {
                    c0328a = new C0328a(continuation);
                }
            }
            Object obj2 = c0328a.f63555a;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = c0328a.f63556b;
            if (i11 == 0) {
                ResultKt.b(obj2);
                w70.n nVar = this.f63553a;
                ((Function0) obj).invoke();
                U0 u02 = this.f63554b;
                u02.f63406d = ((Number) u02.f63404b.invoke()).longValue();
                Unit unit = Unit.f71706a;
                c0328a.f63556b = 1;
                if (nVar.emit(unit, c0328a) == coroutineSingletons) {
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

    public W0(w70.m mVar, U0 u02) {
        this.f63551a = mVar;
        this.f63552b = u02;
    }

    @Override // w70.m
    @Nullable
    public final Object collect(@NotNull w70.n nVar, @NotNull Continuation continuation) {
        Object objCollect = this.f63551a.collect(new a(nVar, this.f63552b), continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }
}
