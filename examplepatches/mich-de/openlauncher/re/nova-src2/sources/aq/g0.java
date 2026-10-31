package aq;

import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f15462a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f15463b = new ArrayDeque();

    /* renamed from: c, reason: collision with root package name */
    public boolean f15464c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ h0 f15465d;

    public g0(h0 h0Var) {
        this.f15465d = h0Var;
    }

    public final IllegalArgumentException a(IllegalArgumentException illegalArgumentException) {
        if (!this.f15464c) {
            this.f15464c = true;
            ArrayDeque arrayDeque = this.f15463b;
            if (arrayDeque.size() != 1 || ((f0) arrayDeque.getFirst()).f15454b != null) {
                StringBuilder sb2 = new StringBuilder(illegalArgumentException.getMessage());
                Iterator itDescendingIterator = arrayDeque.descendingIterator();
                while (itDescendingIterator.hasNext()) {
                    f0 f0Var = (f0) itDescendingIterator.next();
                    sb2.append("\nfor ");
                    Type type = f0Var.f15453a;
                    String str = f0Var.f15454b;
                    sb2.append(type);
                    if (str != null) {
                        sb2.append(' ');
                        sb2.append(str);
                    }
                }
                return new IllegalArgumentException(sb2.toString(), illegalArgumentException);
            }
        }
        return illegalArgumentException;
    }

    public final void b(boolean z11) {
        this.f15463b.removeLast();
        if (this.f15463b.isEmpty()) {
            this.f15465d.f15471b.remove();
            if (z11) {
                synchronized (this.f15465d.f15472c) {
                    try {
                        int size = this.f15462a.size();
                        for (int i5 = 0; i5 < size; i5++) {
                            f0 f0Var = (f0) this.f15462a.get(i5);
                            r rVar = (r) this.f15465d.f15472c.put(f0Var.f15455c, f0Var.f15456d);
                            if (rVar != null) {
                                f0Var.f15456d = rVar;
                                this.f15465d.f15472c.put(f0Var.f15455c, rVar);
                            }
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
        }
    }
}
