package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

import android.util.Log;
import b.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.EOFException;
import java.util.ArrayList;
import java.util.Stack;

/* loaded from: classes3.dex */
public final class p implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i, com.fyber.inneractive.sdk.player.exoplayer2.extractor.q {

    /* renamed from: p, reason: collision with root package name */
    public static final int f29606p = z.a("qt  ");

    /* renamed from: e, reason: collision with root package name */
    public int f29611e;

    /* renamed from: f, reason: collision with root package name */
    public int f29612f;

    /* renamed from: g, reason: collision with root package name */
    public long f29613g;

    /* renamed from: h, reason: collision with root package name */
    public int f29614h;

    /* renamed from: i, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.util.n f29615i;

    /* renamed from: j, reason: collision with root package name */
    public int f29616j;

    /* renamed from: k, reason: collision with root package name */
    public int f29617k;

    /* renamed from: l, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.j f29618l;

    /* renamed from: m, reason: collision with root package name */
    public o[] f29619m;
    public long n;
    public boolean o;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29609c = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(16);

    /* renamed from: d, reason: collision with root package name */
    public final Stack f29610d = new Stack();

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29607a = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(com.fyber.inneractive.sdk.player.exoplayer2.util.l.f30453a);

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29608b = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(4);

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return this.n;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        return r.a(bVar, false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:404:0x094c, code lost:
    
        r2 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:405:0x0950, code lost:
    
        if (r2.f29611e == 2) goto L458;
     */
    /* JADX WARN: Code restructure failed: missing block: B:406:0x0952, code lost:
    
        r2.f29611e = 0;
        r2.f29614h = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:407:0x0957, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:458:?, code lost:
    
        return;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:151:0x026b  */
    /* JADX WARN: Removed duplicated region for block: B:198:0x03a2  */
    /* JADX WARN: Removed duplicated region for block: B:204:0x03b9  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x03c1  */
    /* JADX WARN: Removed duplicated region for block: B:255:0x04cd  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x056d  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x0576  */
    /* JADX WARN: Removed duplicated region for block: B:295:0x05e9  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00e1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(long j11) throws com.fyber.inneractive.sdk.player.exoplayer2.r, NumberFormatException {
        com.fyber.inneractive.sdk.player.exoplayer2.metadata.b bVar;
        s sVarA;
        e hVar;
        int i5;
        boolean z11;
        long j12;
        int iM;
        int iM2;
        int iM3;
        int i11;
        int i12;
        a aVar;
        ArrayList arrayList;
        long j13;
        long[] jArr;
        int[] iArr;
        int[] iArr2;
        long[] jArr2;
        int i13;
        long j14;
        long[] jArr3;
        int i14;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.m mVar;
        v vVar;
        v vVar2;
        long[] jArr4;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.m mVar2;
        int[] iArr3;
        long j15;
        int i15;
        int i16;
        p pVar;
        int i17;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.m mVar3;
        ArrayList arrayList2;
        int i18;
        com.fyber.inneractive.sdk.player.exoplayer2.metadata.b bVar2;
        com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.o oVarB;
        com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.o oVarA;
        int iJ;
        p pVar2 = this;
        while (true) {
            int i19 = 0;
            if (pVar2.f29610d.isEmpty() || ((a) pVar2.f29610d.peek()).R0 != j11) {
                break;
            }
            a aVar2 = (a) pVar2.f29610d.pop();
            if (aVar2.f29511a == c.C) {
                ArrayList arrayList3 = new ArrayList();
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.m mVar4 = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.m();
                b bVarC = aVar2.c(c.A0);
                int i21 = 12;
                int i22 = 1;
                if (bVarC != null) {
                    boolean z12 = pVar2.o;
                    int i23 = i.f29533a;
                    if (z12) {
                        bVar2 = null;
                        if (bVar2 != null) {
                            mVar4.a(bVar2);
                        }
                        bVar = bVar2;
                    } else {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = bVarC.R0;
                        char c11 = '\b';
                        nVar.e(8);
                        while (true) {
                            int i24 = nVar.f30463c;
                            int i25 = nVar.f30462b;
                            if (i24 - i25 < 8) {
                                break;
                            }
                            int iB = nVar.b();
                            if (nVar.b() == c.B0) {
                                nVar.e(i25);
                                int i26 = i25 + iB;
                                nVar.e(nVar.f30462b + i21);
                                while (true) {
                                    int i27 = nVar.f30462b;
                                    if (i27 >= i26) {
                                        break;
                                    }
                                    int iB2 = nVar.b();
                                    char c12 = c11;
                                    if (nVar.b() == c.C0) {
                                        nVar.e(i27);
                                        int i28 = i27 + iB2;
                                        nVar.e(nVar.f30462b + 8);
                                        ArrayList arrayList4 = new ArrayList();
                                        while (true) {
                                            int i29 = nVar.f30462b;
                                            if (i29 >= i28) {
                                                break;
                                            }
                                            int i31 = n.f29578a;
                                            int iB3 = nVar.b() + i29;
                                            int iB4 = nVar.b();
                                            int i32 = (iB4 >> 24) & 255;
                                            if (i32 == 169 || i32 == 65533) {
                                                int i33 = 16777215 & iB4;
                                                if (i33 == n.f29580c) {
                                                    oVarB = n.a(iB4, nVar);
                                                } else if (i33 == n.f29578a || i33 == n.f29579b) {
                                                    oVarB = n.b(iB4, nVar, "TIT2");
                                                } else if (i33 == n.f29585h || i33 == n.f29586i) {
                                                    oVarB = n.b(iB4, nVar, "TCOM");
                                                } else if (i33 == n.f29581d) {
                                                    oVarB = n.b(iB4, nVar, "TDRC");
                                                } else if (i33 == n.f29582e) {
                                                    oVarB = n.b(iB4, nVar, "TPE1");
                                                } else if (i33 == n.f29583f) {
                                                    oVarB = n.b(iB4, nVar, "TSSE");
                                                } else if (i33 == n.f29584g) {
                                                    oVarB = n.b(iB4, nVar, "TALB");
                                                } else if (i33 == n.f29587j) {
                                                    oVarB = n.b(iB4, nVar, "USLT");
                                                } else if (i33 == n.f29588k) {
                                                    oVarB = n.b(iB4, nVar, "TCON");
                                                } else {
                                                    if (i33 == n.n) {
                                                        oVarB = n.b(iB4, nVar, "TIT1");
                                                    }
                                                    c.a(iB4);
                                                    nVar.e(iB3);
                                                    oVarA = null;
                                                }
                                                oVarA = oVarB;
                                            } else {
                                                try {
                                                    if (iB4 == n.f29590m) {
                                                        nVar.e(nVar.f30462b + 4);
                                                        if (nVar.b() == c.F0) {
                                                            nVar.e(nVar.f30462b + 8);
                                                            iJ = nVar.j();
                                                        } else {
                                                            Log.w("MetadataUtil", "Failed to parse uint8 attribute value");
                                                            iJ = -1;
                                                        }
                                                        if (iJ > 0) {
                                                            String[] strArr = n.D;
                                                            String str = iJ <= strArr.length ? strArr[iJ - 1] : null;
                                                            if (str != null) {
                                                                oVarA = new com.fyber.inneractive.sdk.player.exoplayer2.metadata.id3.s("TCON", null, str);
                                                            } else {
                                                                Log.w("MetadataUtil", "Failed to parse standard genre code");
                                                                oVarA = null;
                                                            }
                                                        }
                                                    } else {
                                                        if (iB4 == n.o) {
                                                            oVarB = n.a(iB4, nVar, "TPOS");
                                                        } else if (iB4 == n.f29591p) {
                                                            oVarB = n.a(iB4, nVar, "TRCK");
                                                        } else if (iB4 == n.f29592q) {
                                                            oVarB = n.a(iB4, "TBPM", nVar, true, false);
                                                        } else if (iB4 == n.f29593r) {
                                                            oVarB = n.a(iB4, "TCMP", nVar, true, true);
                                                        } else if (iB4 == n.f29589l) {
                                                            oVarA = n.a(nVar);
                                                        } else if (iB4 == n.f29594s) {
                                                            oVarB = n.b(iB4, nVar, "TPE2");
                                                        } else if (iB4 == n.f29595t) {
                                                            oVarB = n.b(iB4, nVar, "TSOT");
                                                        } else if (iB4 == n.f29596u) {
                                                            oVarB = n.b(iB4, nVar, "TSO2");
                                                        } else if (iB4 == n.f29597v) {
                                                            oVarB = n.b(iB4, nVar, "TSOA");
                                                        } else if (iB4 == n.f29598w) {
                                                            oVarB = n.b(iB4, nVar, "TSOP");
                                                        } else if (iB4 == n.f29599x) {
                                                            oVarB = n.b(iB4, nVar, "TSOC");
                                                        } else if (iB4 == n.f29600y) {
                                                            oVarB = n.a(iB4, "ITUNESADVISORY", nVar, false, false);
                                                        } else if (iB4 == n.f29601z) {
                                                            oVarB = n.a(iB4, "ITUNESGAPLESS", nVar, false, true);
                                                        } else if (iB4 == n.A) {
                                                            oVarB = n.b(iB4, nVar, "TVSHOWSORT");
                                                        } else if (iB4 == n.B) {
                                                            oVarB = n.b(iB4, nVar, "TVSHOW");
                                                        } else {
                                                            if (iB4 == n.C) {
                                                                oVarB = n.b(iB3, nVar);
                                                            }
                                                            c.a(iB4);
                                                            nVar.e(iB3);
                                                            oVarA = null;
                                                        }
                                                        oVarA = oVarB;
                                                    }
                                                } finally {
                                                    nVar.e(iB3);
                                                }
                                            }
                                            if (oVarA != null) {
                                                arrayList4.add(oVarA);
                                            }
                                        }
                                        if (arrayList4.isEmpty()) {
                                            break;
                                        } else {
                                            bVar2 = new com.fyber.inneractive.sdk.player.exoplayer2.metadata.b(arrayList4);
                                        }
                                    } else {
                                        nVar.e(nVar.f30462b + (iB2 - 8));
                                        c11 = c12;
                                    }
                                }
                            } else {
                                nVar.e(nVar.f30462b + (iB - 8));
                                i21 = 12;
                            }
                        }
                        bVar2 = null;
                        if (bVar2 != null) {
                        }
                        bVar = bVar2;
                    }
                } else {
                    bVar = null;
                }
                long j16 = -9223372036854775807L;
                long j17 = Long.MAX_VALUE;
                int i34 = 0;
                while (i34 < aVar2.T0.size()) {
                    a aVar3 = (a) aVar2.T0.get(i34);
                    if (aVar3.f29511a == c.E && (sVarA = i.a(aVar3, aVar2.c(c.D), -9223372036854775807L, (com.fyber.inneractive.sdk.player.exoplayer2.drm.d) null, pVar2.o)) != null) {
                        a aVarB = aVar3.b(c.F).b(c.G).b(c.H);
                        b bVarC2 = aVarB.c(c.f29492q0);
                        if (bVarC2 != null) {
                            hVar = new g(bVarC2);
                        } else {
                            b bVarC3 = aVarB.c(c.f29494r0);
                            if (bVarC3 == null) {
                                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Track has no sample table size information");
                            }
                            hVar = new h(bVarC3);
                        }
                        int iA = hVar.a();
                        if (iA == 0) {
                            aVar = aVar2;
                            i14 = i34;
                            arrayList = arrayList3;
                            mVar = mVar4;
                            j13 = j16;
                            j12 = j17;
                            vVar2 = new v(new long[i19], new int[i19], 0, new long[i19], new int[i19]);
                        } else {
                            b bVarC4 = aVarB.c(c.f29496s0);
                            if (bVarC4 == null) {
                                bVarC4 = aVarB.c(c.f29498t0);
                                i5 = i19;
                                z11 = i22;
                            } else {
                                i5 = i19;
                                z11 = i19;
                            }
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = bVarC4.R0;
                            int i35 = i22;
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = aVarB.c(c.f29490p0).R0;
                            j12 = j17;
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar4 = aVarB.c(c.f29486m0).R0;
                            b bVarC5 = aVarB.c(c.f29487n0);
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar5 = bVarC5 != null ? bVarC5.R0 : null;
                            e eVar = hVar;
                            b bVarC6 = aVarB.c(c.f29488o0);
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar6 = bVarC6 != null ? bVarC6.R0 : null;
                            d dVar = new d(nVar3, nVar2, z11);
                            nVar4.e(12);
                            int iM4 = nVar4.m() - 1;
                            int iM5 = nVar4.m();
                            int iM6 = nVar4.m();
                            if (nVar6 != null) {
                                nVar6.e(12);
                                iM = nVar6.m();
                            } else {
                                iM = i5;
                            }
                            if (nVar5 != null) {
                                nVar5.e(12);
                                iM2 = nVar5.m();
                                if (iM2 > 0) {
                                    iM3 = nVar5.m() - 1;
                                    if (eVar.c()) {
                                        i11 = iM5;
                                    } else {
                                        i11 = iM5;
                                        if ("audio/raw".equals(sVarA.f29626f.f30128f) && iM4 == 0 && iM == 0 && iM2 == 0) {
                                            i12 = i35;
                                        }
                                        if (i12 == 0) {
                                            long[] jArr5 = new long[iA];
                                            int[] iArr4 = new int[iA];
                                            long[] jArr6 = new long[iA];
                                            int[] iArr5 = new int[iA];
                                            int iM7 = iM6;
                                            int i36 = iM4;
                                            int iM8 = i11;
                                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar7 = nVar5;
                                            int iM9 = iM3;
                                            int i37 = iM2;
                                            int i38 = iM;
                                            aVar = aVar2;
                                            arrayList = arrayList3;
                                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar8 = nVar6;
                                            long j18 = 0;
                                            long j19 = 0;
                                            int i39 = i5;
                                            int i40 = i39;
                                            int i41 = i40;
                                            int iM10 = i41;
                                            int iB5 = iM10;
                                            while (i41 < iA) {
                                                while (i39 == 0) {
                                                    if (!dVar.a()) {
                                                        throw new IllegalStateException();
                                                    }
                                                    long j21 = j16;
                                                    long j22 = dVar.f29515d;
                                                    i39 = dVar.f29514c;
                                                    j18 = j22;
                                                    j16 = j21;
                                                }
                                                long j23 = j16;
                                                if (nVar8 != null) {
                                                    while (iM10 == 0 && i38 > 0) {
                                                        iM10 = nVar8.m();
                                                        iB5 = nVar8.b();
                                                        i38--;
                                                    }
                                                    iM10--;
                                                }
                                                int i42 = iB5;
                                                jArr5[i41] = j18;
                                                int iB6 = eVar.b();
                                                iArr4[i41] = iB6;
                                                if (iB6 > i40) {
                                                    i40 = iB6;
                                                }
                                                int i43 = i39;
                                                jArr6[i41] = j19 + i42;
                                                iArr5[i41] = nVar7 == null ? i35 : i5;
                                                if (i41 == iM9) {
                                                    iArr5[i41] = i35;
                                                    i37--;
                                                    if (i37 > 0) {
                                                        iM9 = nVar7.m() - 1;
                                                    }
                                                }
                                                j19 += iM7;
                                                iM8--;
                                                if (iM8 == 0 && i36 > 0) {
                                                    i36--;
                                                    iM8 = nVar4.m();
                                                    iM7 = nVar4.m();
                                                }
                                                j18 += iArr4[i41];
                                                i39 = i43 - 1;
                                                i41++;
                                                iB5 = i42;
                                                j16 = j23;
                                            }
                                            j13 = j16;
                                            if (iM10 != 0) {
                                                throw new IllegalArgumentException();
                                            }
                                            while (i38 > 0) {
                                                if (nVar8.m() != 0) {
                                                    throw new IllegalArgumentException();
                                                }
                                                nVar8.b();
                                                i38--;
                                            }
                                            if (i37 != 0 || iM8 != 0 || i39 != 0 || i36 != 0) {
                                                StringBuilder sb2 = new StringBuilder("Inconsistent stbl box for track ");
                                                c0.A(sb2, sVarA.f29621a, ": remainingSynchronizationSamples ", i37, ", remainingSamplesAtTimestampDelta ");
                                                c0.A(sb2, iM8, ", remainingSamplesInChunk ", i39, ", remainingTimestampDeltaChanges ");
                                                sb2.append(i36);
                                                Log.w("AtomParsers", sb2.toString());
                                            }
                                            i13 = i40;
                                            iArr2 = iArr4;
                                            jArr = jArr5;
                                            jArr2 = jArr6;
                                            j14 = j19;
                                            iArr = iArr5;
                                        } else {
                                            aVar = aVar2;
                                            arrayList = arrayList3;
                                            j13 = j16;
                                            int i44 = dVar.f29512a;
                                            long[] jArr7 = new long[i44];
                                            int[] iArr6 = new int[i44];
                                            while (dVar.a()) {
                                                int i45 = dVar.f29513b;
                                                jArr7[i45] = dVar.f29515d;
                                                iArr6[i45] = dVar.f29514c;
                                            }
                                            int iB7 = eVar.b();
                                            long j24 = iM6;
                                            int i46 = UserMetadata.MAX_INTERNAL_KEY_SIZE / iB7;
                                            int i47 = i5;
                                            int i48 = i47;
                                            while (i47 < i44) {
                                                int i49 = iArr6[i47];
                                                int i51 = z.f30489a;
                                                i48 += ((i49 + i46) - 1) / i46;
                                                i47++;
                                            }
                                            long[] jArr8 = new long[i48];
                                            int[] iArr7 = new int[i48];
                                            long[] jArr9 = new long[i48];
                                            int[] iArr8 = new int[i48];
                                            int i52 = i5;
                                            int i53 = i52;
                                            int i54 = i53;
                                            int i55 = i54;
                                            while (i52 < i44) {
                                                int i56 = iArr6[i52];
                                                long j25 = jArr7[i52];
                                                int[] iArr9 = iArr6;
                                                int i57 = i56;
                                                int i58 = i44;
                                                int i59 = i53;
                                                long[] jArr10 = jArr7;
                                                int iMax = i55;
                                                while (i57 > 0) {
                                                    int iMin = Math.min(i46, i57);
                                                    jArr8[i54] = j25;
                                                    int i61 = i57;
                                                    int i62 = iB7 * iMin;
                                                    iArr7[i54] = i62;
                                                    iMax = Math.max(iMax, i62);
                                                    jArr9[i54] = i59 * j24;
                                                    iArr8[i54] = i35;
                                                    j25 += iArr7[i54];
                                                    i59 += iMin;
                                                    i57 = i61 - iMin;
                                                    i54++;
                                                    iB7 = iB7;
                                                }
                                                i52++;
                                                i55 = iMax;
                                                jArr7 = jArr10;
                                                iArr6 = iArr9;
                                                i53 = i59;
                                                i44 = i58;
                                            }
                                            jArr = jArr8;
                                            iArr = iArr8;
                                            iArr2 = iArr7;
                                            jArr2 = jArr9;
                                            i13 = i55;
                                            j14 = 0;
                                        }
                                        jArr3 = sVarA.f29629i;
                                        if (jArr3 == null || !(mVar4.f29369a == -1 || mVar4.f29370b == -1)) {
                                            i14 = i34;
                                            long[] jArr11 = jArr2;
                                            mVar = mVar4;
                                            long[] jArr12 = jArr;
                                            int[] iArr10 = iArr2;
                                            int[] iArr11 = iArr;
                                            z.a(jArr11, sVarA.f29623c);
                                            vVar = new v(jArr12, iArr10, i13, jArr11, iArr11);
                                        } else {
                                            if (jArr3.length == i35 && sVarA.f29622b == i35 && jArr2.length >= 2) {
                                                long j26 = sVarA.f29630j[i5];
                                                long jA = z.a(jArr3[i5], sVarA.f29623c, sVarA.f29624d) + j26;
                                                long j27 = jArr2[i5];
                                                if (j27 <= j26 && j26 < jArr2[1] && jArr2[jArr2.length - 1] < jA && jA <= j14) {
                                                    long j28 = j14 - jA;
                                                    long jA2 = z.a(j26 - j27, sVarA.f29626f.f30139s, sVarA.f29623c);
                                                    long jA3 = z.a(j28, sVarA.f29626f.f30139s, sVarA.f29623c);
                                                    if ((jA2 != 0 || jA3 != 0) && jA2 <= 2147483647L && jA3 <= 2147483647L) {
                                                        mVar4.f29369a = (int) jA2;
                                                        mVar4.f29370b = (int) jA3;
                                                        z.a(jArr2, sVarA.f29623c);
                                                        vVar = new v(jArr, iArr2, i13, jArr2, iArr);
                                                    }
                                                    i14 = i34;
                                                    mVar = mVar4;
                                                }
                                            } else {
                                                long[] jArr13 = jArr2;
                                                long[] jArr14 = sVarA.f29629i;
                                                if (jArr14.length == 1 && jArr14[i5] == 0) {
                                                    for (int i63 = i5; i63 < jArr13.length; i63++) {
                                                        jArr13[i63] = z.a(jArr13[i63] - sVarA.f29630j[i5], 1000000L, sVarA.f29623c);
                                                    }
                                                    vVar = new v(jArr, iArr2, i13, jArr13, iArr);
                                                    i14 = i34;
                                                    mVar = mVar4;
                                                } else {
                                                    long[] jArr15 = jArr;
                                                    int[] iArr12 = iArr2;
                                                    int[] iArr13 = iArr;
                                                    boolean z13 = sVarA.f29622b == 1 ? 1 : i5;
                                                    int i64 = i5;
                                                    int i65 = i64;
                                                    int i66 = i65;
                                                    int i67 = i66;
                                                    while (true) {
                                                        long[] jArr16 = sVarA.f29629i;
                                                        if (i64 >= jArr16.length) {
                                                            break;
                                                        }
                                                        int i68 = i67;
                                                        long j29 = sVarA.f29630j[i64];
                                                        if (j29 != -1) {
                                                            i15 = i64;
                                                            i16 = i34;
                                                            long jA4 = z.a(jArr16[i64], sVarA.f29623c, sVarA.f29624d);
                                                            int iA2 = z.a(jArr13, j29, true, true);
                                                            int iA3 = z.a(jArr13, j29 + jA4, z13, i5);
                                                            int i69 = (iA3 - iA2) + i65;
                                                            int i71 = i66 != iA2 ? 1 : 0;
                                                            i65 = i69;
                                                            i66 = iA3;
                                                            i67 = i71 | i68;
                                                        } else {
                                                            i15 = i64;
                                                            i16 = i34;
                                                            i67 = i68;
                                                        }
                                                        i64 = i15 + 1;
                                                        i34 = i16;
                                                        i5 = 0;
                                                    }
                                                    int i72 = i34;
                                                    int i73 = (i65 != iA ? 1 : 0) | i67;
                                                    long[] jArr17 = i73 != 0 ? new long[i65] : jArr15;
                                                    int[] iArr14 = i73 != 0 ? new int[i65] : iArr12;
                                                    if (i73 != 0) {
                                                        i13 = 0;
                                                    }
                                                    int[] iArr15 = i73 != 0 ? new int[i65] : iArr13;
                                                    long[] jArr18 = new long[i65];
                                                    long j31 = 0;
                                                    int i74 = i13;
                                                    int i75 = 0;
                                                    int i76 = 0;
                                                    while (true) {
                                                        long[] jArr19 = sVarA.f29629i;
                                                        int i77 = i73;
                                                        if (i75 >= jArr19.length) {
                                                            break;
                                                        }
                                                        int i78 = i75;
                                                        int i79 = i72;
                                                        long j32 = sVarA.f29630j[i78];
                                                        long j33 = jArr19[i78];
                                                        if (j32 != -1) {
                                                            com.fyber.inneractive.sdk.player.exoplayer2.extractor.m mVar5 = mVar4;
                                                            iArr3 = iArr15;
                                                            j15 = j33;
                                                            long jA5 = z.a(j33, sVarA.f29623c, sVarA.f29624d) + j32;
                                                            mVar2 = mVar5;
                                                            jArr4 = jArr18;
                                                            int iA4 = z.a(jArr13, j32, true, true);
                                                            int iA5 = z.a(jArr13, jA5, z13, false);
                                                            if (i77 != 0) {
                                                                int i81 = iA5 - iA4;
                                                                System.arraycopy(jArr15, iA4, jArr17, i76, i81);
                                                                System.arraycopy(iArr12, iA4, iArr14, i76, i81);
                                                                System.arraycopy(iArr13, iA4, iArr3, i76, i81);
                                                            }
                                                            int i82 = i74;
                                                            while (iA4 < iA5) {
                                                                long[] jArr20 = jArr17;
                                                                int i83 = iA4;
                                                                jArr4[i76] = z.a(j31, 1000000L, sVarA.f29624d) + z.a(jArr13[i83] - j32, 1000000L, sVarA.f29623c);
                                                                if (i77 != 0 && iArr14[i76] > i82) {
                                                                    i82 = iArr12[i83];
                                                                }
                                                                i76++;
                                                                iA4 = i83 + 1;
                                                                jArr17 = jArr20;
                                                            }
                                                            i74 = i82;
                                                        } else {
                                                            jArr4 = jArr18;
                                                            mVar2 = mVar4;
                                                            iArr3 = iArr15;
                                                            j15 = j33;
                                                        }
                                                        j31 += j15;
                                                        i75 = i78 + 1;
                                                        jArr17 = jArr17;
                                                        iArr15 = iArr3;
                                                        i73 = i77;
                                                        i72 = i79;
                                                        mVar4 = mVar2;
                                                        jArr18 = jArr4;
                                                    }
                                                    long[] jArr21 = jArr18;
                                                    mVar = mVar4;
                                                    int[] iArr16 = iArr15;
                                                    i14 = i72;
                                                    long[] jArr22 = jArr17;
                                                    boolean z14 = false;
                                                    for (int i84 = 0; i84 < iArr16.length && !z14; i84++) {
                                                        z14 |= (iArr16[i84] & 1) != 0;
                                                    }
                                                    if (!z14) {
                                                        throw new com.fyber.inneractive.sdk.player.exoplayer2.r("The edited sample sequence does not contain a sync sample.");
                                                    }
                                                    vVar2 = new v(jArr22, iArr14, i74, jArr21, iArr16);
                                                }
                                            }
                                            pVar2 = pVar;
                                            arrayList3 = arrayList2;
                                            mVar4 = mVar3;
                                            i19 = 0;
                                            i22 = 1;
                                            i34 = i17 + 1;
                                            aVar2 = aVar;
                                        }
                                        vVar2 = vVar;
                                    }
                                    i12 = i5;
                                    if (i12 == 0) {
                                    }
                                    jArr3 = sVarA.f29629i;
                                    if (jArr3 == null) {
                                        i14 = i34;
                                        long[] jArr112 = jArr2;
                                        mVar = mVar4;
                                        long[] jArr122 = jArr;
                                        int[] iArr102 = iArr2;
                                        int[] iArr112 = iArr;
                                        z.a(jArr112, sVarA.f29623c);
                                        vVar = new v(jArr122, iArr102, i13, jArr112, iArr112);
                                        vVar2 = vVar;
                                    }
                                    pVar2 = pVar;
                                    arrayList3 = arrayList2;
                                    mVar4 = mVar3;
                                    i19 = 0;
                                    i22 = 1;
                                    i34 = i17 + 1;
                                    aVar2 = aVar;
                                } else {
                                    nVar5 = null;
                                }
                            } else {
                                iM2 = i5;
                            }
                            iM3 = -1;
                            if (eVar.c()) {
                            }
                            i12 = i5;
                            if (i12 == 0) {
                            }
                            jArr3 = sVarA.f29629i;
                            if (jArr3 == null) {
                            }
                            pVar2 = pVar;
                            arrayList3 = arrayList2;
                            mVar4 = mVar3;
                            i19 = 0;
                            i22 = 1;
                            i34 = i17 + 1;
                            aVar2 = aVar;
                        }
                        if (vVar2.f29650a != 0) {
                            pVar = this;
                            i17 = i14;
                            com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = pVar.f29618l.a(i17, sVarA.f29622b);
                            o oVar = new o(sVarA, vVar2, gVarA);
                            int i85 = vVar2.f29653d + 30;
                            com.fyber.inneractive.sdk.player.exoplayer2.o oVar2 = sVarA.f29626f;
                            String str2 = oVar2.f30123a;
                            String str3 = oVar2.f30127e;
                            String str4 = oVar2.f30128f;
                            String str5 = oVar2.f30125c;
                            int i86 = oVar2.f30124b;
                            int i87 = oVar2.f30132j;
                            int i88 = oVar2.f30133k;
                            float f11 = oVar2.f30134l;
                            int i89 = oVar2.f30135m;
                            float f12 = oVar2.n;
                            byte[] bArr = oVar2.f30136p;
                            int i91 = oVar2.o;
                            com.fyber.inneractive.sdk.player.exoplayer2.video.c cVar = oVar2.f30137q;
                            int i92 = oVar2.f30138r;
                            int i93 = oVar2.f30139s;
                            int i94 = oVar2.f30140t;
                            int i95 = oVar2.f30141u;
                            int i96 = oVar2.f30142v;
                            int i97 = oVar2.f30144x;
                            String str6 = oVar2.f30145y;
                            int i98 = oVar2.f30146z;
                            long j34 = oVar2.f30143w;
                            com.fyber.inneractive.sdk.player.exoplayer2.o oVar3 = new com.fyber.inneractive.sdk.player.exoplayer2.o(str2, str3, str4, str5, i86, i85, i87, i88, f11, i89, f12, bArr, i91, cVar, i92, i93, i94, i95, i96, i97, str6, i98, j34, oVar2.f30130h, oVar2.f30131i, oVar2.f30126d);
                            if (sVarA.f29622b == 1) {
                                com.fyber.inneractive.sdk.player.exoplayer2.extractor.m mVar6 = mVar;
                                int i99 = mVar6.f29369a;
                                if (i99 != -1 && (i18 = mVar6.f29370b) != -1) {
                                    oVar3 = new com.fyber.inneractive.sdk.player.exoplayer2.o(str2, str3, str4, str5, i86, i85, i87, i88, f11, i89, f12, bArr, i91, cVar, i92, i93, i94, i99, i18, i97, str6, i98, j34, oVar3.f30130h, oVar3.f30131i, oVar3.f30126d);
                                }
                                if (bVar != null) {
                                    mVar3 = mVar6;
                                    oVar3 = new com.fyber.inneractive.sdk.player.exoplayer2.o(oVar3.f30123a, oVar3.f30127e, oVar3.f30128f, oVar3.f30125c, oVar3.f30124b, oVar3.f30129g, oVar3.f30132j, oVar3.f30133k, oVar3.f30134l, oVar3.f30135m, oVar3.n, oVar3.f30136p, oVar3.o, oVar3.f30137q, oVar3.f30138r, oVar3.f30139s, oVar3.f30140t, oVar3.f30141u, oVar3.f30142v, oVar3.f30144x, oVar3.f30145y, oVar3.f30146z, oVar3.f30143w, oVar3.f30130h, oVar3.f30131i, bVar);
                                } else {
                                    mVar3 = mVar6;
                                }
                            } else {
                                mVar3 = mVar;
                            }
                            gVarA.a(oVar3);
                            long jMax = Math.max(j13, sVarA.f29625e);
                            arrayList2 = arrayList;
                            arrayList2.add(oVar);
                            long j35 = vVar2.f29651b[0];
                            if (j35 < j12) {
                                j17 = j35;
                                j16 = jMax;
                            } else {
                                j16 = jMax;
                                j17 = j12;
                            }
                        }
                        pVar2 = pVar;
                        arrayList3 = arrayList2;
                        mVar4 = mVar3;
                        i19 = 0;
                        i22 = 1;
                        i34 = i17 + 1;
                        aVar2 = aVar;
                    } else {
                        aVar = aVar2;
                        i14 = i34;
                        arrayList = arrayList3;
                        mVar = mVar4;
                        j13 = j16;
                        j12 = j17;
                    }
                    pVar = this;
                    i17 = i14;
                    mVar3 = mVar;
                    j17 = j12;
                    arrayList2 = arrayList;
                    j16 = j13;
                    pVar2 = pVar;
                    arrayList3 = arrayList2;
                    mVar4 = mVar3;
                    i19 = 0;
                    i22 = 1;
                    i34 = i17 + 1;
                    aVar2 = aVar;
                }
                p pVar3 = pVar2;
                ArrayList arrayList5 = arrayList3;
                pVar3.n = j16;
                pVar3.f29619m = (o[]) arrayList5.toArray(new o[arrayList5.size()]);
                pVar3.f29618l.b();
                pVar3.f29618l.a(pVar3);
                pVar3.f29610d.clear();
                pVar3.f29611e = 2;
            } else {
                p pVar4 = pVar2;
                if (!pVar4.f29610d.isEmpty()) {
                    ((a) pVar4.f29610d.peek()).T0.add(aVar2);
                }
                pVar2 = pVar4;
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        this.f29618l = jVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        int i5;
        this.f29610d.clear();
        this.f29614h = 0;
        this.f29616j = 0;
        this.f29617k = 0;
        if (j11 == 0) {
            this.f29611e = 0;
            this.f29614h = 0;
            return;
        }
        o[] oVarArr = this.f29619m;
        if (oVarArr != null) {
            for (o oVar : oVarArr) {
                v vVar = oVar.f29603b;
                int iA = z.a(vVar.f29654e, j12, false);
                while (true) {
                    i5 = -1;
                    if (iA < 0) {
                        iA = -1;
                        break;
                    } else if ((vVar.f29655f[iA] & 1) != 0) {
                        break;
                    } else {
                        iA--;
                    }
                }
                if (iA != -1) {
                    i5 = iA;
                    break;
                    break;
                }
                iA = z.a(vVar.f29654e, j12, true, false);
                while (iA < vVar.f29654e.length) {
                    if ((vVar.f29655f[iA] & 1) != 0) {
                        i5 = iA;
                        break;
                    }
                    iA++;
                }
                oVar.f29605d = i5;
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, com.fyber.inneractive.sdk.player.exoplayer2.r, NumberFormatException, EOFException {
        o[] oVarArr;
        boolean z11;
        while (true) {
            int i5 = this.f29611e;
            boolean z12 = false;
            if (i5 == 0) {
                if (this.f29614h == 0) {
                    if (!bVar.b(this.f29609c.f30461a, 0, 8, true)) {
                        return -1;
                    }
                    this.f29614h = 8;
                    this.f29609c.e(0);
                    this.f29613g = this.f29609c.k();
                    this.f29612f = this.f29609c.b();
                }
                if (this.f29613g == 1) {
                    bVar.b(this.f29609c.f30461a, 8, 8, false);
                    this.f29614h += 8;
                    this.f29613g = this.f29609c.n();
                }
                int i11 = this.f29612f;
                if (i11 != c.C && i11 != c.E && i11 != c.F && i11 != c.G && i11 != c.H && i11 != c.Q) {
                    if (i11 != c.S && i11 != c.D && i11 != c.T && i11 != c.U && i11 != c.f29486m0 && i11 != c.f29487n0 && i11 != c.f29488o0 && i11 != c.R && i11 != c.f29490p0 && i11 != c.f29492q0 && i11 != c.f29494r0 && i11 != c.f29496s0 && i11 != c.f29498t0 && i11 != c.P && i11 != c.f29463b && i11 != c.A0) {
                        this.f29615i = null;
                        this.f29611e = 1;
                    } else if (this.f29614h == 8) {
                        long j11 = this.f29613g;
                        if (j11 <= 2147483647L) {
                            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n((int) j11);
                            this.f29615i = nVar;
                            System.arraycopy(this.f29609c.f30461a, 0, nVar.f30461a, 0, 8);
                            this.f29611e = 1;
                        } else {
                            throw new IllegalStateException();
                        }
                    } else {
                        throw new IllegalStateException();
                    }
                } else {
                    long j12 = (bVar.f29133c + this.f29613g) - this.f29614h;
                    this.f29610d.add(new a(this.f29612f, j12));
                    if (this.f29613g == this.f29614h) {
                        c(j12);
                    } else {
                        this.f29611e = 0;
                        this.f29614h = 0;
                    }
                }
            } else {
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException();
                    }
                    long j13 = Long.MAX_VALUE;
                    int i12 = -1;
                    int i13 = 0;
                    while (true) {
                        oVarArr = this.f29619m;
                        if (i13 >= oVarArr.length) {
                            break;
                        }
                        o oVar2 = oVarArr[i13];
                        int i14 = oVar2.f29605d;
                        v vVar = oVar2.f29603b;
                        if (i14 != vVar.f29650a) {
                            long j14 = vVar.f29651b[i14];
                            if (j14 < j13) {
                                i12 = i13;
                                j13 = j14;
                            }
                        }
                        i13++;
                    }
                    if (i12 == -1) {
                        return -1;
                    }
                    o oVar3 = oVarArr[i12];
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar = oVar3.f29604c;
                    int i15 = oVar3.f29605d;
                    v vVar2 = oVar3.f29603b;
                    long j15 = vVar2.f29651b[i15];
                    int i16 = vVar2.f29652c[i15];
                    if (oVar3.f29602a.f29627g == 1) {
                        j15 += 8;
                        i16 -= 8;
                    }
                    long j16 = (j15 - bVar.f29133c) + this.f29616j;
                    if (j16 >= 0 && j16 < 262144) {
                        bVar.a((int) j16);
                        int i17 = oVar3.f29602a.f29631k;
                        if (i17 == 0) {
                            while (true) {
                                int i18 = this.f29616j;
                                if (i18 >= i16) {
                                    break;
                                }
                                int iA = rVar.a(bVar, i16 - i18, false);
                                this.f29616j += iA;
                                this.f29617k -= iA;
                            }
                        } else {
                            byte[] bArr = this.f29608b.f30461a;
                            bArr[0] = 0;
                            bArr[1] = 0;
                            bArr[2] = 0;
                            int i19 = 4 - i17;
                            while (this.f29616j < i16) {
                                int i21 = this.f29617k;
                                if (i21 == 0) {
                                    bVar.b(this.f29608b.f30461a, i19, i17, false);
                                    this.f29608b.e(0);
                                    this.f29617k = this.f29608b.m();
                                    this.f29607a.e(0);
                                    rVar.a(4, this.f29607a);
                                    this.f29616j += 4;
                                    i16 += i19;
                                } else {
                                    int iA2 = rVar.a(bVar, i21, false);
                                    this.f29616j += iA2;
                                    this.f29617k -= iA2;
                                }
                            }
                        }
                        int i22 = i16;
                        v vVar3 = oVar3.f29603b;
                        rVar.a(vVar3.f29654e[i15], vVar3.f29655f[i15], i22, 0, null);
                        oVar3.f29605d++;
                        this.f29616j = 0;
                        this.f29617k = 0;
                        return 0;
                    }
                    oVar.f29669a = j15;
                    return 1;
                }
                long j17 = this.f29613g;
                int i23 = this.f29614h;
                long j18 = j17 - i23;
                long j19 = bVar.f29133c + j18;
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29615i;
                if (nVar2 != null) {
                    bVar.b(nVar2.f30461a, i23, (int) j18, false);
                    if (this.f29612f == c.f29463b) {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = this.f29615i;
                        nVar3.e(8);
                        if (nVar3.b() != f29606p) {
                            nVar3.e(nVar3.f30462b + 4);
                            while (nVar3.f30463c - nVar3.f30462b > 0) {
                                if (nVar3.b() == f29606p) {
                                    z11 = true;
                                    break;
                                }
                            }
                            z11 = false;
                            this.o = z11;
                        } else {
                            z11 = true;
                            this.o = z11;
                        }
                    } else if (!this.f29610d.isEmpty()) {
                        ((a) this.f29610d.peek()).S0.add(new b(this.f29612f, this.f29615i));
                    }
                } else if (j18 < 262144) {
                    bVar.a((int) j18);
                } else {
                    oVar.f29669a = j19;
                    z12 = true;
                }
                c(j19);
                if (z12 && this.f29611e != 2) {
                    return 1;
                }
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        int i5;
        long j12 = Long.MAX_VALUE;
        for (o oVar : this.f29619m) {
            v vVar = oVar.f29603b;
            int iA = z.a(vVar.f29654e, j11, false);
            while (true) {
                i5 = -1;
                if (iA < 0) {
                    iA = -1;
                    break;
                }
                if ((vVar.f29655f[iA] & 1) != 0) {
                    break;
                }
                iA--;
            }
            if (iA != -1) {
                i5 = iA;
                break;
            }
            iA = z.a(vVar.f29654e, j11, true, false);
            while (iA < vVar.f29654e.length) {
                if ((vVar.f29655f[iA] & 1) != 0) {
                    i5 = iA;
                    break;
                }
                iA++;
            }
            long j13 = vVar.f29651b[i5];
            if (j13 < j12) {
                j12 = j13;
            }
        }
        return j12;
    }
}
