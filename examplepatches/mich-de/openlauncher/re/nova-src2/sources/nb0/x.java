package nb0;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public final class x extends AtomicLong implements ib0.f, ib0.i {

    /* renamed from: a, reason: collision with root package name */
    public final z f78171a;

    /* renamed from: b, reason: collision with root package name */
    public final ib0.h f78172b;

    public x(z zVar, ib0.h hVar) {
        this.f78171a = zVar;
        this.f78172b = hVar;
        lazySet(-4611686018427387904L);
    }

    @Override // ib0.i
    public final boolean a() {
        return get() == Long.MIN_VALUE;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // ib0.i
    public final void b() throws Throwable {
        if (get() == Long.MIN_VALUE || getAndSet(Long.MIN_VALUE) == Long.MIN_VALUE) {
            return;
        }
        z zVar = this.f78171a;
        AtomicReference atomicReference = zVar.f78179h;
        loop0: while (true) {
            x[] xVarArr = (x[]) atomicReference.get();
            x[] xVarArr2 = z.f78174l;
            if (xVarArr != xVarArr2 && xVarArr != z.f78175m) {
                int length = xVarArr.length;
                int i5 = 0;
                while (true) {
                    if (i5 >= length) {
                        i5 = -1;
                        break;
                    } else if (xVarArr[i5].equals(this)) {
                        break;
                    } else {
                        i5++;
                    }
                }
                if (i5 < 0) {
                    break;
                }
                if (length != 1) {
                    xVarArr2 = new x[length - 1];
                    System.arraycopy(xVarArr, 0, xVarArr2, 0, i5);
                    System.arraycopy(xVarArr, i5 + 1, xVarArr2, i5, (length - i5) - 1);
                }
                while (!atomicReference.compareAndSet(xVarArr, xVarArr2)) {
                    if (atomicReference.get() != xVarArr) {
                        break;
                    }
                }
                break loop0;
            }
            break;
        }
        zVar.j();
    }

    @Override // ib0.f
    public final void j(long j11) throws Throwable {
        long j12;
        long j13;
        if (j11 < 0) {
            return;
        }
        do {
            j12 = get();
            if (j12 == Long.MIN_VALUE) {
                return;
            }
            if (j12 >= 0 && j11 == 0) {
                return;
            }
            if (j12 == -4611686018427387904L) {
                j13 = j11;
            } else {
                j13 = j12 + j11;
                if (j13 < 0) {
                    j13 = Long.MAX_VALUE;
                }
            }
        } while (!compareAndSet(j12, j13));
        this.f78171a.j();
    }
}
