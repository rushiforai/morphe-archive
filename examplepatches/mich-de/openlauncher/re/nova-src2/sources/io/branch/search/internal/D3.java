package io.branch.search.internal;

import java.util.Comparator;
import java.util.Map;

/* loaded from: classes4.dex */
public final class D3<T> implements Comparator {
    @Override // java.util.Comparator
    public final int compare(T t6, T t9) {
        return ab.e0.t((Long) ((Map.Entry) t6).getValue(), (Long) ((Map.Entry) t9).getValue());
    }
}
