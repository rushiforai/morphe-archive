package j9;

import b.u4;
import com.android.gallery3d.exif.ExifInvalidFormatException;
import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;

/* loaded from: classes2.dex */
public final class g {

    /* renamed from: q, reason: collision with root package name */
    public static final Charset f69235q = Charset.forName("US-ASCII");

    /* renamed from: r, reason: collision with root package name */
    public static final short f69236r = (short) c.E;

    /* renamed from: s, reason: collision with root package name */
    public static final short f69237s = (short) c.F;

    /* renamed from: t, reason: collision with root package name */
    public static final short f69238t = (short) c.f69199o0;

    /* renamed from: u, reason: collision with root package name */
    public static final short f69239u = (short) c.G;

    /* renamed from: v, reason: collision with root package name */
    public static final short f69240v = (short) c.H;

    /* renamed from: w, reason: collision with root package name */
    public static final short f69241w = (short) c.f69188k;

    /* renamed from: x, reason: collision with root package name */
    public static final short f69242x = (short) c.o;

    /* renamed from: a, reason: collision with root package name */
    public final a f69243a;

    /* renamed from: b, reason: collision with root package name */
    public final int f69244b;

    /* renamed from: e, reason: collision with root package name */
    public int f69247e;

    /* renamed from: f, reason: collision with root package name */
    public h f69248f;

    /* renamed from: g, reason: collision with root package name */
    public f f69249g;

    /* renamed from: h, reason: collision with root package name */
    public h f69250h;

    /* renamed from: i, reason: collision with root package name */
    public h f69251i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f69252j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f69253k;

    /* renamed from: l, reason: collision with root package name */
    public final int f69254l;

    /* renamed from: m, reason: collision with root package name */
    public final byte[] f69255m;
    public final int n;
    public final c o;

    /* renamed from: c, reason: collision with root package name */
    public int f69245c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f69246d = 0;

    /* renamed from: p, reason: collision with root package name */
    public final TreeMap f69256p = new TreeMap();

    public g(BufferedInputStream bufferedInputStream, c cVar) throws ExifInvalidFormatException, IOException {
        boolean z11;
        this.f69253k = false;
        this.o = cVar;
        a aVar = new a(bufferedInputStream);
        if (aVar.readShort() != -40) {
            throw new ExifInvalidFormatException("Invalid JPEG format");
        }
        for (short s11 = aVar.readShort(); s11 != -39 && (s11 < -64 || s11 > -49 || s11 == -60 || s11 == -56 || s11 == -52); s11 = aVar.readShort()) {
            int i5 = aVar.readShort() & 65535;
            if (s11 == -31 && i5 >= 8) {
                int i11 = aVar.readInt();
                short s12 = aVar.readShort();
                i5 -= 6;
                if (i11 == 1165519206 && s12 == 0) {
                    this.f69254l = i5;
                    z11 = true;
                    break;
                }
            }
            if (i5 >= 2) {
                long j11 = i5 - 2;
                if (j11 == aVar.skip(j11)) {
                }
            }
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("ExifParser");
            bVar.n("Invalid JPEG format.", new Object[0]);
        }
        z11 = false;
        this.f69253k = z11;
        a aVar2 = new a(bufferedInputStream);
        this.f69243a = aVar2;
        this.f69244b = 63;
        if (z11) {
            short s13 = aVar2.readShort();
            ByteBuffer byteBuffer = aVar2.f69158c;
            if (18761 == s13) {
                byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
            } else {
                if (19789 != s13) {
                    throw new ExifInvalidFormatException("Invalid TIFF header");
                }
                byteBuffer.order(ByteOrder.BIG_ENDIAN);
            }
            if (aVar2.readShort() != 42) {
                throw new ExifInvalidFormatException("Invalid TIFF header");
            }
            long j12 = aVar2.readInt() & 4294967295L;
            if (j12 > 2147483647L) {
                throw new ExifInvalidFormatException(u4.g(j12, "Invalid offset "));
            }
            int i12 = (int) j12;
            this.n = i12;
            this.f69247e = 0;
            if (c(0) || e()) {
                j(0, j12);
                if (j12 != 8) {
                    byte[] bArr = new byte[i12 - 8];
                    this.f69255m = bArr;
                    aVar2.read(bArr);
                }
            }
        }
    }

    public final boolean a(int i5, int i11) {
        int i12 = this.o.c().get(i11);
        if (i12 != 0) {
            int i13 = i12 >>> 24;
            for (int i14 = 0; i14 < 5; i14++) {
                if (i5 == i.f69266c[i14] && ((i13 >> i14) & 1) == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void b(h hVar) {
        if (hVar.f69262d == 0) {
            return;
        }
        short s11 = hVar.f69259a;
        int i5 = hVar.f69263e;
        if (s11 == f69236r && a(i5, c.E)) {
            if (c(2) || c(3)) {
                j(2, hVar.b(0));
                return;
            }
            return;
        }
        if (s11 == f69237s && a(i5, c.F)) {
            if (c(4)) {
                j(4, hVar.b(0));
                return;
            }
            return;
        }
        if (s11 == f69238t && a(i5, c.f69199o0)) {
            if (c(3)) {
                j(3, hVar.b(0));
                return;
            }
            return;
        }
        short s12 = f69239u;
        TreeMap treeMap = this.f69256p;
        if (s11 == s12 && a(i5, c.G)) {
            if (d()) {
                Integer numValueOf = Integer.valueOf((int) hVar.b(0));
                f fVar = new f();
                fVar.f69233a = 0;
                fVar.f69234b = 3;
                treeMap.put(numValueOf, fVar);
                return;
            }
            return;
        }
        if (s11 == f69240v && a(i5, c.H)) {
            if (d()) {
                this.f69251i = hVar;
                return;
            }
            return;
        }
        if (s11 != f69241w || !a(i5, c.f69188k)) {
            if (s11 == f69242x && a(i5, c.o) && d() && hVar.f69264f != null) {
                this.f69250h = hVar;
                return;
            }
            return;
        }
        if (d()) {
            if (hVar.f69264f == null) {
                treeMap.put(Integer.valueOf(hVar.f69265g), new d(hVar, false));
                return;
            }
            for (int i11 = 0; i11 < hVar.f69262d; i11++) {
                if (hVar.f69260b == 3) {
                    Integer numValueOf2 = Integer.valueOf((int) hVar.b(i11));
                    f fVar2 = new f();
                    fVar2.f69234b = 4;
                    fVar2.f69233a = i11;
                    treeMap.put(numValueOf2, fVar2);
                } else {
                    Integer numValueOf3 = Integer.valueOf((int) hVar.b(i11));
                    f fVar3 = new f();
                    fVar3.f69234b = 4;
                    fVar3.f69233a = i11;
                    treeMap.put(numValueOf3, fVar3);
                }
            }
        }
    }

    public final boolean c(int i5) {
        int i11 = this.f69244b;
        if (i5 != 0) {
            if (i5 != 1) {
                if (i5 != 2) {
                    if (i5 != 3) {
                        if (i5 != 4 || (i11 & 8) == 0) {
                            return false;
                        }
                    } else if ((i11 & 16) == 0) {
                        return false;
                    }
                } else if ((i11 & 4) == 0) {
                    return false;
                }
            } else if ((i11 & 2) == 0) {
                return false;
            }
        } else if ((i11 & 1) == 0) {
            return false;
        }
        return true;
    }

    public final boolean d() {
        return (this.f69244b & 32) != 0;
    }

    public final boolean e() {
        int i5 = this.f69247e;
        if (i5 == 0) {
            return c(2) || c(4) || c(3) || c(1);
        }
        if (i5 == 1) {
            return d();
        }
        if (i5 != 2) {
            return false;
        }
        return c(3);
    }

    public final int f() {
        if (this.f69253k) {
            a aVar = this.f69243a;
            int i5 = aVar.f69156a;
            int i11 = (this.f69246d * 12) + this.f69245c + 2;
            if (i5 < i11) {
                h hVarH = h();
                this.f69248f = hVarH;
                if (hVarH == null) {
                    return f();
                }
                if (this.f69252j) {
                    b(hVarH);
                }
                return 1;
            }
            TreeMap treeMap = this.f69256p;
            if (i5 == i11) {
                if (this.f69247e == 0) {
                    long jI = i();
                    if ((c(1) || d()) && jI != 0) {
                        j(1, jI);
                    }
                } else {
                    int iIntValue = treeMap.size() > 0 ? ((Integer) treeMap.firstEntry().getKey()).intValue() - aVar.f69156a : 4;
                    if (iIntValue < 4) {
                        mc0.b bVar = mc0.d.f76206a;
                        bVar.r("ExifParser");
                        bVar.n("Invalid size of link to next IFD: %d", Integer.valueOf(iIntValue));
                    } else {
                        long jI2 = i();
                        if (jI2 != 0) {
                            mc0.b bVar2 = mc0.d.f76206a;
                            bVar2.r("ExifParser");
                            bVar2.n("Invalid link to next IFD: %d", Long.valueOf(jI2));
                        }
                    }
                }
            }
            while (treeMap.size() != 0) {
                Map.Entry entryPollFirstEntry = treeMap.pollFirstEntry();
                Object value = entryPollFirstEntry.getValue();
                try {
                    k(((Integer) entryPollFirstEntry.getKey()).intValue());
                    if (value instanceof e) {
                        e eVar = (e) value;
                        this.f69247e = eVar.f69231a;
                        this.f69246d = aVar.readShort() & 65535;
                        int iIntValue2 = ((Integer) entryPollFirstEntry.getKey()).intValue();
                        this.f69245c = iIntValue2;
                        if ((this.f69246d * 12) + iIntValue2 + 2 > this.f69254l) {
                            mc0.b bVar3 = mc0.d.f76206a;
                            bVar3.r("ExifParser");
                            bVar3.n("Invalid size of IFD %d", Integer.valueOf(this.f69247e));
                            return 5;
                        }
                        boolean zE = e();
                        this.f69252j = zE;
                        if (eVar.f69232b) {
                            return 0;
                        }
                        int i12 = (this.f69246d * 12) + this.f69245c + 2;
                        int i13 = aVar.f69156a;
                        if (i13 <= i12) {
                            if (zE) {
                                while (i13 < i12) {
                                    h hVarH2 = h();
                                    this.f69248f = hVarH2;
                                    i13 += 12;
                                    if (hVarH2 != null) {
                                        b(hVarH2);
                                    }
                                }
                            } else {
                                k(i12);
                            }
                            long jI3 = i();
                            if (this.f69247e == 0 && (c(1) || d())) {
                                if (jI3 > 0) {
                                    j(1, jI3);
                                }
                            }
                        }
                    } else {
                        if (value instanceof f) {
                            f fVar = (f) value;
                            this.f69249g = fVar;
                            return fVar.f69234b;
                        }
                        d dVar = (d) value;
                        h hVar = dVar.f69229a;
                        this.f69248f = hVar;
                        if (hVar.f69260b != 7) {
                            g(hVar);
                            b(this.f69248f);
                        }
                        if (dVar.f69230b) {
                            return 2;
                        }
                    }
                } catch (IOException unused) {
                    mc0.b bVar4 = mc0.d.f76206a;
                    bVar4.r("ExifParser");
                    bVar4.n("Failed to skip to data at: %d for %s, the file may be broken.", entryPollFirstEntry.getKey(), value.getClass().getName());
                }
            }
        }
        return 5;
    }

    public final void g(h hVar) {
        String str;
        short s11 = hVar.f69260b;
        a aVar = this.f69243a;
        if (s11 == 2 || s11 == 7 || s11 == 1) {
            int i5 = hVar.f69262d;
            TreeMap treeMap = this.f69256p;
            if (treeMap.size() > 0 && ((Integer) treeMap.firstEntry().getKey()).intValue() < aVar.f69156a + i5) {
                Object value = treeMap.firstEntry().getValue();
                if (value instanceof f) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("ExifParser");
                    bVar.n("Thumbnail overlaps value for tag: \n%s", hVar.toString());
                    Map.Entry entryPollFirstEntry = treeMap.pollFirstEntry();
                    bVar.r("ExifParser");
                    bVar.n("Invalid thumbnail offset: %d", entryPollFirstEntry.getKey());
                } else {
                    if (value instanceof e) {
                        mc0.b bVar2 = mc0.d.f76206a;
                        bVar2.r("ExifParser");
                        bVar2.n("Ifd %d overlaps value for tag: \n%s", Integer.valueOf(((e) value).f69231a), hVar.toString());
                    } else if (value instanceof d) {
                        mc0.b bVar3 = mc0.d.f76206a;
                        bVar3.r("ExifParser");
                        bVar3.n("Tag value for tag: \n%s overlaps value for tag: \n%s", ((d) value).f69229a.toString(), hVar.toString());
                    }
                    int iIntValue = ((Integer) treeMap.firstEntry().getKey()).intValue() - aVar.f69156a;
                    mc0.b bVar4 = mc0.d.f76206a;
                    bVar4.r("ExifParser");
                    bVar4.n("Invalid size of tag: \n%s setting count to: %d", hVar.toString(), Integer.valueOf(iIntValue));
                    hVar.f69262d = iIntValue;
                }
            }
        }
        int i11 = 0;
        switch (s11) {
            case 1:
            case 7:
                byte[] bArr = new byte[hVar.f69262d];
                aVar.read(bArr);
                hVar.c(bArr);
                return;
            case 2:
                int i12 = hVar.f69262d;
                if (i12 > 0) {
                    aVar.getClass();
                    byte[] bArr2 = new byte[i12];
                    if (aVar.read(bArr2, 0, i12) != i12) {
                        throw new EOFException();
                    }
                    str = new String(bArr2, f69235q);
                } else {
                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                if (s11 == 2 || s11 == 7) {
                    byte[] bytes = str.getBytes(h.f69257h);
                    if (bytes.length > 0) {
                        if (bytes[bytes.length - 1] != 0 && s11 != 7) {
                            bytes = Arrays.copyOf(bytes, bytes.length + 1);
                        }
                    } else if (s11 == 2 && hVar.f69262d == 1) {
                        bytes = new byte[]{0};
                    }
                    int length = bytes.length;
                    if (hVar.a(length)) {
                        return;
                    }
                    hVar.f69262d = length;
                    hVar.f69264f = bytes;
                    return;
                }
                return;
            case 3:
                int i13 = hVar.f69262d;
                int[] iArr = new int[i13];
                while (i11 < i13) {
                    iArr[i11] = aVar.readShort() & 65535;
                    i11++;
                }
                hVar.d(iArr);
                return;
            case 4:
                int i14 = hVar.f69262d;
                long[] jArr = new long[i14];
                for (int i15 = 0; i15 < i14; i15++) {
                    jArr[i15] = i();
                }
                if (hVar.a(i14) || s11 != 4) {
                    return;
                }
                while (i11 < i14) {
                    long j11 = jArr[i11];
                    if (j11 < 0 || j11 > 4294967295L) {
                        return;
                    } else {
                        i11++;
                    }
                }
                hVar.f69264f = jArr;
                hVar.f69262d = i14;
                return;
            case 5:
                int i16 = hVar.f69262d;
                j[] jVarArr = new j[i16];
                while (i11 < i16) {
                    jVarArr[i11] = new j(i(), i());
                    i11++;
                }
                hVar.e(jVarArr);
                return;
            case 6:
            case 8:
            default:
                return;
            case 9:
                int i17 = hVar.f69262d;
                int[] iArr2 = new int[i17];
                while (i11 < i17) {
                    iArr2[i11] = aVar.readInt();
                    i11++;
                }
                hVar.d(iArr2);
                return;
            case 10:
                int i18 = hVar.f69262d;
                j[] jVarArr2 = new j[i18];
                while (i11 < i18) {
                    jVarArr2[i11] = new j(aVar.readInt(), aVar.readInt());
                    i11++;
                }
                hVar.e(jVarArr2);
                return;
        }
    }

    public final h h() throws ExifInvalidFormatException, IOException {
        a aVar = this.f69243a;
        short s11 = aVar.readShort();
        short s12 = aVar.readShort();
        long j11 = aVar.readInt() & 4294967295L;
        if (j11 > 2147483647L) {
            throw new ExifInvalidFormatException("Number of component is larger then Integer.MAX_VALUE");
        }
        Charset charset = h.f69257h;
        if (s12 != 1 && s12 != 2 && s12 != 3 && s12 != 4 && s12 != 5 && s12 != 7 && s12 != 9 && s12 != 10) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("ExifParser");
            bVar.n("Tag %04x: Invalid data type %d", Short.valueOf(s11), Short.valueOf(s12));
            aVar.skip(4L);
            return null;
        }
        boolean z11 = true;
        int i5 = (int) j11;
        int i11 = this.f69247e;
        if (i5 == 0) {
            z11 = false;
        }
        h hVar = new h(s11, s12, i5, i11, z11);
        if (h.f69258i[s12] * i5 <= 4) {
            hVar.f69261c = false;
            g(hVar);
            hVar.f69261c = z11;
            aVar.skip(4 - r2);
            hVar.f69265g = aVar.f69156a - 4;
            return hVar;
        }
        long j12 = aVar.readInt() & 4294967295L;
        if (j12 > 2147483647L) {
            throw new ExifInvalidFormatException("offset is larger then Integer.MAX_VALUE");
        }
        if (j12 >= this.n || s12 != 7) {
            hVar.f69265g = (int) j12;
            return hVar;
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(this.f69255m, ((int) j12) - 8, bArr, 0, i5);
        hVar.c(bArr);
        return hVar;
    }

    public final long i() {
        return this.f69243a.readInt() & 4294967295L;
    }

    public final void j(int i5, long j11) {
        Integer numValueOf = Integer.valueOf((int) j11);
        boolean zC = c(i5);
        e eVar = new e();
        eVar.f69231a = i5;
        eVar.f69232b = zC;
        this.f69256p.put(numValueOf, eVar);
    }

    public final void k(int i5) throws EOFException {
        a aVar = this.f69243a;
        long j11 = i5 - aVar.f69156a;
        if (j11 < 0) {
            throw new AssertionError("diff < 0");
        }
        if (aVar.skip(j11) != j11) {
            throw new EOFException();
        }
        while (true) {
            TreeMap treeMap = this.f69256p;
            if (treeMap.isEmpty() || ((Integer) treeMap.firstKey()).intValue() >= i5) {
                return;
            } else {
                treeMap.pollFirstEntry();
            }
        }
    }
}
