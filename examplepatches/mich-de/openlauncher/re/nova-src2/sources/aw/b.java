package aw;

import b2.t;
import f1.i3;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p1.o;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15705a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t f15706b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f15707c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f15708d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ long f15709e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f15710f;

    public /* synthetic */ b(float f11, int i5, int i11, long j11, long j12, t tVar) {
        this.f15705a = i11;
        this.f15706b = tVar;
        this.f15707c = j11;
        this.f15708d = f11;
        this.f15709e = j12;
        this.f15710f = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f15705a) {
            case 0:
                ((Integer) obj2).getClass();
                wh.f.e(this.f15706b, this.f15707c, this.f15708d, this.f15709e, (o) obj, a0.l(this.f15710f | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                i3.a(this.f15706b, this.f15707c, this.f15708d, this.f15709e, (o) obj, a0.l(this.f15710f | 1));
                break;
        }
        return Unit.f71706a;
    }
}
