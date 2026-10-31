package jy;

import i2.a0;
import i2.s0;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import z2.h1;
import z2.i1;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70489a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ArrayList f70490b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f70491c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ArrayList f70492d;

    public /* synthetic */ i(int i5, int i11, ArrayList arrayList, ArrayList arrayList2) {
        this.f70489a = i11;
        switch (i11) {
            case 1:
                break;
            default:
                float f11 = k.f70493a;
                break;
        }
        this.f70490b = arrayList;
        this.f70491c = i5;
        this.f70492d = arrayList2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f70489a;
        ArrayList arrayList = this.f70492d;
        int i11 = this.f70491c;
        ArrayList arrayList2 = this.f70490b;
        switch (i5) {
            case 0:
                float f11 = k.f70493a;
                h1 h1Var = (h1) obj;
                int i12 = 0;
                for (Object obj2 : arrayList2) {
                    int i13 = i12 + 1;
                    if (i12 < 0) {
                        ul.b.e0();
                        throw null;
                    }
                    List list = (List) obj2;
                    int size = list.size();
                    int[] iArr = new int[size];
                    int i14 = 0;
                    while (i14 < size) {
                        iArr[i14] = ((i1) list.get(i14)).f98081a + (i14 < ul.b.K(list) ? h1Var.mo96roundToPx0680j_4(f11) : 0);
                        i14++;
                    }
                    k0.g gVar = k0.k.f70655a;
                    int[] iArr2 = new int[size];
                    for (int i15 = 0; i15 < size; i15++) {
                        iArr2[i15] = 0;
                    }
                    k0.k.c(i11, iArr, iArr2, false);
                    int i16 = 0;
                    for (Object obj3 : list) {
                        int i17 = i16 + 1;
                        if (i16 < 0) {
                            ul.b.e0();
                            throw null;
                        }
                        h1Var.i((i1) obj3, iArr2[i16], ((Number) arrayList.get(i12)).intValue(), 0.0f);
                        i16 = i17;
                    }
                    i12 = i13;
                }
                return Unit.f71706a;
            default:
                s0 s0Var = (s0) ((a0) obj);
                s0Var.a(((Number) arrayList2.get(i11)).floatValue());
                s0Var.t(((Number) arrayList.get(i11)).floatValue());
                return Unit.f71706a;
        }
    }
}
