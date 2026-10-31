package com.google.android.gms.internal.measurement;

import ads_mobile_sdk.jb1;
import java.util.AbstractList;

/* loaded from: classes3.dex */
public final class v1 extends AbstractList {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33122a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f33123b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f33124c;

    public /* synthetic */ v1(int i5, Object obj, Object obj2) {
        this.f33122a = i5;
        this.f33123b = obj;
        this.f33124c = obj2;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        switch (this.f33122a) {
            case 0:
                t1 t1Var = (t1) this.f33123b;
                u1 u1Var = (u1) this.f33124c;
                int iF = ((p1) t1Var).f(i5);
                ((k1) u1Var).getClass();
                l0 l0VarA = l0.a(iF);
                return l0VarA == null ? l0.UNKNOWN : l0VarA;
            default:
                b.u6 u6Var = (b.u6) this.f33124c;
                jb1 jb1Var = (jb1) ((b.j6) this.f33123b);
                jb1Var.d(i5);
                return u6Var.a(jb1Var.f5203b[i5]);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        switch (this.f33122a) {
            case 0:
                return ((t1) this.f33123b).size();
            default:
                return ((jb1) ((b.j6) this.f33123b)).f5204c;
        }
    }
}
