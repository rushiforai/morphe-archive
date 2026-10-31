package bk;

import android.graphics.Canvas;
import android.graphics.Matrix;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class m extends s {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ArrayList f18028c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Matrix f18029d;

    public m(ArrayList arrayList, Matrix matrix) {
        this.f18028c = arrayList;
        this.f18029d = matrix;
    }

    @Override // bk.s
    public final void a(Matrix matrix, ak.a aVar, int i5, Canvas canvas) {
        Iterator it = this.f18028c.iterator();
        while (it.hasNext()) {
            ((s) it.next()).a(this.f18029d, aVar, i5, canvas);
        }
    }
}
