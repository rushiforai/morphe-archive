package io.branch.search.internal;

import android.app.usage.UsageStats;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.SequenceScope;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.local.appUsage.AppUsageReader$usageStatsAllTime$1", f = "AppUsageReader.kt", l = {52}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class M0 extends RestrictedSuspendLambda implements Function2<SequenceScope<? super P0>, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public Iterator f62857a;

    /* renamed from: b, reason: collision with root package name */
    public int f62858b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f62859c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ K0 f62860d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public M0(K0 k02, Continuation<? super M0> continuation) {
        super(2, continuation);
        this.f62860d = k02;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        M0 m02 = new M0(this.f62860d, continuation);
        m02.f62859c = obj;
        return m02;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        M0 m02 = new M0(this.f62860d, (Continuation) obj2);
        m02.f62859c = (SequenceScope) obj;
        return m02.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        SequenceScope sequenceScope;
        Iterator it;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62858b;
        if (i5 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.f62859c;
            List<UsageStats> listQueryUsageStats = this.f62860d.f62768a.f65068a.queryUsageStats(3, 0L, Long.MAX_VALUE);
            if (listQueryUsageStats == null) {
                return Unit.f71706a;
            }
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (UsageStats usageStats : listQueryUsageStats) {
                if (usageStats.getTotalTimeInForeground() != 0 || usageStats.getLastTimeUsed() != 0) {
                    UsageStats usageStats2 = (UsageStats) linkedHashMap.get(usageStats.getPackageName());
                    if (usageStats2 == null) {
                        String packageName = usageStats.getPackageName();
                        Intrinsics.f(packageName, "it.packageName");
                        linkedHashMap.put(packageName, usageStats);
                    } else {
                        usageStats2.add(usageStats);
                    }
                }
            }
            it = linkedHashMap.values().iterator();
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = this.f62857a;
            sequenceScope = (SequenceScope) this.f62859c;
            ResultKt.b(obj);
        }
        if (!it.hasNext()) {
            return Unit.f71706a;
        }
        UsageStats usageStats3 = (UsageStats) it.next();
        String packageName2 = usageStats3.getPackageName();
        Intrinsics.f(packageName2, "it.packageName");
        P0 p02 = new P0(usageStats3.getTotalTimeInForeground(), usageStats3.getLastTimeUsed(), packageName2);
        this.f62859c = sequenceScope;
        this.f62857a = it;
        this.f62858b = 1;
        sequenceScope.c(p02, this);
        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        return coroutineSingletons;
    }
}
