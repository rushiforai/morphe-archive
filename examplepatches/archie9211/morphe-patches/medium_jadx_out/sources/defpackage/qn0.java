package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qn0 implements on0 {
    public final uk6 a;
    public float b = -1.0f;

    public qn0(List list) {
        this.a = (uk6) list.get(0);
    }

    @Override // defpackage.on0
    public final boolean b(float f) {
        if (this.b == f) {
            return true;
        }
        this.b = f;
        return false;
    }

    @Override // defpackage.on0
    public final uk6 d() {
        return this.a;
    }

    @Override // defpackage.on0
    public final boolean h(float f) {
        return !this.a.c();
    }

    @Override // defpackage.on0
    public final boolean isEmpty() {
        return false;
    }

    @Override // defpackage.on0
    public final float m() {
        return this.a.a();
    }

    @Override // defpackage.on0
    public final float o() {
        return this.a.b();
    }
}
