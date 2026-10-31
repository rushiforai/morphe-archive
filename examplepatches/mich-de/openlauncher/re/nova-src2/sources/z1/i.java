package z1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;

/* loaded from: classes2.dex */
public final class i extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public long[] f97930t;

    /* renamed from: u, reason: collision with root package name */
    public int f97931u;

    /* renamed from: v, reason: collision with root package name */
    public int f97932v;

    /* renamed from: w, reason: collision with root package name */
    public int f97933w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f97934x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ j f97935y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, Continuation continuation) {
        super(2, continuation);
        this.f97935y = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        i iVar = new i(this.f97935y, continuation);
        iVar.f97934x = obj;
        return iVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((i) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00a6  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0083 -> B:26:0x009a). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x00c5 -> B:37:0x00c6). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        long[] jArr;
        int length;
        int i5;
        SequenceScope sequenceScope2;
        int i11;
        SequenceScope sequenceScope3;
        int i12;
        j jVar = this.f97935y;
        long j11 = jVar.f97937a;
        long j12 = jVar.f97939c;
        long j13 = jVar.f97938b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = this.f97933w;
        if (i13 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.f97934x;
            jArr = jVar.f97940d;
            if (jArr != null) {
                length = jArr.length;
                i5 = 0;
            }
            if (j13 != 0) {
                sequenceScope2 = sequenceScope;
                i11 = 0;
                if (i11 >= 64) {
                }
            }
            if (j11 != 0) {
            }
            return Unit.f71706a;
        }
        if (i13 == 1) {
            length = this.f97932v;
            int i14 = this.f97931u;
            jArr = this.f97930t;
            sequenceScope = (SequenceScope) this.f97934x;
            ResultKt.b(obj);
            i5 = i14 + 1;
        } else {
            if (i13 != 2) {
                if (i13 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i12 = this.f97931u;
                sequenceScope3 = (SequenceScope) this.f97934x;
                ResultKt.b(obj);
                i12++;
                if (i12 < 64) {
                    if (((1 << i12) & j11) != 0) {
                        Long l9 = new Long(j12 + i12 + 64);
                        this.f97934x = sequenceScope3;
                        this.f97930t = null;
                        this.f97931u = i12;
                        this.f97933w = 3;
                        sequenceScope3.c(l9, this);
                        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                        return coroutineSingletons;
                    }
                    i12++;
                    if (i12 < 64) {
                    }
                }
                return Unit.f71706a;
            }
            i11 = this.f97931u;
            sequenceScope2 = (SequenceScope) this.f97934x;
            ResultKt.b(obj);
            i11++;
            if (i11 >= 64) {
                sequenceScope = sequenceScope2;
                if (j11 != 0) {
                    sequenceScope3 = sequenceScope;
                    i12 = 0;
                    if (i12 < 64) {
                    }
                }
                return Unit.f71706a;
            }
            if (((1 << i11) & j13) != 0) {
                Long l11 = new Long(j12 + i11);
                this.f97934x = sequenceScope2;
                this.f97930t = null;
                this.f97931u = i11;
                this.f97933w = 2;
                sequenceScope2.c(l11, this);
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                return coroutineSingletons;
            }
            i11++;
            if (i11 >= 64) {
            }
        }
        if (i5 < length) {
            Long l12 = new Long(jArr[i5]);
            this.f97934x = sequenceScope;
            this.f97930t = jArr;
            this.f97931u = i5;
            this.f97932v = length;
            this.f97933w = 1;
            sequenceScope.c(l12, this);
            return coroutineSingletons;
        }
        if (j13 != 0) {
        }
        if (j11 != 0) {
        }
        return Unit.f71706a;
    }
}
