package com.google.android.gms.internal.consent_sdk;

import java.util.Iterator;

/* loaded from: classes.dex */
public final class u0 extends r0 {

    /* renamed from: h, reason: collision with root package name */
    public static final Object[] f32251h;

    /* renamed from: i, reason: collision with root package name */
    public static final u0 f32252i;

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f32253c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f32254d;

    /* renamed from: e, reason: collision with root package name */
    public final transient Object[] f32255e;

    /* renamed from: f, reason: collision with root package name */
    public final transient int f32256f;

    /* renamed from: g, reason: collision with root package name */
    public final transient int f32257g;

    static {
        Object[] objArr = new Object[0];
        f32251h = objArr;
        f32252i = new u0(objArr, 0, objArr, 0, 0);
    }

    public u0(Object[] objArr, int i5, Object[] objArr2, int i11, int i12) {
        this.f32253c = objArr;
        this.f32254d = i5;
        this.f32255e = objArr2;
        this.f32256f = i11;
        this.f32257g = i12;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final int b(Object[] objArr) {
        Object[] objArr2 = this.f32253c;
        int i5 = this.f32257g;
        System.arraycopy(objArr2, 0, objArr, 0, i5);
        return i5;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final int c() {
        return this.f32257g;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        if (obj == null) {
            return false;
        }
        Object[] objArr = this.f32255e;
        if (objArr.length == 0) {
            return false;
        }
        int iRotateLeft = (int) (Integer.rotateLeft((int) (obj.hashCode() * (-862048943)), 15) * 461845907);
        while (true) {
            int i5 = iRotateLeft & this.f32256f;
            Object obj2 = objArr[i5];
            if (obj2 == null) {
                return false;
            }
            if (obj2.equals(obj)) {
                return true;
            }
            iRotateLeft = i5 + 1;
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final int d() {
        return 0;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final Object[] e() {
        return this.f32253c;
    }

    @Override // com.google.android.gms.internal.consent_sdk.r0, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.f32254d;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        q0 q0VarG = this.f32222b;
        if (q0VarG == null) {
            q0VarG = q0.g(this.f32257g, this.f32253c);
            this.f32222b = q0VarG;
        }
        return q0VarG.listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f32257g;
    }
}
