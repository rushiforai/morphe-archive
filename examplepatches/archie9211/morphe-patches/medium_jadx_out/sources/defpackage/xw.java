package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xw implements upc {
    public final hud a;
    public final k49 b;
    public dx c;
    public long d;
    public long e;
    public boolean f;

    public xw(hud hudVar, Object obj, dx dxVar, long j, long j2, boolean z) {
        dx dxVarM0;
        this.a = hudVar;
        this.b = qo7.u(obj);
        if (dxVar != null) {
            dxVarM0 = nk7.m0(dxVar);
        } else {
            dxVarM0 = (dx) hudVar.a.invoke(obj);
            dxVarM0.d();
        }
        this.c = dxVarM0;
        this.d = j;
        this.e = j2;
        this.f = z;
    }

    public final Object c() {
        return this.a.b.invoke(this.c);
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return this.b.getValue();
    }

    public final String toString() {
        return "AnimationState(value=" + this.b.getValue() + ", velocity=" + c() + ", isRunning=" + this.f + ", lastFrameTimeNanos=" + this.d + ", finishedTimeNanos=" + this.e + ')';
    }

    public /* synthetic */ xw(hud hudVar, Object obj, dx dxVar, int i) {
        this(hudVar, obj, (i & 4) != 0 ? null : dxVar, Long.MIN_VALUE, Long.MIN_VALUE, false);
    }
}
