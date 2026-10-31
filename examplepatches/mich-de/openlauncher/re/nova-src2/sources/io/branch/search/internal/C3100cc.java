package io.branch.search.internal;

import java.util.Comparator;

/* renamed from: io.branch.search.internal.cc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3100cc<T> implements Comparator {
    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.Comparator
    public final int compare(T t6, T t9) {
        return ab.e0.t(Long.valueOf(((Sb) t6).f63350b), Long.valueOf(((Sb) t9).f63350b));
    }
}
