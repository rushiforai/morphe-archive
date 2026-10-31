package ke;

import androidx.recyclerview.widget.u1;
import fe.i0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.io.InterruptedIOException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class g implements k {

    /* renamed from: b, reason: collision with root package name */
    public final vf.h f71396b;

    /* renamed from: c, reason: collision with root package name */
    public final long f71397c;

    /* renamed from: d, reason: collision with root package name */
    public long f71398d;

    /* renamed from: f, reason: collision with root package name */
    public int f71400f;

    /* renamed from: g, reason: collision with root package name */
    public int f71401g;

    /* renamed from: e, reason: collision with root package name */
    public byte[] f71399e = new byte[SQLiteDatabase.OPEN_FULLMUTEX];

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f71395a = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];

    static {
        i0.a("goog.exo.extractor");
    }

    public g(vf.h hVar, long j11, long j12) {
        this.f71396b = hVar;
        this.f71398d = j11;
        this.f71397c = j12;
    }

    public final boolean a(int i5, boolean z11) throws EOFException, InterruptedIOException {
        h(i5);
        int i11 = this.f71401g - this.f71400f;
        while (i11 < i5) {
            int i12 = i5;
            boolean z12 = z11;
            i11 = i(this.f71399e, this.f71400f, i12, i11, z12);
            if (i11 == -1) {
                return false;
            }
            this.f71401g = this.f71400f + i11;
            i5 = i12;
            z11 = z12;
        }
        this.f71400f += i5;
        return true;
    }

    @Override // ke.k
    public final void b(int i5, int i11, byte[] bArr) {
        d(bArr, i5, i11, false);
    }

    @Override // ke.k
    public final int c(int i5, int i11, byte[] bArr) throws EOFException, InterruptedIOException {
        g gVar;
        int iMin;
        h(i11);
        int i12 = this.f71401g;
        int i13 = this.f71400f;
        int i14 = i12 - i13;
        if (i14 == 0) {
            gVar = this;
            iMin = gVar.i(this.f71399e, i13, i11, 0, true);
            if (iMin == -1) {
                return -1;
            }
            gVar.f71401g += iMin;
        } else {
            gVar = this;
            iMin = Math.min(i11, i14);
        }
        System.arraycopy(gVar.f71399e, gVar.f71400f, bArr, i5, iMin);
        gVar.f71400f += iMin;
        return iMin;
    }

    @Override // ke.k
    public final boolean d(byte[] bArr, int i5, int i11, boolean z11) {
        if (!a(i11, z11)) {
            return false;
        }
        System.arraycopy(this.f71399e, this.f71400f - i11, bArr, i5, i11);
        return true;
    }

    @Override // ke.k
    public final void e() {
        this.f71400f = 0;
    }

    @Override // ke.k
    public final boolean f(byte[] bArr, int i5, int i11, boolean z11) throws EOFException, InterruptedIOException {
        int iMin;
        int i12 = this.f71401g;
        if (i12 == 0) {
            iMin = 0;
        } else {
            iMin = Math.min(i12, i11);
            System.arraycopy(this.f71399e, 0, bArr, i5, iMin);
            j(iMin);
        }
        int i13 = iMin;
        while (i13 < i11 && i13 != -1) {
            i13 = i(bArr, i5, i11, i13, z11);
        }
        if (i13 != -1) {
            this.f71398d += i13;
        }
        return i13 != -1;
    }

    @Override // ke.k
    public final long g() {
        return this.f71398d + this.f71400f;
    }

    @Override // ke.k
    public final long getLength() {
        return this.f71397c;
    }

    @Override // ke.k
    public final long getPosition() {
        return this.f71398d;
    }

    public final void h(int i5) {
        int i11 = this.f71400f + i5;
        byte[] bArr = this.f71399e;
        if (i11 > bArr.length) {
            this.f71399e = Arrays.copyOf(this.f71399e, wf.v.h(bArr.length * 2, SQLiteDatabase.OPEN_FULLMUTEX + i11, i11 + 524288));
        }
    }

    public final int i(byte[] bArr, int i5, int i11, int i12, boolean z11) throws EOFException, InterruptedIOException {
        if (Thread.interrupted()) {
            throw new InterruptedIOException();
        }
        int i13 = this.f71396b.read(bArr, i5 + i12, i11 - i12);
        if (i13 != -1) {
            return i12 + i13;
        }
        if (i12 == 0 && z11) {
            return -1;
        }
        throw new EOFException();
    }

    public final void j(int i5) {
        int i11 = this.f71401g - i5;
        this.f71401g = i11;
        this.f71400f = 0;
        byte[] bArr = this.f71399e;
        byte[] bArr2 = i11 < bArr.length - 524288 ? new byte[SQLiteDatabase.OPEN_FULLMUTEX + i11] : bArr;
        System.arraycopy(bArr, i5, bArr2, 0, i11);
        this.f71399e = bArr2;
    }

    @Override // ke.k
    public final void k(int i5) throws EOFException, InterruptedIOException {
        a(i5, false);
    }

    @Override // ke.k
    public final int l(int i5) throws EOFException, InterruptedIOException {
        g gVar;
        int iMin = Math.min(this.f71401g, i5);
        j(iMin);
        if (iMin == 0) {
            byte[] bArr = this.f71395a;
            gVar = this;
            iMin = gVar.i(bArr, 0, Math.min(i5, bArr.length), 0, true);
        } else {
            gVar = this;
        }
        if (iMin != -1) {
            gVar.f71398d += iMin;
        }
        return iMin;
    }

    @Override // ke.k
    public final void m(int i5) throws EOFException, InterruptedIOException {
        int iMin = Math.min(this.f71401g, i5);
        j(iMin);
        int i11 = iMin;
        while (i11 < i5 && i11 != -1) {
            byte[] bArr = this.f71395a;
            i11 = i(bArr, -i11, Math.min(i5, bArr.length + i11), i11, false);
        }
        if (i11 != -1) {
            this.f71398d += i11;
        }
    }

    @Override // vf.h
    public final int read(byte[] bArr, int i5, int i11) throws EOFException, InterruptedIOException {
        g gVar;
        int i12 = this.f71401g;
        int i13 = 0;
        if (i12 != 0) {
            int iMin = Math.min(i12, i11);
            System.arraycopy(this.f71399e, 0, bArr, i5, iMin);
            j(iMin);
            i13 = iMin;
        }
        if (i13 == 0) {
            gVar = this;
            i13 = gVar.i(bArr, i5, i11, 0, true);
        } else {
            gVar = this;
        }
        if (i13 != -1) {
            gVar.f71398d += i13;
        }
        return i13;
    }

    @Override // ke.k
    public final void readFully(byte[] bArr, int i5, int i11) throws EOFException, InterruptedIOException {
        f(bArr, i5, i11, false);
    }
}
