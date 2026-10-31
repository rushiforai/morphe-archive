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
public final class S9 implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w70.m f63344a;

    public static final class a<T> implements w70.n {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ w70.n f63345a;

        @DebugMetadata(c = "io.branch.search.internal.util.OnlyLatestMethodDebouncer$special$$inlined$map$1$2", f = "Coros.kt", l = {Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE}, m = "emit")
        /* renamed from: io.branch.search.internal.S9$a$a, reason: collision with other inner class name */
        public static final class C0327a extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public /* synthetic */ Object f63346a;

            /* renamed from: b, reason: collision with root package name */
            public int f63347b;

            public C0327a(Continuation continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f63346a = obj;
                this.f63347b |= Integer.MIN_VALUE;
                return a.this.emit(null, this);
            }
        }

        public a(w70.n nVar) {
            this.f63345a = nVar;
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Override // w70.n
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object emit(Object obj, @NotNull Continuation continuation) {
            C0327a c0327a;
            if (continuation instanceof C0327a) {
                c0327a = (C0327a) continuation;
                int i5 = c0327a.f63347b;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    c0327a.f63347b = i5 - Integer.MIN_VALUE;
                } else {
                    c0327a = new C0327a(continuation);
                }
            }
            Object obj2 = c0327a.f63346a;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = c0327a.f63347b;
            if (i11 == 0) {
                ResultKt.b(obj2);
                w70.n nVar = this.f63345a;
                ((Function0) obj).invoke();
                Unit unit = Unit.f71706a;
                c0327a.f63347b = 1;
                if (nVar.emit(unit, c0327a) == coroutineSingletons) {
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

    public S9(w70.m mVar) {
        this.f63344a = mVar;
    }

    @Override // w70.m
    @Nullable
    public final Object collect(@NotNull w70.n nVar, @NotNull Continuation continuation) {
        Object objCollect = this.f63344a.collect(new a(nVar), continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }
}
