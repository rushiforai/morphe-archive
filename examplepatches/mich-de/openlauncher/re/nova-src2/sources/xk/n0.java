package xk;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class n0 extends t implements Serializable {

    /* renamed from: c, reason: collision with root package name */
    public transient k2 f95973c;

    /* renamed from: d, reason: collision with root package name */
    public transient long f95974d;

    public static n0 c() {
        n0 n0Var = new n0();
        n0Var.f95973c = new k2(100);
        return n0Var;
    }

    public final int b(int i5, Object obj) {
        k2 k2Var = this.f95973c;
        if (i5 == 0) {
            return k2Var.a(obj);
        }
        if (!(i5 > 0)) {
            throw new IllegalArgumentException(vk.b0.p("occurrences cannot be negative: %s", Integer.valueOf(i5)));
        }
        int iC = k2Var.c(obj);
        if (iC == -1) {
            k2Var.e(i5, obj);
            this.f95974d += i5;
            return 0;
        }
        int iB = k2Var.b(iC);
        long j11 = i5;
        long j12 = iB + j11;
        if (!(j12 <= 2147483647L)) {
            throw new IllegalArgumentException(vk.b0.p("too many occurrences: %s", Long.valueOf(j12)));
        }
        vk.b0.e(iC, k2Var.f95954c);
        k2Var.f95953b[iC] = (int) j12;
        this.f95974d += j11;
        return iB;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        k2 k2Var = this.f95973c;
        k2Var.f95955d++;
        Arrays.fill(k2Var.f95952a, 0, k2Var.f95954c, (Object) null);
        Arrays.fill(k2Var.f95953b, 0, k2Var.f95954c, 0);
        Arrays.fill(k2Var.f95956e, -1);
        Arrays.fill(k2Var.f95957f, -1L);
        k2Var.f95954c = 0;
        this.f95974d = 0L;
    }

    public final int d(int i5, Object obj) {
        k2 k2Var = this.f95973c;
        if (i5 == 0) {
            return k2Var.a(obj);
        }
        if (!(i5 > 0)) {
            throw new IllegalArgumentException(vk.b0.p("occurrences cannot be negative: %s", Integer.valueOf(i5)));
        }
        int iC = k2Var.c(obj);
        if (iC == -1) {
            return 0;
        }
        int iB = k2Var.b(iC);
        if (iB > i5) {
            vk.b0.e(iC, k2Var.f95954c);
            k2Var.f95953b[iC] = iB - i5;
        } else {
            k2Var.f(iC);
            i5 = iB;
        }
        this.f95974d -= i5;
        return iB;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new h2(this, ((s) entrySet()).iterator());
    }

    @Override // xk.f2
    public final int r0(Object obj) {
        return this.f95973c.a(obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        return ul.b.a0(this.f95974d);
    }
}
