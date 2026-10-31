package r1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;
import z.a1;
import z.g1;
import z.y;
import z.y0;

/* loaded from: classes2.dex */
public final class g extends RestrictedSuspendLambda implements Function2 {
    public int A;
    public /* synthetic */ Object B;
    public Object C;
    public final /* synthetic */ Object D;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f85080t;

    /* renamed from: u, reason: collision with root package name */
    public long[] f85081u;

    /* renamed from: v, reason: collision with root package name */
    public int f85082v;

    /* renamed from: w, reason: collision with root package name */
    public int f85083w;

    /* renamed from: x, reason: collision with root package name */
    public int f85084x;

    /* renamed from: y, reason: collision with root package name */
    public int f85085y;

    /* renamed from: z, reason: collision with root package name */
    public long f85086z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g(Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f85080t = i5;
        this.D = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f85080t) {
            case 0:
                g gVar = new g((h) this.D, continuation, 0);
                gVar.B = obj;
                return gVar;
            case 1:
                g gVar2 = new g((z.g) this.D, continuation, 1);
                gVar2.B = obj;
                return gVar2;
            case 2:
                g gVar3 = new g((z.g) this.D, continuation, 2);
                gVar3.B = obj;
                return gVar3;
            default:
                g gVar4 = new g((g1) this.D, continuation, 3);
                gVar4.B = obj;
                return gVar4;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        SequenceScope sequenceScope = (SequenceScope) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f85080t) {
        }
        return ((g) create(sequenceScope, continuation)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01e4  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01ed  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0244  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0257  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x027d  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0285  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x0064 -> B:23:0x00af). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0066 -> B:16:0x007a). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0080 -> B:20:0x009f). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:37:0x0101 -> B:46:0x0142). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x0103 -> B:39:0x0114). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:41:0x011a -> B:43:0x0139). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:60:0x019b -> B:69:0x01eb). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:61:0x019d -> B:62:0x01af). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:64:0x01b5 -> B:66:0x01e1). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:83:0x0242 -> B:92:0x0283). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:84:0x0244 -> B:85:0x0255). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:87:0x025b -> B:89:0x027a). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        Object[] objArr;
        long[] jArr;
        int length;
        int i5;
        long j11;
        SequenceScope sequenceScope2;
        z.g gVar;
        long[] jArr2;
        int length2;
        int i11;
        long j12;
        long j13;
        SequenceScope sequenceScope3;
        Object[] objArr2;
        long[] jArr3;
        int length3;
        int i12;
        long j14;
        long j15;
        long j16;
        char c11;
        SequenceScope sequenceScope4;
        Object[] objArr3;
        long[] jArr4;
        int length4;
        int i13;
        long j17;
        int i14 = this.f85080t;
        Object obj2 = this.D;
        long j18 = -9187201950435737472L;
        switch (i14) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i15 = this.A;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    sequenceScope = (SequenceScope) this.B;
                    a1 a1Var = ((h) obj2).f85087a;
                    objArr = a1Var.f97741b;
                    jArr = a1Var.f97740a;
                    length = jArr.length - 2;
                    if (length >= 0) {
                        i5 = 0;
                        j11 = jArr[i5];
                        if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                        }
                        if (i5 != length) {
                        }
                    }
                    return Unit.f71706a;
                }
                if (i15 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                int i16 = this.f85085y;
                int i17 = this.f85084x;
                long j19 = this.f85086z;
                i5 = this.f85083w;
                int i18 = this.f85082v;
                long[] jArr5 = this.f85081u;
                Object[] objArr4 = (Object[]) this.C;
                SequenceScope sequenceScope5 = (SequenceScope) this.B;
                ResultKt.b(obj);
                j19 >>= 8;
                i16++;
                if (i16 < i17) {
                    if (i17 == 8) {
                        length = i18;
                        jArr = jArr5;
                        objArr = objArr4;
                        sequenceScope = sequenceScope5;
                        if (i5 != length) {
                            i5++;
                            j11 = jArr[i5];
                            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                sequenceScope5 = sequenceScope;
                                i16 = 0;
                                jArr5 = jArr;
                                objArr4 = objArr;
                                i17 = 8 - ((~(i5 - length)) >>> 31);
                                i18 = length;
                                j19 = j11;
                                if (i16 < i17) {
                                    if ((j19 & 255) < 128) {
                                        Object obj3 = objArr4[(i5 << 3) + i16];
                                        this.B = sequenceScope5;
                                        this.C = objArr4;
                                        this.f85081u = jArr5;
                                        this.f85082v = i18;
                                        this.f85083w = i5;
                                        this.f85086z = j19;
                                        this.f85084x = i17;
                                        this.f85085y = i16;
                                        this.A = 1;
                                        sequenceScope5.c(obj3, this);
                                        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                                        return coroutineSingletons;
                                    }
                                    j19 >>= 8;
                                    i16++;
                                    if (i16 < i17) {
                                    }
                                }
                            }
                            if (i5 != length) {
                            }
                        }
                    }
                    return Unit.f71706a;
                }
            case 1:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i19 = this.A;
                if (i19 == 0) {
                    ResultKt.b(obj);
                    sequenceScope2 = (SequenceScope) this.B;
                    gVar = (z.g) obj2;
                    jArr2 = gVar.f97771b.f97866a;
                    length2 = jArr2.length - 2;
                    if (length2 >= 0) {
                        i11 = 0;
                        j12 = jArr2[i11];
                        j13 = j18;
                        if ((((~j12) << 7) & j12 & j13) != j13) {
                        }
                        if (i11 != length2) {
                        }
                    }
                    return Unit.f71706a;
                }
                if (i19 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                int i21 = this.f85085y;
                int i22 = this.f85084x;
                long j21 = this.f85086z;
                int i23 = this.f85083w;
                int i24 = this.f85082v;
                long[] jArr6 = this.f85081u;
                z.g gVar2 = (z.g) this.C;
                SequenceScope sequenceScope6 = (SequenceScope) this.B;
                ResultKt.b(obj);
                long[] jArr7 = jArr6;
                j13 = -9187201950435737472L;
                int i25 = i24;
                int i26 = i23;
                j21 >>= 8;
                i21++;
                if (i21 < i22) {
                    if (i22 == 8) {
                        i11 = i26;
                        length2 = i25;
                        jArr2 = jArr7;
                        gVar = gVar2;
                        sequenceScope2 = sequenceScope6;
                        if (i11 != length2) {
                            i11++;
                            j18 = j13;
                            j12 = jArr2[i11];
                            j13 = j18;
                            if ((((~j12) << 7) & j12 & j13) != j13) {
                                jArr7 = jArr2;
                                i22 = 8 - ((~(i11 - length2)) >>> 31);
                                i25 = length2;
                                sequenceScope6 = sequenceScope2;
                                gVar2 = gVar;
                                i21 = 0;
                                i26 = i11;
                                j21 = j12;
                                if (i21 < i22) {
                                    if ((j21 & 255) < 128) {
                                        int i27 = (i26 << 3) + i21;
                                        y0 y0Var = gVar2.f97771b;
                                        y yVar = new y(y0Var.f97867b[i27], y0Var.f97868c[i27]);
                                        this.B = sequenceScope6;
                                        this.C = gVar2;
                                        this.f85081u = jArr7;
                                        this.f85082v = i25;
                                        this.f85083w = i26;
                                        this.f85086z = j21;
                                        this.f85084x = i22;
                                        this.f85085y = i21;
                                        this.A = 1;
                                        sequenceScope6.c(yVar, this);
                                        CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                                        return coroutineSingletons3;
                                    }
                                    j21 >>= 8;
                                    i21++;
                                    if (i21 < i22) {
                                    }
                                }
                            }
                            if (i11 != length2) {
                            }
                        }
                    }
                    return Unit.f71706a;
                }
            case 2:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i28 = this.A;
                if (i28 == 0) {
                    ResultKt.b(obj);
                    sequenceScope3 = (SequenceScope) this.B;
                    y0 y0Var2 = ((z.g) obj2).f97771b;
                    objArr2 = y0Var2.f97867b;
                    jArr3 = y0Var2.f97866a;
                    length3 = jArr3.length - 2;
                    if (length3 >= 0) {
                        i12 = 0;
                        j14 = jArr3[i12];
                        if ((((~j14) << 7) & j14 & (-9187201950435737472L)) != -9187201950435737472L) {
                        }
                        if (i12 != length3) {
                        }
                    }
                    return Unit.f71706a;
                }
                if (i28 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                int i29 = this.f85085y;
                int i31 = this.f85084x;
                long j22 = this.f85086z;
                i12 = this.f85083w;
                int i32 = this.f85082v;
                long[] jArr8 = this.f85081u;
                Object[] objArr5 = (Object[]) this.C;
                SequenceScope sequenceScope7 = (SequenceScope) this.B;
                ResultKt.b(obj);
                j22 >>= 8;
                i29++;
                if (i29 < i31) {
                    if (i31 == 8) {
                        length3 = i32;
                        jArr3 = jArr8;
                        objArr2 = objArr5;
                        sequenceScope3 = sequenceScope7;
                        if (i12 != length3) {
                            i12++;
                            j14 = jArr3[i12];
                            if ((((~j14) << 7) & j14 & (-9187201950435737472L)) != -9187201950435737472L) {
                                sequenceScope7 = sequenceScope3;
                                i29 = 0;
                                jArr8 = jArr3;
                                i32 = length3;
                                i31 = 8 - ((~(i12 - length3)) >>> 31);
                                objArr5 = objArr2;
                                j22 = j14;
                                if (i29 < i31) {
                                    if ((j22 & 255) < 128) {
                                        Object obj4 = objArr5[(i12 << 3) + i29];
                                        this.B = sequenceScope7;
                                        this.C = objArr5;
                                        this.f85081u = jArr8;
                                        this.f85082v = i32;
                                        this.f85083w = i12;
                                        this.f85086z = j22;
                                        this.f85084x = i31;
                                        this.f85085y = i29;
                                        this.A = 1;
                                        sequenceScope7.c(obj4, this);
                                        CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                                        return coroutineSingletons5;
                                    }
                                    j22 >>= 8;
                                    i29++;
                                    if (i29 < i31) {
                                    }
                                }
                            }
                            if (i12 != length3) {
                            }
                        }
                    }
                    return Unit.f71706a;
                }
            default:
                CoroutineSingletons coroutineSingletons7 = CoroutineSingletons.f71806a;
                int i33 = this.A;
                if (i33 == 0) {
                    j15 = 128;
                    j16 = 255;
                    c11 = 7;
                    ResultKt.b(obj);
                    sequenceScope4 = (SequenceScope) this.B;
                    y0 y0Var3 = ((g1) obj2).f97773a;
                    objArr3 = y0Var3.f97868c;
                    jArr4 = y0Var3.f97866a;
                    length4 = jArr4.length - 2;
                    if (length4 >= 0) {
                        i13 = 0;
                        j17 = jArr4[i13];
                        if ((((~j17) << c11) & j17 & (-9187201950435737472L)) != -9187201950435737472L) {
                        }
                        if (i13 != length4) {
                        }
                    }
                    return Unit.f71706a;
                }
                if (i33 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                int i34 = this.f85085y;
                int i35 = this.f85084x;
                long j23 = this.f85086z;
                j15 = 128;
                int i36 = this.f85083w;
                int i37 = this.f85082v;
                j16 = 255;
                long[] jArr9 = this.f85081u;
                Object[] objArr6 = (Object[]) this.C;
                c11 = 7;
                SequenceScope sequenceScope8 = (SequenceScope) this.B;
                ResultKt.b(obj);
                j23 >>= 8;
                i34++;
                if (i34 < i35) {
                    if (i35 == 8) {
                        SequenceScope sequenceScope9 = sequenceScope8;
                        i13 = i36;
                        sequenceScope4 = sequenceScope9;
                        Object[] objArr7 = objArr6;
                        length4 = i37;
                        jArr4 = jArr9;
                        objArr3 = objArr7;
                        if (i13 != length4) {
                            i13++;
                            j17 = jArr4[i13];
                            if ((((~j17) << c11) & j17 & (-9187201950435737472L)) != -9187201950435737472L) {
                                int i38 = 8 - ((~(i13 - length4)) >>> 31);
                                int i39 = i13;
                                sequenceScope8 = sequenceScope4;
                                i36 = i39;
                                Object[] objArr8 = objArr3;
                                jArr9 = jArr4;
                                i37 = length4;
                                objArr6 = objArr8;
                                i35 = i38;
                                j23 = j17;
                                i34 = 0;
                                if (i34 < i35) {
                                    if ((j23 & j16) < j15) {
                                        Object obj5 = objArr6[(i36 << 3) + i34];
                                        this.B = sequenceScope8;
                                        this.C = objArr6;
                                        this.f85081u = jArr9;
                                        this.f85082v = i37;
                                        this.f85083w = i36;
                                        this.f85086z = j23;
                                        this.f85084x = i35;
                                        this.f85085y = i34;
                                        this.A = 1;
                                        sequenceScope8.c(obj5, this);
                                        CoroutineSingletons coroutineSingletons8 = CoroutineSingletons.f71806a;
                                        return coroutineSingletons7;
                                    }
                                    j23 >>= 8;
                                    i34++;
                                    if (i34 < i35) {
                                    }
                                }
                            }
                            if (i13 != length4) {
                            }
                        }
                    }
                    return Unit.f71706a;
                }
        }
    }
}
