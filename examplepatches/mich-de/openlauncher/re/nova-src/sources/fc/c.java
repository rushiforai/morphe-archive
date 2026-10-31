package fc;

import java.util.HashMap;
import java.util.HashSet;

/* loaded from: classes2.dex */
public abstract class c {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f54591dj;
    private boolean fby;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f54595lt;
    private e lud;
    private final String sya;

    /* renamed from: ul, reason: collision with root package name */
    private b f54596ul;
    private final HashMap<Class<? extends h>, i> ycx = new HashMap<>();

    /* renamed from: zb, reason: collision with root package name */
    private final HashSet<String> f54597zb = new HashSet<>();

    /* renamed from: jw, reason: collision with root package name */
    private long f54594jw = 3000;

    /* renamed from: jc, reason: collision with root package name */
    private int f54593jc = 2;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f54592ea = false;

    public c(String str) {
        this.sya = str;
    }

    public final e dj() {
        return this.lud;
    }

    public int fby() {
        return this.f54593jc;
    }

    public boolean jw() {
        return this.f54592ea;
    }

    public final boolean lt() {
        return this.f54595lt;
    }

    public final HashMap<Class<? extends h>, i> lud() {
        return this.ycx;
    }

    public final String sya() {
        return this.sya;
    }

    public long ul() {
        return this.f54594jw;
    }

    public final c ycx(b bVar) {
        if (this.f54591dj) {
            return this;
        }
        this.f54596ul = bVar;
        return this;
    }

    public abstract boolean ycx();

    public b zb() {
        return this.f54596ul;
    }

    public void dj(boolean z11) {
        if (this.f54591dj) {
            return;
        }
        this.f54592ea = z11;
    }

    public final c sya(boolean z11) {
        if (this.f54591dj) {
            return this;
        }
        this.fby = z11;
        return this;
    }

    public final void zb(boolean z11) {
        this.f54591dj = z11;
    }

    public final c ycx(e eVar) {
        if (this.f54591dj) {
            return this;
        }
        this.lud = eVar;
        return this;
    }

    public final c ycx(Class<? extends h> cls, i iVar) {
        if (!this.f54591dj && cls != null && iVar != null) {
            String strDj = iVar.dj();
            if (!this.f54597zb.contains(strDj)) {
                this.f54597zb.add(strDj);
                this.ycx.put(cls, iVar);
            }
        }
        return this;
    }

    public final c ycx(boolean z11) {
        if (this.f54591dj) {
            return this;
        }
        this.f54595lt = z11;
        return this;
    }

    public c ycx(long j11) {
        if (this.f54591dj) {
            return this;
        }
        this.f54594jw = j11;
        return this;
    }

    public c ycx(int i5) {
        if (this.f54591dj) {
            return this;
        }
        this.f54593jc = i5;
        return this;
    }
}
