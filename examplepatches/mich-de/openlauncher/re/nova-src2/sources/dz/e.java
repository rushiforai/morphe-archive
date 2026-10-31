package dz;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Ref;
import w70.n;

/* loaded from: classes4.dex */
public final class e implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49874a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f49875b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f49876c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49877d;

    public e(g gVar, Ref.BooleanRef booleanRef, Ref.BooleanRef booleanRef2, Ref.ObjectRef objectRef) {
        this.f49874a = booleanRef;
        this.f49875b = gVar;
        this.f49876c = objectRef;
        this.f49877d = booleanRef2;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        Ref.BooleanRef booleanRef = this.f49874a;
        booleanRef.f71859a = zBooleanValue;
        Ref.ObjectRef objectRef = this.f49876c;
        g.a(this.f49875b, booleanRef, this.f49877d, objectRef);
        return Unit.f71706a;
    }
}
