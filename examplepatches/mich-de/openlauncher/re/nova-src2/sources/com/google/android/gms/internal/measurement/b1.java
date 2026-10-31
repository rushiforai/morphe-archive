package com.google.android.gms.internal.measurement;

import ads_mobile_sdk.ob3;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class b1 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32399a = 1;

    /* renamed from: b, reason: collision with root package name */
    public int f32400b = -1;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f32401c;

    public b1(s1 s1Var) {
        this.f32401c = s1Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f32399a) {
            case 0:
                return this.f32400b < ((s1) this.f32401c).j();
            default:
                ob3 ob3Var = (ob3) this.f32401c;
                ob3Var.b$1();
                return this.f32400b + 1 < ob3Var.f7809b;
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f32399a) {
            case 0:
                s1 s1Var = (s1) this.f32401c;
                if (this.f32400b >= s1Var.j()) {
                    int i5 = this.f32400b;
                    throw new NoSuchElementException(b.c0.p(new StringBuilder(String.valueOf(i5).length() + 21), "Out of bounds index: ", i5));
                }
                int i11 = this.f32400b;
                this.f32400b = i11 + 1;
                return s1Var.k(i11);
            default:
                ob3 ob3Var = (ob3) this.f32401c;
                ob3Var.b$1();
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                Object[] objArr = ob3Var.f7808a;
                int i12 = this.f32400b + 1;
                this.f32400b = i12;
                if (objArr[i12] == null) {
                    return null;
                }
                throw new ClassCastException();
        }
    }

    public b1(ob3 ob3Var) {
        this.f32401c = ob3Var;
    }
}
