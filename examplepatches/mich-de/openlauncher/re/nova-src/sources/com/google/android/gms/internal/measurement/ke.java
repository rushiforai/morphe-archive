package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ke {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32737a;

    /* renamed from: b, reason: collision with root package name */
    public int f32738b;

    /* renamed from: c, reason: collision with root package name */
    public int f32739c;

    public ke(int i5) {
        this.f32737a = 0;
        this.f32738b = 2;
        this.f32739c = i5;
    }

    public void a(boolean z11, boolean z12, int i5, ke keVar) {
        keVar.f32738b = z11 ? this.f32738b + i5 : this.f32738b;
        int i11 = this.f32739c;
        if (z12) {
            i11 += i5;
        }
        keVar.f32739c = i11;
    }

    public int b(boolean z11, boolean z12, int i5, int i11, int i12, int i13, ke keVar) {
        int iD;
        int iD2;
        a(z11, z12, i5, keVar);
        if (keVar.f32738b < 0) {
            keVar.f32738b = 0;
        }
        if (keVar.f32739c > i13) {
            keVar.f32739c = i13;
        }
        if (keVar.d() < i11) {
            if (z11) {
                keVar.f32738b = keVar.f32739c - i11;
            } else if (z12) {
                keVar.f32739c = keVar.f32738b + i11;
            }
        }
        if (keVar.d() > i12) {
            if (z11) {
                keVar.f32738b = keVar.f32739c - i12;
            } else if (z12) {
                keVar.f32739c = keVar.f32738b + i12;
            }
        }
        if (z12) {
            iD = keVar.d();
            iD2 = d();
        } else {
            iD = d();
            iD2 = keVar.d();
        }
        return iD - iD2;
    }

    public int c() {
        int i5 = this.f32739c;
        if (i5 == 2) {
            return 10;
        }
        if (i5 == 5) {
            return 11;
        }
        if (i5 == 29) {
            return 12;
        }
        if (i5 == 42) {
            return 16;
        }
        if (i5 != 22) {
            return i5 != 23 ? 0 : 15;
        }
        return 1073741824;
    }

    public int d() {
        return this.f32739c - this.f32738b;
    }

    public String toString() {
        switch (this.f32737a) {
            case 6:
                StringBuilder sb2 = new StringBuilder("MutableRange(start=");
                sb2.append(this.f32738b);
                sb2.append(", end=");
                return a2.c.m(sb2, this.f32739c, ')');
            default:
                return super.toString();
        }
    }

    public /* synthetic */ ke(int i5, int i11, int i12) {
        this.f32737a = i12;
        this.f32738b = i5;
        this.f32739c = i11;
    }
}
