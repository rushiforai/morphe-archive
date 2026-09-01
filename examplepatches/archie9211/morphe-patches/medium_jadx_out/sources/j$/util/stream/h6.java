package j$.util.stream;

import j$.util.Collection;
import j$.util.List;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class h6 extends z5 {
    public ArrayList d;

    @Override // java.util.function.Consumer
    /* JADX INFO: renamed from: accept */
    public final void n(Object obj) {
        this.d.add(obj);
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final void c(long j) {
        if (j < 2147483639) {
            this.d = j >= 0 ? new ArrayList((int) j) : new ArrayList();
        } else {
            j$.time.h.c("Stream size exceeds max array size");
        }
    }

    @Override // j$.util.stream.h5, j$.util.stream.l5
    public final void end() {
        List list = this.d;
        Comparator comparator = this.b;
        if (list instanceof j$.util.List) {
            ((j$.util.List) list).sort(comparator);
        } else {
            List.CC.$default$sort(list, comparator);
        }
        long size = this.d.size();
        l5 l5Var = this.a;
        l5Var.c(size);
        boolean z = this.c;
        ArrayList arrayList = this.d;
        if (z) {
            int size2 = arrayList.size();
            int i = 0;
            while (i < size2) {
                Object obj = arrayList.get(i);
                i++;
                if (l5Var.e()) {
                    break;
                } else {
                    l5Var.n(obj);
                }
            }
        } else {
            Objects.requireNonNull(l5Var);
            Collection.EL.a(arrayList, new j$.util.n(7, l5Var));
        }
        l5Var.end();
        this.d = null;
    }
}
