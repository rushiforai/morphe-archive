package b70;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.SequenceScope;

/* loaded from: classes4.dex */
public final class o extends RestrictedSuspendLambda implements Function2 {
    public final /* synthetic */ Iterator A;

    /* renamed from: t, reason: collision with root package name */
    public Object f17597t;

    /* renamed from: u, reason: collision with root package name */
    public Iterator f17598u;

    /* renamed from: v, reason: collision with root package name */
    public int f17599v;

    /* renamed from: w, reason: collision with root package name */
    public int f17600w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f17601x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ int f17602y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ int f17603z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(int i5, int i11, Iterator it, Continuation continuation) {
        super(2, continuation);
        this.f17602y = i5;
        this.f17603z = i11;
        this.A = it;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        o oVar = new o(this.f17602y, this.f17603z, this.A, continuation);
        oVar.f17601x = obj;
        return oVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((o) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0138 A[SYNTHETIC] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        int i5;
        kotlin.collections.d dVar;
        SequenceScope sequenceScope;
        Iterator it;
        ArrayList arrayList;
        SequenceScope sequenceScope2;
        Iterator it2;
        int i11;
        kotlin.collections.d dVar2;
        SequenceScope sequenceScope3;
        Object[] array;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = this.f17600w;
        int i13 = this.f17603z;
        boolean z11 = true;
        int i14 = this.f17602y;
        if (i12 == 0) {
            ResultKt.b(obj);
            SequenceScope sequenceScope4 = (SequenceScope) this.f17601x;
            int i15 = i14 <= 1024 ? i14 : 1024;
            i5 = i13 - i14;
            Iterator it3 = this.A;
            if (i5 >= 0) {
                arrayList = new ArrayList(i15);
                sequenceScope2 = sequenceScope4;
                it2 = it3;
                i11 = 0;
                while (it2.hasNext()) {
                }
                if (!arrayList.isEmpty()) {
                }
            } else {
                dVar = new kotlin.collections.d(new Object[i15], 0);
                sequenceScope = sequenceScope4;
                it = it3;
                while (true) {
                    int i16 = dVar.f71792c;
                    Object[] objArr = dVar.f71791b;
                    if (it.hasNext()) {
                    }
                    z11 = z;
                }
            }
        } else if (i12 != 1) {
            if (i12 != 2) {
                if (i12 == 3) {
                    it = this.f17598u;
                    dVar = (kotlin.collections.d) this.f17597t;
                    sequenceScope = (SequenceScope) this.f17601x;
                    ResultKt.b(obj);
                    dVar.d(i13);
                    while (true) {
                        int i162 = dVar.f71792c;
                        Object[] objArr2 = dVar.f71791b;
                        if (it.hasNext()) {
                            dVar2 = dVar;
                            sequenceScope3 = sequenceScope;
                            break;
                        }
                        Object next = it.next();
                        if (dVar.c() == i162) {
                            throw new IllegalStateException("ring buffer is full");
                        }
                        int i17 = dVar.f71793d;
                        boolean z12 = z11;
                        int i18 = dVar.f71794e;
                        objArr2[(i17 + i18) % i162] = next;
                        dVar.f71794e = i18 + 1;
                        if (dVar.c() == i162) {
                            if (dVar.f71794e >= i14) {
                                ArrayList arrayList2 = new ArrayList(dVar);
                                this.f17601x = sequenceScope;
                                this.f17597t = dVar;
                                this.f17598u = it;
                                this.f17600w = 3;
                                sequenceScope.c(arrayList2, this);
                                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                                return coroutineSingletons;
                            }
                            int i19 = i162 + (i162 >> 1) + 1;
                            if (i19 > i14) {
                                i19 = i14;
                            }
                            if (dVar.f71793d == 0) {
                                array = Arrays.copyOf(objArr2, i19);
                                Intrinsics.f(array, "copyOf(...)");
                            } else {
                                array = dVar.toArray(new Object[i19]);
                            }
                            dVar = new kotlin.collections.d(array, dVar.f71794e);
                        }
                        z11 = z12;
                    }
                } else if (i12 == 4) {
                    dVar2 = (kotlin.collections.d) this.f17597t;
                    sequenceScope3 = (SequenceScope) this.f17601x;
                    ResultKt.b(obj);
                    dVar2.d(i13);
                    if (dVar2.f71794e > i13) {
                        ArrayList arrayList3 = new ArrayList(dVar2);
                        this.f17601x = sequenceScope3;
                        this.f17597t = dVar2;
                        this.f17598u = null;
                        this.f17600w = 4;
                        sequenceScope3.c(arrayList3, this);
                        CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                        return coroutineSingletons;
                    }
                    if (!dVar2.isEmpty()) {
                        this.f17601x = null;
                        this.f17597t = null;
                        this.f17598u = null;
                        this.f17600w = 5;
                        sequenceScope3.c(dVar2, this);
                        CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                        return coroutineSingletons;
                    }
                } else if (i12 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            }
            ResultKt.b(obj);
        } else {
            i11 = this.f17599v;
            it2 = this.f17598u;
            sequenceScope2 = (SequenceScope) this.f17601x;
            ResultKt.b(obj);
            arrayList = new ArrayList(i14);
            i5 = i11;
            while (it2.hasNext()) {
                Object next2 = it2.next();
                if (i11 > 0) {
                    i11--;
                } else {
                    arrayList.add(next2);
                    if (arrayList.size() == i14) {
                        this.f17601x = sequenceScope2;
                        this.f17597t = arrayList;
                        this.f17598u = it2;
                        this.f17599v = i5;
                        this.f17600w = 1;
                        sequenceScope2.c(arrayList, this);
                        CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                        return coroutineSingletons;
                    }
                }
            }
            if (!arrayList.isEmpty()) {
                this.f17601x = null;
                this.f17597t = null;
                this.f17598u = null;
                this.f17600w = 2;
                sequenceScope2.c(arrayList, this);
                CoroutineSingletons coroutineSingletons6 = CoroutineSingletons.f71806a;
                return coroutineSingletons;
            }
        }
        return Unit.f71706a;
    }
}
