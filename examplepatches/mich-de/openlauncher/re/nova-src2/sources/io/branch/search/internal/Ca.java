package io.branch.search.internal;

import android.os.UserHandle;
import io.branch.search.internal.C3250la;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onPackageChanged$fn$1", f = "PackageSyncManager.kt", l = {509}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Ca extends SuspendLambda implements Function2<C3250la.b, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f62307a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f62308b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f62309c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ UserHandle f62310d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ List<C3443x0> f62311e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ List<C3460y0> f62312f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ca(String str, UserHandle userHandle, List<C3443x0> list, List<C3460y0> list2, Continuation<? super Ca> continuation) {
        super(2, continuation);
        this.f62309c = str;
        this.f62310d = userHandle;
        this.f62311e = list;
        this.f62312f = list2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        Ca ca2 = new Ca(this.f62309c, this.f62310d, this.f62311e, this.f62312f, continuation);
        ca2.f62308b = obj;
        return ca2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((Ca) create((C3250la.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62307a;
        if (i5 == 0) {
            ResultKt.b(obj);
            C3250la.b bVar = (C3250la.b) this.f62308b;
            String str = this.f62309c;
            UserHandle userHandle = this.f62310d;
            List<C3443x0> list = this.f62311e;
            List<C3460y0> list2 = this.f62312f;
            this.f62307a = 1;
            if (bVar.b(str, userHandle, list, list2, this) == coroutineSingletons) {
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
