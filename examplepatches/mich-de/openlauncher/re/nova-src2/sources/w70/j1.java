package w70;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class j1 implements m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f93942a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f93943b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f93944c;

    public j1(m mVar, m mVar2, Function3 function3) {
        this.f93942a = mVar;
        this.f93943b = mVar2;
        this.f93944c = function3;
    }

    /* JADX WARN: Type inference failed for: r2v2, types: [java.lang.Object, kotlin.jvm.functions.Function3] */
    @Override // w70.m
    public final Object collect(n nVar, Continuation continuation) {
        Object objA = x70.b.a(continuation, k1.f93950a, new i1((Function3) this.f93944c, (Continuation) null), nVar, new m[]{this.f93942a, this.f93943b});
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
