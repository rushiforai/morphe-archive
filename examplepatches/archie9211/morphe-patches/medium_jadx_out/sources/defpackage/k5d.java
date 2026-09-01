package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class k5d implements PointerInputEventHandler {
    public final /* synthetic */ sb2 a;
    public final /* synthetic */ ou b;
    public final /* synthetic */ float c;
    public final /* synthetic */ boc d;
    public final /* synthetic */ koc e;
    public final /* synthetic */ float f;
    public final /* synthetic */ ou g;

    public k5d(sb2 sb2Var, ou ouVar, float f, boc bocVar, koc kocVar, float f2, ou ouVar2) {
        this.a = sb2Var;
        this.b = ouVar;
        this.c = f;
        this.d = bocVar;
        this.e = kocVar;
        this.f = f2;
        this.g = ouVar2;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(vb9 vb9Var, n92 n92Var) {
        final sb2 sb2Var = this.a;
        final ou ouVar = this.b;
        final float f = this.c;
        final boc bocVar = this.d;
        final koc kocVar = this.e;
        final float f2 = this.f;
        final ou ouVar2 = this.g;
        Object objD = yk3.d(vb9Var, new iz2(10), new m45() { // from class: g5d
            @Override // defpackage.m45
            public final Object invoke() {
                vx0.c0(sb2Var, null, null, new i5d(ouVar, f, bocVar, kocVar, f2, ouVar2, null), 3);
                return c1e.a;
            }
        }, new i16(sb2Var, ouVar, ouVar2, 28), new h5d(sb2Var, ouVar, ouVar2, 0), n92Var);
        return objD == tb2.COROUTINE_SUSPENDED ? objD : c1e.a;
    }
}
