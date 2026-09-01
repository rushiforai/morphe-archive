package com.drew.lang;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Iterables {
    public static <E> List<E> toList(Iterable<E> iterable) {
        ArrayList arrayList = new ArrayList();
        Iterator<E> it2 = iterable.iterator();
        while (it2.hasNext()) {
            arrayList.add(it2.next());
        }
        return arrayList;
    }

    public static <E> Set<E> toSet(Iterable<E> iterable) {
        HashSet hashSet = new HashSet();
        Iterator<E> it2 = iterable.iterator();
        while (it2.hasNext()) {
            hashSet.add(it2.next());
        }
        return hashSet;
    }
}
