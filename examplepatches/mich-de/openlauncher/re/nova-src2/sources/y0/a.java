package y0;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import s10.s;
import z2.y;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96499a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f96500b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ a1.k f96501c;

    public /* synthetic */ a(f fVar, a1.k kVar, int i5) {
        this.f96499a = i5;
        this.f96500b = fVar;
        this.f96501c = kVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f96499a) {
            case 0:
                f fVar = this.f96500b;
                b bVar = fVar.f96517f;
                xu.d dVar = new xu.d(this.f96501c, 3);
                Ref.ObjectRef objectRef = new Ref.ObjectRef();
                fVar.f96516e.d("dataBuilder", bVar, new s(14, objectRef, dVar));
                Object obj = objectRef.f71863a;
                if (obj != null) {
                    return (w0.c) obj;
                }
                Intrinsics.m("result");
                throw null;
            case 1:
                f fVar2 = this.f96500b;
                b bVar2 = fVar2.f96518g;
                a aVar = new a(fVar2, this.f96501c, 2);
                Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
                fVar2.f96516e.d("positioner", bVar2, new s(14, objectRef2, aVar));
                Object obj2 = objectRef2.f71863a;
                if (obj2 != null) {
                    return (h2.c) obj2;
                }
                Intrinsics.m("result");
                throw null;
            default:
                y yVar = (y) this.f96500b.f96514c.invoke();
                return this.f96501c.z(yVar).j(yVar.M(0L));
        }
    }
}
