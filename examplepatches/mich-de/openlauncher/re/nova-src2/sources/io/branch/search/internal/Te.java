package io.branch.search.internal;

import io.branch.search.internal.AbstractC3196i6;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Te {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3366s8 f63391a;

    @DebugMetadata(c = "io.branch.search.internal.data.remote.service.TrackingService", f = "TrackingService.kt", l = {10}, m = "trackImpressionUrl")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f63392a;

        /* renamed from: c, reason: collision with root package name */
        public int f63394c;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63392a = obj;
            this.f63394c |= Integer.MIN_VALUE;
            return Te.this.a(null, null, this);
        }
    }

    public Te(@NotNull C3366s8 kNetworkInterfaceImpl) {
        Intrinsics.g(kNetworkInterfaceImpl, "kNetworkInterfaceImpl");
        this.f63391a = kNetworkInterfaceImpl;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull String str2, @NotNull Continuation<? super J2> continuation) {
        a aVar;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f63394c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f63394c = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        a aVar2 = aVar;
        Object objA = aVar2.f63392a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f63394c;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3366s8 c3366s8 = this.f63391a;
            EnumC3075b4 enumC3075b4 = EnumC3075b4.f63995m;
            aVar2.f63394c = 1;
            objA = c3366s8.a(str, enumC3075b4, str2, null, null, aVar2);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        AbstractC3196i6 abstractC3196i6 = (AbstractC3196i6) objA;
        if (abstractC3196i6 instanceof AbstractC3196i6.b) {
            return null;
        }
        if (abstractC3196i6 instanceof AbstractC3196i6.a) {
            return (J2) ((AbstractC3196i6.a) abstractC3196i6).f64738a;
        }
        throw new NoWhenBranchMatchedException();
    }
}
