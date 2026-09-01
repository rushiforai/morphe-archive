package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ug3 {
    public List a;

    public ug3(ArrayList arrayList) {
        this.a = DesugarCollections.unmodifiableList(arrayList);
    }

    public ug3(List list) {
        this.a = list;
    }
}
