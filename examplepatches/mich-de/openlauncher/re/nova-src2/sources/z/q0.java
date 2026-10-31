package z;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;

/* loaded from: classes2.dex */
public final class q0 extends RestrictedSuspendLambda implements Function2 {
    public long A;
    public int B;
    public /* synthetic */ Object C;
    public final /* synthetic */ r0 D;
    public final /* synthetic */ m0 E;

    /* renamed from: t, reason: collision with root package name */
    public m0 f97815t;

    /* renamed from: u, reason: collision with root package name */
    public r0 f97816u;

    /* renamed from: v, reason: collision with root package name */
    public long[] f97817v;

    /* renamed from: w, reason: collision with root package name */
    public int f97818w;

    /* renamed from: x, reason: collision with root package name */
    public int f97819x;

    /* renamed from: y, reason: collision with root package name */
    public int f97820y;

    /* renamed from: z, reason: collision with root package name */
    public int f97821z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q0(r0 r0Var, m0 m0Var, Continuation continuation) {
        super(2, continuation);
        this.D = r0Var;
        this.E = m0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        q0 q0Var = new q0(this.D, this.E, continuation);
        q0Var.C = obj;
        return q0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((q0) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00a4  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0052 -> B:22:0x00a2). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:13:0x0054 -> B:14:0x0067). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0070 -> B:19:0x0097). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        r0 r0Var;
        long[] jArr;
        int length;
        m0 m0Var;
        int i5;
        long j11;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = this.B;
        if (i11 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.C;
            r0Var = this.D;
            jArr = r0Var.f97828b.f97740a;
            length = jArr.length - 2;
            if (length >= 0) {
                m0Var = this.E;
                i5 = 0;
                j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                }
                if (i5 != length) {
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        int i12 = this.f97821z;
        int i13 = this.f97820y;
        long j12 = this.A;
        int i14 = this.f97819x;
        int i15 = this.f97818w;
        long[] jArr2 = this.f97817v;
        r0 r0Var2 = this.f97816u;
        m0 m0Var2 = this.f97815t;
        SequenceScope sequenceScope2 = (SequenceScope) this.C;
        ResultKt.b(obj);
        j12 >>= 8;
        i12++;
        if (i12 < i13) {
            if (i13 == 8) {
                length = i15;
                jArr = jArr2;
                r0Var = r0Var2;
                sequenceScope = sequenceScope2;
                i5 = i14;
                m0Var = m0Var2;
                if (i5 != length) {
                    i5++;
                    j11 = jArr[i5];
                    if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                        sequenceScope2 = sequenceScope;
                        i12 = 0;
                        r0Var2 = r0Var;
                        jArr2 = jArr;
                        i13 = 8 - ((~(i5 - length)) >>> 31);
                        m0Var2 = m0Var;
                        i14 = i5;
                        i15 = length;
                        j12 = j11;
                        if (i12 < i13) {
                            if ((255 & j12) < 128) {
                                int i16 = (i14 << 3) + i12;
                                m0Var2.f97800b = i16;
                                Object obj2 = r0Var2.f97828b.f97741b[i16];
                                this.C = sequenceScope2;
                                this.f97815t = m0Var2;
                                this.f97816u = r0Var2;
                                this.f97817v = jArr2;
                                this.f97818w = i15;
                                this.f97819x = i14;
                                this.A = j12;
                                this.f97820y = i13;
                                this.f97821z = i12;
                                this.B = 1;
                                sequenceScope2.c(obj2, this);
                                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                                return coroutineSingletons;
                            }
                            j12 >>= 8;
                            i12++;
                            if (i12 < i13) {
                            }
                        }
                    }
                    if (i5 != length) {
                    }
                }
            }
            return Unit.f71706a;
        }
    }
}
