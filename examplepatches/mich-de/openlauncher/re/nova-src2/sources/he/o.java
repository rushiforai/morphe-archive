package he;

import android.media.AudioTrack;
import android.os.SystemClock;
import java.lang.reflect.Method;

/* loaded from: classes3.dex */
public final class o {
    public long A;
    public long B;
    public long C;
    public boolean D;
    public long E;
    public long F;

    /* renamed from: a, reason: collision with root package name */
    public final gu.j f59757a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f59758b;

    /* renamed from: c, reason: collision with root package name */
    public AudioTrack f59759c;

    /* renamed from: d, reason: collision with root package name */
    public int f59760d;

    /* renamed from: e, reason: collision with root package name */
    public int f59761e;

    /* renamed from: f, reason: collision with root package name */
    public n f59762f;

    /* renamed from: g, reason: collision with root package name */
    public int f59763g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f59764h;

    /* renamed from: i, reason: collision with root package name */
    public long f59765i;

    /* renamed from: j, reason: collision with root package name */
    public float f59766j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f59767k;

    /* renamed from: l, reason: collision with root package name */
    public long f59768l;

    /* renamed from: m, reason: collision with root package name */
    public long f59769m;
    public Method n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f59770p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f59771q;

    /* renamed from: r, reason: collision with root package name */
    public long f59772r;

    /* renamed from: s, reason: collision with root package name */
    public long f59773s;

    /* renamed from: t, reason: collision with root package name */
    public long f59774t;

    /* renamed from: u, reason: collision with root package name */
    public long f59775u;

    /* renamed from: v, reason: collision with root package name */
    public int f59776v;

    /* renamed from: w, reason: collision with root package name */
    public int f59777w;

    /* renamed from: x, reason: collision with root package name */
    public long f59778x;

    /* renamed from: y, reason: collision with root package name */
    public long f59779y;

    /* renamed from: z, reason: collision with root package name */
    public long f59780z;

    public o(gu.j jVar) {
        this.f59757a = jVar;
        if (wf.v.f94376a >= 18) {
            try {
                this.n = AudioTrack.class.getMethod("getLatency", null);
            } catch (NoSuchMethodException unused) {
            }
        }
        this.f59758b = new long[10];
    }

    public final long a() {
        AudioTrack audioTrack = this.f59759c;
        audioTrack.getClass();
        if (this.f59778x != -9223372036854775807L) {
            return Math.min(this.A, this.f59780z + ((((SystemClock.elapsedRealtime() * 1000) - this.f59778x) * this.f59763g) / 1000000));
        }
        int playState = audioTrack.getPlayState();
        if (playState == 1) {
            return 0L;
        }
        long playbackHeadPosition = audioTrack.getPlaybackHeadPosition() & 4294967295L;
        if (this.f59764h) {
            if (playState == 2 && playbackHeadPosition == 0) {
                this.f59775u = this.f59773s;
            }
            playbackHeadPosition += this.f59775u;
        }
        if (wf.v.f94376a <= 29) {
            if (playbackHeadPosition == 0 && this.f59773s > 0 && playState == 3) {
                if (this.f59779y == -9223372036854775807L) {
                    this.f59779y = SystemClock.elapsedRealtime();
                }
                return this.f59773s;
            }
            this.f59779y = -9223372036854775807L;
        }
        if (this.f59773s > playbackHeadPosition) {
            this.f59774t++;
        }
        this.f59773s = playbackHeadPosition;
        return playbackHeadPosition + (this.f59774t << 32);
    }

    public final boolean b(long j11) {
        if (j11 > a()) {
            return true;
        }
        if (!this.f59764h) {
            return false;
        }
        AudioTrack audioTrack = this.f59759c;
        audioTrack.getClass();
        return audioTrack.getPlayState() == 2 && a() == 0;
    }
}
