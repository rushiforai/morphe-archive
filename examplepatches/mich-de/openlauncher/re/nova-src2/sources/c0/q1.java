package c0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes2.dex */
public final /* synthetic */ class q1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18931a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2 f18932b;

    public /* synthetic */ q1(Function2 function2, int i5) {
        this.f18931a = i5;
        this.f18932b = function2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f18931a) {
            case 0:
                i2 i2Var = f.f18784i;
                l lVar = (l) obj;
                this.f18932b.invoke(((s2) lVar.f18861e).getValue(), i2Var.f18833b.invoke(lVar.f18862f));
                break;
            case 1:
                Boolean bool = Boolean.FALSE;
                this.f18932b.invoke((tz.n) obj, bool);
                break;
            case 2:
                Boolean bool2 = Boolean.TRUE;
                this.f18932b.invoke((tz.n) obj, bool2);
                break;
            case 3:
                z2.y coordinates = (z2.y) obj;
                Intrinsics.g(coordinates, "coordinates");
                this.f18932b.invoke("saved", coordinates);
                break;
            default:
                es.z screen = (es.z) obj;
                Intrinsics.g(screen, "screen");
                this.f18932b.invoke(screen, Boolean.TRUE);
                break;
        }
        return Unit.f71706a;
    }
}
