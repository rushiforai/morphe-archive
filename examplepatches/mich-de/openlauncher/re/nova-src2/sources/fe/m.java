package fe;

import android.content.Context;
import android.os.Looper;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final Context f54908a;

    /* renamed from: b, reason: collision with root package name */
    public final wf.q f54909b;

    /* renamed from: c, reason: collision with root package name */
    public final k f54910c;

    /* renamed from: d, reason: collision with root package name */
    public final k f54911d;

    /* renamed from: e, reason: collision with root package name */
    public final k f54912e;

    /* renamed from: f, reason: collision with root package name */
    public final k f54913f;

    /* renamed from: g, reason: collision with root package name */
    public Looper f54914g;

    /* renamed from: h, reason: collision with root package name */
    public final he.d f54915h;

    /* renamed from: i, reason: collision with root package name */
    public final int f54916i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f54917j;

    /* renamed from: k, reason: collision with root package name */
    public final s1 f54918k;

    /* renamed from: l, reason: collision with root package name */
    public final long f54919l;

    /* renamed from: m, reason: collision with root package name */
    public final long f54920m;
    public final g n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final long f54921p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f54922q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f54923r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f54924s;

    public m(Context context) {
        k kVar = new k(context, 0);
        k kVar2 = new k(context, 1);
        k kVar3 = new k(context, 2);
        k kVar4 = new k(context, 3);
        context.getClass();
        this.f54908a = context;
        this.f54910c = kVar;
        this.f54911d = kVar2;
        this.f54912e = kVar3;
        this.f54913f = kVar4;
        int i5 = wf.v.f94376a;
        Looper looperMyLooper = Looper.myLooper();
        this.f54914g = looperMyLooper == null ? Looper.getMainLooper() : looperMyLooper;
        this.f54915h = he.d.f59672g;
        this.f54916i = 1;
        this.f54917j = true;
        this.f54918k = s1.f54985c;
        this.f54919l = 5000L;
        this.f54920m = 15000L;
        this.n = new g(wf.v.y(20L), wf.v.y(500L));
        this.f54909b = wf.q.f94367a;
        this.o = 500L;
        this.f54921p = 2000L;
        this.f54923r = true;
    }
}
