package w70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class k implements m {

    /* renamed from: a, reason: collision with root package name */
    public final m f93946a;

    public k(m mVar) {
        this.f93946a = mVar;
    }

    @Override // w70.m
    public final Object collect(n nVar, Continuation continuation) {
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        objectRef.f71863a = x70.b.f95216b;
        Object objCollect = this.f93946a.collect(new j(this, objectRef, nVar), continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }
}
