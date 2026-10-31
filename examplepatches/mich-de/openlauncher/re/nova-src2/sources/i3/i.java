package i3;

import b3.t1;
import j3.q;
import y3.l;
import z2.y;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final q f61241a;

    /* renamed from: b, reason: collision with root package name */
    public final int f61242b;

    /* renamed from: c, reason: collision with root package name */
    public final l f61243c;

    /* renamed from: d, reason: collision with root package name */
    public final t1 f61244d;

    public i(q qVar, int i5, l lVar, t1 t1Var) {
        this.f61241a = qVar;
        this.f61242b = i5;
        this.f61243c = lVar;
        this.f61244d = t1Var;
    }

    public final y a() {
        return this.f61244d;
    }

    public final q b() {
        return this.f61241a;
    }

    public final l c() {
        return this.f61243c;
    }

    public final String toString() {
        return "ScrollCaptureCandidate(node=" + this.f61241a + ", depth=" + this.f61242b + ", viewportBoundsInWindow=" + this.f61243c + ", coordinates=" + this.f61244d + ')';
    }
}
