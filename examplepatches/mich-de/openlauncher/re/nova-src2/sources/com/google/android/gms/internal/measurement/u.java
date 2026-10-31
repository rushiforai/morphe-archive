package com.google.android.gms.internal.measurement;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class u implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33097a;

    /* renamed from: b, reason: collision with root package name */
    public int f33098b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Iterable f33099c;

    public /* synthetic */ u(Iterable iterable, int i5) {
        this.f33097a = i5;
        this.f33099c = iterable;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.f33097a) {
            case 0:
                int i5 = this.f33098b;
                v vVar = (v) this.f33099c;
                if (i5 < vVar.d() - vVar.c()) {
                }
                break;
            case 1:
                if (this.f33098b < ((ni) ((androidx.datastore.preferences.protobuf.e1) this.f33099c).f14313b).f32864e) {
                }
                break;
            default:
                if (this.f33098b < ((ya.p) this.f33099c).f97194b) {
                }
                break;
        }
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.f33097a) {
            case 0:
                int i5 = this.f33098b;
                v vVar = (v) this.f33099c;
                if (i5 >= vVar.d() - vVar.c()) {
                    throw new NoSuchElementException();
                }
                w wVar = vVar.f33119b;
                Object obj = wVar.f33165a[vVar.c() + i5];
                this.f33098b = i5 + 1;
                return obj;
            case 1:
                int i11 = this.f33098b;
                this.f33098b = i11 + 1;
                ni niVar = (ni) ((androidx.datastore.preferences.protobuf.e1) this.f33099c).f14313b;
                return niVar.d(niVar.f32863d[i11] & 31);
            default:
                ya.p pVar = (ya.p) this.f33099c;
                int i12 = this.f33098b;
                this.f33098b = i12 + 1;
                return Integer.valueOf(pVar.j(i12));
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.f33097a) {
            case 0:
                throw new UnsupportedOperationException();
            case 1:
                throw new UnsupportedOperationException();
            default:
                ya.p pVar = (ya.p) this.f33099c;
                int i5 = this.f33098b - 1;
                this.f33098b = i5;
                pVar.n(i5);
                return;
        }
    }
}
