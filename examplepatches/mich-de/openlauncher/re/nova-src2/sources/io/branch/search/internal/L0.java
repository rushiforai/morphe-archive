package io.branch.search.internal;

import android.app.usage.UsageEvents;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
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

@DebugMetadata(c = "io.branch.search.internal.local.appUsage.AppUsageReader$batchedUsageEvents$1", f = "AppUsageReader.kt", l = {71}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class L0 extends RestrictedSuspendLambda implements Function2<SequenceScope<? super G0>, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public long f62806a;

    /* renamed from: b, reason: collision with root package name */
    public int f62807b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f62808c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f62809d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ long f62810e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ long f62811f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ K0 f62812g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public L0(long j11, long j12, long j13, K0 k02, Continuation<? super L0> continuation) {
        super(2, continuation);
        this.f62809d = j11;
        this.f62810e = j12;
        this.f62811f = j13;
        this.f62812g = k02;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        L0 l02 = new L0(this.f62809d, this.f62810e, this.f62811f, this.f62812g, continuation);
        l02.f62808c = obj;
        return l02;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((L0) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        SequenceScope sequenceScope;
        long j11;
        Object objD;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f62807b;
        if (i5 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.f62808c;
            j11 = this.f62809d;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = this.f62806a;
            sequenceScope = (SequenceScope) this.f62808c;
            ResultKt.b(obj);
        }
        while (true) {
            long j12 = this.f62810e;
            if (j11 >= j12) {
                return Unit.f71706a;
            }
            long jMin = Math.min(this.f62811f + j11, j12);
            C3255lf c3255lf = this.f62812g.f62768a;
            UsageEvents usageEventsQueryEvents = c3255lf.f65068a.queryEvents(j11, jMin);
            C3221jf c3221jf = usageEventsQueryEvents != null ? (C3221jf) c3255lf.f65069b.invoke(usageEventsQueryEvents) : null;
            if (c3221jf != null) {
                Set<Integer> set = this.f62812g.f62769b;
                ArrayList arrayList = new ArrayList();
                while (c3221jf.f64904a.hasNextEvent()) {
                    UsageEvents.Event event = new UsageEvents.Event();
                    c3221jf.f64904a.getNextEvent(event);
                    if (set.contains(Integer.valueOf(event.getEventType()))) {
                        arrayList.add(event);
                    }
                }
                ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    UsageEvents.Event event2 = (UsageEvents.Event) it.next();
                    String packageName = event2.getPackageName();
                    Intrinsics.f(packageName, "it.packageName");
                    arrayList2.add(new G0(event2.getTimeStamp(), event2.getEventType(), packageName, event2.getClassName()));
                }
                this.f62808c = sequenceScope;
                this.f62806a = jMin;
                this.f62807b = 1;
                sequenceScope.getClass();
                if (arrayList2.isEmpty() || (objD = sequenceScope.d(arrayList2.iterator(), this)) != CoroutineSingletons.f71806a) {
                    objD = Unit.f71706a;
                }
                if (objD == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            j11 = jMin;
        }
    }
}
