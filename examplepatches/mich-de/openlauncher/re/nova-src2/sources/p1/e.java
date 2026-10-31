package p1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f81397a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f81398b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f81399c;

    public e(d dVar, f fVar, Ref.IntRef intRef) {
        this.f81397a = dVar;
        this.f81398b = fVar;
        this.f81399c = intRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5;
        d dVar = this.f81397a;
        dVar.f81394a = null;
        dVar.f81395b = null;
        x1.a aVar = this.f81398b.f81405d;
        int i11 = this.f81399c.f71861a;
        do {
            i5 = aVar.get();
        } while (!aVar.compareAndSet(i5, ((i5 >>> 27) & 15) == i11 ? i5 - 1 : i5));
        return Unit.f71706a;
    }
}
