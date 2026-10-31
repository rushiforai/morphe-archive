package com.google.android.gms.internal.measurement;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class m0 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Iterator f32808a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Iterator f32809b;

    public m0(s1 s1Var, Iterator it, Iterator it2) {
        this.f32808a = it;
        this.f32809b = it2;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.f32808a.hasNext()) {
            return true;
        }
        return this.f32809b.hasNext();
    }

    @Override // java.util.Iterator
    public final /* bridge */ /* synthetic */ Object next() {
        Iterator it = this.f32808a;
        if (it.hasNext()) {
            return new i6(((Integer) it.next()).toString());
        }
        Iterator it2 = this.f32809b;
        if (it2.hasNext()) {
            return new i6((String) it2.next());
        }
        throw new NoSuchElementException();
    }
}
