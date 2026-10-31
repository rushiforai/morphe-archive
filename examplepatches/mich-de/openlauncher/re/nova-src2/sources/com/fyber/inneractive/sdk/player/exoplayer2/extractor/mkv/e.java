package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mkv;

import android.util.SparseArray;
import b.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.i;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.j;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.o;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.p;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.q;
import com.fyber.inneractive.sdk.player.exoplayer2.m;
import com.fyber.inneractive.sdk.player.exoplayer2.r;
import com.fyber.inneractive.sdk.player.exoplayer2.util.l;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import h6.c1;
import java.io.EOFException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Locale;
import java.util.UUID;

/* loaded from: classes3.dex */
public final class e implements i {
    public static final byte[] Z = {49, 10, 48, 48, 58, 48, 48, 58, 48, 48, 44, 48, 48, 48, 32, 45, 45, 62, 32, 48, 48, 58, 48, 48, 58, 48, 48, 44, 48, 48, 48, 10};

    /* renamed from: a0, reason: collision with root package name */
    public static final byte[] f29405a0 = {32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32};

    /* renamed from: b0, reason: collision with root package name */
    public static final UUID f29406b0 = new UUID(72057594037932032L, -9223371306706625679L);
    public long A;
    public com.fyber.inneractive.sdk.player.exoplayer2.util.g B;
    public com.fyber.inneractive.sdk.player.exoplayer2.util.g C;
    public boolean D;
    public int E;
    public long F;
    public long G;
    public int H;
    public int I;
    public int[] J;
    public int K;
    public int L;
    public int M;
    public int N;
    public boolean O;
    public boolean P;
    public boolean Q;
    public boolean R;
    public byte S;
    public int T;
    public int U;
    public int V;
    public boolean W;
    public boolean X;
    public j Y;

    /* renamed from: a, reason: collision with root package name */
    public final b f29407a;

    /* renamed from: b, reason: collision with root package name */
    public final g f29408b;

    /* renamed from: c, reason: collision with root package name */
    public final SparseArray f29409c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f29410d;

    /* renamed from: e, reason: collision with root package name */
    public final n f29411e;

    /* renamed from: f, reason: collision with root package name */
    public final n f29412f;

    /* renamed from: g, reason: collision with root package name */
    public final n f29413g;

    /* renamed from: h, reason: collision with root package name */
    public final n f29414h;

    /* renamed from: i, reason: collision with root package name */
    public final n f29415i;

    /* renamed from: j, reason: collision with root package name */
    public final n f29416j;

    /* renamed from: k, reason: collision with root package name */
    public final n f29417k;

    /* renamed from: l, reason: collision with root package name */
    public final n f29418l;

    /* renamed from: m, reason: collision with root package name */
    public final n f29419m;
    public ByteBuffer n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public long f29420p;

    /* renamed from: q, reason: collision with root package name */
    public long f29421q;

    /* renamed from: r, reason: collision with root package name */
    public long f29422r;

    /* renamed from: s, reason: collision with root package name */
    public long f29423s;

    /* renamed from: t, reason: collision with root package name */
    public d f29424t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f29425u;

    /* renamed from: v, reason: collision with root package name */
    public int f29426v;

    /* renamed from: w, reason: collision with root package name */
    public long f29427w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f29428x;

    /* renamed from: y, reason: collision with root package name */
    public long f29429y;

    /* renamed from: z, reason: collision with root package name */
    public long f29430z;

    public e() {
        b bVar = new b();
        this.f29420p = -1L;
        this.f29421q = -9223372036854775807L;
        this.f29422r = -9223372036854775807L;
        this.f29423s = -9223372036854775807L;
        this.f29429y = -1L;
        this.f29430z = -1L;
        this.A = -9223372036854775807L;
        this.f29407a = bVar;
        bVar.f29376d = new c(this);
        this.f29410d = true;
        this.f29408b = new g();
        this.f29409c = new SparseArray();
        this.f29413g = new n(4);
        this.f29414h = new n(ByteBuffer.allocate(4).putInt(-1).array());
        this.f29415i = new n(4);
        this.f29411e = new n(l.f30453a);
        this.f29412f = new n(4);
        this.f29416j = new n();
        this.f29417k = new n();
        this.f29418l = new n(8);
        this.f29419m = new n();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        f fVar = new f();
        long j11 = bVar.f29132b;
        long j12 = 1024;
        if (j11 != -1 && j11 <= 1024) {
            j12 = j11;
        }
        int i5 = (int) j12;
        bVar.a(fVar.f29431a.f30461a, 0, 4, false);
        long jK = fVar.f29431a.k();
        fVar.f29432b = 4;
        while (true) {
            if (jK != 440786851) {
                int i11 = fVar.f29432b + 1;
                fVar.f29432b = i11;
                if (i11 == i5) {
                    break;
                }
                bVar.a(fVar.f29431a.f30461a, 0, 1, false);
                jK = ((jK << 8) & (-256)) | (fVar.f29431a.f30461a[0] & 255);
            } else {
                long jA = fVar.a(bVar);
                long j13 = fVar.f29432b;
                if (jA != Long.MIN_VALUE && (j11 == -1 || j13 + jA < j11)) {
                    while (true) {
                        long j14 = fVar.f29432b;
                        long j15 = j13 + jA;
                        if (j14 < j15) {
                            if (fVar.a(bVar) == Long.MIN_VALUE) {
                                break;
                            }
                            long jA2 = fVar.a(bVar);
                            if (jA2 < 0 || jA2 > 2147483647L) {
                                break;
                            }
                            if (jA2 != 0) {
                                bVar.a((int) jA2, false);
                                fVar.f29432b = (int) (fVar.f29432b + jA2);
                            }
                        } else if (j14 == j15) {
                            return true;
                        }
                    }
                }
            }
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(j jVar) {
        this.Y = jVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        this.A = -9223372036854775807L;
        this.E = 0;
        b bVar = this.f29407a;
        bVar.f29377e = 0;
        bVar.f29374b.clear();
        g gVar = bVar.f29375c;
        gVar.f29435b = 0;
        gVar.f29436c = 0;
        g gVar2 = this.f29408b;
        gVar2.f29435b = 0;
        gVar2.f29436c = 0;
        this.N = 0;
        this.V = 0;
        this.U = 0;
        this.O = false;
        this.P = false;
        this.R = false;
        this.T = 0;
        this.S = (byte) 0;
        this.Q = false;
        n nVar = this.f29416j;
        nVar.f30462b = 0;
        nVar.f30463c = 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:168:0x02e4, code lost:
    
        r5 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:578:0x0a61, code lost:
    
        if (r5 == false) goto L631;
     */
    /* JADX WARN: Code restructure failed: missing block: B:579:0x0a63, code lost:
    
        r3 = r33.f29133c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:580:0x0a67, code lost:
    
        if (r32.f29428x == false) goto L583;
     */
    /* JADX WARN: Code restructure failed: missing block: B:581:0x0a69, code lost:
    
        r32.f29430z = r3;
        r34.f29669a = r32.f29429y;
        r32.f29428x = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:582:0x0a71, code lost:
    
        return 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:584:0x0a76, code lost:
    
        if (r32.f29425u == false) goto L632;
     */
    /* JADX WARN: Code restructure failed: missing block: B:585:0x0a78, code lost:
    
        r3 = r32.f29430z;
     */
    /* JADX WARN: Code restructure failed: missing block: B:586:0x0a7e, code lost:
    
        if (r3 == (-1)) goto L633;
     */
    /* JADX WARN: Code restructure failed: missing block: B:587:0x0a80, code lost:
    
        r34.f29669a = r3;
        r32.f29430z = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:589:0x0a86, code lost:
    
        r3 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:632:0x0a86, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:657:?, code lost:
    
        return 1;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:306:0x057f  */
    /* JADX WARN: Removed duplicated region for block: B:307:0x058e  */
    /* JADX WARN: Removed duplicated region for block: B:444:0x082a  */
    /* JADX WARN: Type inference failed for: r3v104, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r3v110 */
    /* JADX WARN: Type inference failed for: r3v161 */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, o oVar) throws InterruptedException, r, EOFException {
        boolean z11;
        long j11;
        int i5;
        boolean z12;
        String str;
        boolean z13;
        int i11;
        int i12;
        int i13;
        char c11;
        int i14;
        long j12;
        int i15;
        int i16;
        double dLongBitsToDouble;
        long j13;
        int i17;
        int iA;
        boolean z14;
        q pVar;
        com.fyber.inneractive.sdk.player.exoplayer2.util.g gVar;
        int i18;
        com.fyber.inneractive.sdk.player.exoplayer2.util.g gVar2;
        boolean z15 = false;
        this.W = false;
        boolean z16 = true;
        while (z16 && !this.W) {
            b bVar2 = this.f29407a;
            boolean z17 = z15;
            if (bVar2.f29376d == null) {
                throw new IllegalStateException();
            }
            while (true) {
                if (!bVar2.f29374b.isEmpty() && bVar.f29133c >= ((a) bVar2.f29374b.peek()).f29372b) {
                    c cVar = bVar2.f29376d;
                    int i19 = ((a) bVar2.f29374b.pop()).f29371a;
                    e eVar = cVar.f29380a;
                    if (i19 != 160) {
                        if (i19 == 174) {
                            String str2 = eVar.f29424t.f29381a;
                            if ("V_VP8".equals(str2) || "V_VP9".equals(str2) || "V_MPEG2".equals(str2) || "V_MPEG4/ISO/SP".equals(str2) || "V_MPEG4/ISO/ASP".equals(str2) || "V_MPEG4/ISO/AP".equals(str2) || "V_MPEG4/ISO/AVC".equals(str2) || "V_MPEGH/ISO/HEVC".equals(str2) || "V_MS/VFW/FOURCC".equals(str2) || "V_THEORA".equals(str2) || "A_OPUS".equals(str2) || "A_VORBIS".equals(str2) || "A_AAC".equals(str2) || "A_MPEG/L2".equals(str2) || "A_MPEG/L3".equals(str2) || "A_AC3".equals(str2) || "A_EAC3".equals(str2) || "A_TRUEHD".equals(str2) || "A_DTS".equals(str2) || "A_DTS/EXPRESS".equals(str2) || "A_DTS/LOSSLESS".equals(str2) || "A_FLAC".equals(str2) || "A_MS/ACM".equals(str2) || "A_PCM/INT/LIT".equals(str2) || "S_TEXT/UTF8".equals(str2) || "S_VOBSUB".equals(str2) || "S_HDMV/PGS".equals(str2) || "S_DVBSUB".equals(str2)) {
                                d dVar = eVar.f29424t;
                                dVar.a(eVar.Y, dVar.f29382b);
                                SparseArray sparseArray = eVar.f29409c;
                                d dVar2 = eVar.f29424t;
                                sparseArray.put(dVar2.f29382b, dVar2);
                            }
                            eVar.f29424t = null;
                        } else {
                            if (i19 == 19899) {
                                int i21 = eVar.f29426v;
                                if (i21 != -1) {
                                    long j14 = eVar.f29427w;
                                    if (j14 != -1) {
                                        if (i21 == 475249515) {
                                            eVar.f29429y = j14;
                                        }
                                    }
                                }
                                throw new r("Mandatory element SeekID or SeekPosition not found");
                            }
                            if (i19 == 25152) {
                                d dVar3 = eVar.f29424t;
                                if (dVar3.f29385e) {
                                    byte[] bArr = dVar3.f29387g;
                                    if (bArr != null) {
                                        dVar3.f29389i = new com.fyber.inneractive.sdk.player.exoplayer2.drm.d(true, new com.fyber.inneractive.sdk.player.exoplayer2.drm.c(com.fyber.inneractive.sdk.player.exoplayer2.b.f29096b, "video/webm", bArr));
                                    } else {
                                        throw new r("Encrypted Track found but ContentEncKeyID was not found");
                                    }
                                }
                            } else if (i19 == 28032) {
                                d dVar4 = eVar.f29424t;
                                if (dVar4.f29385e && dVar4.f29386f != null) {
                                    throw new r("Combining encryption and compression is not supported");
                                }
                            } else if (i19 == 357149030) {
                                if (eVar.f29421q == -9223372036854775807L) {
                                    eVar.f29421q = 1000000L;
                                }
                                long j15 = eVar.f29422r;
                                if (j15 != -9223372036854775807L) {
                                    eVar.f29423s = eVar.a(j15);
                                }
                            } else if (i19 != 374648427) {
                                if (i19 != 475249515) {
                                    eVar.getClass();
                                    z14 = z17;
                                } else {
                                    z14 = z17;
                                    if (!eVar.f29425u) {
                                        j jVar = eVar.Y;
                                        if (eVar.f29420p != -1 && eVar.f29423s != -9223372036854775807L && (gVar = eVar.B) != null && (i18 = gVar.f30439a) != 0 && (gVar2 = eVar.C) != null && gVar2.f30439a == i18) {
                                            int[] iArr = new int[i18];
                                            long[] jArr = new long[i18];
                                            long[] jArr2 = new long[i18];
                                            long[] jArr3 = new long[i18];
                                            for (int i22 = z17 ? 1 : 0; i22 < i18; i22++) {
                                                com.fyber.inneractive.sdk.player.exoplayer2.util.g gVar3 = eVar.B;
                                                if (i22 >= 0) {
                                                    if (i22 < gVar3.f30439a) {
                                                        jArr3[i22] = gVar3.f30440b[i22];
                                                        long j16 = eVar.f29420p;
                                                        com.fyber.inneractive.sdk.player.exoplayer2.util.g gVar4 = eVar.C;
                                                        if (i22 < 0) {
                                                            gVar4.getClass();
                                                        } else if (i22 < gVar4.f30439a) {
                                                            jArr[i22] = gVar4.f30440b[i22] + j16;
                                                        }
                                                        StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Invalid index ", i22, ", size is ");
                                                        sbA.append(gVar4.f30439a);
                                                        throw new IndexOutOfBoundsException(sbA.toString());
                                                    }
                                                } else {
                                                    gVar3.getClass();
                                                }
                                                StringBuilder sbA2 = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Invalid index ", i22, ", size is ");
                                                sbA2.append(gVar3.f30439a);
                                                throw new IndexOutOfBoundsException(sbA2.toString());
                                            }
                                            int i23 = 0;
                                            while (true) {
                                                int i24 = i18 - 1;
                                                if (i23 < i24) {
                                                    int i25 = i23 + 1;
                                                    iArr[i23] = (int) (jArr[i25] - jArr[i23]);
                                                    jArr2[i23] = jArr3[i25] - jArr3[i23];
                                                    i23 = i25;
                                                } else {
                                                    iArr[i24] = (int) ((eVar.f29420p + eVar.o) - jArr[i24]);
                                                    jArr2[i24] = eVar.f29423s - jArr3[i24];
                                                    eVar.B = null;
                                                    eVar.C = null;
                                                    pVar = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.a(iArr, jArr, jArr2, jArr3);
                                                }
                                            }
                                        } else {
                                            eVar.B = null;
                                            eVar.C = null;
                                            pVar = new p(eVar.f29423s);
                                        }
                                        jVar.a(pVar);
                                        eVar.f29425u = true;
                                    }
                                }
                                z12 = z14;
                            } else if (eVar.f29409c.size() != 0) {
                                eVar.Y.b();
                            } else {
                                throw new r("No valid tracks were found");
                            }
                        }
                        z14 = false;
                        z12 = z14;
                    } else {
                        if (eVar.E != 2) {
                            z14 = false;
                        } else {
                            if (!eVar.X) {
                                eVar.M |= 1;
                            }
                            eVar.a((d) eVar.f29409c.get(eVar.K), eVar.F);
                            z14 = false;
                            eVar.E = 0;
                        }
                        z12 = z14;
                    }
                } else {
                    int i26 = 8;
                    if (bVar2.f29377e == 0) {
                        long jA = bVar2.f29375c.a(bVar, true, z17, 4);
                        if (jA == -2) {
                            bVar.f29135e = z17 ? 1 : 0;
                            ?? r32 = z17;
                            while (true) {
                                bVar.a(bVar2.f29373a, r32, 4, r32);
                                byte b11 = bVar2.f29373a[r32];
                                i17 = 0;
                                while (true) {
                                    long[] jArr4 = g.f29433d;
                                    if (i17 < 8) {
                                        j11 = 0;
                                        long j17 = jArr4[i17] & b11;
                                        i17++;
                                        if (j17 != 0) {
                                        }
                                    } else {
                                        j11 = 0;
                                        i17 = -1;
                                    }
                                }
                                if (i17 != -1 && i17 <= 4) {
                                    iA = (int) g.a(bVar2.f29373a, i17, false);
                                    bVar2.f29376d.f29380a.getClass();
                                    if (iA == 357149030 || iA == 524531317 || iA == 475249515 || iA == 374648427) {
                                    }
                                }
                                bVar.a(1);
                                r32 = 0;
                            }
                            bVar.a(i17);
                            j13 = iA;
                        } else {
                            j11 = 0;
                            j13 = jA;
                        }
                        z11 = true;
                        if (j13 == -1) {
                            z16 = false;
                            z12 = false;
                        } else {
                            bVar2.f29378f = (int) j13;
                            bVar2.f29377e = 1;
                        }
                    } else {
                        z11 = true;
                        j11 = 0;
                    }
                    if (bVar2.f29377e == z11) {
                        bVar2.f29379g = bVar2.f29375c.a(bVar, false, z11, 8);
                        bVar2.f29377e = 2;
                    }
                    c cVar2 = bVar2.f29376d;
                    int i27 = bVar2.f29378f;
                    cVar2.f29380a.getClass();
                    switch (i27) {
                        case MRAID_JS_WRITE_FAILED_VALUE:
                        case PRIVACY_URL_ERROR_VALUE:
                        case 155:
                        case 159:
                        case 176:
                        case 179:
                        case 186:
                        case AD_RESPONSE_EMPTY_VALUE:
                        case 231:
                        case 241:
                        case 251:
                        case 16980:
                        case 17029:
                        case 17143:
                        case 18401:
                        case 18408:
                        case 20529:
                        case 20530:
                        case 21420:
                        case 21432:
                        case 21680:
                        case 21682:
                        case 21690:
                        case 21930:
                        case 21945:
                        case 21946:
                        case 21947:
                        case 21948:
                        case 21949:
                        case 22186:
                        case 22203:
                        case 25188:
                        case 2352003:
                        case 2807729:
                            i5 = 2;
                            break;
                        case STORE_REGION_CODE_ERROR_VALUE:
                        case 17026:
                        case 2274716:
                            i5 = 3;
                            break;
                        case 160:
                        case 174:
                        case 183:
                        case 187:
                        case AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE:
                        case AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE:
                        case 18407:
                        case 19899:
                        case 20532:
                        case 20533:
                        case 21936:
                        case 21968:
                        case 25152:
                        case 28032:
                        case 30320:
                        case 290298740:
                        case 357149030:
                        case 374648427:
                        case 408125543:
                        case 440786851:
                        case 475249515:
                        case 524531317:
                            i5 = 1;
                            break;
                        case 161:
                        case 163:
                        case 16981:
                        case 18402:
                        case 21419:
                        case 25506:
                        case 30322:
                            i5 = 4;
                            break;
                        case 181:
                        case 17545:
                        case 21969:
                        case 21970:
                        case 21971:
                        case 21972:
                        case 21973:
                        case 21974:
                        case 21975:
                        case 21976:
                        case 21977:
                        case 21978:
                            i5 = 5;
                            break;
                        default:
                            i5 = 0;
                            break;
                    }
                    if (i5 == 0) {
                        bVar.a((int) bVar2.f29379g);
                        bVar2.f29377e = 0;
                        z17 = false;
                    } else if (i5 != 1) {
                        char c12 = 6;
                        byte b12 = 255;
                        if (i5 == 2) {
                            long j18 = bVar2.f29379g;
                            if (j18 <= 8) {
                                c cVar3 = bVar2.f29376d;
                                int i28 = bVar2.f29378f;
                                int i29 = (int) j18;
                                bVar.b(bVar2.f29373a, 0, i29, false);
                                long j19 = j11;
                                for (int i31 = 0; i31 < i29; i31++) {
                                    j19 = (j19 << 8) | (bVar2.f29373a[i31] & 255);
                                }
                                e eVar2 = cVar3.f29380a;
                                eVar2.getClass();
                                if (i28 != 20529) {
                                    if (i28 != 20530) {
                                        switch (i28) {
                                            case MRAID_JS_WRITE_FAILED_VALUE:
                                                eVar2.f29424t.f29383c = (int) j19;
                                                break;
                                            case PRIVACY_URL_ERROR_VALUE:
                                                eVar2.f29424t.L = j19 == 1;
                                                break;
                                            case 155:
                                                eVar2.G = eVar2.a(j19);
                                                break;
                                            case 159:
                                                eVar2.f29424t.G = (int) j19;
                                                break;
                                            case 176:
                                                eVar2.f29424t.f29390j = (int) j19;
                                                break;
                                            case 179:
                                                eVar2.B.a(eVar2.a(j19));
                                                break;
                                            case 186:
                                                eVar2.f29424t.f29391k = (int) j19;
                                                break;
                                            case AD_RESPONSE_EMPTY_VALUE:
                                                eVar2.f29424t.f29382b = (int) j19;
                                                break;
                                            case 231:
                                                eVar2.A = eVar2.a(j19);
                                                break;
                                            case 241:
                                                if (!eVar2.D) {
                                                    eVar2.C.a(j19);
                                                    eVar2.D = true;
                                                    break;
                                                }
                                                break;
                                            case 251:
                                                eVar2.X = true;
                                                break;
                                            case 16980:
                                                if (j19 != 3) {
                                                    throw new r(c1.o(j19, "ContentCompAlgo ", " not supported"));
                                                }
                                                break;
                                            case 17029:
                                                if (j19 < 1 || j19 > 2) {
                                                    throw new r(c1.o(j19, "DocTypeReadVersion ", " not supported"));
                                                }
                                                break;
                                            case 17143:
                                                if (j19 != 1) {
                                                    throw new r(c1.o(j19, "EBMLReadVersion ", " not supported"));
                                                }
                                                break;
                                            case 18401:
                                                if (j19 != 5) {
                                                    throw new r(c1.o(j19, "ContentEncAlgo ", " not supported"));
                                                }
                                                break;
                                            case 18408:
                                                if (j19 != 1) {
                                                    throw new r(c1.o(j19, "AESSettingsCipherMode ", " not supported"));
                                                }
                                                break;
                                            case 21420:
                                                eVar2.f29427w = j19 + eVar2.f29420p;
                                                break;
                                            case 21432:
                                                int i32 = (int) j19;
                                                if (i32 != 0) {
                                                    if (i32 != 1) {
                                                        if (i32 != 3) {
                                                            if (i32 == 15) {
                                                                eVar2.f29424t.f29394p = 3;
                                                                break;
                                                            }
                                                        } else {
                                                            eVar2.f29424t.f29394p = 1;
                                                            break;
                                                        }
                                                    } else {
                                                        eVar2.f29424t.f29394p = 2;
                                                        break;
                                                    }
                                                } else {
                                                    z12 = false;
                                                    eVar2.f29424t.f29394p = 0;
                                                    bVar2.f29377e = z12 ? 1 : 0;
                                                    break;
                                                }
                                                break;
                                            case 21680:
                                                eVar2.f29424t.f29392l = (int) j19;
                                                break;
                                            case 21682:
                                                eVar2.f29424t.n = (int) j19;
                                                break;
                                            case 21690:
                                                eVar2.f29424t.f29393m = (int) j19;
                                                break;
                                            case 21930:
                                                eVar2.f29424t.M = j19 == 1;
                                                break;
                                            case 22186:
                                                eVar2.f29424t.J = j19;
                                                break;
                                            case 22203:
                                                eVar2.f29424t.K = j19;
                                                break;
                                            case 25188:
                                                eVar2.f29424t.H = (int) j19;
                                                break;
                                            case 2352003:
                                                eVar2.f29424t.f29384d = (int) j19;
                                                break;
                                            case 2807729:
                                                eVar2.f29421q = j19;
                                                break;
                                            default:
                                                switch (i28) {
                                                    case 21945:
                                                        int i33 = (int) j19;
                                                        if (i33 != 1) {
                                                            if (i33 == 2) {
                                                                eVar2.f29424t.f29398t = 1;
                                                                break;
                                                            }
                                                        } else {
                                                            eVar2.f29424t.f29398t = 2;
                                                            break;
                                                        }
                                                        break;
                                                    case 21946:
                                                        int i34 = (int) j19;
                                                        if (i34 == 1) {
                                                            eVar2.f29424t.f29397s = 3;
                                                            break;
                                                        } else if (i34 == 16) {
                                                            eVar2.f29424t.f29397s = 6;
                                                            break;
                                                        } else if (i34 == 18) {
                                                            eVar2.f29424t.f29397s = 7;
                                                            break;
                                                        } else if (i34 == 6 || i34 == 7) {
                                                        }
                                                    case 21947:
                                                        d dVar5 = eVar2.f29424t;
                                                        dVar5.f29395q = true;
                                                        int i35 = (int) j19;
                                                        if (i35 != 1) {
                                                            if (i35 != 9) {
                                                                if (i35 == 4 || i35 == 5 || i35 == 6 || i35 == 7) {
                                                                    dVar5.f29396r = 2;
                                                                    break;
                                                                }
                                                            } else {
                                                                dVar5.f29396r = 6;
                                                                break;
                                                            }
                                                        } else {
                                                            dVar5.f29396r = 1;
                                                            break;
                                                        }
                                                    case 21948:
                                                        eVar2.f29424t.f29399u = (int) j19;
                                                        break;
                                                    case 21949:
                                                        eVar2.f29424t.f29400v = (int) j19;
                                                        break;
                                                }
                                                break;
                                        }
                                    } else if (j19 != 1) {
                                        throw new r(c1.o(j19, "ContentEncodingScope ", " not supported"));
                                    }
                                } else if (j19 != j11) {
                                    throw new r(c1.o(j19, "ContentEncodingOrder ", " not supported"));
                                }
                                z12 = false;
                                bVar2.f29377e = z12 ? 1 : 0;
                            } else {
                                throw new r("Invalid integer size: " + bVar2.f29379g);
                            }
                        } else if (i5 == 3) {
                            long j21 = bVar2.f29379g;
                            if (j21 <= 2147483647L) {
                                c cVar4 = bVar2.f29376d;
                                int i36 = bVar2.f29378f;
                                int i37 = (int) j21;
                                if (i37 == 0) {
                                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                } else {
                                    byte[] bArr2 = new byte[i37];
                                    bVar.b(bArr2, 0, i37, false);
                                    str = new String(bArr2);
                                }
                                e eVar3 = cVar4.f29380a;
                                eVar3.getClass();
                                if (i36 == 134) {
                                    eVar3.f29424t.f29381a = str;
                                } else if (i36 != 17026) {
                                    if (i36 == 2274716) {
                                        eVar3.f29424t.N = str;
                                    }
                                } else if (!"webm".equals(str) && !"matroska".equals(str)) {
                                    throw new r(c0.l("DocType ", str, " not supported"));
                                }
                                z12 = false;
                                bVar2.f29377e = 0;
                            } else {
                                throw new r("String element size: " + bVar2.f29379g);
                            }
                        } else if (i5 == 4) {
                            c cVar5 = bVar2.f29376d;
                            int i38 = bVar2.f29378f;
                            int i39 = (int) bVar2.f29379g;
                            e eVar4 = cVar5.f29380a;
                            if (i38 == 161 || i38 == 163) {
                                z13 = false;
                                if (eVar4.E == 0) {
                                    eVar4.K = (int) eVar4.f29408b.a(bVar, false, true, 8);
                                    eVar4.L = eVar4.f29408b.f29436c;
                                    eVar4.G = -9223372036854775807L;
                                    eVar4.E = 1;
                                    n nVar = eVar4.f29413g;
                                    nVar.f30462b = 0;
                                    nVar.f30463c = 0;
                                }
                                d dVar6 = (d) eVar4.f29409c.get(eVar4.K);
                                if (dVar6 == null) {
                                    bVar.a(i39 - eVar4.L);
                                    eVar4.E = 0;
                                } else {
                                    if (eVar4.E == 1) {
                                        eVar4.a(bVar, 3);
                                        int i40 = (eVar4.f29413g.f30461a[2] & 6) >> 1;
                                        if (i40 == 0) {
                                            eVar4.I = 1;
                                            int[] iArr2 = eVar4.J;
                                            if (iArr2 == null) {
                                                iArr2 = new int[1];
                                            } else if (iArr2.length < 1) {
                                                iArr2 = new int[Math.max(iArr2.length * 2, 1)];
                                            }
                                            eVar4.J = iArr2;
                                            iArr2[0] = (i39 - eVar4.L) - 3;
                                        } else if (i38 == 163) {
                                            eVar4.a(bVar, 4);
                                            int i41 = (eVar4.f29413g.f30461a[3] & 255) + 1;
                                            eVar4.I = i41;
                                            int[] iArr3 = eVar4.J;
                                            if (iArr3 == null) {
                                                iArr3 = new int[i41];
                                            } else {
                                                if (iArr3.length < i41) {
                                                    i12 = 2;
                                                    iArr3 = new int[Math.max(iArr3.length * 2, i41)];
                                                }
                                                eVar4.J = iArr3;
                                                if (i40 != i12) {
                                                    int i42 = (i39 - eVar4.L) - 4;
                                                    int i43 = eVar4.I;
                                                    Arrays.fill(iArr3, 0, i43, i42 / i43);
                                                } else {
                                                    int i44 = 0;
                                                    int i45 = 1;
                                                    if (i40 != 1) {
                                                        if (i40 == 3) {
                                                            int i46 = 0;
                                                            int i47 = 0;
                                                            int i48 = 4;
                                                            while (true) {
                                                                int i49 = eVar4.I - 1;
                                                                if (i46 < i49) {
                                                                    eVar4.J[i46] = 0;
                                                                    int i51 = i48 + 1;
                                                                    eVar4.a(bVar, i51);
                                                                    if (eVar4.f29413g.f30461a[i48] == 0) {
                                                                        throw new r("No valid varint length mask found");
                                                                    }
                                                                    int i52 = 0;
                                                                    while (true) {
                                                                        if (i52 < i26) {
                                                                            c11 = c12;
                                                                            int i53 = 1 << (7 - i52);
                                                                            if ((eVar4.f29413g.f30461a[i48] & i53) != 0) {
                                                                                int i54 = i51 + i52;
                                                                                eVar4.a(bVar, i54);
                                                                                i14 = i26;
                                                                                int i55 = i52;
                                                                                j12 = (~i53) & eVar4.f29413g.f30461a[i48] & 255;
                                                                                while (i51 < i54) {
                                                                                    j12 = (j12 << i14) | (eVar4.f29413g.f30461a[i51] & 255);
                                                                                    i51++;
                                                                                }
                                                                                if (i46 > 0) {
                                                                                    j12 -= (1 << ((i55 * 7) + 6)) - 1;
                                                                                }
                                                                                i48 = i54;
                                                                            } else {
                                                                                i52++;
                                                                                c12 = c11;
                                                                            }
                                                                        } else {
                                                                            c11 = c12;
                                                                            i14 = i26;
                                                                            i48 = i51;
                                                                            j12 = j11;
                                                                        }
                                                                    }
                                                                    if (j12 >= -2147483648L && j12 <= 2147483647L) {
                                                                        int i56 = (int) j12;
                                                                        int[] iArr4 = eVar4.J;
                                                                        if (i46 != 0) {
                                                                            i56 += iArr4[i46 - 1];
                                                                        }
                                                                        iArr4[i46] = i56;
                                                                        i47 += i56;
                                                                        i46++;
                                                                        c12 = c11;
                                                                        i26 = i14;
                                                                    }
                                                                } else {
                                                                    i13 = i26;
                                                                    eVar4.J[i49] = ((i39 - eVar4.L) - i48) - i47;
                                                                }
                                                            }
                                                            throw new r("EBML lacing sample size out of range.");
                                                        }
                                                        throw new r(m.a("Unexpected lacing value: ", i40));
                                                    }
                                                    int i57 = 0;
                                                    int i58 = 0;
                                                    int i59 = 4;
                                                    while (true) {
                                                        int i61 = eVar4.I - i45;
                                                        if (i57 < i61) {
                                                            eVar4.J[i57] = i44;
                                                            while (true) {
                                                                i15 = i59 + 1;
                                                                eVar4.a(bVar, i15);
                                                                int i62 = eVar4.f29413g.f30461a[i59] & 255;
                                                                int[] iArr5 = eVar4.J;
                                                                i16 = iArr5[i57] + i62;
                                                                iArr5[i57] = i16;
                                                                if (i62 != 255) {
                                                                    break;
                                                                }
                                                                i59 = i15;
                                                            }
                                                            i58 += i16;
                                                            i57++;
                                                            i59 = i15;
                                                            i44 = 0;
                                                            i45 = 1;
                                                        } else {
                                                            eVar4.J[i61] = ((i39 - eVar4.L) - i59) - i58;
                                                        }
                                                    }
                                                }
                                            }
                                            i12 = 2;
                                            eVar4.J = iArr3;
                                            if (i40 != i12) {
                                            }
                                        } else {
                                            throw new r("Lacing only supported in SimpleBlocks.");
                                        }
                                        i13 = 8;
                                        byte[] bArr3 = eVar4.f29413g.f30461a;
                                        eVar4.F = eVar4.a((bArr3[1] & 255) | (bArr3[0] << 8)) + eVar4.A;
                                        byte b13 = eVar4.f29413g.f30461a[2];
                                        eVar4.M = ((dVar6.f29383c == 2 || (i38 == 163 && (b13 & 128) == 128)) ? 1 : 0) | ((b13 & 8) == i13 ? Integer.MIN_VALUE : 0);
                                        eVar4.E = 2;
                                        eVar4.H = 0;
                                        i11 = 163;
                                    } else {
                                        i11 = 163;
                                    }
                                    if (i38 == i11) {
                                        while (true) {
                                            int i63 = eVar4.H;
                                            if (i63 < eVar4.I) {
                                                eVar4.a(bVar, dVar6, eVar4.J[i63]);
                                                eVar4.a(dVar6, eVar4.F + ((eVar4.H * dVar6.f29384d) / 1000));
                                                eVar4.H++;
                                            } else {
                                                z12 = false;
                                                eVar4.E = 0;
                                            }
                                        }
                                    } else {
                                        z12 = false;
                                        eVar4.a(bVar, dVar6, eVar4.J[0]);
                                    }
                                    bVar2.f29377e = z12 ? 1 : 0;
                                }
                            } else if (i38 == 16981) {
                                z13 = false;
                                byte[] bArr4 = new byte[i39];
                                eVar4.f29424t.f29386f = bArr4;
                                bVar.b(bArr4, 0, i39, false);
                            } else if (i38 == 18402) {
                                z13 = false;
                                byte[] bArr5 = new byte[i39];
                                eVar4.f29424t.f29387g = bArr5;
                                bVar.b(bArr5, 0, i39, false);
                            } else if (i38 == 21419) {
                                z13 = false;
                                Arrays.fill(eVar4.f29415i.f30461a, (byte) 0);
                                bVar.b(eVar4.f29415i.f30461a, 4 - i39, i39, false);
                                eVar4.f29415i.e(0);
                                eVar4.f29426v = (int) eVar4.f29415i.k();
                            } else if (i38 == 25506) {
                                z13 = false;
                                byte[] bArr6 = new byte[i39];
                                eVar4.f29424t.f29388h = bArr6;
                                bVar.b(bArr6, 0, i39, false);
                            } else if (i38 == 30322) {
                                byte[] bArr7 = new byte[i39];
                                eVar4.f29424t.o = bArr7;
                                z13 = false;
                                bVar.b(bArr7, 0, i39, false);
                            } else {
                                eVar4.getClass();
                                throw new r(m.a("Unexpected id: ", i38));
                            }
                            z12 = z13;
                            bVar2.f29377e = z12 ? 1 : 0;
                        } else if (i5 == 5) {
                            long j22 = bVar2.f29379g;
                            if (j22 != 4 && j22 != 8) {
                                throw new r("Invalid float size: " + bVar2.f29379g);
                            }
                            c cVar6 = bVar2.f29376d;
                            int i64 = bVar2.f29378f;
                            int i65 = (int) j22;
                            bVar.b(bVar2.f29373a, 0, i65, false);
                            long j23 = j11;
                            int i66 = 0;
                            while (i66 < i65) {
                                j23 = (j23 << 8) | (bVar2.f29373a[i66] & b12);
                                i66++;
                                b12 = 255;
                            }
                            if (i65 == 4) {
                                dLongBitsToDouble = Float.intBitsToFloat((int) j23);
                            } else {
                                dLongBitsToDouble = Double.longBitsToDouble(j23);
                            }
                            e eVar5 = cVar6.f29380a;
                            if (i64 == 181) {
                                eVar5.f29424t.I = (int) dLongBitsToDouble;
                            } else if (i64 != 17545) {
                                switch (i64) {
                                    case 21969:
                                        eVar5.f29424t.f29401w = (float) dLongBitsToDouble;
                                        break;
                                    case 21970:
                                        eVar5.f29424t.f29402x = (float) dLongBitsToDouble;
                                        break;
                                    case 21971:
                                        eVar5.f29424t.f29403y = (float) dLongBitsToDouble;
                                        break;
                                    case 21972:
                                        eVar5.f29424t.f29404z = (float) dLongBitsToDouble;
                                        break;
                                    case 21973:
                                        eVar5.f29424t.A = (float) dLongBitsToDouble;
                                        break;
                                    case 21974:
                                        eVar5.f29424t.B = (float) dLongBitsToDouble;
                                        break;
                                    case 21975:
                                        eVar5.f29424t.C = (float) dLongBitsToDouble;
                                        break;
                                    case 21976:
                                        eVar5.f29424t.D = (float) dLongBitsToDouble;
                                        break;
                                    case 21977:
                                        eVar5.f29424t.E = (float) dLongBitsToDouble;
                                        break;
                                    case 21978:
                                        eVar5.f29424t.F = (float) dLongBitsToDouble;
                                        break;
                                    default:
                                        eVar5.getClass();
                                        break;
                                }
                            } else {
                                eVar5.f29422r = (long) dLongBitsToDouble;
                            }
                            z12 = false;
                            bVar2.f29377e = 0;
                        } else {
                            throw new r(m.a("Invalid element type ", i5));
                        }
                    } else {
                        long j24 = bVar.f29133c;
                        bVar2.f29374b.add(new a(bVar2.f29378f, bVar2.f29379g + j24));
                        c cVar7 = bVar2.f29376d;
                        int i67 = bVar2.f29378f;
                        long j25 = bVar2.f29379g;
                        e eVar6 = cVar7.f29380a;
                        eVar6.getClass();
                        if (i67 == 160) {
                            z12 = false;
                            eVar6.X = false;
                        } else if (i67 == 174) {
                            z12 = false;
                            eVar6.f29424t = new d();
                        } else if (i67 != 187) {
                            if (i67 == 19899) {
                                eVar6.f29426v = -1;
                                eVar6.f29427w = -1L;
                            } else if (i67 == 20533) {
                                eVar6.f29424t.f29385e = true;
                            } else if (i67 == 21968) {
                                eVar6.f29424t.f29395q = true;
                            } else if (i67 == 408125543) {
                                long j26 = eVar6.f29420p;
                                if (j26 != -1 && j26 != j24) {
                                    throw new r("Multiple Segment elements not supported");
                                }
                                eVar6.f29420p = j24;
                                eVar6.o = j25;
                            } else if (i67 != 475249515) {
                                if (i67 == 524531317 && !eVar6.f29425u) {
                                    if (eVar6.f29410d && eVar6.f29429y != -1) {
                                        eVar6.f29428x = true;
                                    } else {
                                        eVar6.Y.a(new p(eVar6.f29423s));
                                        eVar6.f29425u = true;
                                    }
                                }
                            } else {
                                eVar6.B = new com.fyber.inneractive.sdk.player.exoplayer2.util.g();
                                eVar6.C = new com.fyber.inneractive.sdk.player.exoplayer2.util.g();
                            }
                            z12 = false;
                        } else {
                            z12 = false;
                            eVar6.D = false;
                        }
                        bVar2.f29377e = z12 ? 1 : 0;
                    }
                }
            }
        }
        int i68 = z15 ? 1 : 0;
        if (z16) {
            return i68;
        }
        return -1;
    }

    public final void a(d dVar, long j11) {
        byte[] bArrB;
        if ("S_TEXT/UTF8".equals(dVar.f29381a)) {
            byte[] bArr = this.f29417k.f30461a;
            long j12 = this.G;
            if (j12 == -9223372036854775807L) {
                bArrB = f29405a0;
            } else {
                int i5 = (int) (j12 / 3600000000L);
                long j13 = j12 - (i5 * 3600000000L);
                int i11 = (int) (j13 / 60000000);
                long j14 = j13 - (60000000 * i11);
                bArrB = z.b(String.format(Locale.US, "%02d:%02d:%02d,%03d", Integer.valueOf(i5), Integer.valueOf(i11), Integer.valueOf((int) (j14 / 1000000)), Integer.valueOf((int) ((j14 - (1000000 * r5)) / 1000))));
            }
            System.arraycopy(bArrB, 0, bArr, 19, 12);
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar = dVar.O;
            n nVar = this.f29417k;
            rVar.a(nVar.f30463c, nVar);
            this.V += this.f29417k.f30463c;
        }
        dVar.O.a(j11, this.M, this.V, 0, dVar.f29387g);
        this.W = true;
        this.N = 0;
        this.V = 0;
        this.U = 0;
        this.O = false;
        this.P = false;
        this.R = false;
        this.T = 0;
        this.S = (byte) 0;
        this.Q = false;
        n nVar2 = this.f29416j;
        nVar2.f30462b = 0;
        nVar2.f30463c = 0;
    }

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, int i5) throws InterruptedException, EOFException {
        n nVar = this.f29413g;
        if (nVar.f30463c >= i5) {
            return;
        }
        if (nVar.a() < i5) {
            n nVar2 = this.f29413g;
            byte[] bArr = nVar2.f30461a;
            byte[] bArrCopyOf = Arrays.copyOf(bArr, Math.max(bArr.length * 2, i5));
            int i11 = this.f29413g.f30463c;
            nVar2.f30461a = bArrCopyOf;
            nVar2.f30463c = i11;
            nVar2.f30462b = 0;
        }
        n nVar3 = this.f29413g;
        byte[] bArr2 = nVar3.f30461a;
        int i12 = nVar3.f30463c;
        bVar.b(bArr2, i12, i5 - i12, false);
        this.f29413g.d(i5);
    }

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, d dVar, int i5) throws InterruptedException, r, EOFException {
        int iA;
        int iA2;
        int i11;
        if ("S_TEXT/UTF8".equals(dVar.f29381a)) {
            byte[] bArr = Z;
            int i12 = i5 + 32;
            if (this.f29417k.a() < i12) {
                this.f29417k.f30461a = Arrays.copyOf(bArr, i12 + i5);
            }
            bVar.b(this.f29417k.f30461a, 32, i5, false);
            this.f29417k.e(0);
            this.f29417k.d(i12);
            return;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar = dVar.O;
        if (!this.O) {
            if (dVar.f29385e) {
                this.M &= -1073741825;
                if (!this.P) {
                    bVar.b(this.f29413g.f30461a, 0, 1, false);
                    this.N++;
                    byte b11 = this.f29413g.f30461a[0];
                    if ((b11 & 128) != 128) {
                        this.S = b11;
                        this.P = true;
                    } else {
                        throw new r("Extension bit is set in signal byte");
                    }
                }
                byte b12 = this.S;
                if ((b12 & 1) == 1) {
                    boolean z11 = (b12 & 2) == 2;
                    this.M |= 1073741824;
                    if (!this.Q) {
                        bVar.b(this.f29418l.f30461a, 0, 8, false);
                        this.N += 8;
                        this.Q = true;
                        n nVar = this.f29413g;
                        nVar.f30461a[0] = (byte) ((z11 ? 128 : 0) | 8);
                        nVar.e(0);
                        rVar.a(1, this.f29413g);
                        this.V++;
                        this.f29418l.e(0);
                        rVar.a(8, this.f29418l);
                        this.V += 8;
                    }
                    if (z11) {
                        if (!this.R) {
                            bVar.b(this.f29413g.f30461a, 0, 1, false);
                            this.N++;
                            this.f29413g.e(0);
                            this.T = this.f29413g.j();
                            this.R = true;
                        }
                        int i13 = this.T * 4;
                        this.f29413g.c(i13);
                        bVar.b(this.f29413g.f30461a, 0, i13, false);
                        this.N += i13;
                        short s11 = (short) ((this.T / 2) + 1);
                        int i14 = (s11 * 6) + 2;
                        ByteBuffer byteBuffer = this.n;
                        if (byteBuffer == null || byteBuffer.capacity() < i14) {
                            this.n = ByteBuffer.allocate(i14);
                        }
                        this.n.position(0);
                        this.n.putShort(s11);
                        int i15 = 0;
                        int i16 = 0;
                        while (true) {
                            i11 = this.T;
                            if (i15 >= i11) {
                                break;
                            }
                            int iM = this.f29413g.m();
                            if (i15 % 2 == 0) {
                                this.n.putShort((short) (iM - i16));
                            } else {
                                this.n.putInt(iM - i16);
                            }
                            i15++;
                            i16 = iM;
                        }
                        int i17 = (i5 - this.N) - i16;
                        if (i11 % 2 == 1) {
                            this.n.putInt(i17);
                        } else {
                            this.n.putShort((short) i17);
                            this.n.putInt(0);
                        }
                        n nVar2 = this.f29419m;
                        nVar2.f30461a = this.n.array();
                        nVar2.f30463c = i14;
                        nVar2.f30462b = 0;
                        rVar.a(i14, this.f29419m);
                        this.V += i14;
                    }
                }
            } else {
                byte[] bArr2 = dVar.f29386f;
                if (bArr2 != null) {
                    n nVar3 = this.f29416j;
                    int length = bArr2.length;
                    nVar3.f30461a = bArr2;
                    nVar3.f30463c = length;
                    nVar3.f30462b = 0;
                }
            }
            this.O = true;
        }
        int i18 = i5 + this.f29416j.f30463c;
        if (!"V_MPEG4/ISO/AVC".equals(dVar.f29381a) && !"V_MPEGH/ISO/HEVC".equals(dVar.f29381a)) {
            while (true) {
                int i19 = this.N;
                if (i19 >= i18) {
                    break;
                }
                int i21 = i18 - i19;
                n nVar4 = this.f29416j;
                int i22 = nVar4.f30463c - nVar4.f30462b;
                if (i22 > 0) {
                    iA2 = Math.min(i21, i22);
                    rVar.a(iA2, this.f29416j);
                } else {
                    iA2 = rVar.a(bVar, i21, false);
                }
                this.N += iA2;
                this.V += iA2;
            }
        } else {
            byte[] bArr3 = this.f29412f.f30461a;
            bArr3[0] = 0;
            bArr3[1] = 0;
            bArr3[2] = 0;
            int i23 = dVar.P;
            int i24 = 4 - i23;
            while (this.N < i18) {
                int i25 = this.U;
                if (i25 == 0) {
                    n nVar5 = this.f29416j;
                    int iMin = Math.min(i23, nVar5.f30463c - nVar5.f30462b);
                    bVar.b(bArr3, i24 + iMin, i23 - iMin, false);
                    if (iMin > 0) {
                        this.f29416j.a(bArr3, i24, iMin);
                    }
                    this.N += i23;
                    this.f29412f.e(0);
                    this.U = this.f29412f.m();
                    this.f29411e.e(0);
                    rVar.a(4, this.f29411e);
                    this.V += 4;
                } else {
                    n nVar6 = this.f29416j;
                    int i26 = nVar6.f30463c - nVar6.f30462b;
                    if (i26 > 0) {
                        iA = Math.min(i25, i26);
                        rVar.a(iA, this.f29416j);
                    } else {
                        iA = rVar.a(bVar, i25, false);
                    }
                    this.N += iA;
                    this.V += iA;
                    this.U = i25 - iA;
                }
            }
        }
        if ("A_VORBIS".equals(dVar.f29381a)) {
            this.f29414h.e(0);
            rVar.a(4, this.f29414h);
            this.V += 4;
        }
    }

    public final long a(long j11) throws r {
        long j12 = this.f29421q;
        if (j12 != -9223372036854775807L) {
            return z.a(j11, j12, 1000L);
        }
        throw new r("Can't scale timecode prior to timecodeScale being set.");
    }
}
