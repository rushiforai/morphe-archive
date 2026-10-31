package io.branch.search.internal;

import io.branch.search.internal.services.stub.android.AndroidCacheUpdateService;
import java.util.Objects;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class M3 implements InterfaceC3490zd<C3465y5> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Function1<Continuation<? super C3411v2>, Object> f62888a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3206j0 f62889b;

    /* JADX WARN: Multi-variable type inference failed */
    public M3(@NotNull Function1<? super Continuation<? super C3411v2>, ? extends Object> getClient) {
        Intrinsics.g(getClient, "getClient");
        this.f62888a = getClient;
        this.f62889b = new C3206j0();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x002f  */
    @Override // io.branch.search.internal.InterfaceC3490zd
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Boolean a(F4 context, Cd cd2, Exception exc) {
        String strJ;
        Intrinsics.g(context, "context");
        Y1 y12 = (Y1) t70.m0.u(EmptyCoroutineContext.f71803a, new E6(context, 15000L, null));
        if (y12 != null) {
            y12.a(this.f62889b);
            strJ = this.f62889b.a().b("io.branch.search");
            if (strJ == null) {
                strJ = b.c0.j("randomUUID().toString()");
            }
        }
        C3296o5.a(strJ, exc, "CacheUpdateService.onStartJob");
        return Boolean.FALSE;
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final Object a(F4 f42, Cd cd2, Continuation continuation) {
        return a(this, f42, continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x009f, code lost:
    
        if (r11 == r1) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(M3 m32, F4 context, Continuation continuation) throws Throwable {
        K3 k32;
        if (continuation instanceof K3) {
            k32 = (K3) continuation;
            int i5 = k32.f62776e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k32.f62776e = i5 - Integer.MIN_VALUE;
            } else {
                k32 = new K3(m32, continuation);
            }
        }
        Object objInvoke = k32.f62774c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k32.f62776e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            Function1<Continuation<? super C3411v2>, Object> function1 = m32.f62888a;
            k32.f62772a = m32;
            k32.f62773b = context;
            k32.f62776e = 1;
            objInvoke = function1.invoke(k32);
            if (objInvoke != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objInvoke);
            C3309p1.a("CacheUpdateService.onStartJob", new L3((O3) objInvoke));
            z11 = false;
            return Boolean.valueOf(z11);
        }
        context = k32.f62773b;
        m32 = k32.f62772a;
        ResultKt.b(objInvoke);
        C3411v2 c3411v2 = (C3411v2) objInvoke;
        if (c3411v2 != null) {
            InterfaceC3227k4 interfaceC3227k4 = c3411v2.f66083b;
            Zf zf2 = interfaceC3227k4 instanceof Zf ? (Zf) interfaceC3227k4 : null;
            if (zf2 == null) {
                C3309p1 c3309p1 = C3309p1.f65465a;
                C3309p1.a(a50.b.f402c, AndroidCacheUpdateService.TAG, "Failed to retrieve cache request executor", (Throwable) null);
                return Boolean.FALSE;
            }
            if (c3411v2.f66084c) {
                Intrinsics.g(context, "context");
                Y1 y12 = (Y1) t70.m0.u(EmptyCoroutineContext.f71803a, new E6(context, 15000L, null));
                if (y12 != null) {
                    y12.a(m32);
                }
                if (y12 != null) {
                    Pf pf2 = zf2.f63858b;
                    k32.f62772a = null;
                    k32.f62773b = null;
                    k32.f62776e = 2;
                    objInvoke = t70.m0.y(pf2.f63105f, new Tf(pf2, null), k32);
                }
                return Boolean.valueOf(z11);
            }
            throw new IllegalStateException("Cache update should not be performed.");
        }
        throw new IllegalStateException("BranchNavigatorClient not available.");
    }

    @Override // io.branch.search.internal.InterfaceC3490zd
    public final void a(F4 contextDelegate, Cd cd2) {
        C3465y5 request = (C3465y5) cd2;
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(request, "request");
        Objects.toString(request);
    }
}
