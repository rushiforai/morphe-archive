package ux;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import t70.t0;

/* loaded from: classes4.dex */
public final class n extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f91632t;

    /* renamed from: u, reason: collision with root package name */
    public int f91633u;

    /* renamed from: v, reason: collision with root package name */
    public int f91634v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ SnapshotStateList f91635w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n(SnapshotStateList snapshotStateList, Continuation continuation, int i5) {
        super(2, continuation);
        this.f91632t = i5;
        this.f91635w = snapshotStateList;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f91632t) {
            case 0:
                return new n(this.f91635w, continuation, 0);
            case 1:
                return new n(this.f91635w, continuation, 1);
            case 2:
                return new n(this.f91635w, continuation, 2);
            default:
                return new n(this.f91635w, continuation, 3);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f91632t) {
        }
        return ((n) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00e2  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x0035 -> B:16:0x0038). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x006d -> B:31:0x0070). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:44:0x00a5 -> B:46:0x00a8). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:59:0x00dd -> B:61:0x00e0). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        int i5;
        int i11;
        int i12;
        int i13;
        switch (this.f91632t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i14 = this.f91634v;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    i5 = 0;
                    if (i5 < 6) {
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    i5 = this.f91633u;
                    ResultKt.b(obj);
                    i5++;
                    if (i5 < 6) {
                        this.f91635w.set(i5, Boolean.TRUE);
                        this.f91633u = i5;
                        this.f91634v = 1;
                        if (t0.b(120L, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        i5++;
                        if (i5 < 6) {
                            return Unit.f71706a;
                        }
                    }
                }
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i15 = this.f91634v;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    i11 = 0;
                    if (i11 < 4) {
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    i11 = this.f91633u;
                    ResultKt.b(obj);
                    i11++;
                    if (i11 < 4) {
                        this.f91635w.set(i11, Boolean.TRUE);
                        this.f91633u = i11;
                        this.f91634v = 1;
                        if (t0.b(120L, this) == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
                        i11++;
                        if (i11 < 4) {
                            return Unit.f71706a;
                        }
                    }
                }
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i16 = this.f91634v;
                if (i16 == 0) {
                    ResultKt.b(obj);
                    i12 = 0;
                    if (i12 < 6) {
                    }
                } else {
                    if (i16 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    i12 = this.f91633u;
                    ResultKt.b(obj);
                    i12++;
                    if (i12 < 6) {
                        this.f91635w.set(i12, Boolean.TRUE);
                        this.f91633u = i12;
                        this.f91634v = 1;
                        if (t0.b(120L, this) == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                        i12++;
                        if (i12 < 6) {
                            return Unit.f71706a;
                        }
                    }
                }
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i17 = this.f91634v;
                if (i17 == 0) {
                    ResultKt.b(obj);
                    i13 = 0;
                    if (i13 < 6) {
                    }
                } else {
                    if (i17 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    i13 = this.f91633u;
                    ResultKt.b(obj);
                    i13++;
                    if (i13 < 6) {
                        this.f91635w.set(i13, Boolean.TRUE);
                        this.f91633u = i13;
                        this.f91634v = 1;
                        if (t0.b(120L, this) == coroutineSingletons4) {
                            return coroutineSingletons4;
                        }
                        i13++;
                        if (i13 < 6) {
                            return Unit.f71706a;
                        }
                    }
                }
        }
    }
}
