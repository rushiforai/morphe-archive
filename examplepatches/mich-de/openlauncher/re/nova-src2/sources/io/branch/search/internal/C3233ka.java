package io.branch.search.internal;

import io.branch.search.internal.C3250la;
import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$4", f = "PackageSyncManager.kt", l = {357, 358, 359}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.ka, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3233ka extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public Iterator f64922a;

    /* renamed from: b, reason: collision with root package name */
    public int f64923b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ C3250la f64924c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3233ka(C3250la c3250la, Continuation<? super C3233ka> continuation) {
        super(2, continuation);
        this.f64924c = c3250la;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3233ka(this.f64924c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3233ka(this.f64924c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0046 A[Catch: all -> 0x0016, TryCatch #1 {all -> 0x0016, blocks: (B:8:0x0012, B:29:0x005f, B:31:0x0065, B:15:0x0022, B:23:0x0040, B:25:0x0046, B:28:0x0057, B:16:0x0026, B:22:0x0038, B:19:0x002d), top: B:44:0x0008 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0065 A[Catch: all -> 0x0016, TRY_LEAVE, TryCatch #1 {all -> 0x0016, blocks: (B:8:0x0012, B:29:0x005f, B:31:0x0065, B:15:0x0022, B:23:0x0040, B:25:0x0046, B:28:0x0057, B:16:0x0026, B:22:0x0038, B:19:0x002d), top: B:44:0x0008 }] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) {
        C3250la.a aVar;
        C3250la c3250la;
        Iterator it;
        Iterator it2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64923b;
        try {
        } catch (Throwable th2) {
            try {
                C3309p1.a(EnumC3131e9.PackageSync, "Failure on initial package sync", th2);
                this.f64924c.f64975l = false;
                aVar = C3250la.Companion;
                c3250la = this.f64924c;
            } catch (Throwable th3) {
                this.f64924c.f64975l = false;
                C3250la.a.a(C3250la.Companion, this.f64924c.f64964a);
                throw th3;
            }
        }
        if (i5 == 0) {
            ResultKt.b(obj);
            C3250la c3250la2 = this.f64924c;
            this.f64923b = 1;
            if (C3250la.b(c3250la2, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                if (i5 != 2) {
                    if (i5 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    it2 = this.f64922a;
                    ResultKt.b(obj);
                    while (it2.hasNext()) {
                        C3250la.d dVar = (C3250la.d) it2.next();
                        this.f64922a = it2;
                        this.f64923b = 3;
                        if (dVar.a(this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                    this.f64924c.f64975l = false;
                    aVar = C3250la.Companion;
                    c3250la = this.f64924c;
                    C3250la.a.a(aVar, c3250la.f64964a);
                    return Unit.f71706a;
                }
                it = this.f64922a;
                ResultKt.b(obj);
                while (it.hasNext()) {
                    C3250la.b bVar = (C3250la.b) it.next();
                    this.f64922a = it;
                    this.f64923b = 2;
                    if (bVar.a(this) == coroutineSingletons) {
                        break;
                    }
                }
                it2 = this.f64924c.f64971h.iterator();
                while (it2.hasNext()) {
                }
                this.f64924c.f64975l = false;
                aVar = C3250la.Companion;
                c3250la = this.f64924c;
                C3250la.a.a(aVar, c3250la.f64964a);
                return Unit.f71706a;
            }
            ResultKt.b(obj);
        }
        it = this.f64924c.f64970g.iterator();
        while (it.hasNext()) {
        }
        it2 = this.f64924c.f64971h.iterator();
        while (it2.hasNext()) {
        }
        this.f64924c.f64975l = false;
        aVar = C3250la.Companion;
        c3250la = this.f64924c;
        C3250la.a.a(aVar, c3250la.f64964a);
        return Unit.f71706a;
    }
}
