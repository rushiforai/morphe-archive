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

@DebugMetadata(c = "io.branch.search.internal.sync.PackageSyncManager$onPackageAdded$fn$1", f = "PackageSyncManager.kt", l = {486}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.ya, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3470ya extends SuspendLambda implements Function2<C3250la.b, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f66324a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f66325b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f66326c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ UserHandle f66327d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ List<C3443x0> f66328e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ List<C3460y0> f66329f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3470ya(String str, UserHandle userHandle, List<C3443x0> list, List<C3460y0> list2, Continuation<? super C3470ya> continuation) {
        super(2, continuation);
        this.f66326c = str;
        this.f66327d = userHandle;
        this.f66328e = list;
        this.f66329f = list2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        C3470ya c3470ya = new C3470ya(this.f66326c, this.f66327d, this.f66328e, this.f66329f, continuation);
        c3470ya.f66325b = obj;
        return c3470ya;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3470ya) create((C3250la.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66324a;
        if (i5 == 0) {
            ResultKt.b(obj);
            C3250la.b bVar = (C3250la.b) this.f66325b;
            String str = this.f66326c;
            UserHandle userHandle = this.f66327d;
            List<C3443x0> list = this.f66328e;
            List<C3460y0> list2 = this.f66329f;
            this.f66324a = 1;
            if (bVar.a(str, userHandle, list, list2, this) == coroutineSingletons) {
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
