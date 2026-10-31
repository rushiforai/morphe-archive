package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

import android.util.Log;
import android.util.Pair;
import android.util.SparseArray;
import androidx.compose.ui.node.LayoutNode;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.vungle.ads.internal.protos.Sdk;
import java.io.EOFException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Stack;
import java.util.UUID;

/* loaded from: classes3.dex */
public final class m implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i {
    public static final int A = z.a("seig");
    public static final byte[] B = {-94, 57, 79, 82, 90, -101, 79, 20, -94, 68, 108, 66, 124, 100, -115, -12};

    /* renamed from: f, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.v f29559f;

    /* renamed from: l, reason: collision with root package name */
    public int f29565l;

    /* renamed from: m, reason: collision with root package name */
    public long f29566m;
    public com.fyber.inneractive.sdk.player.exoplayer2.util.n o;

    /* renamed from: p, reason: collision with root package name */
    public long f29567p;

    /* renamed from: q, reason: collision with root package name */
    public int f29568q;

    /* renamed from: t, reason: collision with root package name */
    public l f29571t;

    /* renamed from: u, reason: collision with root package name */
    public int f29572u;

    /* renamed from: v, reason: collision with root package name */
    public int f29573v;

    /* renamed from: w, reason: collision with root package name */
    public int f29574w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f29575x;

    /* renamed from: y, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.j f29576y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f29577z;

    /* renamed from: g, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29560g = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(16);

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29555b = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(com.fyber.inneractive.sdk.player.exoplayer2.util.l.f30453a);

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29556c = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(5);

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29557d = new com.fyber.inneractive.sdk.player.exoplayer2.util.n();

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29558e = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(1);

    /* renamed from: h, reason: collision with root package name */
    public final byte[] f29561h = new byte[16];

    /* renamed from: i, reason: collision with root package name */
    public final Stack f29562i = new Stack();

    /* renamed from: j, reason: collision with root package name */
    public final LinkedList f29563j = new LinkedList();

    /* renamed from: a, reason: collision with root package name */
    public final SparseArray f29554a = new SparseArray();

    /* renamed from: r, reason: collision with root package name */
    public long f29569r = -9223372036854775807L;

    /* renamed from: s, reason: collision with root package name */
    public long f29570s = -9223372036854775807L;

    /* renamed from: k, reason: collision with root package name */
    public int f29564k = 0;
    public int n = 0;

    public m(com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar) {
        this.f29559f = vVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        return r.a(bVar, true);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        this.f29576y = jVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        int size = this.f29554a.size();
        for (int i5 = 0; i5 < size; i5++) {
            ((l) this.f29554a.valueAt(i5)).a();
        }
        this.f29563j.clear();
        this.f29568q = 0;
        this.f29562i.clear();
        this.f29564k = 0;
        this.n = 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0083, code lost:
    
        r2 = r27.f29571t;
        r3 = r2.f29547a;
        r4 = r3.f29641h;
        r9 = r2.f29551e;
        r27.f29572u = r4[r9];
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0091, code lost:
    
        if (r3.f29645l == false) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0093, code lost:
    
        r4 = r3.f29647p;
        r10 = r3.f29634a.f29541a;
        r11 = r3.n;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x009b, code lost:
    
        if (r11 == null) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x009e, code lost:
    
        r11 = r2.f29549c.f29628h[r10];
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00a4, code lost:
    
        r10 = r11.f29632a;
        r3 = r3.f29646m[r9];
        r9 = r27.f29558e;
        r11 = r9.f30461a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00ae, code lost:
    
        if (r3 == false) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00b0, code lost:
    
        r12 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00b3, code lost:
    
        r12 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00b4, code lost:
    
        r11[0] = (byte) (r12 | r10);
        r9.e(0);
        r2 = r2.f29548b;
        r2.a(1, r27.f29558e);
        r2.a(r10, r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c5, code lost:
    
        if (r3 != false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00c7, code lost:
    
        r10 = r10 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c9, code lost:
    
        r3 = r4.o();
        r4.e(r4.f30462b - 2);
        r3 = (r3 * 6) + 2;
        r2.a(r3, r4);
        r10 = (r10 + 1) + r3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00dd, code lost:
    
        r27.f29573v = r10;
        r27.f29572u += r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00e5, code lost:
    
        r27.f29573v = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00ed, code lost:
    
        if (r27.f29571t.f29549c.f29627g != 1) goto L52;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00ef, code lost:
    
        r27.f29572u -= 8;
        r28.a(8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x00f7, code lost:
    
        r27.f29564k = 4;
        r27.f29574w = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x00fe, code lost:
    
        r2 = r27.f29571t;
        r3 = r2.f29547a;
        r4 = r2.f29549c;
        r9 = r2.f29548b;
        r2 = r2.f29551e;
        r5 = r4.f29631k;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x010a, code lost:
    
        if (r5 == 0) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x010c, code lost:
    
        r12 = r27.f29556c.f30461a;
        r12[0] = 0;
        r12[1] = 0;
        r12[r29] = 0;
        r13 = r5 + 1;
        r5 = 4 - r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x011e, code lost:
    
        if (r27.f29573v >= r27.f29572u) goto L312;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0120, code lost:
    
        r14 = r27.f29574w;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0122, code lost:
    
        if (r14 != 0) goto L313;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0124, code lost:
    
        r28.b(r12, r5, r13, r7);
        r27.f29556c.e(r7 ? 1 : 0);
        r27.f29574w = r27.f29556c.m() - r6;
        r27.f29555b.e(r7 ? 1 : 0);
        r9.a(r8, r27.f29555b);
        r9.a(r6, r27.f29556c);
        r27.f29575x = r7;
        r27.f29573v += 5;
        r27.f29572u += r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0154, code lost:
    
        if (r27.f29575x == false) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0156, code lost:
    
        r27.f29557d.c(r14);
        r28.b(r27.f29557d.f30461a, r7 ? 1 : 0, r27.f29574w, r7);
        r9.a(r27.f29574w, r27.f29557d);
        r14 = r27.f29574w;
        r15 = r27.f29557d;
        r18 = r8;
        r8 = com.fyber.inneractive.sdk.player.exoplayer2.util.l.a(r15.f30463c, r15.f30461a);
        r27.f29557d.e("video/hevc".equals(r4.f29626f.f30128f) ? 1 : 0);
        r27.f29557d.d(r8);
        r21 = r6;
        com.fyber.inneractive.sdk.player.exoplayer2.text.cea.a.a((r3.f29643j[r2] + r3.f29642i[r2]) * 1000, r27.f29557d, null);
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x01a4, code lost:
    
        r21 = r6;
        r18 = r8;
        r14 = r9.a(r28, r14, r7 ? 1 : 0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x01af, code lost:
    
        r27.f29573v += r14;
        r27.f29574w -= r14;
        r8 = r18;
        r6 = r21;
        r7 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x01c0, code lost:
    
        r19 = 1000;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01c5, code lost:
    
        r19 = 1000;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01c9, code lost:
    
        r5 = r27.f29573v;
        r6 = r27.f29572u;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x01cd, code lost:
    
        if (r5 >= r6) goto L318;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x01cf, code lost:
    
        r27.f29573v += r9.a(r28, r6 - r5, false);
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x01db, code lost:
    
        r5 = (r3.f29643j[r2] + r3.f29642i[r2]) * r19;
        r1 = r3.f29645l;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x01e9, code lost:
    
        if (r1 == false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x01eb, code lost:
    
        r7 = 1073741824;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x01ee, code lost:
    
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x01ef, code lost:
    
        r12 = r7 | (r3.f29644k[r2] ? 1 : 0);
        r2 = r3.f29634a.f29541a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x01f9, code lost:
    
        if (r1 == false) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x01fb, code lost:
    
        r1 = r3.n;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01fd, code lost:
    
        if (r1 == null) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01ff, code lost:
    
        r1 = r1.f29633b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0201, code lost:
    
        r15 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0203, code lost:
    
        r1 = r4.f29628h[r2].f29633b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x020a, code lost:
    
        r15 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x020b, code lost:
    
        r1 = r27.f29559f;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x020d, code lost:
    
        if (r1 == null) goto L87;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x020f, code lost:
    
        r5 = r1.a(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x0213, code lost:
    
        r9.a(r5, r12, r27.f29572u, 0, r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0220, code lost:
    
        if (r27.f29563j.isEmpty() == false) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0222, code lost:
    
        r1 = r27.f29571t;
        r1.f29551e++;
        r2 = r1.f29552f + 1;
        r1.f29552f = r2;
        r3 = r3.f29640g;
        r4 = r1.f29553g;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0236, code lost:
    
        if (r2 != r3[r4]) goto L93;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0238, code lost:
    
        r1.f29553g = r4 + 1;
        r5 = 0;
        r1.f29552f = 0;
        r27.f29571t = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0244, code lost:
    
        r5 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0246, code lost:
    
        r27.f29564k = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x0248, code lost:
    
        return r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x0249, code lost:
    
        r27.f29568q -= ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.k) r27.f29563j.removeFirst()).f29546b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x025a, code lost:
    
        throw null;
     */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, com.fyber.inneractive.sdk.player.exoplayer2.r, EOFException {
        char c11;
        long jN;
        long jN2;
        while (true) {
            int i5 = this.f29564k;
            char c12 = 2;
            int i11 = 1;
            boolean z11 = false;
            if (i5 != 0) {
                int i12 = 4;
                if (i5 != 1) {
                    long j11 = Long.MAX_VALUE;
                    if (i5 != 2) {
                        if (i5 != 3) {
                            c11 = 2;
                            break;
                        }
                        if (this.f29571t != null) {
                            c11 = 2;
                            break;
                        }
                        SparseArray sparseArray = this.f29554a;
                        int size = sparseArray.size();
                        int i13 = 0;
                        l lVar = null;
                        while (i13 < size) {
                            l lVar2 = (l) sparseArray.valueAt(i13);
                            char c13 = c12;
                            int i14 = lVar2.f29553g;
                            u uVar = lVar2.f29547a;
                            if (i14 != uVar.f29637d) {
                                long j12 = uVar.f29639f[i14];
                                if (j12 < j11) {
                                    j11 = j12;
                                    lVar = lVar2;
                                }
                            }
                            i13++;
                            c12 = c13;
                        }
                        c11 = c12;
                        if (lVar == null) {
                            int i15 = (int) (this.f29567p - bVar.f29133c);
                            if (i15 >= 0) {
                                bVar.a(i15);
                                this.f29564k = 0;
                                this.n = 0;
                            } else {
                                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Offset to end of mdat was negative.");
                            }
                        } else {
                            int i16 = (int) (lVar.f29547a.f29639f[lVar.f29553g] - bVar.f29133c);
                            if (i16 < 0) {
                                Log.w("FragmentedMp4Extractor", "Ignoring negative offset to sample data.");
                                i16 = 0;
                            }
                            bVar.a(i16);
                            this.f29571t = lVar;
                        }
                    } else {
                        int size2 = this.f29554a.size();
                        l lVar3 = null;
                        for (int i17 = 0; i17 < size2; i17++) {
                            u uVar2 = ((l) this.f29554a.valueAt(i17)).f29547a;
                            if (uVar2.f29648q) {
                                long j13 = uVar2.f29636c;
                                if (j13 < j11) {
                                    lVar3 = (l) this.f29554a.valueAt(i17);
                                    j11 = j13;
                                }
                            }
                        }
                        if (lVar3 == null) {
                            this.f29564k = 3;
                        } else {
                            int i18 = (int) (j11 - bVar.f29133c);
                            if (i18 >= 0) {
                                bVar.a(i18);
                                u uVar3 = lVar3.f29547a;
                                bVar.b(uVar3.f29647p.f30461a, 0, uVar3.o, false);
                                uVar3.f29647p.e(0);
                                uVar3.f29648q = false;
                            } else {
                                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Offset to encryption data was negative.");
                            }
                        }
                    }
                } else {
                    int i19 = ((int) this.f29566m) - this.n;
                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.o;
                    if (nVar != null) {
                        bVar.b(nVar.f30461a, 8, i19, false);
                        int i21 = this.f29565l;
                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.o;
                        b bVar2 = new b(i21, nVar2);
                        long j14 = bVar.f29133c;
                        if (!this.f29562i.isEmpty()) {
                            ((a) this.f29562i.peek()).S0.add(bVar2);
                        } else if (i21 == c.B) {
                            nVar2.e(8);
                            int iB = (nVar2.b() >> 24) & 255;
                            nVar2.e(nVar2.f30462b + 4);
                            long jK = nVar2.k();
                            if (iB == 0) {
                                jN = nVar2.k();
                                jN2 = nVar2.k();
                            } else {
                                jN = nVar2.n();
                                jN2 = nVar2.n();
                            }
                            long j15 = jN2 + j14;
                            long j16 = jN;
                            long j17 = j15;
                            long jA = z.a(j16, 1000000L, jK);
                            nVar2.e(nVar2.f30462b + 2);
                            int iO = nVar2.o();
                            int[] iArr = new int[iO];
                            long[] jArr = new long[iO];
                            long[] jArr2 = new long[iO];
                            long[] jArr3 = new long[iO];
                            long jA2 = jA;
                            long j18 = j16;
                            int i22 = 0;
                            while (i22 < iO) {
                                int iB2 = nVar2.b();
                                if ((iB2 & Integer.MIN_VALUE) == 0) {
                                    long jK2 = nVar2.k();
                                    iArr[i22] = iB2 & LayoutNode.NotPlacedPlaceOrder;
                                    jArr[i22] = j17;
                                    jArr3[i22] = jA2;
                                    long j19 = j18 + jK2;
                                    long[] jArr4 = jArr2;
                                    long[] jArr5 = jArr3;
                                    int i23 = i22;
                                    jA2 = z.a(j19, 1000000L, jK);
                                    jArr4[i23] = jA2 - jArr5[i23];
                                    nVar2.e(nVar2.f30462b + 4);
                                    long j21 = j17 + iArr[i23];
                                    i22 = i23 + 1;
                                    j18 = j19;
                                    jArr2 = jArr4;
                                    jArr3 = jArr5;
                                    j17 = j21;
                                } else {
                                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Unhandled indirect reference");
                                }
                            }
                            Pair pairCreate = Pair.create(Long.valueOf(jA), new com.fyber.inneractive.sdk.player.exoplayer2.extractor.a(iArr, jArr, jArr2, jArr3));
                            this.f29570s = ((Long) pairCreate.first).longValue();
                            this.f29576y.a((com.fyber.inneractive.sdk.player.exoplayer2.extractor.q) pairCreate.second);
                            this.f29577z = true;
                        }
                    } else {
                        bVar.a(i19);
                    }
                    a(bVar.f29133c);
                }
            } else {
                if (this.n == 0) {
                    if (!bVar.b(this.f29560g.f30461a, 0, 8, true)) {
                        return -1;
                    }
                    this.n = 8;
                    this.f29560g.e(0);
                    this.f29566m = this.f29560g.k();
                    this.f29565l = this.f29560g.b();
                }
                if (this.f29566m == 1) {
                    bVar.b(this.f29560g.f30461a, 8, 8, false);
                    this.n += 8;
                    this.f29566m = this.f29560g.n();
                }
                long j22 = this.f29566m;
                long j23 = this.n;
                if (j22 >= j23) {
                    long j24 = bVar.f29133c - j23;
                    if (this.f29565l == c.L) {
                        int size3 = this.f29554a.size();
                        for (int i24 = 0; i24 < size3; i24++) {
                            u uVar4 = ((l) this.f29554a.valueAt(i24)).f29547a;
                            uVar4.getClass();
                            uVar4.f29636c = j24;
                            uVar4.f29635b = j24;
                        }
                    }
                    int i25 = this.f29565l;
                    if (i25 == c.f29477i) {
                        this.f29571t = null;
                        this.f29567p = j24 + this.f29566m;
                        if (!this.f29577z) {
                            this.f29576y.a(new com.fyber.inneractive.sdk.player.exoplayer2.extractor.p(this.f29569r));
                            this.f29577z = true;
                        }
                        this.f29564k = 2;
                    } else if (i25 != c.C && i25 != c.E && i25 != c.F && i25 != c.G && i25 != c.H && i25 != c.L && i25 != c.M && i25 != c.N && i25 != c.Q) {
                        if (i25 == c.T || i25 == c.S || i25 == c.D || i25 == c.B || i25 == c.U || i25 == c.f29505x || i25 == c.f29507y || i25 == c.P || i25 == c.f29509z || i25 == c.A || i25 == c.V || i25 == c.f29468d0 || i25 == c.f29470e0 || i25 == c.f29478i0 || i25 == c.f29476h0 || i25 == c.f29472f0 || i25 == c.f29474g0 || i25 == c.R || i25 == c.O || i25 == c.G0) {
                            if (this.n == 8) {
                                long j25 = this.f29566m;
                                if (j25 <= 2147483647L) {
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = new com.fyber.inneractive.sdk.player.exoplayer2.util.n((int) j25);
                                    this.o = nVar3;
                                    System.arraycopy(this.f29560g.f30461a, 0, nVar3.f30461a, 0, 8);
                                    this.f29564k = 1;
                                } else {
                                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Leaf atom with length > 2147483647 (unsupported).");
                                }
                            } else {
                                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Leaf atom defines extended atom size (unsupported).");
                            }
                        } else if (this.f29566m <= 2147483647L) {
                            this.o = null;
                            this.f29564k = 1;
                        } else {
                            throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Skipping atom with length > 2147483647 (unsupported).");
                        }
                    } else {
                        long j26 = (bVar.f29133c + this.f29566m) - 8;
                        this.f29562i.add(new a(this.f29565l, j26));
                        if (this.f29566m == this.n) {
                            a(j26);
                        } else {
                            this.f29564k = 0;
                            this.n = 0;
                        }
                    }
                } else {
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Atom size less than header length (unsupported).");
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:214:0x052b  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x05b9  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0204  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(long j11) throws com.fyber.inneractive.sdk.player.exoplayer2.r {
        s sVarA;
        int i5;
        SparseArray sparseArray;
        int i11;
        int i12;
        int i13;
        int i14;
        int size;
        int i15;
        int i16;
        int i17;
        ArrayList arrayList;
        long j12;
        int i18;
        boolean z11;
        long j13;
        int i19;
        long j14;
        int iM;
        int i21;
        int iB;
        int i22;
        j jVar;
        int i23;
        while (!this.f29562i.isEmpty() && ((a) this.f29562i.peek()).R0 == j11) {
            a aVar = (a) this.f29562i.pop();
            int i24 = aVar.f29511a;
            int i25 = 12;
            int i26 = 8;
            int i27 = 1;
            if (i24 == c.C) {
                com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVarA = a(aVar.S0);
                a aVarB = aVar.b(c.N);
                SparseArray sparseArray2 = new SparseArray();
                int size2 = aVarB.S0.size();
                long jK = -9223372036854775807L;
                int i28 = 0;
                while (i28 < size2) {
                    b bVar = (b) aVarB.S0.get(i28);
                    int i29 = bVar.f29511a;
                    if (i29 == c.f29509z) {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = bVar.R0;
                        nVar.e(i25);
                        i5 = i27;
                        Pair pairCreate = Pair.create(Integer.valueOf(nVar.b()), new j(nVar.m() - i27, nVar.m(), nVar.m(), nVar.b()));
                        sparseArray2.put(((Integer) pairCreate.first).intValue(), (j) pairCreate.second);
                    } else {
                        i5 = i27;
                        if (i29 == c.O) {
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = bVar.R0;
                            nVar2.e(8);
                            jK = ((nVar2.b() >> 24) & 255) == 0 ? nVar2.k() : nVar2.n();
                        }
                    }
                    i28++;
                    i27 = i5;
                    i25 = 12;
                }
                SparseArray sparseArray3 = new SparseArray();
                int size3 = aVar.T0.size();
                for (int i31 = 0; i31 < size3; i31++) {
                    a aVar2 = (a) aVar.T0.get(i31);
                    if (aVar2.f29511a == c.E && (sVarA = i.a(aVar2, aVar.c(c.D), jK, dVarA, false)) != null) {
                        sparseArray3.put(sVarA.f29621a, sVarA);
                    }
                }
                int size4 = sparseArray3.size();
                if (this.f29554a.size() == 0) {
                    for (int i32 = 0; i32 < size4; i32++) {
                        s sVar = (s) sparseArray3.valueAt(i32);
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = this.f29576y.a(i32, sVar.f29622b);
                        l lVar = new l(gVarA);
                        j jVar2 = (j) sparseArray2.get(sVar.f29621a);
                        lVar.f29549c = sVar;
                        jVar2.getClass();
                        lVar.f29550d = jVar2;
                        gVarA.a(sVar.f29626f);
                        lVar.a();
                        this.f29554a.put(sVar.f29621a, lVar);
                        this.f29569r = Math.max(this.f29569r, sVar.f29625e);
                    }
                    this.f29576y.b();
                } else {
                    if (this.f29554a.size() != size4) {
                        throw new IllegalStateException();
                    }
                    for (int i33 = 0; i33 < size4; i33++) {
                        s sVar2 = (s) sparseArray3.valueAt(i33);
                        l lVar2 = (l) this.f29554a.get(sVar2.f29621a);
                        j jVar3 = (j) sparseArray2.get(sVar2.f29621a);
                        lVar2.getClass();
                        lVar2.f29549c = sVar2;
                        jVar3.getClass();
                        lVar2.f29550d = jVar3;
                        lVar2.f29548b.a(sVar2.f29626f);
                        lVar2.a();
                    }
                }
            } else {
                int i34 = 1;
                if (i24 == c.L) {
                    SparseArray sparseArray4 = this.f29554a;
                    byte[] bArr = this.f29561h;
                    int size5 = aVar.T0.size();
                    int i35 = 0;
                    while (i35 < size5) {
                        a aVar3 = (a) aVar.T0.get(i35);
                        if (aVar3.f29511a == c.M) {
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = aVar3.c(c.f29507y).R0;
                            nVar3.e(i26);
                            int iB2 = nVar3.b();
                            l lVar3 = (l) sparseArray4.get(nVar3.b());
                            if (lVar3 == null) {
                                lVar3 = null;
                            } else {
                                if ((iB2 & 1) != 0) {
                                    long jN = nVar3.n();
                                    u uVar = lVar3.f29547a;
                                    uVar.f29635b = jN;
                                    uVar.f29636c = jN;
                                }
                                j jVar4 = lVar3.f29550d;
                                lVar3.f29547a.f29634a = new j((iB2 & 2) != 0 ? nVar3.m() - 1 : jVar4.f29541a, (iB2 & 8) != 0 ? nVar3.m() : jVar4.f29542b, (iB2 & 16) != 0 ? nVar3.m() : jVar4.f29543c, (iB2 & 32) != 0 ? nVar3.m() : jVar4.f29544d);
                            }
                            if (lVar3 == null) {
                                sparseArray = sparseArray4;
                                i11 = size5;
                                i12 = i35;
                                i13 = i26;
                                i14 = i34;
                            } else {
                                u uVar2 = lVar3.f29547a;
                                long jN2 = uVar2.f29649r;
                                lVar3.a();
                                int i36 = c.f29505x;
                                if (aVar3.c(i36) != null) {
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar4 = aVar3.c(i36).R0;
                                    nVar4.e(i26);
                                    jN2 = ((nVar4.b() >> 24) & 255) == i34 ? nVar4.n() : nVar4.k();
                                }
                                ArrayList arrayList2 = aVar3.S0;
                                int size6 = arrayList2.size();
                                int i37 = 0;
                                int i38 = 0;
                                int i39 = 0;
                                while (i38 < size6) {
                                    SparseArray sparseArray5 = sparseArray4;
                                    b bVar2 = (b) arrayList2.get(i38);
                                    int i40 = size5;
                                    int i41 = i35;
                                    if (bVar2.f29511a == c.A) {
                                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar5 = bVar2.R0;
                                        nVar5.e(12);
                                        int iM2 = nVar5.m();
                                        if (iM2 > 0) {
                                            i37 += iM2;
                                            i39++;
                                        }
                                    }
                                    i38++;
                                    size5 = i40;
                                    sparseArray4 = sparseArray5;
                                    i35 = i41;
                                }
                                sparseArray = sparseArray4;
                                i11 = size5;
                                i12 = i35;
                                lVar3.f29553g = 0;
                                lVar3.f29552f = 0;
                                lVar3.f29551e = 0;
                                u uVar3 = lVar3.f29547a;
                                uVar3.f29637d = i39;
                                uVar3.f29638e = i37;
                                int[] iArr = uVar3.f29640g;
                                if (iArr == null || iArr.length < i39) {
                                    uVar3.f29639f = new long[i39];
                                    uVar3.f29640g = new int[i39];
                                }
                                int[] iArr2 = uVar3.f29641h;
                                if (iArr2 == null || iArr2.length < i37) {
                                    int i42 = (i37 * Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE) / 100;
                                    uVar3.f29641h = new int[i42];
                                    uVar3.f29642i = new int[i42];
                                    uVar3.f29643j = new long[i42];
                                    uVar3.f29644k = new boolean[i42];
                                    uVar3.f29646m = new boolean[i42];
                                }
                                int i43 = 0;
                                int i44 = 0;
                                int i45 = 0;
                                while (i43 < size6) {
                                    long jA = 0;
                                    b bVar3 = (b) arrayList2.get(i43);
                                    if (bVar3.f29511a == c.A) {
                                        int i46 = i44 + 1;
                                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar6 = bVar3.R0;
                                        nVar6.e(8);
                                        int iB3 = nVar6.b();
                                        i17 = i43;
                                        s sVar3 = lVar3.f29549c;
                                        u uVar4 = lVar3.f29547a;
                                        int i47 = i44;
                                        j jVar5 = uVar4.f29634a;
                                        int i48 = i45;
                                        uVar4.f29640g[i47] = nVar6.m();
                                        long[] jArr = uVar4.f29639f;
                                        j12 = jN2;
                                        long j15 = uVar4.f29635b;
                                        jArr[i47] = j15;
                                        if ((iB3 & 1) != 0) {
                                            jArr[i47] = j15 + nVar6.b();
                                        }
                                        boolean z12 = (iB3 & 4) != 0;
                                        int iM3 = jVar5.f29544d;
                                        if (z12) {
                                            iM3 = nVar6.m();
                                        }
                                        boolean z13 = (iB3 & 256) != 0;
                                        boolean z14 = z12;
                                        boolean z15 = (iB3 & EventBridgeChannel.QUEUE_CAPACITY) != 0;
                                        boolean z16 = (iB3 & 1024) != 0;
                                        boolean z17 = (iB3 & 2048) != 0;
                                        boolean z18 = z16;
                                        long[] jArr2 = sVar3.f29629i;
                                        arrayList = arrayList2;
                                        if (jArr2 != null && jArr2.length == 1 && jArr2[0] == 0) {
                                            i18 = iM3;
                                            z11 = z13;
                                            jA = z.a(sVar3.f29630j[0], 1000L, sVar3.f29623c);
                                        } else {
                                            i18 = iM3;
                                            z11 = z13;
                                        }
                                        int[] iArr3 = uVar4.f29641h;
                                        int[] iArr4 = uVar4.f29642i;
                                        int i49 = i18;
                                        long[] jArr3 = uVar4.f29643j;
                                        boolean[] zArr = uVar4.f29644k;
                                        int i51 = i48 + uVar4.f29640g[i47];
                                        long j16 = sVar3.f29623c;
                                        if (i47 > 0) {
                                            j13 = j16;
                                            j14 = uVar4.f29649r;
                                            i19 = i48;
                                        } else {
                                            j13 = j16;
                                            i19 = i48;
                                            j14 = j12;
                                        }
                                        while (i19 < i51) {
                                            if (z11) {
                                                iM = nVar6.m();
                                            } else {
                                                iM = jVar5.f29542b;
                                            }
                                            int iM4 = z15 ? nVar6.m() : jVar5.f29543c;
                                            if (i19 == 0 && z14) {
                                                i21 = i19;
                                                iB = i49;
                                            } else if (z18) {
                                                i21 = i19;
                                                iB = nVar6.b();
                                            } else {
                                                i21 = i19;
                                                iB = jVar5.f29544d;
                                            }
                                            if (z17) {
                                                i22 = iB;
                                                jVar = jVar5;
                                                i23 = i51;
                                                iArr4[i21] = (int) ((nVar6.b() * 1000) / j13);
                                            } else {
                                                i22 = iB;
                                                jVar = jVar5;
                                                i23 = i51;
                                                iArr4[i21] = 0;
                                            }
                                            long j17 = j14;
                                            jArr3[i21] = z.a(j14, 1000L, j13) - jA;
                                            iArr3[i21] = iM4;
                                            zArr[i21] = ((i22 >> 16) & 1) == 0;
                                            j14 = j17 + iM;
                                            i19 = i21 + 1;
                                            jVar5 = jVar;
                                            i51 = i23;
                                        }
                                        uVar4.f29649r = j14;
                                        i44 = i46;
                                        i45 = i51;
                                    } else {
                                        i17 = i43;
                                        arrayList = arrayList2;
                                        j12 = jN2;
                                    }
                                    i43 = i17 + 1;
                                    jN2 = j12;
                                    arrayList2 = arrayList;
                                }
                                b bVarC = aVar3.c(c.f29468d0);
                                if (bVarC != null) {
                                    t tVar = lVar3.f29549c.f29628h[uVar2.f29634a.f29541a];
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar7 = bVarC.R0;
                                    int i52 = tVar.f29632a;
                                    nVar7.e(8);
                                    if ((nVar7.b() & 1) == 1) {
                                        nVar7.e(nVar7.f30462b + 8);
                                    }
                                    int iJ = nVar7.j();
                                    int iM5 = nVar7.m();
                                    if (iM5 == uVar2.f29638e) {
                                        if (iJ == 0) {
                                            boolean[] zArr2 = uVar2.f29646m;
                                            i16 = 0;
                                            for (int i53 = 0; i53 < iM5; i53++) {
                                                int iJ2 = nVar7.j();
                                                i16 += iJ2;
                                                zArr2[i53] = iJ2 > i52;
                                            }
                                        } else {
                                            i16 = iJ * iM5;
                                            Arrays.fill(uVar2.f29646m, 0, iM5, iJ > i52);
                                        }
                                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar8 = uVar2.f29647p;
                                        if (nVar8 == null || nVar8.f30463c < i16) {
                                            uVar2.f29647p = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(i16);
                                        }
                                        uVar2.o = i16;
                                        uVar2.f29645l = true;
                                        uVar2.f29648q = true;
                                    } else {
                                        StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Length mismatch: ", iM5, ", ");
                                        sbA.append(uVar2.f29638e);
                                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r(sbA.toString());
                                    }
                                }
                                b bVarC2 = aVar3.c(c.f29470e0);
                                if (bVarC2 != null) {
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar9 = bVarC2.R0;
                                    nVar9.e(8);
                                    int iB4 = nVar9.b();
                                    if ((iB4 & 1) == 1) {
                                        nVar9.e(nVar9.f30462b + 8);
                                    }
                                    int iM6 = nVar9.m();
                                    if (iM6 != 1) {
                                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r(com.fyber.inneractive.sdk.player.exoplayer2.m.a("Unexpected saio entry count: ", iM6));
                                    }
                                    uVar2.f29636c += ((iB4 >> 24) & 255) == 0 ? nVar9.k() : nVar9.n();
                                }
                                b bVarC3 = aVar3.c(c.f29478i0);
                                if (bVarC3 != null) {
                                    a(bVarC3.R0, 0, uVar2);
                                }
                                b bVarC4 = aVar3.c(c.f29472f0);
                                b bVarC5 = aVar3.c(c.f29474g0);
                                if (bVarC4 != null && bVarC5 != null) {
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar10 = bVarC4.R0;
                                    com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar11 = bVarC5.R0;
                                    nVar10.e(8);
                                    int iB5 = nVar10.b();
                                    int iB6 = nVar10.b();
                                    int i54 = A;
                                    if (iB6 == i54) {
                                        i14 = 1;
                                        if (((iB5 >> 24) & 255) == 1) {
                                            nVar10.e(nVar10.f30462b + 4);
                                        }
                                        if (nVar10.b() == 1) {
                                            nVar11.e(8);
                                            int iB7 = nVar11.b();
                                            if (nVar11.b() == i54) {
                                                int i55 = (iB7 >> 24) & 255;
                                                if (i55 == 1) {
                                                    if (nVar11.k() == 0) {
                                                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Variable length decription in sgpd found (unsupported)");
                                                    }
                                                } else if (i55 >= 2) {
                                                    nVar11.e(nVar11.f30462b + 4);
                                                }
                                                if (nVar11.k() == 1) {
                                                    nVar11.e(nVar11.f30462b + 2);
                                                    i14 = 1;
                                                    if (nVar11.j() == 1) {
                                                        int iJ3 = nVar11.j();
                                                        byte[] bArr2 = new byte[16];
                                                        nVar11.a(bArr2, 0, 16);
                                                        uVar2.f29645l = true;
                                                        uVar2.n = new t(iJ3, bArr2);
                                                    }
                                                } else {
                                                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Entry count in sgpd != 1 (unsupported).");
                                                }
                                            }
                                        } else {
                                            throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Entry count in sbgp != 1 (unsupported).");
                                        }
                                    }
                                    size = aVar3.S0.size();
                                    while (i15 < size) {
                                    }
                                    i13 = 8;
                                } else {
                                    i14 = 1;
                                    size = aVar3.S0.size();
                                    for (i15 = 0; i15 < size; i15++) {
                                        b bVar4 = (b) aVar3.S0.get(i15);
                                        if (bVar4.f29511a == c.f29476h0) {
                                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar12 = bVar4.R0;
                                            nVar12.e(8);
                                            nVar12.a(bArr, 0, 16);
                                            if (Arrays.equals(bArr, B)) {
                                                a(nVar12, 16, uVar2);
                                            }
                                        }
                                    }
                                    i13 = 8;
                                }
                            }
                        }
                        i35 = i12 + 1;
                        i34 = i14;
                        i26 = i13;
                        size5 = i11;
                        sparseArray4 = sparseArray;
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.drm.d dVarA2 = a(aVar.S0);
                    if (dVarA2 != null) {
                        int i56 = 0;
                        for (int size7 = this.f29554a.size(); i56 < size7; size7 = size7) {
                            l lVar4 = (l) this.f29554a.valueAt(i56);
                            com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar = lVar4.f29548b;
                            com.fyber.inneractive.sdk.player.exoplayer2.o oVar = lVar4.f29549c.f29626f;
                            rVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.o(oVar.f30123a, oVar.f30127e, oVar.f30128f, oVar.f30125c, oVar.f30124b, oVar.f30129g, oVar.f30132j, oVar.f30133k, oVar.f30134l, oVar.f30135m, oVar.n, oVar.f30136p, oVar.o, oVar.f30137q, oVar.f30138r, oVar.f30139s, oVar.f30140t, oVar.f30141u, oVar.f30142v, oVar.f30144x, oVar.f30145y, oVar.f30146z, oVar.f30143w, oVar.f30130h, dVarA2, oVar.f30126d));
                            i56++;
                        }
                    }
                } else if (!this.f29562i.isEmpty()) {
                    ((a) this.f29562i.peek()).T0.add(aVar);
                }
            }
        }
        this.f29564k = 0;
        this.n = 0;
    }

    public static void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, int i5, u uVar) throws com.fyber.inneractive.sdk.player.exoplayer2.r {
        nVar.e(i5 + 8);
        int iB = nVar.b();
        int i11 = c.f29463b;
        if ((iB & 1) == 0) {
            boolean z11 = (iB & 2) != 0;
            int iM = nVar.m();
            if (iM == uVar.f29638e) {
                Arrays.fill(uVar.f29646m, 0, iM, z11);
                int i12 = nVar.f30463c - nVar.f30462b;
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = uVar.f29647p;
                if (nVar2 == null || nVar2.f30463c < i12) {
                    uVar.f29647p = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(i12);
                }
                uVar.o = i12;
                uVar.f29645l = true;
                uVar.f29648q = true;
                nVar.a(uVar.f29647p.f30461a, 0, i12);
                uVar.f29647p.e(0);
                uVar.f29648q = false;
                return;
            }
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Length mismatch: ", iM, ", ");
            sbA.append(uVar.f29638e);
            throw new com.fyber.inneractive.sdk.player.exoplayer2.r(sbA.toString());
        }
        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Overriding TrackEncryptionBox parameters is unsupported.");
    }

    public static com.fyber.inneractive.sdk.player.exoplayer2.drm.d a(ArrayList arrayList) {
        int size = arrayList.size();
        ArrayList arrayList2 = null;
        for (int i5 = 0; i5 < size; i5++) {
            b bVar = (b) arrayList.get(i5);
            if (bVar.f29511a == c.V) {
                if (arrayList2 == null) {
                    arrayList2 = new ArrayList();
                }
                byte[] bArr = bVar.R0.f30461a;
                UUID uuidA = q.a(bArr);
                if (uuidA == null) {
                    Log.w("FragmentedMp4Extractor", "Skipped pssh atom (failed to extract uuid)");
                } else {
                    arrayList2.add(new com.fyber.inneractive.sdk.player.exoplayer2.drm.c(uuidA, "video/mp4", bArr));
                }
            }
        }
        if (arrayList2 == null) {
            return null;
        }
        return new com.fyber.inneractive.sdk.player.exoplayer2.drm.d(false, (com.fyber.inneractive.sdk.player.exoplayer2.drm.c[]) arrayList2.toArray(new com.fyber.inneractive.sdk.player.exoplayer2.drm.c[arrayList2.size()]));
    }
}
