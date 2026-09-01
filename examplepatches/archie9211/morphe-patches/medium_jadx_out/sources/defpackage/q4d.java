package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lq4d;", "Lu28;", "Lw4d;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class q4d extends u28 {
    public final Object b;
    public final Object c;
    public final PointerInputEventHandler d;

    public q4d(Object obj, Object obj2, PointerInputEventHandler pointerInputEventHandler, int i) {
        obj2 = (i & 2) != 0 ? null : obj2;
        this.b = obj;
        this.c = obj2;
        this.d = pointerInputEventHandler;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q4d)) {
            return false;
        }
        q4d q4dVar = (q4d) obj;
        return g76.L(this.b, q4dVar.b) && g76.L(this.c, q4dVar.c) && this.d == q4dVar.d;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new w4d(this.b, this.c, this.d);
    }

    public final int hashCode() {
        Object obj = this.b;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * 31;
        Object obj2 = this.c;
        return this.d.hashCode() + ((iHashCode + (obj2 != null ? obj2.hashCode() : 0)) * 961);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        w4d w4dVar = (w4d) q28Var;
        Object obj = w4dVar.o;
        Object obj2 = this.b;
        boolean z = !g76.L(obj, obj2);
        w4dVar.o = obj2;
        Object obj3 = w4dVar.p;
        Object obj4 = this.c;
        if (!g76.L(obj3, obj4)) {
            z = true;
        }
        w4dVar.p = obj4;
        Class<?> cls = w4dVar.q.getClass();
        PointerInputEventHandler pointerInputEventHandler = this.d;
        if (cls == pointerInputEventHandler.getClass() ? z : true) {
            w4dVar.K0();
        }
        w4dVar.q = pointerInputEventHandler;
    }
}
