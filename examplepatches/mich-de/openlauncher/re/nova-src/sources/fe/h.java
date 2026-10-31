package fe;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final vf.m f54800a;

    /* renamed from: b, reason: collision with root package name */
    public final long f54801b;

    /* renamed from: c, reason: collision with root package name */
    public final long f54802c;

    /* renamed from: d, reason: collision with root package name */
    public final long f54803d;

    /* renamed from: e, reason: collision with root package name */
    public final long f54804e;

    /* renamed from: f, reason: collision with root package name */
    public final int f54805f;

    /* renamed from: g, reason: collision with root package name */
    public final long f54806g;

    /* renamed from: h, reason: collision with root package name */
    public int f54807h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f54808i;

    public h() {
        vf.m mVar = new vf.m();
        a(2500, 0, "bufferForPlaybackMs", "0");
        a(5000, 0, "bufferForPlaybackAfterRebufferMs", "0");
        a(50000, 2500, "minBufferMs", "bufferForPlaybackMs");
        a(50000, 5000, "minBufferMs", "bufferForPlaybackAfterRebufferMs");
        a(50000, 50000, "maxBufferMs", "minBufferMs");
        a(0, 0, "backBufferDurationMs", "0");
        this.f54800a = mVar;
        long j11 = 50000;
        this.f54801b = wf.v.y(j11);
        this.f54802c = wf.v.y(j11);
        this.f54803d = wf.v.y(2500);
        this.f54804e = wf.v.y(5000);
        this.f54805f = -1;
        this.f54807h = 13107200;
        this.f54806g = wf.v.y(0);
    }

    public static void a(int i5, int i11, String str, String str2) {
        wf.a.d(str + " cannot be less than " + str2, i5 >= i11);
    }

    public final void b(boolean z11) {
        int i5 = this.f54805f;
        if (i5 == -1) {
            i5 = 13107200;
        }
        this.f54807h = i5;
        this.f54808i = false;
        if (z11) {
            vf.m mVar = this.f54800a;
            synchronized (mVar) {
                if (mVar.f92698a) {
                    mVar.a(0);
                }
            }
        }
    }

    public final boolean c(float f11, long j11) {
        int i5;
        long j12 = this.f54802c;
        vf.m mVar = this.f54800a;
        synchronized (mVar) {
            i5 = mVar.f92701d * mVar.f92699b;
        }
        boolean z11 = i5 >= this.f54807h;
        long jMin = this.f54801b;
        if (f11 > 1.0f) {
            jMin = Math.min(wf.v.n(f11, jMin), j12);
        }
        if (j11 < Math.max(jMin, 500000L)) {
            this.f54808i = !z11;
            if (z11 && j11 < 500000) {
                wf.a.D("DefaultLoadControl", "Target buffer size reached with less than 500ms of buffered media data.");
            }
        } else if (j11 >= j12 || z11) {
            this.f54808i = false;
        }
        return this.f54808i;
    }
}
