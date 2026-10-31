package p50;

import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;

/* loaded from: classes4.dex */
public final class b extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Iterator f82087t;

    /* renamed from: u, reason: collision with root package name */
    public int[] f82088u;

    /* renamed from: v, reason: collision with root package name */
    public int f82089v;

    /* renamed from: w, reason: collision with root package name */
    public int f82090w;

    /* renamed from: x, reason: collision with root package name */
    public int f82091x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f82092y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ c f82093z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, Continuation continuation) {
        super(2, continuation);
        this.f82093z = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        b bVar = new b(this.f82093z, continuation);
        bVar.f82092y = obj;
        return bVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((b) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0078  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x003b -> B:12:0x0045). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0068 -> B:19:0x006c). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        Iterator it;
        int i5;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = this.f82091x;
        c cVar = this.f82093z;
        if (i11 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.f82092y;
            it = cVar.f82094a.iterator();
            i5 = 0;
            if (it.hasNext()) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i12 = this.f82090w;
            int i13 = this.f82089v;
            int[] iArr = this.f82088u;
            Iterator it2 = this.f82087t;
            SequenceScope sequenceScope2 = (SequenceScope) this.f82092y;
            ResultKt.b(obj);
            sequenceScope = sequenceScope2;
            i12 += 6;
            int[] iArr2 = iArr;
            int i14 = i13 + 6;
            Iterator it3 = it2;
            int[] iArr3 = iArr2;
            if (i12 < iArr3.length) {
                it = it3;
                i5 = i14;
                if (it.hasNext()) {
                    return Unit.f71706a;
                }
                iArr3 = (int[]) it.next();
                i14 = i5;
                it3 = it;
                i12 = 0;
                if (i12 < iArr3.length) {
                    if (cVar.a(i14) != -1) {
                        Integer num = new Integer(i14);
                        this.f82092y = sequenceScope;
                        this.f82087t = it3;
                        this.f82088u = iArr3;
                        this.f82089v = i14;
                        this.f82090w = i12;
                        this.f82091x = 1;
                        sequenceScope.c(num, this);
                        CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                        return coroutineSingletons;
                    }
                    int[] iArr4 = iArr3;
                    it2 = it3;
                    i13 = i14;
                    iArr = iArr4;
                    i12 += 6;
                    int[] iArr22 = iArr;
                    int i142 = i13 + 6;
                    Iterator it32 = it2;
                    int[] iArr32 = iArr22;
                    if (i12 < iArr32.length) {
                    }
                }
            }
        }
    }
}
