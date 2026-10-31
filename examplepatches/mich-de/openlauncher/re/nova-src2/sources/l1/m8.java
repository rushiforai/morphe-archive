package l1;

import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class m8 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ ArrayList f73656j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z2.w1 f73657k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function2 f73658l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f73659m;
    public final /* synthetic */ long n;
    public final /* synthetic */ int o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Function3 f73660p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ ArrayList f73661q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ int f73662r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m8(ArrayList arrayList, z2.w1 w1Var, Function2 function2, Ref.IntRef intRef, long j11, int i5, Function3 function3, ArrayList arrayList2, int i11) {
        super(1);
        this.f73656j = arrayList;
        this.f73657k = w1Var;
        this.f73658l = function2;
        this.f73659m = intRef;
        this.n = j11;
        this.o = i5;
        this.f73660p = function3;
        this.f73661q = arrayList2;
        this.f73662r = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5;
        z2.h1 h1Var = (z2.h1) obj;
        ArrayList arrayList = this.f73656j;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            z2.h1.m(h1Var, (z2.i1) arrayList.get(i11), this.f73659m.f71861a * i11, 0);
        }
        p8 p8Var = p8.f73795b;
        Function2 function2 = this.f73658l;
        z2.w1 w1Var = this.f73657k;
        List listC = w1Var.c(p8Var, function2);
        int size2 = listC.size();
        int i12 = 0;
        while (true) {
            i5 = this.o;
            if (i12 >= size2) {
                break;
            }
            z2.i1 i1VarH = ((z2.q0) listC.get(i12)).H(y3.a.a(this.n, 0, 0, 0, 0, 11));
            z2.h1.m(h1Var, i1VarH, 0, i5 - i1VarH.f98082b);
            i12++;
        }
        List listC2 = w1Var.c(p8.f73796c, new x1.e(new h8(this.f73660p, this.f73661q, 1), true, 1621992604));
        int size3 = listC2.size();
        for (int i13 = 0; i13 < size3; i13++) {
            z2.q0 q0Var = (z2.q0) listC2.get(i13);
            int i14 = this.f73662r;
            if (!((i14 >= 0) & (i5 >= 0))) {
                y3.j.a("width and height must be >= 0");
            }
            z2.h1.m(h1Var, q0Var.H(y3.b.h(i14, i14, i5, i5)), 0, 0);
        }
        return Unit.f71706a;
    }
}
