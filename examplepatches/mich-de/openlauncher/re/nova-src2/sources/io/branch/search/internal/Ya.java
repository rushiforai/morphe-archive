package io.branch.search.internal;

import android.content.Context;
import io.branch.search.internal.AbstractC3196i6;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Ya implements InterfaceC3490zd<Wa> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63753a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Gb f63754b;

    public Ya(@NotNull Context applicationContext, @NotNull Gb remotePingDataSource) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(remotePingDataSource, "remotePingDataSource");
        this.f63753a = applicationContext;
        this.f63754b = remotePingDataSource;
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final Boolean a(F4 f42, Cd cd2, Exception exc) {
        C3309p1.a(EnumC3131e9.ScheduledJobRuns, "PingService: " + exc.getLocalizedMessage(), exc);
        return Boolean.TRUE;
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final Object a(F4 f42, Cd cd2, Continuation continuation) {
        return a(this, (Wa) cd2, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(Ya ya2, Wa wa2, Continuation continuation) {
        Xa xa2;
        if (continuation instanceof Xa) {
            xa2 = (Xa) continuation;
            int i5 = xa2.f63671c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xa2.f63671c = i5 - Integer.MIN_VALUE;
            } else {
                xa2 = new Xa(ya2, continuation);
            }
        }
        Object objA = xa2.f63669a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xa2.f63671c;
        boolean z11 = false;
        try {
            if (i11 == 0) {
                ResultKt.b(objA);
                String str = wa2.f63595d;
                if (str == null) {
                    return Boolean.FALSE;
                }
                EnumC3131e9 enumC3131e9 = EnumC3131e9.ScheduledJobRuns;
                StringBuilder sb2 = new StringBuilder("Starting PingService on ");
                new F4(ya2.f63753a);
                sb2.append(F4.c());
                C3309p1.c(enumC3131e9, sb2.toString());
                Gb gb2 = ya2.f63754b;
                xa2.f63671c = 1;
                objA = gb2.a(str, xa2);
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
            abstractC3196i6.getClass();
            if (abstractC3196i6 instanceof AbstractC3196i6.b) {
                z11 = true;
            } else if (!(abstractC3196i6 instanceof AbstractC3196i6.a)) {
                throw new NoWhenBranchMatchedException();
            }
            z11 = !z11;
        } catch (Exception e3) {
            EnumC3131e9 enumC3131e92 = EnumC3131e9.ScheduledJobRuns;
            String localizedMessage = e3.getLocalizedMessage();
            if (localizedMessage == null) {
                localizedMessage = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40331e;
            }
            C3309p1.a(enumC3131e92, localizedMessage, e3);
        }
        return Boolean.valueOf(z11);
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final void a(F4 contextDelegate, Cd cd2) {
        Wa request = (Wa) cd2;
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(request, "request");
    }
}
