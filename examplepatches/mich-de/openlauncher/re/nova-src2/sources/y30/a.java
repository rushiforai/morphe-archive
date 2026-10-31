package y30;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.Closeable;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a implements Closeable {

    /* renamed from: g, reason: collision with root package name */
    public static final int f96621g;

    /* renamed from: a, reason: collision with root package name */
    public final RandomAccessFile f96622a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f96623b;

    /* renamed from: c, reason: collision with root package name */
    public int f96624c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f96625d;

    /* renamed from: e, reason: collision with root package name */
    public int[] f96626e;

    /* renamed from: f, reason: collision with root package name */
    public long f96627f;

    static {
        UInt.Companion companion = UInt.f71696b;
        f96621g = -616267775;
    }

    public a(RandomAccessFile randomAccessFile) {
        this.f96622a = randomAccessFile;
    }

    public final UByte a(int i5) {
        long j11;
        int i11;
        byte b11;
        if (!this.f96623b) {
            b();
        }
        int i12 = this.f96624c;
        int i13 = i12 & 1;
        UInt.Companion companion = UInt.f71696b;
        int i14 = 65535;
        int i15 = i13 != 0 ? (i5 >>> 16) & 65535 : (i5 >>> 24) & 255;
        UByte uByte = null;
        if (i15 > 0) {
            int[] iArr = this.f96626e;
            if (iArr == null) {
                Intrinsics.m("offsets");
                throw null;
            }
            j11 = iArr[i15 - 1];
        } else {
            j11 = 0;
        }
        int[] iArr2 = this.f96626e;
        if (iArr2 == null) {
            Intrinsics.m("offsets");
            throw null;
        }
        long j12 = iArr2[i15];
        int i16 = -16777216;
        int i17 = (i12 & 1) != 0 ? ((-65536) & i5) >>> 16 : (i5 & (-16777216)) >>> 24;
        ByteBuffer byteBufferOrder = ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN);
        Intrinsics.f(byteBufferOrder, "order(...)");
        int i18 = (this.f96624c & 1) != 0 ? 3 : 4;
        while (j11 <= j12) {
            int i19 = i16;
            int i21 = i14;
            long j13 = ((j12 - j11) / 2) + j11;
            UByte uByte2 = uByte;
            long j14 = j11;
            long j15 = (i18 * j13) + this.f96627f;
            RandomAccessFile randomAccessFile = this.f96622a;
            randomAccessFile.seek(j15);
            int i22 = this.f96624c & 1;
            UInt.Companion companion2 = UInt.f71696b;
            if (i22 != 0) {
                v4.a.a(randomAccessFile, byteBufferOrder, 3);
                byteBufferOrder.put((byte) 0);
                int i23 = byteBufferOrder.getInt();
                i11 = (i23 & i21) | (i17 << 16);
                b11 = (byte) ((i23 & 16711680) >> 16);
                UByte.Companion companion3 = UByte.f71693b;
            } else {
                v4.a.a(randomAccessFile, byteBufferOrder, byteBufferOrder.limit());
                int i24 = byteBufferOrder.getInt();
                i11 = (16777215 & i24) | (i17 << 24);
                b11 = (byte) ((i24 & i19) >> 24);
                UByte.Companion companion4 = UByte.f71693b;
            }
            if (i11 == i5) {
                return new UByte(b11);
            }
            if (Integer.compareUnsigned(i11, i5) < 0) {
                j11 = j13 + 1;
                uByte = uByte2;
                i14 = i21;
                i16 = i19;
            } else {
                j12 = j13 - 1;
                uByte = uByte2;
                i14 = i21;
                i16 = i19;
                j11 = j14;
            }
        }
        return uByte;
    }

    public final void b() {
        if (this.f96623b) {
            throw new IllegalStateException();
        }
        ByteBuffer byteBufferOrder = ByteBuffer.allocate(1024).order(ByteOrder.LITTLE_ENDIAN);
        Intrinsics.d(byteBufferOrder);
        RandomAccessFile randomAccessFile = this.f96622a;
        v4.a.a(randomAccessFile, byteBufferOrder, 16);
        ByteOrder BIG_ENDIAN = ByteOrder.BIG_ENDIAN;
        Intrinsics.f(BIG_ENDIAN, "BIG_ENDIAN");
        ByteOrder byteOrderOrder = byteBufferOrder.order();
        byteBufferOrder.order(BIG_ENDIAN);
        try {
            int i5 = byteBufferOrder.getInt();
            byteBufferOrder.order(byteOrderOrder);
            UInt.Companion companion = UInt.f71696b;
            if (i5 != f96621g) {
                throw new IllegalStateException("File doesn't have magic header");
            }
            this.f96625d = byteBufferOrder.getInt();
            this.f96624c = byteBufferOrder.getInt();
            byteBufferOrder.getInt();
            int i11 = 0;
            if ((this.f96624c & 1) != 0) {
                this.f96626e = new int[SQLiteDatabase.OPEN_FULLMUTEX];
                int i12 = 0;
                for (int i13 = 0; i13 < 256; i13++) {
                    v4.a.a(randomAccessFile, byteBufferOrder, 1024);
                    int i14 = 0;
                    while (i14 < 256) {
                        int[] iArr = this.f96626e;
                        if (iArr == null) {
                            Intrinsics.m("offsets");
                            throw null;
                        }
                        iArr[i12] = byteBufferOrder.getInt();
                        i14++;
                        i12++;
                    }
                }
            } else {
                this.f96626e = new int[256];
                v4.a.a(randomAccessFile, byteBufferOrder, 1024);
                int i15 = 0;
                while (i11 < 256) {
                    int[] iArr2 = this.f96626e;
                    if (iArr2 == null) {
                        Intrinsics.m("offsets");
                        throw null;
                    }
                    iArr2[i15] = byteBufferOrder.getInt();
                    i11++;
                    i15++;
                }
            }
            this.f96623b = true;
            this.f96627f = randomAccessFile.getFilePointer();
        } catch (Throwable th2) {
            byteBufferOrder.order(byteOrderOrder);
            throw th2;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f96622a.close();
    }
}
