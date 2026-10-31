package l1;

import com.google.android.gms.internal.measurement.ke;
import java.util.ArrayList;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class t5 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ ArrayList f74021j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ ArrayList f74022k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ ArrayList f74023l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ ArrayList f74024m;
    public final /* synthetic */ ke n;
    public final /* synthetic */ int o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ int f74025p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ k0.g2 f74026q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ z2.w1 f74027r;

    /* renamed from: s, reason: collision with root package name */
    public final /* synthetic */ int f74028s;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f74029t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Integer f74030u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ ArrayList f74031v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Integer f74032w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t5(ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, ArrayList arrayList4, ke keVar, int i5, int i11, k0.g2 g2Var, z2.w1 w1Var, int i12, int i13, Integer num, ArrayList arrayList5, Integer num2) {
        super(1);
        this.f74021j = arrayList;
        this.f74022k = arrayList2;
        this.f74023l = arrayList3;
        this.f74024m = arrayList4;
        this.n = keVar;
        this.o = i5;
        this.f74025p = i11;
        this.f74026q = g2Var;
        this.f74027r = w1Var;
        this.f74028s = i12;
        this.f74029t = i13;
        this.f74030u = num;
        this.f74031v = arrayList5;
        this.f74032w = num2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5;
        z2.h1 h1Var = (z2.h1) obj;
        ArrayList arrayList = this.f74021j;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            h1Var.i((z2.i1) arrayList.get(i11), 0, 0, 0.0f);
        }
        ArrayList arrayList2 = this.f74022k;
        int size2 = arrayList2.size();
        for (int i12 = 0; i12 < size2; i12++) {
            h1Var.i((z2.i1) arrayList2.get(i12), 0, 0, 0.0f);
        }
        ArrayList arrayList3 = this.f74023l;
        int size3 = arrayList3.size();
        int i13 = 0;
        while (true) {
            i5 = this.f74028s;
            if (i13 >= size3) {
                break;
            }
            z2.i1 i1Var = (z2.i1) arrayList3.get(i13);
            int i14 = (this.o - this.f74025p) / 2;
            z2.w1 w1Var = this.f74027r;
            h1Var.i(i1Var, this.f74026q.a(w1Var, w1Var.getLayoutDirection()) + i14, i5 - this.f74029t, 0.0f);
            i13++;
        }
        ArrayList arrayList4 = this.f74024m;
        int size4 = arrayList4.size();
        for (int i15 = 0; i15 < size4; i15++) {
            z2.i1 i1Var2 = (z2.i1) arrayList4.get(i15);
            Integer num = this.f74030u;
            h1Var.i(i1Var2, 0, i5 - (num != null ? num.intValue() : 0), 0.0f);
        }
        ke keVar = this.n;
        if (keVar != null) {
            ArrayList arrayList5 = this.f74031v;
            int size5 = arrayList5.size();
            for (int i16 = 0; i16 < size5; i16++) {
                z2.i1 i1Var3 = (z2.i1) arrayList5.get(i16);
                int i17 = keVar.f32738b;
                Integer num2 = this.f74032w;
                Intrinsics.d(num2);
                h1Var.i(i1Var3, i17, i5 - num2.intValue(), 0.0f);
            }
        }
        return Unit.f71706a;
    }
}
