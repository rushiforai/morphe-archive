package defpackage;

import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w38 {
    public final ArrayList a = new ArrayList();
    public final ArrayDeque b = new ArrayDeque();
    public boolean c;
    public final /* synthetic */ x38 d;

    public w38(x38 x38Var) {
        this.d = x38Var;
    }

    public final IllegalArgumentException a(IllegalArgumentException illegalArgumentException) {
        if (!this.c) {
            this.c = true;
            ArrayDeque arrayDeque = this.b;
            if (arrayDeque.size() != 1 || ((v38) arrayDeque.getFirst()).b != null) {
                StringBuilder sb = new StringBuilder(illegalArgumentException.getMessage());
                Iterator itDescendingIterator = arrayDeque.descendingIterator();
                while (itDescendingIterator.hasNext()) {
                    v38 v38Var = (v38) itDescendingIterator.next();
                    sb.append("\nfor ");
                    Type type = v38Var.a;
                    String str = v38Var.b;
                    sb.append(type);
                    if (str != null) {
                        sb.append(' ');
                        sb.append(str);
                    }
                }
                return new IllegalArgumentException(sb.toString(), illegalArgumentException);
            }
        }
        return illegalArgumentException;
    }

    public final void b(boolean z) {
        this.b.removeLast();
        if (this.b.isEmpty()) {
            this.d.c.remove();
            if (z) {
                synchronized (this.d.d) {
                    try {
                        int size = this.a.size();
                        for (int i = 0; i < size; i++) {
                            v38 v38Var = (v38) this.a.get(i);
                            jb6 jb6Var = (jb6) this.d.d.put(v38Var.c, v38Var.d);
                            if (jb6Var != null) {
                                v38Var.d = jb6Var;
                                this.d.d.put(v38Var.c, jb6Var);
                            }
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
            }
        }
    }
}
