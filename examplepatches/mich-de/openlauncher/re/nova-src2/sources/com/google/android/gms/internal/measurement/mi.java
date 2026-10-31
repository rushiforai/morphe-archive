package com.google.android.gms.internal.measurement;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class mi implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32834a = 0;

    /* renamed from: b, reason: collision with root package name */
    public int f32835b;

    /* renamed from: c, reason: collision with root package name */
    public int f32836c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f32837d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f32838e;

    public /* synthetic */ mi(ni niVar, th thVar, int i5) {
        this.f32838e = niVar;
        this.f32837d = thVar;
        int i11 = i5 & 31;
        this.f32835b = i11;
        this.f32836c = i5 >>> (i11 + 5);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f32834a) {
            case 0:
                if (this.f32835b >= 0) {
                }
                break;
            default:
                if (this.f32836c < this.f32835b) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f32834a) {
            case 0:
                ni niVar = (ni) this.f32838e;
                int i5 = this.f32835b;
                h hVar = niVar.f32861b;
                int iA = hVar.a();
                Object objCast = ((th) this.f32837d).f33093b.cast(i5 >= iA ? niVar.f32862c.i(i5 - iA) : hVar.i(i5));
                int i11 = this.f32836c;
                if (i11 != 0) {
                    int iNumberOfTrailingZeros = Integer.numberOfTrailingZeros(i11) + 1;
                    this.f32836c >>>= iNumberOfTrailingZeros;
                    this.f32835b += iNumberOfTrailingZeros;
                } else {
                    this.f32835b = -1;
                }
                return objCast;
            default:
                int i12 = this.f32836c;
                if (i12 >= this.f32835b) {
                    throw new NoSuchElementException();
                }
                fa.t tVar = (fa.t) this.f32837d;
                this.f32836c = i12 + 1;
                return new ja0.a(((na0.a) this.f32838e).f78067d.f78068a, tVar);
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f32834a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    public mi(na0.a aVar, v6 v6Var, int i5, int i11) {
        this.f32838e = aVar;
        v6Var.getClass();
        this.f32837d = new fa.t(v6Var, i5);
        this.f32835b = i11;
    }
}
