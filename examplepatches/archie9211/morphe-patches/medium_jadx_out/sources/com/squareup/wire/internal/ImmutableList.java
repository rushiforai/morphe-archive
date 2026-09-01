package com.squareup.wire.internal;

import defpackage.k1;
import j$.util.DesugarCollections;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.RandomAccess;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u00022\u00060\u0003j\u0002`\u00042\u00060\u0005j\u0002`\u0006B\u0015\u0012\f\u0010\b\u001a\b\u0012\u0004\u0012\u00028\u00000\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\f\u0010\rJ\u0018\u0010\u0010\u001a\u00028\u00002\u0006\u0010\u000f\u001a\u00020\u000eH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u0017\u0010\u0013\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b0\u0012H\u0014¢\u0006\u0004\b\u0013\u0010\u0014R&\u0010\b\u001a\u0014\u0012\f\u0012\n \u0016*\u0004\u0018\u00018\u00008\u00000\u0015j\u0002`\u00178\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u0018R\u0014\u0010\u001b\u001a\u00020\u000e8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001a¨\u0006\u001c"}, d2 = {"Lcom/squareup/wire/internal/ImmutableList;", "T", "Lk1;", "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "Ljava/io/Serializable;", "Lcom/squareup/wire/internal/Serializable;", "", "list", "<init>", "(Ljava/util/List;)V", "", "writeReplace", "()Ljava/lang/Object;", "", "index", "get", "(I)Ljava/lang/Object;", "", "toArray", "()[Ljava/lang/Object;", "Ljava/util/ArrayList;", "kotlin.jvm.PlatformType", "Lkotlin/collections/ArrayList;", "Ljava/util/ArrayList;", "getSize", "()I", "size", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ImmutableList<T> extends k1 implements RandomAccess, Serializable {
    private final ArrayList<T> list;

    public ImmutableList(List<? extends T> list) {
        list.getClass();
        this.list = new ArrayList<>(list);
    }

    private final Object writeReplace() {
        List listUnmodifiableList = DesugarCollections.unmodifiableList(this.list);
        listUnmodifiableList.getClass();
        return listUnmodifiableList;
    }

    @Override // java.util.List
    public final T get(int index) {
        return this.list.get(index);
    }

    @Override // defpackage.t0
    public final int getSize() {
        return this.list.size();
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final Object[] toArray() {
        return this.list.toArray(new Object[0]);
    }
}
