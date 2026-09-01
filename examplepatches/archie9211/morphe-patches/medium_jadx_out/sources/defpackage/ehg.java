package defpackage;

import j$.util.Objects;
import java.util.AbstractMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ehg extends mgg {
    public final /* synthetic */ ghg c;

    public ehg(ghg ghgVar) {
        this.c = ghgVar;
    }

    @Override // java.util.List
    public final /* synthetic */ Object get(int i) {
        ghg ghgVar = this.c;
        jq7.z(i, ghgVar.f);
        Object[] objArr = ghgVar.e;
        int i2 = i + i;
        Object obj = objArr[i2];
        Objects.requireNonNull(obj);
        Object obj2 = objArr[i2 + 1];
        Objects.requireNonNull(obj2);
        return new AbstractMap.SimpleImmutableEntry(obj, obj2);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c.f;
    }
}
