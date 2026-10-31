package q70;

import e10.j2;
import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;

/* loaded from: classes.dex */
public final class g extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Iterator f83791t;

    /* renamed from: u, reason: collision with root package name */
    public Object f83792u;

    /* renamed from: v, reason: collision with root package name */
    public int f83793v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f83794w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1 f83795x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ j2 f83796y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1 collectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1, j2 j2Var, Continuation continuation) {
        super(2, continuation);
        this.f83795x = collectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1;
        this.f83796y = j2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        g gVar = new g(this.f83795x, this.f83796y, continuation);
        gVar.f83794w = obj;
        return gVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((g) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        Iterator it;
        Object next;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f83793v;
        if (i5 == 0) {
            ResultKt.b(obj);
            sequenceScope = (SequenceScope) this.f83794w;
            it = this.f83795x.f71731a.iterator();
            if (!it.hasNext()) {
                return Unit.f71706a;
            }
            next = it.next();
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            next = this.f83792u;
            it = this.f83791t;
            sequenceScope = (SequenceScope) this.f83794w;
            ResultKt.b(obj);
        }
        if (!it.hasNext()) {
            return Unit.f71706a;
        }
        Object next2 = it.next();
        Object objInvoke = this.f83796y.invoke(next, next2);
        this.f83794w = sequenceScope;
        this.f83791t = it;
        this.f83792u = next2;
        this.f83793v = 1;
        sequenceScope.c(objInvoke, this);
        return coroutineSingletons;
    }
}
