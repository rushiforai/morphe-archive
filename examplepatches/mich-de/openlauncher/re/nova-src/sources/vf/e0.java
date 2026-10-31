package vf;

import h6.c1;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class e0 {

    /* renamed from: h, reason: collision with root package name */
    public static final com.google.firebase.crashlytics.internal.persistence.c f92655h = new com.google.firebase.crashlytics.internal.persistence.c(23);

    /* renamed from: i, reason: collision with root package name */
    public static final com.google.firebase.crashlytics.internal.persistence.c f92656i = new com.google.firebase.crashlytics.internal.persistence.c(24);

    /* renamed from: a, reason: collision with root package name */
    public final int f92657a;

    /* renamed from: e, reason: collision with root package name */
    public int f92661e;

    /* renamed from: f, reason: collision with root package name */
    public int f92662f;

    /* renamed from: g, reason: collision with root package name */
    public int f92663g;

    /* renamed from: c, reason: collision with root package name */
    public final d0[] f92659c = new d0[5];

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f92658b = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public int f92660d = -1;

    public e0(int i5) {
        this.f92657a = i5;
    }

    public final void a(float f11, int i5) {
        d0 d0Var;
        int i11 = this.f92660d;
        ArrayList arrayList = this.f92658b;
        if (i11 != 1) {
            Collections.sort(arrayList, f92655h);
            this.f92660d = 1;
        }
        int i12 = this.f92663g;
        d0[] d0VarArr = this.f92659c;
        if (i12 > 0) {
            int i13 = i12 - 1;
            this.f92663g = i13;
            d0Var = d0VarArr[i13];
        } else {
            d0Var = new d0();
        }
        int i14 = this.f92661e;
        this.f92661e = i14 + 1;
        d0Var.f92652a = i14;
        d0Var.f92653b = i5;
        d0Var.f92654c = f11;
        arrayList.add(d0Var);
        this.f92662f += i5;
        while (true) {
            int i15 = this.f92662f;
            int i16 = this.f92657a;
            if (i15 <= i16) {
                return;
            }
            int i17 = i15 - i16;
            d0 d0Var2 = (d0) arrayList.get(0);
            int i18 = d0Var2.f92653b;
            if (i18 <= i17) {
                this.f92662f -= i18;
                arrayList.remove(0);
                int i19 = this.f92663g;
                if (i19 < 5) {
                    this.f92663g = i19 + 1;
                    d0VarArr[i19] = d0Var2;
                }
            } else {
                d0Var2.f92653b = i18 - i17;
                this.f92662f -= i17;
            }
        }
    }

    public final float b() {
        int i5 = this.f92660d;
        ArrayList arrayList = this.f92658b;
        if (i5 != 0) {
            Collections.sort(arrayList, f92656i);
            this.f92660d = 0;
        }
        float f11 = 0.5f * this.f92662f;
        int i11 = 0;
        for (int i12 = 0; i12 < arrayList.size(); i12++) {
            d0 d0Var = (d0) arrayList.get(i12);
            i11 += d0Var.f92653b;
            if (i11 >= f11) {
                return d0Var.f92654c;
            }
        }
        if (arrayList.isEmpty()) {
            return Float.NaN;
        }
        return ((d0) c1.l(arrayList, 1)).f92654c;
    }
}
