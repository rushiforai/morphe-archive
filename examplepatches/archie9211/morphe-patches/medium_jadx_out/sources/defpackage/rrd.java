package defpackage;

import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rrd implements Iterator, th6 {
    public final /* synthetic */ int a;
    public Iterator b;
    public final Object c;

    public rrd(srd srdVar) {
        this.a = 0;
        this.c = srdVar;
        this.b = srdVar.a.iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
        }
        return this.b.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                return ((srd) obj).b.invoke(this.b.next());
            default:
                Object next = this.b.next();
                ArrayList arrayList = (ArrayList) obj;
                View view = (View) next;
                ViewGroup viewGroup = view instanceof ViewGroup ? (ViewGroup) view : null;
                h1 h1Var = viewGroup != null ? new h1(7, viewGroup) : null;
                if (h1Var == null || !h1Var.hasNext()) {
                    while (!this.b.hasNext() && !arrayList.isEmpty()) {
                        this.b = (Iterator) bu1.H0(arrayList);
                        bu1.U0(arrayList);
                    }
                } else {
                    arrayList.add(this.b);
                    this.b = h1Var;
                }
                return next;
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public rrd(h1 h1Var) {
        this.a = 1;
        this.c = new ArrayList();
        this.b = h1Var;
    }
}
