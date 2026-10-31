package com.bytedance.sdk.component.ycx;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/* loaded from: classes2.dex */
public class wie<K, V> {
    private final Map<K, V> ycx = new HashMap();

    /* renamed from: zb, reason: collision with root package name */
    private final Map<V, Set<K>> f24141zb = new HashMap();

    public void ycx(Set<K> set, V v11) {
        for (K k11 : set) {
            if (this.ycx.containsKey(k11)) {
                zb(k11);
            }
        }
        Set<K> hashSet = this.f24141zb.get(v11);
        if (hashSet == null) {
            hashSet = new HashSet<>();
            this.f24141zb.put(v11, hashSet);
        }
        hashSet.addAll(set);
        Iterator<K> it = set.iterator();
        while (it.hasNext()) {
            this.ycx.put(it.next(), v11);
        }
    }

    public void zb(K k11) {
        Set<K> set;
        V vRemove = this.ycx.remove(k11);
        if (vRemove == null || (set = this.f24141zb.get(vRemove)) == null) {
            return;
        }
        set.remove(k11);
        if (set.isEmpty()) {
            this.f24141zb.remove(vRemove);
        }
    }

    public V ycx(K k11) {
        return this.ycx.get(k11);
    }

    public void ycx() {
        this.ycx.clear();
        this.f24141zb.clear();
    }
}
