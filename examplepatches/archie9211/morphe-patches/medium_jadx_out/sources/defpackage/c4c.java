package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c4c extends i4c {
    public final /* synthetic */ ArrayList c;
    public final /* synthetic */ Matrix d;

    public c4c(ArrayList arrayList, Matrix matrix) {
        this.c = arrayList;
        this.d = matrix;
    }

    @Override // defpackage.i4c
    public final void a(Matrix matrix, k3c k3cVar, int i, Canvas canvas) {
        Iterator it2 = this.c.iterator();
        while (it2.hasNext()) {
            ((i4c) it2.next()).a(this.d, k3cVar, i, canvas);
        }
    }
}
