package dz;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Ref;
import w70.n;

/* loaded from: classes4.dex */
public final class c implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49865a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f49866b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f49867c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49868d;

    public c(g gVar, Ref.BooleanRef booleanRef, Ref.BooleanRef booleanRef2, Ref.ObjectRef objectRef) {
        this.f49865a = booleanRef;
        this.f49866b = gVar;
        this.f49867c = objectRef;
        this.f49868d = booleanRef2;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        Ref.BooleanRef booleanRef = this.f49865a;
        booleanRef.f71859a = zBooleanValue;
        Ref.ObjectRef objectRef = this.f49867c;
        g.a(this.f49866b, this.f49868d, booleanRef, objectRef);
        return Unit.f71706a;
    }
}
