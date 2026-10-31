package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.sync.LocalUserManager$replacement$2", f = "PackageSyncManager.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class V8 extends SuspendLambda implements Function2<t70.j0, Continuation<? super List<Long>>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ S8 f63507a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public V8(S8 s82, Continuation<? super V8> continuation) {
        super(2, continuation);
        this.f63507a = s82;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new V8(this.f63507a, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new V8(this.f63507a, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        String string = this.f63507a.f63343a.getString("syncing_users", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.d(string);
        List listI1 = r70.k.i1(string, new String[]{":"}, 6);
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : listI1) {
            if (!Intrinsics.b((String) obj2, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
                arrayList.add(obj2);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(new Long(Long.parseLong((String) it.next())));
        }
        return b70.g.K1(arrayList2);
    }
}
