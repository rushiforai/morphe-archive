package com.google.android.gms.internal.measurement;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class u5 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Iterator f33104a;

    public u5(Iterator it) {
        this.f33104a = it;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f33104a.hasNext();
    }

    @Override // java.util.Iterator
    public final /* bridge */ /* synthetic */ Object next() {
        return new i6((String) this.f33104a.next());
    }
}
