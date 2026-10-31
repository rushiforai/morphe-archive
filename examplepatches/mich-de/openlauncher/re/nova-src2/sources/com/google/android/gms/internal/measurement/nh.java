package com.google.android.gms.internal.measurement;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class nh extends h {

    /* renamed from: e, reason: collision with root package name */
    public Object[] f32859e;

    /* renamed from: f, reason: collision with root package name */
    public int f32860f;

    @Override // com.google.android.gms.internal.measurement.h
    public final int a() {
        return this.f32860f;
    }

    @Override // com.google.android.gms.internal.measurement.h
    public final th h(int i5) {
        if (i5 < this.f32860f) {
            return (th) this.f32859e[i5 + i5];
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // com.google.android.gms.internal.measurement.h
    public final Object i(int i5) {
        if (i5 < this.f32860f) {
            return this.f32859e[i5 + i5 + 1];
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // com.google.android.gms.internal.measurement.h
    public final Object j(th thVar) {
        int iL = l(thVar);
        if (iL == -1) {
            return null;
        }
        return thVar.f33093b.cast(this.f32859e[iL + iL + 1]);
    }

    public final void k(th thVar, Object obj) {
        int iL;
        if (!thVar.f33094c && (iL = l(thVar)) != -1) {
            fb.b(obj, "metadata value");
            this.f32859e[iL + iL + 1] = obj;
            return;
        }
        int i5 = this.f32860f + 1;
        Object[] objArr = this.f32859e;
        int length = objArr.length;
        if (i5 + i5 > length) {
            this.f32859e = Arrays.copyOf(objArr, length + length);
        }
        Object[] objArr2 = this.f32859e;
        int i11 = this.f32860f;
        int i12 = i11 + i11;
        objArr2[i12] = thVar;
        fb.b(obj, "metadata value");
        objArr2[i12 + 1] = obj;
        this.f32860f++;
    }

    public final int l(th thVar) {
        for (int i5 = 0; i5 < this.f32860f; i5++) {
            if (this.f32859e[i5 + i5].equals(thVar)) {
                return i5;
            }
        }
        return -1;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Metadata{");
        for (int i5 = 0; i5 < this.f32860f; i5++) {
            sb2.append(" '");
            sb2.append(h(i5));
            sb2.append("': ");
            sb2.append(i(i5));
        }
        sb2.append(" }");
        return sb2.toString();
    }
}
