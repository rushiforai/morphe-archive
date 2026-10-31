package dz;

import e10.q0;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Ref;
import w70.n;

/* loaded from: classes4.dex */
public final class a implements n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f49856a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f49857b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49858c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49859d;

    public a(g gVar, Ref.BooleanRef booleanRef, Ref.BooleanRef booleanRef2, Ref.ObjectRef objectRef) {
        this.f49856a = objectRef;
        this.f49857b = gVar;
        this.f49858c = booleanRef;
        this.f49859d = booleanRef2;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        Ref.ObjectRef objectRef = this.f49856a;
        objectRef.f71863a = (q0) obj;
        g.a(this.f49857b, this.f49858c, this.f49859d, objectRef);
        return Unit.f71706a;
    }
}
