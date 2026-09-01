package defpackage;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.Stack;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class g21 implements Iterable {
    public static final c57 a = new c57(new byte[0]);

    public static g21 d(Iterator it2, int i) {
        if (i == 1) {
            return (g21) it2.next();
        }
        int i2 = i >>> 1;
        return d(it2, i2).e(d(it2, i - i2));
    }

    public static e21 s() {
        return new e21(0);
    }

    public final g21 e(g21 g21Var) {
        int size = size();
        int size2 = g21Var.size();
        if (((long) size) + ((long) size2) >= 2147483647L) {
            StringBuilder sb = new StringBuilder(53);
            sb.append("ByteString would be too long: ");
            sb.append(size);
            sb.append("+");
            sb.append(size2);
            throw new IllegalArgumentException(sb.toString());
        }
        int[] iArr = tlb.h;
        tlb tlbVar = this instanceof tlb ? (tlb) this : null;
        if (g21Var.size() == 0) {
            return this;
        }
        if (size() == 0) {
            return g21Var;
        }
        int size3 = g21Var.size() + size();
        if (size3 < 128) {
            int size4 = size();
            int size5 = g21Var.size();
            byte[] bArr = new byte[size4 + size5];
            f(0, 0, size4, bArr);
            g21Var.f(0, size4, size5, bArr);
            return new c57(bArr);
        }
        if (tlbVar != null) {
            g21 g21Var2 = tlbVar.d;
            if (g21Var.size() + g21Var2.size() < 128) {
                int size6 = g21Var2.size();
                int size7 = g21Var.size();
                byte[] bArr2 = new byte[size6 + size7];
                g21Var2.f(0, 0, size6, bArr2);
                g21Var.f(0, size6, size7, bArr2);
                return new tlb(tlbVar.c, new c57(bArr2));
            }
        }
        if (tlbVar != null) {
            g21 g21Var3 = tlbVar.d;
            g21 g21Var4 = tlbVar.c;
            if (g21Var4.p() > g21Var3.p() && tlbVar.f > g21Var.p()) {
                return new tlb(g21Var4, new tlb(g21Var3, g21Var));
            }
        }
        if (size3 >= tlb.h[Math.max(p(), g21Var.p()) + 1]) {
            return new tlb(this, g21Var);
        }
        qlb qlbVar = new qlb();
        qlbVar.a = new Stack();
        qlbVar.f(this);
        qlbVar.f(g21Var);
        Stack stack = (Stack) qlbVar.a;
        g21 tlbVar2 = (g21) stack.pop();
        while (!stack.isEmpty()) {
            tlbVar2 = new tlb((g21) stack.pop(), tlbVar2);
        }
        return tlbVar2;
    }

    public final void f(int i, int i2, int i3, byte[] bArr) {
        if (i < 0) {
            ay0.c(30, i, "Source offset < 0: ");
            return;
        }
        if (i2 < 0) {
            ay0.c(30, i2, "Target offset < 0: ");
            return;
        }
        if (i3 < 0) {
            ay0.c(23, i3, "Length < 0: ");
            return;
        }
        int i4 = i + i3;
        if (i4 > size()) {
            ay0.c(34, i4, "Source end offset < 0: ");
            return;
        }
        int i5 = i2 + i3;
        if (i5 > bArr.length) {
            ay0.c(34, i5, "Target end offset < 0: ");
        } else if (i3 > 0) {
            m(i, i2, i3, bArr);
        }
    }

    public abstract void m(int i, int i2, int i3, byte[] bArr);

    public abstract int p();

    public abstract boolean q();

    public abstract boolean r();

    public abstract int size();

    public abstract int t(int i, int i2, int i3);

    public final String toString() {
        return String.format("<ByteString@%s size=%d>", Integer.toHexString(System.identityHashCode(this)), Integer.valueOf(size()));
    }

    public abstract int u(int i, int i2, int i3);

    public abstract int v();

    public abstract String w();

    public final String x() {
        try {
            return w();
        } catch (UnsupportedEncodingException e) {
            lg8.p("UTF-8 not supported?", e);
            return null;
        }
    }

    public abstract void y(OutputStream outputStream, int i, int i2);
}
