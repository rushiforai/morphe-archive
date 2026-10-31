package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.player.exoplayer2.r;
import com.fyber.inneractive.sdk.player.exoplayer2.util.v;
import java.io.EOFException;
import java.util.Arrays;
import java.util.Collections;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class p implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i {

    /* renamed from: g, reason: collision with root package name */
    public static final Pattern f29284g = Pattern.compile("LOCAL:([^,]+)");

    /* renamed from: h, reason: collision with root package name */
    public static final Pattern f29285h = Pattern.compile("MPEGTS:(\\d+)");

    /* renamed from: a, reason: collision with root package name */
    public final String f29286a;

    /* renamed from: b, reason: collision with root package name */
    public final v f29287b;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.j f29289d;

    /* renamed from: f, reason: collision with root package name */
    public int f29291f;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29288c = new com.fyber.inneractive.sdk.player.exoplayer2.util.n();

    /* renamed from: e, reason: collision with root package name */
    public byte[] f29290e = new byte[1024];

    public p(String str, v vVar) {
        this.f29286a = str;
        this.f29287b = vVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        throw new IllegalStateException();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        this.f29289d = jVar;
        jVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.extractor.p(-9223372036854775807L));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        throw new IllegalStateException();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, r, NumberFormatException, EOFException, com.fyber.inneractive.sdk.player.exoplayer2.text.a {
        int iMin;
        Matcher matcher;
        String strC;
        int i5 = (int) bVar.f29132b;
        int i11 = this.f29291f;
        byte[] bArr = this.f29290e;
        if (i11 == bArr.length) {
            this.f29290e = Arrays.copyOf(bArr, ((i5 != -1 ? i5 : bArr.length) * 3) / 2);
        }
        byte[] bArr2 = this.f29290e;
        int i12 = this.f29291f;
        int length = bArr2.length - i12;
        int i13 = bVar.f29136f;
        if (i13 == 0) {
            iMin = 0;
        } else {
            iMin = Math.min(i13, length);
            System.arraycopy(bVar.f29134d, 0, bArr2, i12, iMin);
            bVar.b(iMin);
        }
        if (iMin == 0) {
            iMin = bVar.a(bArr2, i12, length, 0, true);
        }
        if (iMin != -1) {
            bVar.f29133c += iMin;
        }
        if (iMin != -1) {
            int i14 = this.f29291f + iMin;
            this.f29291f = i14;
            if (i5 == -1 || i14 != i5) {
                return 0;
            }
        }
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(this.f29290e);
        try {
            Pattern pattern = com.fyber.inneractive.sdk.player.exoplayer2.text.webvtt.b.f30254a;
            String strC2 = nVar.c();
            if (strC2 == null || !com.fyber.inneractive.sdk.player.exoplayer2.text.webvtt.b.f30255b.matcher(strC2).matches()) {
                throw new com.fyber.inneractive.sdk.player.exoplayer2.text.a("Expected WEBVTT. Got " + strC2);
            }
            long j11 = 0;
            long j12 = 0;
            while (true) {
                String strC3 = nVar.c();
                if (TextUtils.isEmpty(strC3)) {
                    while (true) {
                        String strC4 = nVar.c();
                        if (strC4 == null) {
                            matcher = null;
                            break;
                        }
                        if (com.fyber.inneractive.sdk.player.exoplayer2.text.webvtt.b.f30254a.matcher(strC4).matches()) {
                            do {
                                strC = nVar.c();
                                if (strC != null) {
                                }
                            } while (!strC.isEmpty());
                        } else {
                            matcher = com.fyber.inneractive.sdk.player.exoplayer2.text.webvtt.a.f30253a.matcher(strC4);
                            if (matcher.matches()) {
                                break;
                            }
                        }
                    }
                    if (matcher == null) {
                        this.f29289d.a(0, 3).a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(null, "text/vtt", 0, this.f29286a, -1, null, 0L, Collections.EMPTY_LIST));
                        this.f29289d.b();
                    } else {
                        long jA = com.fyber.inneractive.sdk.player.exoplayer2.text.webvtt.b.a(matcher.group(1));
                        long jA2 = this.f29287b.a((j12 + jA) - j11);
                        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = this.f29289d.a(0, 3);
                        gVarA.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(null, "text/vtt", 0, this.f29286a, -1, null, jA2 - jA, Collections.EMPTY_LIST));
                        this.f29289d.b();
                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29288c;
                        byte[] bArr3 = this.f29290e;
                        int i15 = this.f29291f;
                        nVar2.f30461a = bArr3;
                        nVar2.f30463c = i15;
                        nVar2.f30462b = 0;
                        gVarA.a(i15, nVar2);
                        gVarA.a(jA2, 1, this.f29291f, 0, (byte[]) null);
                    }
                    return -1;
                }
                if (strC3.startsWith("X-TIMESTAMP-MAP")) {
                    Matcher matcher2 = f29284g.matcher(strC3);
                    if (matcher2.find()) {
                        Matcher matcher3 = f29285h.matcher(strC3);
                        if (matcher3.find()) {
                            long jA3 = com.fyber.inneractive.sdk.player.exoplayer2.text.webvtt.b.a(matcher2.group(1));
                            j12 = (Long.parseLong(matcher3.group(1)) * 1000000) / 90000;
                            j11 = jA3;
                        } else {
                            throw new r("X-TIMESTAMP-MAP doesn't contain media timestamp: ".concat(strC3));
                        }
                    } else {
                        throw new r("X-TIMESTAMP-MAP doesn't contain local timestamp: ".concat(strC3));
                    }
                }
            }
        } catch (com.fyber.inneractive.sdk.player.exoplayer2.text.a e3) {
            throw new r(e3);
        }
    }
}
