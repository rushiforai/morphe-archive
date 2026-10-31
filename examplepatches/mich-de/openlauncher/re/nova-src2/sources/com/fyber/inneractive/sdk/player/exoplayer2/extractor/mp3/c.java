package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3;

import androidx.recyclerview.widget.u1;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.i;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.j;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.m;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.o;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.r;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class c implements i {

    /* renamed from: m, reason: collision with root package name */
    public static final int f29440m = z.a("Xing");
    public static final int n = z.a("Info");
    public static final int o = z.a("VBRI");

    /* renamed from: a, reason: collision with root package name */
    public final long f29441a;

    /* renamed from: e, reason: collision with root package name */
    public j f29445e;

    /* renamed from: f, reason: collision with root package name */
    public r f29446f;

    /* renamed from: g, reason: collision with root package name */
    public int f29447g;

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.metadata.b f29448h;

    /* renamed from: i, reason: collision with root package name */
    public b f29449i;

    /* renamed from: k, reason: collision with root package name */
    public long f29451k;

    /* renamed from: l, reason: collision with root package name */
    public int f29452l;

    /* renamed from: b, reason: collision with root package name */
    public final n f29442b = new n(10);

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.n f29443c = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.n();

    /* renamed from: d, reason: collision with root package name */
    public final m f29444d = new m();

    /* renamed from: j, reason: collision with root package name */
    public long f29450j = -9223372036854775807L;

    public c(long j11) {
        this.f29441a = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        return a(bVar, true);
    }

    public final a b(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        bVar.a(this.f29442b.f30461a, 0, 4, false);
        this.f29442b.e(0);
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.n.a(this.f29442b.b(), this.f29443c);
        return new a(this.f29443c.f29667f, bVar.f29133c, bVar.f29132b);
    }

    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, boolean z11) throws Throwable {
        int i5;
        int i11;
        int iA;
        int i12 = z11 ? ReaderJsonLexerKt.BATCH_SIZE : SQLiteDatabase.OPEN_SHAREDCACHE;
        bVar.f29135e = 0;
        if (bVar.f29133c == 0) {
            int i13 = 0;
            while (true) {
                bVar.a(this.f29442b.f30461a, 0, 10, false);
                this.f29442b.e(0);
                if (this.f29442b.l() != com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.n.f30114b) {
                    break;
                }
                n nVar = this.f29442b;
                nVar.e(nVar.f30462b + 3);
                int i14 = this.f29442b.i();
                int i15 = i14 + 10;
                if (this.f29448h == null) {
                    byte[] bArr = new byte[i15];
                    System.arraycopy(this.f29442b.f30461a, 0, bArr, 0, 10);
                    bVar.a(bArr, 10, i14, false);
                    com.fyber.inneractive.sdk.player.exoplayer2.metadata.b bVarA = new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.n(null).a(i15, bArr);
                    this.f29448h = bVarA;
                    if (bVarA != null) {
                        this.f29444d.a(bVarA);
                    }
                } else {
                    bVar.a(i14, false);
                }
                i13 += i15;
            }
            bVar.f29135e = 0;
            bVar.a(i13, false);
            i5 = (int) (bVar.f29133c + bVar.f29135e);
            if (!z11) {
                bVar.a(i5);
            }
            i11 = 0;
        } else {
            i5 = 0;
            i11 = 0;
        }
        int i16 = i11;
        int i17 = i16;
        while (true) {
            if (!bVar.a(this.f29442b.f30461a, 0, 4, i11 > 0)) {
                break;
            }
            this.f29442b.e(0);
            int iB = this.f29442b.b();
            if ((i16 == 0 || ((-128000) & iB) == (i16 & (-128000))) && (iA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.n.a(iB)) != -1) {
                i11++;
                if (i11 != 1) {
                    if (i11 == 4) {
                        break;
                    }
                } else {
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.n.a(iB, this.f29443c);
                    i16 = iB;
                }
                bVar.a(iA - 4, false);
            } else {
                int i18 = i17 + 1;
                if (i17 == i12) {
                    if (z11) {
                        return false;
                    }
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Searched too many bytes.");
                }
                if (z11) {
                    bVar.f29135e = 0;
                    bVar.a(i5 + i18, false);
                } else {
                    bVar.a(1);
                }
                i16 = 0;
                i17 = i18;
                i11 = 0;
            }
        }
        if (z11) {
            bVar.a(i5 + i17);
        } else {
            bVar.f29135e = 0;
        }
        this.f29447g = i16;
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(j jVar) {
        this.f29445e = jVar;
        this.f29446f = jVar.a(0, 1);
        this.f29445e.b();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        this.f29447g = 0;
        this.f29450j = -9223372036854775807L;
        this.f29451k = 0L;
        this.f29452l = 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0039  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0067  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, o oVar) throws Throwable {
        long j11;
        long j12;
        int i5;
        b bVarB;
        int iM;
        b eVar;
        int iJ;
        long j13;
        long jMin;
        if (this.f29447g == 0) {
            try {
                a(bVar, false);
            } catch (EOFException unused) {
                return -1;
            }
        }
        int i11 = 1;
        if (this.f29449i == null) {
            n nVar = new n(this.f29443c.f29664c);
            bVar.a(nVar.f30461a, 0, this.f29443c.f29664c, false);
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.n nVar2 = this.f29443c;
            if ((nVar2.f29662a & 1) != 0) {
                i5 = nVar2.f29666e != 1 ? 36 : 21;
                if (nVar.f30463c < i5 + 4) {
                    nVar.e(i5);
                    int iB = nVar.b();
                    if (iB != f29440m && iB != n) {
                        if (nVar.f30463c >= 40) {
                            nVar.e(36);
                            int iB2 = nVar.b();
                            int i12 = o;
                            iB = iB2 == i12 ? i12 : 0;
                        }
                    }
                    if (iB != f29440m && iB != n) {
                        if (iB == o) {
                            com.fyber.inneractive.sdk.player.exoplayer2.extractor.n nVar3 = this.f29443c;
                            long j14 = bVar.f29133c;
                            j11 = 1000000;
                            long j15 = bVar.f29132b;
                            nVar.e(nVar.f30462b + 10);
                            int iB3 = nVar.b();
                            if (iB3 <= 0) {
                                j12 = 0;
                            } else {
                                j12 = 0;
                                int i13 = nVar3.f29665d;
                                long j16 = j15;
                                long jA = z.a(iB3, (i13 >= 32000 ? 1152 : 576) * 1000000, i13);
                                int iO = nVar.o();
                                int iO2 = nVar.o();
                                int iO3 = nVar.o();
                                int i14 = 2;
                                nVar.e(nVar.f30462b + 2);
                                long j17 = j14 + nVar3.f29664c;
                                int i15 = iO + 1;
                                long[] jArr = new long[i15];
                                long[] jArr2 = new long[i15];
                                jArr[0] = 0;
                                jArr2[0] = j17;
                                int i16 = 1;
                                while (i16 < i15) {
                                    if (iO3 == i11) {
                                        iJ = nVar.j();
                                    } else if (iO3 == i14) {
                                        iJ = nVar.o();
                                    } else if (iO3 == 3) {
                                        iJ = nVar.l();
                                    } else if (iO3 == 4) {
                                        iJ = nVar.m();
                                    }
                                    int i17 = i15;
                                    j17 += iJ * iO2;
                                    int i18 = iO2;
                                    int i19 = iO3;
                                    jArr[i16] = (i16 * jA) / iO;
                                    if (j16 == -1) {
                                        jMin = j17;
                                        j13 = j16;
                                    } else {
                                        j13 = j16;
                                        jMin = Math.min(j13, j17);
                                    }
                                    jArr2[i16] = jMin;
                                    i16++;
                                    j16 = j13;
                                    iO2 = i18;
                                    i15 = i17;
                                    iO3 = i19;
                                    i14 = 2;
                                    i11 = 1;
                                }
                                bVarB = new d(jArr, jArr2, jA);
                                bVar.a(this.f29443c.f29664c);
                            }
                            bVarB = null;
                            bVar.a(this.f29443c.f29664c);
                        } else {
                            j11 = 1000000;
                            j12 = 0;
                            bVar.f29135e = 0;
                            bVarB = null;
                        }
                    } else {
                        j11 = 1000000;
                        j12 = 0;
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.n nVar4 = this.f29443c;
                        long j18 = bVar.f29133c;
                        long j19 = bVar.f29132b;
                        int i21 = nVar4.f29668g;
                        int i22 = nVar4.f29665d;
                        long j21 = j18 + nVar4.f29664c;
                        int iB4 = nVar.b();
                        if ((iB4 & 1) != 1 || (iM = nVar.m()) == 0) {
                            bVarB = null;
                        } else {
                            long jA2 = z.a(iM, i21 * 1000000, i22);
                            if ((iB4 & 6) != 6) {
                                eVar = new e(j21, jA2, j19, null, 0L, 0);
                            } else {
                                long jM = nVar.m();
                                nVar.e(nVar.f30462b + 1);
                                long[] jArr3 = new long[99];
                                for (int i23 = 0; i23 < 99; i23++) {
                                    jArr3[i23] = nVar.j();
                                }
                                eVar = new e(j21, jA2, j19, jArr3, jM, nVar4.f29664c);
                            }
                            bVarB = eVar;
                        }
                        if (bVarB != null) {
                            m mVar = this.f29444d;
                            if (mVar.f29369a == -1 || mVar.f29370b == -1) {
                                bVar.f29135e = 0;
                                bVar.a(i5 + 141, false);
                                bVar.a(this.f29442b.f30461a, 0, 3, false);
                                this.f29442b.e(0);
                                m mVar2 = this.f29444d;
                                int iL = this.f29442b.l();
                                mVar2.getClass();
                                int i24 = iL >> 12;
                                int i25 = iL & 4095;
                                if (i24 > 0 || i25 > 0) {
                                    mVar2.f29369a = i24;
                                    mVar2.f29370b = i25;
                                }
                            }
                        }
                        bVar.a(this.f29443c.f29664c);
                        if (bVarB != null && !bVarB.a() && iB == n) {
                            bVarB = b(bVar);
                        }
                    }
                    this.f29449i = bVarB;
                    if (bVarB == null) {
                        this.f29449i = b(bVar);
                    }
                    this.f29445e.a(this.f29449i);
                    r rVar = this.f29446f;
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.n nVar5 = this.f29443c;
                    String str = nVar5.f29663b;
                    int i26 = nVar5.f29666e;
                    int i27 = nVar5.f29665d;
                    m mVar3 = this.f29444d;
                    rVar.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(null, str, -1, u1.FLAG_APPEARED_IN_PRE_LAYOUT, i26, i27, -1, mVar3.f29369a, mVar3.f29370b, null, null, 0, null, this.f29448h));
                }
            } else {
                if (nVar2.f29666e == 1) {
                    i5 = 13;
                }
                if (nVar.f30463c < i5 + 4) {
                }
            }
        } else {
            j11 = 1000000;
            j12 = 0;
        }
        if (this.f29452l == 0) {
            bVar.f29135e = 0;
            if (!bVar.a(this.f29442b.f30461a, 0, 4, true)) {
                return -1;
            }
            this.f29442b.e(0);
            int iB5 = this.f29442b.b();
            if (((-128000) & iB5) == (this.f29447g & (-128000)) && com.fyber.inneractive.sdk.player.exoplayer2.extractor.n.a(iB5) != -1) {
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.n.a(iB5, this.f29443c);
                if (this.f29450j == -9223372036854775807L) {
                    this.f29450j = this.f29449i.b(bVar.f29133c);
                    if (this.f29441a != -9223372036854775807L) {
                        this.f29450j = (this.f29441a - this.f29449i.b(j12)) + this.f29450j;
                    }
                }
                this.f29452l = this.f29443c.f29664c;
            } else {
                bVar.a(1);
                this.f29447g = 0;
                return 0;
            }
        }
        int iA = this.f29446f.a(bVar, this.f29452l, true);
        if (iA == -1) {
            return -1;
        }
        int i28 = this.f29452l - iA;
        this.f29452l = i28;
        if (i28 > 0) {
            return 0;
        }
        this.f29446f.a(((this.f29451k * j11) / r5.f29665d) + this.f29450j, 1, this.f29443c.f29664c, 0, null);
        this.f29451k += this.f29443c.f29668g;
        this.f29452l = 0;
        return 0;
    }
}
