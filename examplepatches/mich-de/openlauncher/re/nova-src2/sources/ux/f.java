package ux;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import t70.t0;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f91610t;

    /* renamed from: u, reason: collision with root package name */
    public int f91611u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ List f91612v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ boolean f91613w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ int f91614x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ SnapshotStateList f91615y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(List list, boolean z11, int i5, SnapshotStateList snapshotStateList, Continuation continuation) {
        super(2, continuation);
        this.f91612v = list;
        this.f91613w = z11;
        this.f91614x = i5;
        this.f91615y = snapshotStateList;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new f(this.f91612v, this.f91613w, this.f91614x, this.f91615y, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((f) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0036  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0031 -> B:14:0x0034). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        int i5;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = this.f91611u;
        if (i11 == 0) {
            ResultKt.b(obj);
            i5 = 0;
            if (i5 < this.f91614x) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = this.f91610t;
            ResultKt.b(obj);
            i5++;
            if (i5 < this.f91614x) {
                this.f91615y.set(i5, Boolean.TRUE);
                this.f91610t = i5;
                this.f91611u = 1;
                if (t0.b(100L, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                i5++;
                if (i5 < this.f91614x) {
                    return Unit.f71706a;
                }
            }
        }
    }
}
