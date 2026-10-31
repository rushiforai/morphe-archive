package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioTrack;
import android.os.ConditionVariable;
import android.os.SystemClock;
import android.util.Log;
import b.c0;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.LinkedList;

/* loaded from: classes3.dex */
public final class r {
    public long A;
    public boolean B;
    public long C;
    public Method D;
    public int E;
    public long F;
    public long G;
    public int H;
    public long I;
    public long J;
    public int K;
    public int L;
    public long M;
    public long N;
    public long O;
    public float P;
    public c[] Q;
    public ByteBuffer[] R;
    public ByteBuffer S;
    public ByteBuffer T;
    public byte[] U;
    public int V;
    public int W;
    public boolean X;
    public boolean Y;
    public int Z;

    /* renamed from: a, reason: collision with root package name */
    public final s f29017a;

    /* renamed from: a0, reason: collision with root package name */
    public boolean f29018a0;

    /* renamed from: b, reason: collision with root package name */
    public final x f29019b;

    /* renamed from: b0, reason: collision with root package name */
    public boolean f29020b0;

    /* renamed from: c, reason: collision with root package name */
    public final c[] f29021c;

    /* renamed from: c0, reason: collision with root package name */
    public long f29022c0;

    /* renamed from: d, reason: collision with root package name */
    public final o f29023d;

    /* renamed from: e, reason: collision with root package name */
    public final ConditionVariable f29024e = new ConditionVariable(true);

    /* renamed from: f, reason: collision with root package name */
    public final long[] f29025f;

    /* renamed from: g, reason: collision with root package name */
    public final k f29026g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkedList f29027h;

    /* renamed from: i, reason: collision with root package name */
    public AudioTrack f29028i;

    /* renamed from: j, reason: collision with root package name */
    public int f29029j;

    /* renamed from: k, reason: collision with root package name */
    public int f29030k;

    /* renamed from: l, reason: collision with root package name */
    public int f29031l;

    /* renamed from: m, reason: collision with root package name */
    public int f29032m;
    public int n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public int f29033p;

    /* renamed from: q, reason: collision with root package name */
    public long f29034q;

    /* renamed from: r, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.s f29035r;

    /* renamed from: s, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.s f29036s;

    /* renamed from: t, reason: collision with root package name */
    public long f29037t;

    /* renamed from: u, reason: collision with root package name */
    public long f29038u;

    /* renamed from: v, reason: collision with root package name */
    public ByteBuffer f29039v;

    /* renamed from: w, reason: collision with root package name */
    public int f29040w;

    /* renamed from: x, reason: collision with root package name */
    public int f29041x;

    /* renamed from: y, reason: collision with root package name */
    public int f29042y;

    /* renamed from: z, reason: collision with root package name */
    public long f29043z;

    public r(c[] cVarArr, u uVar) {
        this.f29023d = uVar;
        if (z.f30489a >= 18) {
            try {
                this.D = AudioTrack.class.getMethod("getLatency", null);
            } catch (NoSuchMethodException unused) {
            }
        }
        if (z.f30489a >= 19) {
            this.f29026g = new l();
        } else {
            this.f29026g = new k();
        }
        s sVar = new s();
        this.f29017a = sVar;
        x xVar = new x();
        this.f29019b = xVar;
        c[] cVarArr2 = new c[cVarArr.length + 3];
        this.f29021c = cVarArr2;
        cVarArr2[0] = new v();
        cVarArr2[1] = sVar;
        System.arraycopy(cVarArr, 0, cVarArr2, 2, cVarArr.length);
        cVarArr2[cVarArr.length + 2] = xVar;
        this.f29025f = new long[10];
        this.P = 1.0f;
        this.L = 0;
        this.n = 3;
        this.Z = 0;
        this.f29036s = com.fyber.inneractive.sdk.player.exoplayer2.s.f30148d;
        this.W = -1;
        this.Q = new c[0];
        this.R = new ByteBuffer[0];
        this.f29027h = new LinkedList();
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x009b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(int i5, int i11, int i12, int[] iArr) throws IllegalStateException, m {
        int i13;
        int i14;
        int i15 = z.f30489a;
        if (i12 == Integer.MIN_VALUE) {
            i13 = i5 * 3;
        } else if (i12 == 1073741824) {
            i13 = i5 * 4;
        } else if (i12 == 2) {
            i13 = i5 * 2;
        } else {
            if (i12 != 3) {
                throw new IllegalArgumentException();
            }
            i13 = i5;
        }
        this.E = i13;
        this.f29017a.f29046d = iArr;
        boolean zA = false;
        for (c cVar : this.f29021c) {
            try {
                zA |= cVar.a(i11, i5, i12);
                if (cVar.d()) {
                    i5 = cVar.e();
                    i12 = 2;
                }
            } catch (b e3) {
                throw new m(e3);
            }
        }
        if (zA) {
            h();
        }
        int i16 = 252;
        switch (i5) {
            case 1:
                i14 = 4;
                break;
            case 2:
                i14 = 12;
                break;
            case 3:
                i14 = 28;
                break;
            case 4:
                i14 = Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE;
                break;
            case 5:
                i14 = Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE;
                break;
            case 6:
                i14 = 252;
                break;
            case 7:
                i14 = 1276;
                break;
            case 8:
                i14 = com.fyber.inneractive.sdk.player.exoplayer2.b.f29095a;
                break;
            default:
                throw new m(com.fyber.inneractive.sdk.player.exoplayer2.m.a("Unsupported channel count: ", i5));
        }
        int i17 = z.f30489a;
        if (i17 > 23 || !"foster".equals(z.f30490b) || !"NVIDIA".equals(z.f30491c)) {
            i16 = i14;
        } else if (i5 != 3 && i5 != 5) {
            if (i5 == 7) {
                i16 = com.fyber.inneractive.sdk.player.exoplayer2.b.f29095a;
            }
        }
        if (i17 <= 25) {
            "fugu".equals(z.f30490b);
        }
        if (!zA && d() && this.f29031l == i12 && this.f29029j == i11 && this.f29030k == i16) {
            return;
        }
        g();
        this.f29031l = i12;
        this.o = false;
        this.f29029j = i11;
        this.f29030k = i16;
        this.f29032m = 2;
        this.H = i5 * 2;
        int minBufferSize = AudioTrack.getMinBufferSize(i11, i16, 2);
        if (minBufferSize == -2) {
            throw new IllegalStateException();
        }
        int i18 = minBufferSize * 4;
        long j11 = this.f29029j;
        int i19 = this.H;
        int i21 = ((int) ((250000 * j11) / 1000000)) * i19;
        int iMax = (int) Math.max(minBufferSize, ((j11 * 750000) / 1000000) * i19);
        if (i18 < i21) {
            i18 = i21;
        } else if (i18 > iMax) {
            i18 = iMax;
        }
        this.f29033p = i18;
        this.f29034q = ((i18 / this.H) * 1000000) / this.f29029j;
        a(this.f29036s);
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00d0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(ByteBuffer byteBuffer, long j11) throws q {
        if (byteBuffer.hasRemaining()) {
            ByteBuffer byteBuffer2 = this.T;
            int iWrite = 0;
            if (byteBuffer2 == null) {
                this.T = byteBuffer;
                if (z.f30489a < 21) {
                    int iRemaining = byteBuffer.remaining();
                    byte[] bArr = this.U;
                    if (bArr == null || bArr.length < iRemaining) {
                        this.U = new byte[iRemaining];
                    }
                    int iPosition = byteBuffer.position();
                    byteBuffer.get(this.U, 0, iRemaining);
                    byteBuffer.position(iPosition);
                    this.V = 0;
                }
            } else if (byteBuffer2 != byteBuffer) {
                throw new IllegalArgumentException();
            }
            int iRemaining2 = byteBuffer.remaining();
            if (z.f30489a < 21) {
                int iA = this.f29033p - ((int) (this.I - (this.f29026g.a() * this.H)));
                if (iA > 0) {
                    iWrite = this.f29028i.write(this.U, this.V, Math.min(iRemaining2, iA));
                    if (iWrite > 0) {
                        this.V += iWrite;
                        byteBuffer.position(byteBuffer.position() + iWrite);
                    }
                }
            } else if (!this.f29018a0) {
                iWrite = this.f29028i.write(byteBuffer, iRemaining2, 1);
            } else {
                if (j11 == -9223372036854775807L) {
                    throw new IllegalStateException();
                }
                AudioTrack audioTrack = this.f29028i;
                if (this.f29039v == null) {
                    ByteBuffer byteBufferAllocate = ByteBuffer.allocate(16);
                    this.f29039v = byteBufferAllocate;
                    byteBufferAllocate.order(ByteOrder.BIG_ENDIAN);
                    this.f29039v.putInt(1431633921);
                }
                if (this.f29040w == 0) {
                    this.f29039v.putInt(4, iRemaining2);
                    this.f29039v.putLong(8, j11 * 1000);
                    this.f29039v.position(0);
                    this.f29040w = iRemaining2;
                }
                int iRemaining3 = this.f29039v.remaining();
                if (iRemaining3 <= 0) {
                    int iWrite2 = audioTrack.write(byteBuffer, iRemaining2, 1);
                    if (iWrite2 < 0) {
                        this.f29040w = 0;
                    } else {
                        this.f29040w -= iWrite2;
                    }
                    iWrite = iWrite2;
                } else {
                    int iWrite3 = audioTrack.write(this.f29039v, iRemaining3, 1);
                    if (iWrite3 < 0) {
                        this.f29040w = 0;
                        iWrite = iWrite3;
                    } else if (iWrite3 >= iRemaining3) {
                    }
                }
            }
            this.f29022c0 = SystemClock.elapsedRealtime();
            if (iWrite < 0) {
                throw new q(iWrite);
            }
            boolean z11 = this.o;
            if (!z11) {
                this.I += iWrite;
            }
            if (iWrite == iRemaining2) {
                if (z11) {
                    this.J += this.K;
                }
                this.T = null;
            }
        }
    }

    public final boolean c() {
        if (!d()) {
            return false;
        }
        if (b() <= this.f29026g.a()) {
            return e() && this.f29028i.getPlayState() == 2 && this.f29028i.getPlaybackHeadPosition() == 0;
        }
        return true;
    }

    public final boolean d() {
        return this.f29028i != null;
    }

    public final boolean e() {
        if (z.f30489a >= 23) {
            return false;
        }
        int i5 = this.f29032m;
        return i5 == 5 || i5 == 6;
    }

    public final void f() throws IllegalStateException {
        this.Y = true;
        if (d()) {
            this.N = System.nanoTime() / 1000;
            this.f29028i.play();
        }
    }

    public final void g() throws IllegalStateException {
        if (d()) {
            this.F = 0L;
            this.G = 0L;
            this.I = 0L;
            this.J = 0L;
            this.K = 0;
            com.fyber.inneractive.sdk.player.exoplayer2.s sVar = this.f29035r;
            if (sVar != null) {
                this.f29036s = sVar;
                this.f29035r = null;
            } else if (!this.f29027h.isEmpty()) {
                this.f29036s = ((p) this.f29027h.getLast()).f29014a;
            }
            this.f29027h.clear();
            this.f29037t = 0L;
            this.f29038u = 0L;
            this.S = null;
            this.T = null;
            int i5 = 0;
            while (true) {
                c[] cVarArr = this.Q;
                if (i5 >= cVarArr.length) {
                    break;
                }
                c cVar = cVarArr[i5];
                cVar.flush();
                this.R[i5] = cVar.a();
                i5++;
            }
            this.X = false;
            this.W = -1;
            this.f29039v = null;
            this.f29040w = 0;
            this.L = 0;
            this.O = 0L;
            this.f29043z = 0L;
            this.f29042y = 0;
            this.f29041x = 0;
            this.A = 0L;
            this.B = false;
            this.C = 0L;
            if (this.f29028i.getPlayState() == 3) {
                this.f29028i.pause();
            }
            AudioTrack audioTrack = this.f29028i;
            this.f29028i = null;
            this.f29026g.a(null, false);
            this.f29024e.close();
            new j(this, audioTrack).start();
        }
    }

    public final void h() {
        ArrayList arrayList = new ArrayList();
        for (c cVar : this.f29021c) {
            if (cVar.d()) {
                arrayList.add(cVar);
            } else {
                cVar.flush();
            }
        }
        int size = arrayList.size();
        this.Q = (c[]) arrayList.toArray(new c[size]);
        this.R = new ByteBuffer[size];
        for (int i5 = 0; i5 < size; i5++) {
            c cVar2 = this.Q[i5];
            cVar2.flush();
            this.R[i5] = cVar2.a();
        }
    }

    public final void i() {
        if (d()) {
            if (z.f30489a >= 21) {
                this.f29028i.setVolume(this.P);
                return;
            }
            AudioTrack audioTrack = this.f29028i;
            float f11 = this.P;
            audioTrack.setStereoVolume(f11, f11);
        }
    }

    public final boolean a(ByteBuffer byteBuffer, long j11) throws IllegalStateException, q, n {
        long j12;
        int i5;
        ByteBuffer byteBuffer2 = this.S;
        if (byteBuffer2 != null && byteBuffer != byteBuffer2) {
            throw new IllegalArgumentException();
        }
        if (!d()) {
            this.f29024e.block();
            if (this.f29018a0) {
                this.f29028i = new AudioTrack(new AudioAttributes.Builder().setUsage(1).setContentType(3).setFlags(16).build(), new AudioFormat.Builder().setChannelMask(this.f29030k).setEncoding(this.f29032m).setSampleRate(this.f29029j).build(), this.f29033p, 1, this.Z);
            } else if (this.Z == 0) {
                this.f29028i = new AudioTrack(this.n, this.f29029j, this.f29030k, this.f29032m, this.f29033p, 1);
            } else {
                this.f29028i = new AudioTrack(this.n, this.f29029j, this.f29030k, this.f29032m, this.f29033p, 1, this.Z);
            }
            int state = this.f29028i.getState();
            if (state == 1) {
                int audioSessionId = this.f29028i.getAudioSessionId();
                if (this.Z != audioSessionId) {
                    this.Z = audioSessionId;
                    u uVar = (u) this.f29023d;
                    uVar.f29055a.P.audioSessionId(audioSessionId);
                    uVar.f29055a.getClass();
                }
                this.f29026g.a(this.f29028i, e());
                i();
                this.f29020b0 = false;
                if (this.Y) {
                    f();
                }
            } else {
                try {
                    this.f29028i.release();
                } catch (Exception unused) {
                } catch (Throwable th2) {
                    this.f29028i = null;
                    throw th2;
                }
                this.f29028i = null;
                throw new n(state, this.f29029j, this.f29030k, this.f29033p);
            }
        }
        if (e()) {
            if (this.f29028i.getPlayState() == 2) {
                this.f29020b0 = false;
                return false;
            }
            if (this.f29028i.getPlayState() == 1 && this.f29026g.a() != 0) {
                return false;
            }
        }
        boolean z11 = this.f29020b0;
        boolean zC = c();
        this.f29020b0 = zC;
        if (z11 && !zC && this.f29028i.getPlayState() != 1) {
            long jElapsedRealtime = SystemClock.elapsedRealtime() - this.f29022c0;
            u uVar2 = (u) this.f29023d;
            uVar2.f29055a.P.audioTrackUnderrun(this.f29033p, com.fyber.inneractive.sdk.player.exoplayer2.b.a(this.f29034q), jElapsedRealtime);
            uVar2.f29055a.getClass();
        }
        if (this.S == null) {
            if (!byteBuffer.hasRemaining()) {
                return true;
            }
            if (this.o && this.K == 0) {
                int i11 = this.f29032m;
                if (i11 == 7 || i11 == 8) {
                    int iPosition = byteBuffer.position();
                    i5 = ((((byteBuffer.get(iPosition + 5) & 252) >> 2) | ((byteBuffer.get(iPosition + 4) & 1) << 6)) + 1) * 32;
                } else if (i11 == 5) {
                    i5 = 1536;
                } else if (i11 == 6) {
                    i5 = (((byteBuffer.get(byteBuffer.position() + 4) & 192) >> 6) != 3 ? a.f28976a[(byteBuffer.get(byteBuffer.position() + 4) & 48) >> 4] : 6) * 256;
                } else {
                    throw new IllegalStateException(com.fyber.inneractive.sdk.player.exoplayer2.m.a("Unexpected audio encoding: ", i11));
                }
                this.K = i5;
            }
            if (this.f29035r == null) {
                j12 = 1000000;
            } else {
                if (!a()) {
                    return false;
                }
                j12 = 1000000;
                this.f29027h.add(new p(this.f29035r, Math.max(0L, j11), (b() * 1000000) / this.f29029j));
                this.f29035r = null;
                h();
            }
            int i12 = this.L;
            if (i12 == 0) {
                this.M = Math.max(0L, j11);
                this.L = 1;
            } else {
                long j13 = (((this.o ? this.G : this.F / this.E) * j12) / this.f29029j) + this.M;
                if (i12 == 1 && Math.abs(j13 - j11) > 200000) {
                    StringBuilder sbU = c0.u(j13, "Discontinuity detected [expected ", ", got ");
                    sbU.append(j11);
                    sbU.append("]");
                    Log.e("AudioTrack", sbU.toString());
                    this.L = 2;
                }
                if (this.L == 2) {
                    this.M = (j11 - j13) + this.M;
                    this.L = 1;
                    u uVar3 = (u) this.f29023d;
                    uVar3.f29055a.getClass();
                    uVar3.f29055a.V = true;
                }
            }
            if (this.o) {
                this.G += this.K;
            } else {
                this.F += byteBuffer.remaining();
            }
            this.S = byteBuffer;
        }
        if (this.o) {
            b(this.S, j11);
        } else {
            a(j11);
        }
        if (this.S.hasRemaining()) {
            return false;
        }
        this.S = null;
        return true;
    }

    public final long b() {
        return this.o ? this.J : this.I / this.H;
    }

    public final void a(long j11) throws q {
        ByteBuffer byteBuffer;
        int length = this.Q.length;
        int i5 = length;
        while (i5 >= 0) {
            if (i5 > 0) {
                byteBuffer = this.R[i5 - 1];
            } else {
                byteBuffer = this.S;
                if (byteBuffer == null) {
                    byteBuffer = c.f28982a;
                }
            }
            if (i5 == length) {
                b(byteBuffer, j11);
            } else {
                c cVar = this.Q[i5];
                cVar.a(byteBuffer);
                ByteBuffer byteBufferA = cVar.a();
                this.R[i5] = byteBufferA;
                if (byteBufferA.hasRemaining()) {
                    i5++;
                }
            }
            if (byteBuffer.hasRemaining()) {
                return;
            } else {
                i5--;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0038  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0032 -> B:9:0x0012). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a() throws q {
        boolean z11;
        int i5;
        c[] cVarArr;
        if (this.W == -1) {
            this.W = this.o ? this.Q.length : 0;
            z11 = true;
            i5 = this.W;
            cVarArr = this.Q;
            if (i5 < cVarArr.length) {
                c cVar = cVarArr[i5];
                if (z11) {
                    cVar.b();
                }
                a(-9223372036854775807L);
                if (!cVar.c()) {
                    return false;
                }
                this.W++;
                z11 = true;
                i5 = this.W;
                cVarArr = this.Q;
                if (i5 < cVarArr.length) {
                    ByteBuffer byteBuffer = this.T;
                    if (byteBuffer != null) {
                        b(byteBuffer, -9223372036854775807L);
                        if (this.T != null) {
                            return false;
                        }
                    }
                    this.W = -1;
                    return true;
                }
            }
        } else {
            z11 = false;
            i5 = this.W;
            cVarArr = this.Q;
            if (i5 < cVarArr.length) {
            }
        }
    }

    public final com.fyber.inneractive.sdk.player.exoplayer2.s a(com.fyber.inneractive.sdk.player.exoplayer2.s sVar) {
        if (this.o) {
            com.fyber.inneractive.sdk.player.exoplayer2.s sVar2 = com.fyber.inneractive.sdk.player.exoplayer2.s.f30148d;
            this.f29036s = sVar2;
            return sVar2;
        }
        x xVar = this.f29019b;
        float f11 = sVar.f30149a;
        xVar.getClass();
        int i5 = z.f30489a;
        float fMax = Math.max(0.1f, Math.min(f11, 8.0f));
        xVar.f29087e = fMax;
        x xVar2 = this.f29019b;
        float f12 = sVar.f30150b;
        xVar2.getClass();
        xVar2.f29088f = Math.max(0.1f, Math.min(f12, 8.0f));
        com.fyber.inneractive.sdk.player.exoplayer2.s sVar3 = new com.fyber.inneractive.sdk.player.exoplayer2.s(fMax, f12);
        com.fyber.inneractive.sdk.player.exoplayer2.s sVar4 = this.f29035r;
        if (sVar4 == null) {
            if (!this.f29027h.isEmpty()) {
                sVar4 = ((p) this.f29027h.getLast()).f29014a;
            } else {
                sVar4 = this.f29036s;
            }
        }
        if (!sVar3.equals(sVar4)) {
            if (d()) {
                this.f29035r = sVar3;
            } else {
                this.f29036s = sVar3;
            }
        }
        return this.f29036s;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0230  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long a(boolean z11) {
        long j11;
        long j12;
        long jA;
        long jA2;
        long j13;
        if (!d() || this.L == 0) {
            return Long.MIN_VALUE;
        }
        long j14 = 1000;
        if (this.f29028i.getPlayState() == 3) {
            long jA3 = (this.f29026g.a() * 1000000) / r1.f29003c;
            if (jA3 == 0) {
                j11 = 1000;
            } else {
                long jNanoTime = System.nanoTime() / 1000;
                if (jNanoTime - this.A >= 30000) {
                    long[] jArr = this.f29025f;
                    int i5 = this.f29041x;
                    jArr[i5] = jA3 - jNanoTime;
                    this.f29041x = (i5 + 1) % 10;
                    int i11 = this.f29042y;
                    if (i11 < 10) {
                        this.f29042y = i11 + 1;
                    }
                    this.A = jNanoTime;
                    this.f29043z = 0L;
                    int i12 = 0;
                    while (true) {
                        int i13 = this.f29042y;
                        if (i12 >= i13) {
                            break;
                        }
                        this.f29043z = (this.f29025f[i12] / i13) + this.f29043z;
                        i12++;
                        j14 = j14;
                    }
                }
                j11 = j14;
                if (!e() && jNanoTime - this.C >= 500000) {
                    boolean zE = this.f29026g.e();
                    this.B = zE;
                    if (zE) {
                        j12 = 1000000;
                        long jC = this.f29026g.c() / j11;
                        j13 = 5000000;
                        long jB = this.f29026g.b();
                        if (jC < this.N) {
                            this.B = false;
                        } else if (Math.abs(jC - jNanoTime) > 5000000) {
                            StringBuilder sbU = c0.u(jB, "Spurious audio timestamp (system clock mismatch): ", ", ");
                            sbU.append(jC);
                            c0.B(sbU, ", ", jNanoTime, ", ");
                            sbU.append(jA3);
                            sbU.append(", ");
                            sbU.append(this.o ? this.G : this.F / this.E);
                            sbU.append(", ");
                            sbU.append(b());
                            Log.w("AudioTrack", sbU.toString());
                            this.B = false;
                        } else if (Math.abs(((jB * 1000000) / this.f29029j) - jA3) > 5000000) {
                            StringBuilder sbU2 = c0.u(jB, "Spurious audio timestamp (frame position mismatch): ", ", ");
                            sbU2.append(jC);
                            c0.B(sbU2, ", ", jNanoTime, ", ");
                            sbU2.append(jA3);
                            sbU2.append(", ");
                            sbU2.append(this.o ? this.G : this.F / this.E);
                            sbU2.append(", ");
                            sbU2.append(b());
                            Log.w("AudioTrack", sbU2.toString());
                            this.B = false;
                        }
                    } else {
                        j12 = 1000000;
                        j13 = 5000000;
                    }
                    if (this.D != null && !this.o) {
                        try {
                            long jIntValue = (((Integer) r1.invoke(this.f29028i, null)).intValue() * j11) - this.f29034q;
                            this.O = jIntValue;
                            long jMax = Math.max(jIntValue, 0L);
                            this.O = jMax;
                            if (jMax > j13) {
                                Log.w("AudioTrack", "Ignoring impossibly large audio latency: " + this.O);
                                this.O = 0L;
                            }
                        } catch (Exception unused) {
                            this.D = null;
                        }
                    }
                    this.C = jNanoTime;
                }
            }
            j12 = 1000000;
        }
        long jNanoTime2 = System.nanoTime() / j11;
        if (this.B) {
            jA = ((this.f29026g.b() + (((jNanoTime2 - (this.f29026g.c() / j11)) * this.f29029j) / j12)) * j12) / this.f29029j;
        } else {
            if (this.f29042y == 0) {
                jA = (this.f29026g.a() * j12) / r1.f29003c;
            } else {
                jA = jNanoTime2 + this.f29043z;
            }
            if (!z11) {
                jA -= this.O;
            }
        }
        long j15 = this.M;
        while (!this.f29027h.isEmpty() && jA >= ((p) this.f29027h.getFirst()).f29016c) {
            p pVar = (p) this.f29027h.remove();
            this.f29036s = pVar.f29014a;
            this.f29038u = pVar.f29016c;
            this.f29037t = pVar.f29015b - this.M;
        }
        if (this.f29036s.f30149a == 1.0f) {
            jA2 = (jA + this.f29037t) - this.f29038u;
        } else if (this.f29027h.isEmpty()) {
            x xVar = this.f29019b;
            long j16 = xVar.f29093k;
            if (j16 >= 1024) {
                jA2 = z.a(jA - this.f29038u, xVar.f29092j, j16) + this.f29037t;
            } else {
                jA2 = ((long) (this.f29036s.f30149a * (jA - this.f29038u))) + this.f29037t;
            }
        }
        return j15 + jA2;
    }
}
