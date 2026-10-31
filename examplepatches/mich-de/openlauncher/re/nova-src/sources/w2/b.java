package w2;

import b.u4;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93643a;

    /* renamed from: b, reason: collision with root package name */
    public int f93644b;

    /* renamed from: c, reason: collision with root package name */
    public long[] f93645c;

    public b(int i5) {
        this.f93643a = i5;
        switch (i5) {
            case 1:
                this.f93645c = new long[32];
                break;
            default:
                this.f93645c = new long[2];
                break;
        }
    }

    public final void a(long j11) {
        switch (this.f93643a) {
            case 0:
                if (!c(j11)) {
                    int i5 = this.f93644b;
                    long[] jArrCopyOf = this.f93645c;
                    if (i5 >= jArrCopyOf.length) {
                        jArrCopyOf = Arrays.copyOf(jArrCopyOf, Math.max(i5 + 1, jArrCopyOf.length * 2));
                        Intrinsics.f(jArrCopyOf, "copyOf(...)");
                        this.f93645c = jArrCopyOf;
                    }
                    jArrCopyOf[i5] = j11;
                    if (i5 >= this.f93644b) {
                        this.f93644b = i5 + 1;
                        break;
                    }
                }
                break;
            default:
                int i11 = this.f93644b;
                long[] jArr = this.f93645c;
                if (i11 == jArr.length) {
                    this.f93645c = Arrays.copyOf(jArr, i11 * 2);
                }
                long[] jArr2 = this.f93645c;
                int i12 = this.f93644b;
                this.f93644b = i12 + 1;
                jArr2[i12] = j11;
                break;
        }
    }

    public void b() {
        this.f93644b = 0;
    }

    public boolean c(long j11) {
        int i5 = this.f93644b;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f93645c[i11] == j11) {
                return true;
            }
        }
        return false;
    }

    public long d(int i5) {
        if (i5 >= 0 && i5 < this.f93644b) {
            return this.f93645c[i5];
        }
        StringBuilder sbJ = u4.j(i5, "Invalid index ", ", size is ");
        sbJ.append(this.f93644b);
        throw new IndexOutOfBoundsException(sbJ.toString());
    }

    public long e(int i5) {
        return this.f93645c[i5];
    }

    public int f() {
        return this.f93644b;
    }

    public boolean g() {
        return this.f93644b == 0;
    }

    public void h(long j11) {
        int i5 = this.f93644b;
        int i11 = 0;
        while (i11 < i5) {
            if (j11 == this.f93645c[i11]) {
                int i12 = this.f93644b - 1;
                while (i11 < i12) {
                    long[] jArr = this.f93645c;
                    int i13 = i11 + 1;
                    jArr[i11] = jArr[i13];
                    i11 = i13;
                }
                this.f93644b--;
                return;
            }
            i11++;
        }
    }

    public void i(int i5) {
        int i11 = this.f93644b;
        if (i5 < i11) {
            int i12 = i11 - 1;
            while (i5 < i12) {
                long[] jArr = this.f93645c;
                int i13 = i5 + 1;
                jArr[i5] = jArr[i13];
                i5 = i13;
            }
            this.f93644b--;
        }
    }
}
