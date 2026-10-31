package w70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class f0 implements m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f93894a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f93895b;

    public f0(m mVar, int i5) {
        this.f93894a = mVar;
        this.f93895b = i5;
    }

    @Override // w70.m
    public final Object collect(n nVar, Continuation continuation) {
        Object objCollect = this.f93894a.collect(new h0(new Ref.IntRef(), this.f93895b, nVar), continuation);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }
}
