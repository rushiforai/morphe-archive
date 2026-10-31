package ads_mobile_sdk;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.x;

/* loaded from: classes2.dex */
public final class ti3 implements x {

    /* renamed from: b, reason: collision with root package name */
    public static final bk.e f9938b = new bk.e(28);

    /* renamed from: a, reason: collision with root package name */
    public final au f9939a;

    public ti3() {
        au auVar = new au(6);
        auVar.f1092a = ji3.b().f4777a;
        this.f9939a = auVar;
    }

    public final ti3 copyForChild() {
        return new ti3();
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return function2.invoke(obj, this);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.b(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    public final CoroutineContext.Key getKey() {
        return f9938b;
    }

    public final ti3 mergeForChild(CoroutineContext.Element element) {
        return new ti3();
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.c(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(this, coroutineContext);
    }

    @Override // t70.j2
    public final void restoreThreadContext(CoroutineContext context, Object obj) {
        gi3 oldState = (gi3) obj;
        Intrinsics.g(context, "context");
        Intrinsics.g(oldState, "oldState");
        this.f9939a.getClass();
        ii3 ii3VarB = ji3.b();
        ii3VarB.f4779c = null;
        ji3.a(ii3VarB, oldState.f3853a);
        ii3VarB.f4779c = oldState.f3854b;
    }

    @Override // t70.j2
    public final Object updateThreadContext(CoroutineContext context) {
        Intrinsics.g(context, "context");
        au auVar = this.f9939a;
        auVar.getClass();
        ii3 ii3VarB = ji3.b();
        gi3 gi3Var = new gi3(ji3.a(ii3VarB, (th3) auVar.f1092a), ii3VarB.f4779c);
        ii3VarB.f4779c = auVar;
        return gi3Var;
    }
}
