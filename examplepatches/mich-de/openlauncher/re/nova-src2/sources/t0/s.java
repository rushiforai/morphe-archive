package t0;

import ads_mobile_sdk.ti3;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final /* synthetic */ class s implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88185a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f88186b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f88187c;

    public /* synthetic */ s(e1.a1 a1Var, boolean z11, int i5) {
        this.f88187c = a1Var;
        this.f88186b = z11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f88185a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                t0.k((e1.a1) this.f88187c, this.f88186b, (p1.o) obj, iL);
                return Unit.f71706a;
            default:
                Ref.ObjectRef objectRef = (Ref.ObjectRef) this.f88187c;
                CoroutineContext coroutineContext = (CoroutineContext) obj;
                CoroutineContext.Element element = (CoroutineContext.Element) obj2;
                if (!(element instanceof t70.x)) {
                    return coroutineContext.plus(element);
                }
                CoroutineContext.Element element2 = ((CoroutineContext) objectRef.f71863a).get(element.getKey());
                if (element2 != null) {
                    objectRef.f71863a = ((CoroutineContext) objectRef.f71863a).minusKey(element.getKey());
                    return coroutineContext.plus(((ti3) ((t70.x) element)).mergeForChild(element2));
                }
                CoroutineContext coroutineContextCopyForChild = (t70.x) element;
                if (this.f88186b) {
                    coroutineContextCopyForChild = ((ti3) coroutineContextCopyForChild).copyForChild();
                }
                return coroutineContext.plus(coroutineContextCopyForChild);
        }
    }

    public /* synthetic */ s(Ref.ObjectRef objectRef, boolean z11) {
        this.f88187c = objectRef;
        this.f88186b = z11;
    }
}
