package m90;

import b.u4;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.nio.charset.Charset;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class g implements i, h, Cloneable, ByteChannel {

    /* renamed from: a, reason: collision with root package name */
    public e0 f76125a;

    /* renamed from: b, reason: collision with root package name */
    public long f76126b;

    public final long A(long j11, j targetBytes) {
        Intrinsics.g(targetBytes, "targetBytes");
        long j12 = 0;
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "fromIndex < 0: ").toString());
        }
        e0 e0Var = this.f76125a;
        if (e0Var == null) {
            return -1L;
        }
        long j13 = this.f76126b;
        if (j13 - j11 < j11) {
            while (j13 > j11) {
                e0Var = e0Var.f76121g;
                Intrinsics.d(e0Var);
                j13 -= e0Var.f76117c - e0Var.f76116b;
            }
            if (targetBytes.c() == 2) {
                byte bJ = targetBytes.j(0);
                byte bJ2 = targetBytes.j(1);
                while (j13 < this.f76126b) {
                    byte[] bArr = e0Var.f76115a;
                    int i5 = e0Var.f76117c;
                    for (int i11 = (int) ((e0Var.f76116b + j11) - j13); i11 < i5; i11++) {
                        byte b11 = bArr[i11];
                        if (b11 == bJ || b11 == bJ2) {
                            return (i11 - e0Var.f76116b) + j13;
                        }
                    }
                    j13 += e0Var.f76117c - e0Var.f76116b;
                    e0Var = e0Var.f76120f;
                    Intrinsics.d(e0Var);
                    j11 = j13;
                }
            } else {
                byte[] bArrI = targetBytes.i();
                while (j13 < this.f76126b) {
                    byte[] bArr2 = e0Var.f76115a;
                    int i12 = e0Var.f76117c;
                    for (int i13 = (int) ((e0Var.f76116b + j11) - j13); i13 < i12; i13++) {
                        byte b12 = bArr2[i13];
                        for (byte b13 : bArrI) {
                            if (b12 == b13) {
                                return (i13 - e0Var.f76116b) + j13;
                            }
                        }
                    }
                    j13 += e0Var.f76117c - e0Var.f76116b;
                    e0Var = e0Var.f76120f;
                    Intrinsics.d(e0Var);
                    j11 = j13;
                }
            }
            return -1L;
        }
        while (true) {
            long j14 = (e0Var.f76117c - e0Var.f76116b) + j12;
            if (j14 > j11) {
                break;
            }
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
            j12 = j14;
        }
        if (targetBytes.c() == 2) {
            byte bJ3 = targetBytes.j(0);
            byte bJ4 = targetBytes.j(1);
            while (j12 < this.f76126b) {
                byte[] bArr3 = e0Var.f76115a;
                int i14 = e0Var.f76117c;
                for (int i15 = (int) ((e0Var.f76116b + j11) - j12); i15 < i14; i15++) {
                    byte b14 = bArr3[i15];
                    if (b14 == bJ3 || b14 == bJ4) {
                        return (i15 - e0Var.f76116b) + j12;
                    }
                }
                j12 += e0Var.f76117c - e0Var.f76116b;
                e0Var = e0Var.f76120f;
                Intrinsics.d(e0Var);
                j11 = j12;
            }
        } else {
            byte[] bArrI2 = targetBytes.i();
            while (j12 < this.f76126b) {
                byte[] bArr4 = e0Var.f76115a;
                int i16 = e0Var.f76117c;
                for (int i17 = (int) ((e0Var.f76116b + j11) - j12); i17 < i16; i17++) {
                    byte b15 = bArr4[i17];
                    for (byte b16 : bArrI2) {
                        if (b15 == b16) {
                            return (i17 - e0Var.f76116b) + j12;
                        }
                    }
                }
                j12 += e0Var.f76117c - e0Var.f76116b;
                e0Var = e0Var.f76120f;
                Intrinsics.d(e0Var);
                j11 = j12;
            }
        }
        return -1L;
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h C(j jVar) {
        f0(jVar);
        return this;
    }

    public final byte[] D(long j11) throws EOFException {
        if (j11 < 0 || j11 > 2147483647L) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: ").toString());
        }
        if (this.f76126b < j11) {
            throw new EOFException();
        }
        int i5 = (int) j11;
        byte[] bArr = new byte[i5];
        int i11 = 0;
        while (i11 < i5) {
            int i12 = read(bArr, i11, i5 - i11);
            if (i12 == -1) {
                throw new EOFException();
            }
            i11 += i12;
        }
        return bArr;
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h E(long j11) {
        h0(j11);
        return this;
    }

    @Override // m90.i
    public final j H(long j11) throws EOFException {
        if (j11 < 0 || j11 > 2147483647L) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: ").toString());
        }
        if (this.f76126b < j11) {
            throw new EOFException();
        }
        if (j11 < 4096) {
            return new j(D(j11));
        }
        j jVarD0 = d0((int) j11);
        skip(j11);
        return jVarD0;
    }

    @Override // m90.h
    public final long I(j0 source) {
        Intrinsics.g(source, "source");
        long j11 = 0;
        while (true) {
            long j12 = source.read(this, 8192L);
            if (j12 == -1) {
                return j11;
            }
            j11 += j12;
        }
    }

    public final short K() {
        return com.google.android.gms.internal.consent_sdk.e0.c0(readShort());
    }

    @Override // m90.i
    public final byte[] L() {
        return D(this.f76126b);
    }

    public final String M(long j11, Charset charset) throws EOFException {
        Intrinsics.g(charset, "charset");
        if (j11 < 0 || j11 > 2147483647L) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount: ").toString());
        }
        if (this.f76126b < j11) {
            throw new EOFException();
        }
        if (j11 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        e0 e0Var = this.f76125a;
        Intrinsics.d(e0Var);
        int i5 = e0Var.f76116b;
        if (i5 + j11 > e0Var.f76117c) {
            return new String(D(j11), charset);
        }
        int i11 = (int) j11;
        String str = new String(e0Var.f76115a, i5, i11, charset);
        int i12 = e0Var.f76116b + i11;
        e0Var.f76116b = i12;
        this.f76126b -= j11;
        if (i12 == e0Var.f76117c) {
            this.f76125a = e0Var.a();
            f0.a(e0Var);
        }
        return str;
    }

    public final boolean N() {
        return this.f76126b == 0;
    }

    @Override // m90.i
    public final long O(h hVar) {
        long j11 = this.f76126b;
        if (j11 > 0) {
            hVar.Z(this, j11);
        }
        return j11;
    }

    public final String P() {
        return M(this.f76126b, Charsets.f72000b);
    }

    @Override // m90.i
    public final String Q(Charset charset) {
        Intrinsics.g(charset, "charset");
        return M(this.f76126b, charset);
    }

    @Override // m90.i
    public final boolean R(long j11, j bytes) {
        Intrinsics.g(bytes, "bytes");
        int iC = bytes.c();
        if (iC >= 0 && this.f76126b >= iC && bytes.c() >= iC) {
            for (int i5 = 0; i5 < iC; i5++) {
                if (f(i5) == bytes.j(i5)) {
                }
            }
            return true;
        }
        return false;
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h T(long j11) {
        i0(j11);
        return this;
    }

    @Override // m90.i
    public final j U() {
        return H(this.f76126b);
    }

    public final int V() throws EOFException {
        int i5;
        int i11;
        int i12;
        if (this.f76126b == 0) {
            throw new EOFException();
        }
        byte bF = f(0L);
        if ((bF & 128) == 0) {
            i5 = bF & AbstractJsonLexerKt.TC_INVALID;
            i12 = 0;
            i11 = 1;
        } else if ((bF & 224) == 192) {
            i5 = bF & 31;
            i11 = 2;
            i12 = 128;
        } else if ((bF & 240) == 224) {
            i5 = bF & 15;
            i11 = 3;
            i12 = 2048;
        } else {
            if ((bF & 248) != 240) {
                skip(1L);
                return 65533;
            }
            i5 = bF & 7;
            i11 = 4;
            i12 = SQLiteDatabase.OPEN_FULLMUTEX;
        }
        long j11 = i11;
        if (this.f76126b < j11) {
            StringBuilder sbJ = u4.j(i11, "size < ", ": ");
            sbJ.append(this.f76126b);
            sbJ.append(" (to read code point prefixed 0x");
            sbJ.append(com.google.android.gms.internal.consent_sdk.e0.i0(bF));
            sbJ.append(')');
            throw new EOFException(sbJ.toString());
        }
        for (int i13 = 1; i13 < i11; i13++) {
            long j12 = i13;
            byte bF2 = f(j12);
            if ((bF2 & 192) != 128) {
                skip(j12);
                return 65533;
            }
            i5 = (i5 << 6) | (bF2 & 63);
        }
        skip(j11);
        if (i5 > 1114111) {
            return 65533;
        }
        if ((55296 > i5 || i5 >= 57344) && i5 >= i12) {
            return i5;
        }
        return 65533;
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h Y(int i5, int i11, byte[] bArr) {
        write(bArr, i5, i11);
        return this;
    }

    @Override // m90.h0
    public final void Z(g source, long j11) {
        e0 e0VarB;
        Intrinsics.g(source, "source");
        if (source == this) {
            throw new IllegalArgumentException("source == this");
        }
        com.google.android.gms.internal.consent_sdk.e0.v(source.f76126b, 0L, j11);
        while (j11 > 0) {
            e0 e0Var = source.f76125a;
            Intrinsics.d(e0Var);
            int i5 = e0Var.f76117c;
            e0 e0Var2 = source.f76125a;
            Intrinsics.d(e0Var2);
            long j12 = i5 - e0Var2.f76116b;
            int i11 = 0;
            if (j11 < j12) {
                e0 e0Var3 = this.f76125a;
                e0 e0Var4 = e0Var3 != null ? e0Var3.f76121g : null;
                if (e0Var4 != null && e0Var4.f76119e) {
                    if ((e0Var4.f76117c + j11) - (e0Var4.f76118d ? 0 : e0Var4.f76116b) <= 8192) {
                        e0 e0Var5 = source.f76125a;
                        Intrinsics.d(e0Var5);
                        e0Var5.d(e0Var4, (int) j11);
                        source.f76126b -= j11;
                        this.f76126b += j11;
                        return;
                    }
                }
                e0 e0Var6 = source.f76125a;
                Intrinsics.d(e0Var6);
                int i12 = (int) j11;
                if (i12 <= 0 || i12 > e0Var6.f76117c - e0Var6.f76116b) {
                    throw new IllegalArgumentException("byteCount out of range");
                }
                if (i12 >= 1024) {
                    e0VarB = e0Var6.c();
                } else {
                    e0VarB = f0.b();
                    byte[] bArr = e0Var6.f76115a;
                    byte[] bArr2 = e0VarB.f76115a;
                    int i13 = e0Var6.f76116b;
                    u90.b.v(bArr, i13, bArr2, i13 + i12, 2);
                }
                e0VarB.f76117c = e0VarB.f76116b + i12;
                e0Var6.f76116b += i12;
                e0 e0Var7 = e0Var6.f76121g;
                Intrinsics.d(e0Var7);
                e0Var7.b(e0VarB);
                source.f76125a = e0VarB;
            }
            e0 e0Var8 = source.f76125a;
            Intrinsics.d(e0Var8);
            long j13 = e0Var8.f76117c - e0Var8.f76116b;
            source.f76125a = e0Var8.a();
            e0 e0Var9 = this.f76125a;
            if (e0Var9 == null) {
                this.f76125a = e0Var8;
                e0Var8.f76121g = e0Var8;
                e0Var8.f76120f = e0Var8;
            } else {
                e0 e0Var10 = e0Var9.f76121g;
                Intrinsics.d(e0Var10);
                e0Var10.b(e0Var8);
                e0 e0Var11 = e0Var8.f76121g;
                if (e0Var11 == e0Var8) {
                    throw new IllegalStateException("cannot compact");
                }
                Intrinsics.d(e0Var11);
                if (e0Var11.f76119e) {
                    int i14 = e0Var8.f76117c - e0Var8.f76116b;
                    e0 e0Var12 = e0Var8.f76121g;
                    Intrinsics.d(e0Var12);
                    int i15 = 8192 - e0Var12.f76117c;
                    e0 e0Var13 = e0Var8.f76121g;
                    Intrinsics.d(e0Var13);
                    if (!e0Var13.f76118d) {
                        e0 e0Var14 = e0Var8.f76121g;
                        Intrinsics.d(e0Var14);
                        i11 = e0Var14.f76116b;
                    }
                    if (i14 <= i15 + i11) {
                        e0 e0Var15 = e0Var8.f76121g;
                        Intrinsics.d(e0Var15);
                        e0Var8.d(e0Var15, i14);
                        e0Var8.a();
                        f0.a(e0Var8);
                    }
                }
            }
            source.f76126b -= j13;
            this.f76126b += j13;
            j11 -= j13;
        }
    }

    public final void a() {
        skip(this.f76126b);
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x008d A[EDGE_INSN: B:43:0x008d->B:37:0x008d BREAK  A[LOOP:0: B:5:0x000b->B:45:?], SYNTHETIC] */
    @Override // m90.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long a0() throws EOFException {
        int i5;
        if (this.f76126b == 0) {
            throw new EOFException();
        }
        int i11 = 0;
        boolean z11 = false;
        long j11 = 0;
        do {
            e0 e0Var = this.f76125a;
            Intrinsics.d(e0Var);
            byte[] bArr = e0Var.f76115a;
            int i12 = e0Var.f76116b;
            int i13 = e0Var.f76117c;
            while (i12 < i13) {
                byte b11 = bArr[i12];
                if (b11 >= 48 && b11 <= 57) {
                    i5 = b11 - 48;
                } else if (b11 >= 97 && b11 <= 102) {
                    i5 = b11 - 87;
                } else if (b11 >= 65 && b11 <= 70) {
                    i5 = b11 - 55;
                } else {
                    if (i11 == 0) {
                        throw new NumberFormatException("Expected leading [0-9a-fA-F] character but was 0x".concat(com.google.android.gms.internal.consent_sdk.e0.i0(b11)));
                    }
                    z11 = true;
                    if (i12 != i13) {
                        this.f76125a = e0Var.a();
                        f0.a(e0Var);
                    } else {
                        e0Var.f76116b = i12;
                    }
                    if (!z11) {
                        break;
                    }
                }
                if (((-1152921504606846976L) & j11) != 0) {
                    g gVar = new g();
                    gVar.i0(j11);
                    gVar.g0(b11);
                    throw new NumberFormatException("Number too large: ".concat(gVar.P()));
                }
                j11 = (j11 << 4) | i5;
                i12++;
                i11++;
            }
            if (i12 != i13) {
            }
            if (!z11) {
            }
        } while (this.f76125a != null);
        this.f76126b -= i11;
        return j11;
    }

    @Override // m90.i
    public final InputStream b0() {
        return new a60.b(this, 4);
    }

    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final g clone() {
        g gVar = new g();
        if (this.f76126b == 0) {
            return gVar;
        }
        e0 e0Var = this.f76125a;
        Intrinsics.d(e0Var);
        e0 e0VarC = e0Var.c();
        gVar.f76125a = e0VarC;
        e0VarC.f76121g = e0VarC;
        e0VarC.f76120f = e0VarC;
        for (e0 e0Var2 = e0Var.f76120f; e0Var2 != e0Var; e0Var2 = e0Var2.f76120f) {
            e0 e0Var3 = e0VarC.f76121g;
            Intrinsics.d(e0Var3);
            Intrinsics.d(e0Var2);
            e0Var3.b(e0Var2.c());
        }
        gVar.f76126b = this.f76126b;
        return gVar;
    }

    public final j c0() {
        long j11 = this.f76126b;
        if (j11 <= 2147483647L) {
            return d0((int) j11);
        }
        throw new IllegalStateException(("size > Int.MAX_VALUE: " + this.f76126b).toString());
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable, java.nio.channels.Channel, m90.h0
    public final void close() {
    }

    public final long d() {
        long j11 = this.f76126b;
        if (j11 == 0) {
            return 0L;
        }
        e0 e0Var = this.f76125a;
        Intrinsics.d(e0Var);
        e0 e0Var2 = e0Var.f76121g;
        Intrinsics.d(e0Var2);
        return (e0Var2.f76117c >= 8192 || !e0Var2.f76119e) ? j11 : j11 - (r3 - e0Var2.f76116b);
    }

    public final j d0(int i5) {
        if (i5 == 0) {
            return j.f76130d;
        }
        com.google.android.gms.internal.consent_sdk.e0.v(this.f76126b, 0L, i5);
        e0 e0Var = this.f76125a;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i12 < i5) {
            Intrinsics.d(e0Var);
            int i14 = e0Var.f76117c;
            int i15 = e0Var.f76116b;
            if (i14 == i15) {
                throw new AssertionError("s.limit == s.pos");
            }
            i12 += i14 - i15;
            i13++;
            e0Var = e0Var.f76120f;
        }
        byte[][] bArr = new byte[i13][];
        int[] iArr = new int[i13 * 2];
        e0 e0Var2 = this.f76125a;
        int i16 = 0;
        while (i11 < i5) {
            Intrinsics.d(e0Var2);
            bArr[i16] = e0Var2.f76115a;
            i11 += e0Var2.f76117c - e0Var2.f76116b;
            iArr[i16] = Math.min(i11, i5);
            iArr[i16 + i13] = e0Var2.f76116b;
            e0Var2.f76118d = true;
            i16++;
            e0Var2 = e0Var2.f76120f;
        }
        return new g0(bArr, iArr);
    }

    public final void e(g out, long j11, long j12) {
        Intrinsics.g(out, "out");
        long j13 = j11;
        com.google.android.gms.internal.consent_sdk.e0.v(this.f76126b, j13, j12);
        if (j12 == 0) {
            return;
        }
        out.f76126b += j12;
        e0 e0Var = this.f76125a;
        while (true) {
            Intrinsics.d(e0Var);
            long j14 = e0Var.f76117c - e0Var.f76116b;
            if (j13 < j14) {
                break;
            }
            j13 -= j14;
            e0Var = e0Var.f76120f;
        }
        e0 e0Var2 = e0Var;
        long j15 = j12;
        while (j15 > 0) {
            Intrinsics.d(e0Var2);
            e0 e0VarC = e0Var2.c();
            int i5 = e0VarC.f76116b + ((int) j13);
            e0VarC.f76116b = i5;
            e0VarC.f76117c = Math.min(i5 + ((int) j15), e0VarC.f76117c);
            e0 e0Var3 = out.f76125a;
            if (e0Var3 == null) {
                e0VarC.f76121g = e0VarC;
                e0VarC.f76120f = e0VarC;
                out.f76125a = e0VarC;
            } else {
                e0 e0Var4 = e0Var3.f76121g;
                Intrinsics.d(e0Var4);
                e0Var4.b(e0VarC);
            }
            j15 -= e0VarC.f76117c - e0VarC.f76116b;
            e0Var2 = e0Var2.f76120f;
            j13 = 0;
        }
    }

    public final e0 e0(int i5) {
        if (i5 < 1 || i5 > 8192) {
            throw new IllegalArgumentException("unexpected capacity");
        }
        e0 e0Var = this.f76125a;
        if (e0Var == null) {
            e0 e0VarB = f0.b();
            this.f76125a = e0VarB;
            e0VarB.f76121g = e0VarB;
            e0VarB.f76120f = e0VarB;
            return e0VarB;
        }
        e0 e0Var2 = e0Var.f76121g;
        Intrinsics.d(e0Var2);
        if (e0Var2.f76117c + i5 <= 8192 && e0Var2.f76119e) {
            return e0Var2;
        }
        e0 e0VarB2 = f0.b();
        e0Var2.b(e0VarB2);
        return e0VarB2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        long j11 = this.f76126b;
        g gVar = (g) obj;
        if (j11 != gVar.f76126b) {
            return false;
        }
        if (j11 == 0) {
            return true;
        }
        e0 e0Var = this.f76125a;
        Intrinsics.d(e0Var);
        e0 e0Var2 = gVar.f76125a;
        Intrinsics.d(e0Var2);
        int i5 = e0Var.f76116b;
        int i11 = e0Var2.f76116b;
        long j12 = 0;
        while (j12 < this.f76126b) {
            long jMin = Math.min(e0Var.f76117c - i5, e0Var2.f76117c - i11);
            long j13 = 0;
            while (j13 < jMin) {
                int i12 = i5 + 1;
                int i13 = i11 + 1;
                if (e0Var.f76115a[i5] != e0Var2.f76115a[i11]) {
                    return false;
                }
                j13++;
                i5 = i12;
                i11 = i13;
            }
            if (i5 == e0Var.f76117c) {
                e0Var = e0Var.f76120f;
                Intrinsics.d(e0Var);
                i5 = e0Var.f76116b;
            }
            if (i11 == e0Var2.f76117c) {
                e0Var2 = e0Var2.f76120f;
                Intrinsics.d(e0Var2);
                i11 = e0Var2.f76116b;
            }
            j12 += jMin;
        }
        return true;
    }

    public final byte f(long j11) {
        com.google.android.gms.internal.consent_sdk.e0.v(this.f76126b, j11, 1L);
        e0 e0Var = this.f76125a;
        if (e0Var == null) {
            Intrinsics.d(null);
            throw null;
        }
        long j12 = this.f76126b;
        if (j12 - j11 < j11) {
            while (j12 > j11) {
                e0Var = e0Var.f76121g;
                Intrinsics.d(e0Var);
                j12 -= e0Var.f76117c - e0Var.f76116b;
            }
            return e0Var.f76115a[(int) ((e0Var.f76116b + j11) - j12)];
        }
        long j13 = 0;
        while (true) {
            int i5 = e0Var.f76117c;
            int i11 = e0Var.f76116b;
            long j14 = (i5 - i11) + j13;
            if (j14 > j11) {
                return e0Var.f76115a[(int) ((i11 + j11) - j13)];
            }
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
            j13 = j14;
        }
    }

    public final void f0(j byteString) {
        Intrinsics.g(byteString, "byteString");
        byteString.t(this, byteString.c());
    }

    @Override // m90.h, m90.h0, java.io.Flushable
    public final void flush() {
    }

    public final void g0(int i5) {
        e0 e0VarE0 = e0(1);
        byte[] bArr = e0VarE0.f76115a;
        int i11 = e0VarE0.f76117c;
        e0VarE0.f76117c = i11 + 1;
        bArr[i11] = (byte) i5;
        this.f76126b++;
    }

    public final long h(byte b11, long j11, long j12) {
        e0 e0Var;
        long j13 = 0;
        if (0 > j11 || j11 > j12) {
            StringBuilder sb2 = new StringBuilder("size=");
            sb2.append(this.f76126b);
            b.c0.B(sb2, " fromIndex=", j11, " toIndex=");
            sb2.append(j12);
            throw new IllegalArgumentException(sb2.toString().toString());
        }
        long j14 = this.f76126b;
        if (j12 > j14) {
            j12 = j14;
        }
        if (j11 == j12 || (e0Var = this.f76125a) == null) {
            return -1L;
        }
        if (j14 - j11 < j11) {
            while (j14 > j11) {
                e0Var = e0Var.f76121g;
                Intrinsics.d(e0Var);
                j14 -= e0Var.f76117c - e0Var.f76116b;
            }
            while (j14 < j12) {
                byte[] bArr = e0Var.f76115a;
                int iMin = (int) Math.min(e0Var.f76117c, (e0Var.f76116b + j12) - j14);
                for (int i5 = (int) ((e0Var.f76116b + j11) - j14); i5 < iMin; i5++) {
                    if (bArr[i5] == b11) {
                        return (i5 - e0Var.f76116b) + j14;
                    }
                }
                j14 += e0Var.f76117c - e0Var.f76116b;
                e0Var = e0Var.f76120f;
                Intrinsics.d(e0Var);
                j11 = j14;
            }
            return -1L;
        }
        while (true) {
            long j15 = (e0Var.f76117c - e0Var.f76116b) + j13;
            if (j15 > j11) {
                break;
            }
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
            j13 = j15;
        }
        while (j13 < j12) {
            byte[] bArr2 = e0Var.f76115a;
            int iMin2 = (int) Math.min(e0Var.f76117c, (e0Var.f76116b + j12) - j13);
            for (int i11 = (int) ((e0Var.f76116b + j11) - j13); i11 < iMin2; i11++) {
                if (bArr2[i11] == b11) {
                    return (i11 - e0Var.f76116b) + j13;
                }
            }
            j13 += e0Var.f76117c - e0Var.f76116b;
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
            j11 = j13;
        }
        return -1L;
    }

    public final void h0(long j11) {
        boolean z11;
        if (j11 == 0) {
            g0(48);
            return;
        }
        int i5 = 1;
        if (j11 < 0) {
            j11 = -j11;
            if (j11 < 0) {
                m0("-9223372036854775808");
                return;
            }
            z11 = true;
        } else {
            z11 = false;
        }
        if (j11 >= 100000000) {
            i5 = j11 < 1000000000000L ? j11 < 10000000000L ? j11 < 1000000000 ? 9 : 10 : j11 < 100000000000L ? 11 : 12 : j11 < 1000000000000000L ? j11 < 10000000000000L ? 13 : j11 < 100000000000000L ? 14 : 15 : j11 < 100000000000000000L ? j11 < 10000000000000000L ? 16 : 17 : j11 < 1000000000000000000L ? 18 : 19;
        } else if (j11 >= com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c) {
            i5 = j11 < 1000000 ? j11 < 100000 ? 5 : 6 : j11 < 10000000 ? 7 : 8;
        } else if (j11 >= 100) {
            i5 = j11 < 1000 ? 3 : 4;
        } else if (j11 >= 10) {
            i5 = 2;
        }
        if (z11) {
            i5++;
        }
        e0 e0VarE0 = e0(i5);
        byte[] bArr = e0VarE0.f76115a;
        int i11 = e0VarE0.f76117c + i5;
        while (j11 != 0) {
            long j12 = 10;
            i11--;
            bArr[i11] = n90.a.a()[(int) (j11 % j12)];
            j11 /= j12;
        }
        if (z11) {
            bArr[i11 - 1] = 45;
        }
        e0VarE0.f76117c += i5;
        this.f76126b += i5;
    }

    public final int hashCode() {
        e0 e0Var = this.f76125a;
        if (e0Var == null) {
            return 0;
        }
        int i5 = 1;
        do {
            int i11 = e0Var.f76117c;
            for (int i12 = e0Var.f76116b; i12 < i11; i12++) {
                i5 = (i5 * 31) + e0Var.f76115a[i12];
            }
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
        } while (e0Var != this.f76125a);
        return i5;
    }

    @Override // m90.i
    public final g i() {
        return this;
    }

    public final void i0(long j11) {
        if (j11 == 0) {
            g0(48);
            return;
        }
        long j12 = (j11 >>> 1) | j11;
        long j13 = j12 | (j12 >>> 2);
        long j14 = j13 | (j13 >>> 4);
        long j15 = j14 | (j14 >>> 8);
        long j16 = j15 | (j15 >>> 16);
        long j17 = j16 | (j16 >>> 32);
        long j18 = j17 - ((j17 >>> 1) & 6148914691236517205L);
        long j19 = ((j18 >>> 2) & 3689348814741910323L) + (j18 & 3689348814741910323L);
        long j21 = ((j19 >>> 4) + j19) & 1085102592571150095L;
        long j22 = j21 + (j21 >>> 8);
        long j23 = j22 + (j22 >>> 16);
        int i5 = (int) ((((j23 & 63) + ((j23 >>> 32) & 63)) + 3) / 4);
        e0 e0VarE0 = e0(i5);
        byte[] bArr = e0VarE0.f76115a;
        int i11 = e0VarE0.f76117c;
        for (int i12 = (i11 + i5) - 1; i12 >= i11; i12--) {
            bArr[i12] = n90.a.a()[(int) (15 & j11)];
            j11 >>>= 4;
        }
        e0VarE0.f76117c += i5;
        this.f76126b += i5;
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return true;
    }

    @Override // m90.i
    public final boolean j(long j11) {
        return this.f76126b >= j11;
    }

    public final void j0(int i5) {
        e0 e0VarE0 = e0(4);
        byte[] bArr = e0VarE0.f76115a;
        int i11 = e0VarE0.f76117c;
        bArr[i11] = (byte) ((i5 >>> 24) & 255);
        bArr[i11 + 1] = (byte) ((i5 >>> 16) & 255);
        bArr[i11 + 2] = (byte) ((i5 >>> 8) & 255);
        bArr[i11 + 3] = (byte) (i5 & 255);
        e0VarE0.f76117c = i11 + 4;
        this.f76126b += 4;
    }

    public final void k0(int i5) {
        e0 e0VarE0 = e0(2);
        byte[] bArr = e0VarE0.f76115a;
        int i11 = e0VarE0.f76117c;
        bArr[i11] = (byte) ((i5 >>> 8) & 255);
        bArr[i11 + 1] = (byte) (i5 & 255);
        e0VarE0.f76117c = i11 + 2;
        this.f76126b += 2;
    }

    public final void l0(int i5, int i11, String string) {
        char cCharAt;
        Intrinsics.g(string, "string");
        if (i5 < 0) {
            throw new IllegalArgumentException(b.c0.h(i5, "beginIndex < 0: ").toString());
        }
        if (i11 < i5) {
            throw new IllegalArgumentException(b.c0.g(i11, i5, "endIndex < beginIndex: ", " < ").toString());
        }
        if (i11 > string.length()) {
            StringBuilder sbJ = u4.j(i11, "endIndex > string.length: ", " > ");
            sbJ.append(string.length());
            throw new IllegalArgumentException(sbJ.toString().toString());
        }
        while (i5 < i11) {
            char cCharAt2 = string.charAt(i5);
            if (cCharAt2 < 128) {
                e0 e0VarE0 = e0(1);
                byte[] bArr = e0VarE0.f76115a;
                int i12 = e0VarE0.f76117c - i5;
                int iMin = Math.min(i11, 8192 - i12);
                int i13 = i5 + 1;
                bArr[i5 + i12] = (byte) cCharAt2;
                while (true) {
                    i5 = i13;
                    if (i5 >= iMin || (cCharAt = string.charAt(i5)) >= 128) {
                        break;
                    }
                    i13 = i5 + 1;
                    bArr[i5 + i12] = (byte) cCharAt;
                }
                int i14 = e0VarE0.f76117c;
                int i15 = (i12 + i5) - i14;
                e0VarE0.f76117c = i14 + i15;
                this.f76126b += i15;
            } else {
                if (cCharAt2 < 2048) {
                    e0 e0VarE02 = e0(2);
                    byte[] bArr2 = e0VarE02.f76115a;
                    int i16 = e0VarE02.f76117c;
                    bArr2[i16] = (byte) ((cCharAt2 >> 6) | 192);
                    bArr2[i16 + 1] = (byte) ((cCharAt2 & '?') | 128);
                    e0VarE02.f76117c = i16 + 2;
                    this.f76126b += 2;
                } else if (cCharAt2 < 55296 || cCharAt2 > 57343) {
                    e0 e0VarE03 = e0(3);
                    byte[] bArr3 = e0VarE03.f76115a;
                    int i17 = e0VarE03.f76117c;
                    bArr3[i17] = (byte) ((cCharAt2 >> '\f') | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
                    bArr3[i17 + 1] = (byte) ((63 & (cCharAt2 >> 6)) | 128);
                    bArr3[i17 + 2] = (byte) ((cCharAt2 & '?') | 128);
                    e0VarE03.f76117c = i17 + 3;
                    this.f76126b += 3;
                } else {
                    int i18 = i5 + 1;
                    char cCharAt3 = i18 < i11 ? string.charAt(i18) : (char) 0;
                    if (cCharAt2 > 56319 || 56320 > cCharAt3 || cCharAt3 >= 57344) {
                        g0(63);
                        i5 = i18;
                    } else {
                        int i19 = (((cCharAt2 & 1023) << 10) | (cCharAt3 & 1023)) + SQLiteDatabase.OPEN_FULLMUTEX;
                        e0 e0VarE04 = e0(4);
                        byte[] bArr4 = e0VarE04.f76115a;
                        int i21 = e0VarE04.f76117c;
                        bArr4[i21] = (byte) ((i19 >> 18) | 240);
                        bArr4[i21 + 1] = (byte) (((i19 >> 12) & 63) | 128);
                        bArr4[i21 + 2] = (byte) (((i19 >> 6) & 63) | 128);
                        bArr4[i21 + 3] = (byte) ((i19 & 63) | 128);
                        e0VarE04.f76117c = i21 + 4;
                        this.f76126b += 4;
                        i5 += 2;
                    }
                }
                i5++;
            }
        }
    }

    @Override // m90.i
    public final void m(long j11) throws EOFException {
        if (this.f76126b < j11) {
            throw new EOFException();
        }
    }

    public final void m0(String string) {
        Intrinsics.g(string, "string");
        l0(0, string.length(), string);
    }

    public final void n0(int i5) {
        if (i5 < 128) {
            g0(i5);
            return;
        }
        if (i5 < 2048) {
            e0 e0VarE0 = e0(2);
            byte[] bArr = e0VarE0.f76115a;
            int i11 = e0VarE0.f76117c;
            bArr[i11] = (byte) ((i5 >> 6) | 192);
            bArr[i11 + 1] = (byte) ((i5 & 63) | 128);
            e0VarE0.f76117c = i11 + 2;
            this.f76126b += 2;
            return;
        }
        if (55296 <= i5 && i5 < 57344) {
            g0(63);
            return;
        }
        if (i5 < 65536) {
            e0 e0VarE02 = e0(3);
            byte[] bArr2 = e0VarE02.f76115a;
            int i12 = e0VarE02.f76117c;
            bArr2[i12] = (byte) ((i5 >> 12) | Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
            bArr2[i12 + 1] = (byte) (((i5 >> 6) & 63) | 128);
            bArr2[i12 + 2] = (byte) ((i5 & 63) | 128);
            e0VarE02.f76117c = i12 + 3;
            this.f76126b += 3;
            return;
        }
        if (i5 > 1114111) {
            throw new IllegalArgumentException("Unexpected code point: 0x".concat(com.google.android.gms.internal.consent_sdk.e0.j0(i5)));
        }
        e0 e0VarE03 = e0(4);
        byte[] bArr3 = e0VarE03.f76115a;
        int i13 = e0VarE03.f76117c;
        bArr3[i13] = (byte) ((i5 >> 18) | 240);
        bArr3[i13 + 1] = (byte) (((i5 >> 12) & 63) | 128);
        bArr3[i13 + 2] = (byte) (((i5 >> 6) & 63) | 128);
        bArr3[i13 + 3] = (byte) ((i5 & 63) | 128);
        e0VarE03.f76117c = i13 + 4;
        this.f76126b += 4;
    }

    @Override // m90.i
    public final d0 peek() {
        return x7.f.r(new a0(this));
    }

    @Override // m90.i
    public final String r(long j11) throws EOFException {
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "limit < 0: ").toString());
        }
        long j12 = j11 != Long.MAX_VALUE ? j11 + 1 : Long.MAX_VALUE;
        long jH = h((byte) 10, 0L, j12);
        if (jH != -1) {
            return n90.a.c(this, jH);
        }
        if (j12 < this.f76126b && f(j12 - 1) == 13 && f(j12) == 10) {
            return n90.a.c(this, j12);
        }
        g gVar = new g();
        e(gVar, 0L, Math.min(32, this.f76126b));
        throw new EOFException("\\n not found: limit=" + Math.min(this.f76126b, j11) + " content=" + gVar.H(gVar.f76126b).d() + (char) 8230);
    }

    @Override // m90.j0
    public final long read(g sink, long j11) {
        Intrinsics.g(sink, "sink");
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "byteCount < 0: ").toString());
        }
        long j12 = this.f76126b;
        if (j12 == 0) {
            return -1L;
        }
        if (j11 > j12) {
            j11 = j12;
        }
        sink.Z(this, j11);
        return j11;
    }

    @Override // m90.i
    public final byte readByte() {
        if (this.f76126b == 0) {
            throw new EOFException();
        }
        e0 e0Var = this.f76125a;
        Intrinsics.d(e0Var);
        int i5 = e0Var.f76116b;
        int i11 = e0Var.f76117c;
        int i12 = i5 + 1;
        byte b11 = e0Var.f76115a[i5];
        this.f76126b--;
        if (i12 != i11) {
            e0Var.f76116b = i12;
            return b11;
        }
        this.f76125a = e0Var.a();
        f0.a(e0Var);
        return b11;
    }

    @Override // m90.i
    public final int readInt() throws EOFException {
        if (this.f76126b < 4) {
            throw new EOFException();
        }
        e0 e0Var = this.f76125a;
        Intrinsics.d(e0Var);
        int i5 = e0Var.f76116b;
        int i11 = e0Var.f76117c;
        if (i11 - i5 < 4) {
            return ((readByte() & 255) << 24) | ((readByte() & 255) << 16) | ((readByte() & 255) << 8) | (readByte() & 255);
        }
        byte[] bArr = e0Var.f76115a;
        int i12 = i5 + 3;
        int i13 = ((bArr[i5 + 1] & 255) << 16) | ((bArr[i5] & 255) << 24) | ((bArr[i5 + 2] & 255) << 8);
        int i14 = i5 + 4;
        int i15 = (bArr[i12] & 255) | i13;
        this.f76126b -= 4;
        if (i14 != i11) {
            e0Var.f76116b = i14;
            return i15;
        }
        this.f76125a = e0Var.a();
        f0.a(e0Var);
        return i15;
    }

    @Override // m90.i
    public final short readShort() throws EOFException {
        if (this.f76126b < 2) {
            throw new EOFException();
        }
        e0 e0Var = this.f76125a;
        Intrinsics.d(e0Var);
        int i5 = e0Var.f76116b;
        int i11 = e0Var.f76117c;
        if (i11 - i5 < 2) {
            return (short) (((readByte() & 255) << 8) | (readByte() & 255));
        }
        byte[] bArr = e0Var.f76115a;
        int i12 = i5 + 1;
        int i13 = (bArr[i5] & 255) << 8;
        int i14 = i5 + 2;
        int i15 = (bArr[i12] & 255) | i13;
        this.f76126b -= 2;
        if (i14 == i11) {
            this.f76125a = e0Var.a();
            f0.a(e0Var);
        } else {
            e0Var.f76116b = i14;
        }
        return (short) i15;
    }

    @Override // m90.i
    public final void skip(long j11) {
        while (j11 > 0) {
            e0 e0Var = this.f76125a;
            if (e0Var == null) {
                throw new EOFException();
            }
            int iMin = (int) Math.min(j11, e0Var.f76117c - e0Var.f76116b);
            long j12 = iMin;
            this.f76126b -= j12;
            j11 -= j12;
            int i5 = e0Var.f76116b + iMin;
            e0Var.f76116b = i5;
            if (i5 == e0Var.f76117c) {
                this.f76125a = e0Var.a();
                f0.a(e0Var);
            }
        }
    }

    @Override // m90.i
    public final long t(j targetBytes) {
        Intrinsics.g(targetBytes, "targetBytes");
        return A(0L, targetBytes);
    }

    @Override // m90.j0
    public final l0 timeout() {
        return l0.f76140d;
    }

    public final String toString() {
        return c0().toString();
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h u(String str) {
        m0(str);
        return this;
    }

    @Override // m90.i
    public final int v(x options) {
        Intrinsics.g(options, "options");
        int iD = n90.a.d(this, options, false);
        if (iD == -1) {
            return -1;
        }
        skip(options.f76172b[iD].c());
        return iD;
    }

    public final long w(long j11, j bytes) {
        Intrinsics.g(bytes, "bytes");
        if (bytes.c() <= 0) {
            throw new IllegalArgumentException("bytes is empty");
        }
        long j12 = 0;
        if (j11 < 0) {
            throw new IllegalArgumentException(u4.g(j11, "fromIndex < 0: ").toString());
        }
        e0 e0Var = this.f76125a;
        if (e0Var == null) {
            return -1L;
        }
        long j13 = this.f76126b;
        if (j13 - j11 < j11) {
            while (j13 > j11) {
                e0Var = e0Var.f76121g;
                Intrinsics.d(e0Var);
                j13 -= e0Var.f76117c - e0Var.f76116b;
            }
            byte[] bArrI = bytes.i();
            byte b11 = bArrI[0];
            int iC = bytes.c();
            long j14 = (this.f76126b - iC) + 1;
            while (j13 < j14) {
                byte[] bArr = e0Var.f76115a;
                int iMin = (int) Math.min(e0Var.f76117c, (e0Var.f76116b + j14) - j13);
                for (int i5 = (int) ((e0Var.f76116b + j11) - j13); i5 < iMin; i5++) {
                    if (bArr[i5] == b11 && n90.a.b(e0Var, i5 + 1, bArrI, iC)) {
                        return (i5 - e0Var.f76116b) + j13;
                    }
                }
                j13 += e0Var.f76117c - e0Var.f76116b;
                e0Var = e0Var.f76120f;
                Intrinsics.d(e0Var);
                j11 = j13;
            }
            return -1L;
        }
        while (true) {
            long j15 = (e0Var.f76117c - e0Var.f76116b) + j12;
            if (j15 > j11) {
                break;
            }
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
            j12 = j15;
        }
        byte[] bArrI2 = bytes.i();
        byte b12 = bArrI2[0];
        int iC2 = bytes.c();
        long j16 = (this.f76126b - iC2) + 1;
        while (j12 < j16) {
            byte[] bArr2 = e0Var.f76115a;
            int iMin2 = (int) Math.min(e0Var.f76117c, (e0Var.f76116b + j16) - j12);
            for (int i11 = (int) ((e0Var.f76116b + j11) - j12); i11 < iMin2; i11++) {
                if (bArr2[i11] == b12 && n90.a.b(e0Var, i11 + 1, bArrI2, iC2)) {
                    return (i11 - e0Var.f76116b) + j12;
                }
            }
            j12 += e0Var.f76117c - e0Var.f76116b;
            e0Var = e0Var.f76120f;
            Intrinsics.d(e0Var);
            j11 = j12;
        }
        return -1L;
    }

    @Override // m90.h
    public final h write(byte[] source) {
        Intrinsics.g(source, "source");
        write(source, 0, source.length);
        return this;
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h writeByte(int i5) {
        g0(i5);
        return this;
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h writeInt(int i5) {
        j0(i5);
        return this;
    }

    @Override // m90.h
    public final /* bridge */ /* synthetic */ h writeShort(int i5) {
        k0(i5);
        return this;
    }

    @Override // m90.i
    public final long y(j bytes) {
        Intrinsics.g(bytes, "bytes");
        return w(0L, bytes);
    }

    @Override // m90.i
    public final String z() {
        return r(Long.MAX_VALUE);
    }

    @Override // java.nio.channels.WritableByteChannel
    public final int write(ByteBuffer source) {
        Intrinsics.g(source, "source");
        int iRemaining = source.remaining();
        int i5 = iRemaining;
        while (i5 > 0) {
            e0 e0VarE0 = e0(1);
            int iMin = Math.min(i5, 8192 - e0VarE0.f76117c);
            source.get(e0VarE0.f76115a, e0VarE0.f76117c, iMin);
            i5 -= iMin;
            e0VarE0.f76117c += iMin;
        }
        this.f76126b += iRemaining;
        return iRemaining;
    }

    public final void write(byte[] source, int i5, int i11) {
        Intrinsics.g(source, "source");
        long j11 = i11;
        com.google.android.gms.internal.consent_sdk.e0.v(source.length, i5, j11);
        int i12 = i11 + i5;
        while (i5 < i12) {
            e0 e0VarE0 = e0(1);
            int iMin = Math.min(i12 - i5, 8192 - e0VarE0.f76117c);
            int i13 = i5 + iMin;
            u90.b.q(source, e0VarE0.f76117c, e0VarE0.f76115a, i5, i13);
            e0VarE0.f76117c += iMin;
            i5 = i13;
        }
        this.f76126b += j11;
    }

    @Override // java.nio.channels.ReadableByteChannel
    public final int read(ByteBuffer sink) {
        Intrinsics.g(sink, "sink");
        e0 e0Var = this.f76125a;
        if (e0Var == null) {
            return -1;
        }
        int iMin = Math.min(sink.remaining(), e0Var.f76117c - e0Var.f76116b);
        sink.put(e0Var.f76115a, e0Var.f76116b, iMin);
        int i5 = e0Var.f76116b + iMin;
        e0Var.f76116b = i5;
        this.f76126b -= iMin;
        if (i5 == e0Var.f76117c) {
            this.f76125a = e0Var.a();
            f0.a(e0Var);
        }
        return iMin;
    }

    public final int read(byte[] bArr, int i5, int i11) {
        com.google.android.gms.internal.consent_sdk.e0.v(bArr.length, i5, i11);
        e0 e0Var = this.f76125a;
        if (e0Var == null) {
            return -1;
        }
        int iMin = Math.min(i11, e0Var.f76117c - e0Var.f76116b);
        byte[] bArr2 = e0Var.f76115a;
        int i12 = e0Var.f76116b;
        u90.b.q(bArr2, i5, bArr, i12, i12 + iMin);
        int i13 = e0Var.f76116b + iMin;
        e0Var.f76116b = i13;
        this.f76126b -= iMin;
        if (i13 == e0Var.f76117c) {
            this.f76125a = e0Var.a();
            f0.a(e0Var);
        }
        return iMin;
    }
}
