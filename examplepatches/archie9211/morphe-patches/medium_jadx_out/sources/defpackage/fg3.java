package defpackage;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fg3 implements Closeable {
    public final String a;
    public final long b;
    public final ArrayList c;
    public final /* synthetic */ lg3 d;

    public fg3(lg3 lg3Var, String str, long j, ArrayList arrayList, long[] jArr) {
        str.getClass();
        jArr.getClass();
        this.d = lg3Var;
        this.a = str;
        this.b = j;
        this.c = arrayList;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        Iterator it2 = this.c.iterator();
        while (it2.hasNext()) {
            egf.b((ikc) it2.next());
        }
    }
}
