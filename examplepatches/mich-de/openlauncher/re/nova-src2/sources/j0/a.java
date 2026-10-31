package j0;

import android.os.Parcel;
import i2.s;
import kotlin.ULong;
import w20.h;
import y3.p;
import y3.q;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public Parcel f68438a;

    public long a() {
        int i5 = s.n;
        long j11 = this.f68438a.readLong();
        long j12 = 63 & j11;
        if (j12 >= 16) {
            j11 = (j11 & (-64)) | (j12 + 1);
        }
        ULong.Companion companion = ULong.f71699b;
        return j11;
    }

    public long b() {
        Parcel parcel = this.f68438a;
        byte b11 = parcel.readByte();
        long j11 = b11 == 1 ? 4294967296L : b11 == 2 ? 8589934592L : 0L;
        return q.a(j11, 0L) ? p.f96617c : h.m(parcel.readFloat(), j11);
    }

    public void c(byte b11) {
        this.f68438a.writeByte(b11);
    }

    public void d(float f11) {
        this.f68438a.writeFloat(f11);
    }

    public void e(long j11) {
        long jB = p.b(j11);
        byte b11 = 0;
        if (!q.a(jB, 0L)) {
            if (q.a(jB, 4294967296L)) {
                b11 = 1;
            } else if (q.a(jB, 8589934592L)) {
                b11 = 2;
            }
        }
        c(b11);
        if (q.a(p.b(j11), 0L)) {
            return;
        }
        d(p.c(j11));
    }
}
