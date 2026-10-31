package te;

import ke.l;
import ke.v;

/* loaded from: classes3.dex */
public abstract class i {

    /* renamed from: b, reason: collision with root package name */
    public v f89041b;

    /* renamed from: c, reason: collision with root package name */
    public l f89042c;

    /* renamed from: d, reason: collision with root package name */
    public g f89043d;

    /* renamed from: e, reason: collision with root package name */
    public long f89044e;

    /* renamed from: f, reason: collision with root package name */
    public long f89045f;

    /* renamed from: g, reason: collision with root package name */
    public long f89046g;

    /* renamed from: h, reason: collision with root package name */
    public int f89047h;

    /* renamed from: i, reason: collision with root package name */
    public int f89048i;

    /* renamed from: k, reason: collision with root package name */
    public long f89050k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f89051l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f89052m;

    /* renamed from: a, reason: collision with root package name */
    public final e f89040a = new e();

    /* renamed from: j, reason: collision with root package name */
    public og.i f89049j = new og.i((char) 0, 12);

    public void a(long j11) {
        this.f89046g = j11;
    }

    public abstract long b(com.google.android.gms.internal.consent_sdk.a aVar);

    public abstract boolean c(com.google.android.gms.internal.consent_sdk.a aVar, long j11, og.i iVar);

    public void d(boolean z11) {
        if (z11) {
            this.f89049j = new og.i((char) 0, 12);
            this.f89045f = 0L;
            this.f89047h = 0;
        } else {
            this.f89047h = 1;
        }
        this.f89044e = -1L;
        this.f89046g = 0L;
    }
}
