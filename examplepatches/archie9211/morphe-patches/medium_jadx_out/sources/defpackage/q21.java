package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q21 extends l21 implements Iterable {
    @Override // defpackage.l21
    /* JADX INFO: renamed from: K, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public final q21 clone() {
        return (q21) super.clone();
    }

    @Override // defpackage.l21, defpackage.m21
    /* JADX INFO: renamed from: clone */
    public final Object d() {
        return (q21) super.clone();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        p21 p21Var = new p21();
        p21Var.b = 0;
        p21Var.a = this;
        return p21Var;
    }
}
