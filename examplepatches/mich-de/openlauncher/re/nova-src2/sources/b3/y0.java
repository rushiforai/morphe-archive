package b3;

import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.Owner;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class y0 extends z2.i1 implements k1, z2.t0 {

    /* renamed from: f, reason: collision with root package name */
    public v0 f17402f;

    /* renamed from: g, reason: collision with root package name */
    public Function1 f17403g;

    /* renamed from: h, reason: collision with root package name */
    public k2 f17404h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f17405i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f17406j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f17407k;

    /* renamed from: l, reason: collision with root package name */
    public final z2.o0 f17408l = new z2.o0(this, 0);

    /* renamed from: m, reason: collision with root package name */
    public o2 f17409m;
    public z.o0 n;

    public static void i0(t1 t1Var) {
        q0 q0Var;
        t1 t1Var2 = t1Var.f17359p;
        LayoutNode layoutNode = t1Var.o;
        if (!Intrinsics.b(t1Var2 != null ? t1Var2.o : null, layoutNode)) {
            layoutNode.getLayoutDelegate().f17357p.f17256y.g();
            return;
        }
        c cVarF = layoutNode.getLayoutDelegate().f17357p.f();
        if (cVarF == null || (q0Var = ((i1) cVarF).f17256y) == null) {
            return;
        }
        q0Var.g();
    }

    @Override // z2.t0
    public final z2.s0 K(int i5, int i11, Map map, Function1 function1, Function1 function12) {
        if ((i5 & (-16777216)) != 0 || ((-16777216) & i11) != 0) {
            y2.a.b("Size(" + i5 + " x " + i11 + ") is out of range. Each dimension must be between 0 and 16777215.");
        }
        return new x0(i5, i11, map, function1, function12, this);
    }

    @Override // z2.i1
    public final int O(z2.n nVar) {
        int iX;
        if (c0() && (iX = X(nVar)) != Integer.MIN_VALUE) {
            return iX + ((int) (this.f98085e & 4294967295L));
        }
        return Integer.MIN_VALUE;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0108  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void W(LayoutNode layoutNode, z2.p pVar) {
        char c11;
        long j11;
        long j12;
        long j13;
        long[] jArr;
        long[] jArr2;
        long j14;
        int i5;
        char c12;
        long j15;
        long j16;
        int i11;
        int i12;
        int i13;
        z.o0 o0Var = this.n;
        char c13 = 7;
        long j17 = -9187201950435737472L;
        int i14 = 8;
        if (o0Var != null) {
            Object[] objArr = o0Var.f97868c;
            long[] jArr3 = o0Var.f97866a;
            int length = jArr3.length - 2;
            if (length >= 0) {
                int i15 = 0;
                long j18 = 128;
                while (true) {
                    long j19 = jArr3[i15];
                    j12 = 255;
                    if ((((~j19) << c13) & j19 & j17) != j17) {
                        int i16 = 8 - ((~(i15 - length)) >>> 31);
                        int i17 = 0;
                        while (i17 < i16) {
                            if ((j19 & 255) < j18) {
                                c12 = c13;
                                z.p0 p0Var = (z.p0) objArr[(i15 << 3) + i17];
                                j15 = j17;
                                Object[] objArr2 = p0Var.f97741b;
                                long[] jArr4 = p0Var.f97740a;
                                int length2 = jArr4.length - 2;
                                if (length2 >= 0) {
                                    j16 = j18;
                                    int i18 = 0;
                                    int i19 = i14;
                                    while (true) {
                                        int i21 = length2;
                                        long j21 = jArr4[i18];
                                        jArr2 = jArr3;
                                        j14 = j19;
                                        if ((((~j21) << c12) & j21 & j15) != j15) {
                                            int i22 = 8 - ((~(i18 - i21)) >>> 31);
                                            int i23 = 0;
                                            while (i23 < i22) {
                                                if ((j21 & 255) < j16) {
                                                    int i24 = (i18 << 3) + i23;
                                                    LayoutNode layoutNode2 = (LayoutNode) ((v2) objArr2[i24]).get();
                                                    i12 = i23;
                                                    if (layoutNode2 != null) {
                                                        boolean zIsAttached = layoutNode2.isAttached();
                                                        i13 = i17;
                                                        if (zIsAttached) {
                                                        }
                                                    } else {
                                                        i13 = i17;
                                                    }
                                                    p0Var.m(i24);
                                                } else {
                                                    i12 = i23;
                                                    i13 = i17;
                                                }
                                                j21 >>= i19;
                                                i23 = i12 + 1;
                                                i17 = i13;
                                            }
                                            i5 = i17;
                                            if (i22 != i19) {
                                                break;
                                            }
                                        } else {
                                            i5 = i17;
                                        }
                                        length2 = i21;
                                        if (i18 == length2) {
                                            break;
                                        }
                                        i18++;
                                        jArr3 = jArr2;
                                        j19 = j14;
                                        i17 = i5;
                                        i19 = 8;
                                    }
                                } else {
                                    jArr2 = jArr3;
                                    j14 = j19;
                                    i5 = i17;
                                    j16 = j18;
                                }
                                i11 = 8;
                            } else {
                                jArr2 = jArr3;
                                j14 = j19;
                                i5 = i17;
                                c12 = c13;
                                j15 = j17;
                                j16 = j18;
                                i11 = i14;
                            }
                            i14 = i11;
                            j19 = j14 >> i11;
                            c13 = c12;
                            j17 = j15;
                            j18 = j16;
                            i17 = i5 + 1;
                            jArr3 = jArr2;
                        }
                        jArr = jArr3;
                        c11 = c13;
                        j11 = j17;
                        j13 = j18;
                        if (i16 != i14) {
                            break;
                        }
                    } else {
                        jArr = jArr3;
                        c11 = c13;
                        j11 = j17;
                        j13 = j18;
                    }
                    if (i15 == length) {
                        break;
                    }
                    i15++;
                    c13 = c11;
                    j17 = j11;
                    j18 = j13;
                    jArr3 = jArr;
                    i14 = 8;
                }
            } else {
                c11 = 7;
                j11 = -9187201950435737472L;
                j12 = 255;
                j13 = 128;
            }
        }
        z.o0 o0Var2 = this.n;
        if (o0Var2 != null) {
            long[] jArr5 = o0Var2.f97866a;
            int length3 = jArr5.length - 2;
            if (length3 >= 0) {
                int i25 = 0;
                while (true) {
                    long j22 = jArr5[i25];
                    if ((((~j22) << c11) & j22 & j11) != j11) {
                        int i26 = 8 - ((~(i25 - length3)) >>> 31);
                        for (int i27 = 0; i27 < i26; i27++) {
                            if ((j22 & j12) < j13) {
                                int i28 = (i25 << 3) + i27;
                                if (((z.p0) o0Var2.f97868c[i28]).b()) {
                                    o0Var2.l(i28);
                                }
                            }
                            j22 >>= 8;
                        }
                        if (i26 != 8) {
                            break;
                        }
                    }
                    if (i25 == length3) {
                        break;
                    } else {
                        i25++;
                    }
                }
            }
        }
        z.o0 o0Var3 = this.n;
        if (o0Var3 == null) {
            o0Var3 = new z.o0();
            this.n = o0Var3;
        }
        Object objD = o0Var3.d(pVar);
        if (objD == null) {
            objD = new z.p0();
            o0Var3.m(pVar, objD);
        }
        ((z.p0) objD).j(new v2(layoutNode));
    }

    public abstract int X(z2.n nVar);

    public final void Y(k2 k2Var, long j11, long j12) {
        i2 snapshotObserver;
        z.o0 o0Var = this.n;
        o2 o2Var = this.f17409m;
        if (o2Var == null) {
            o2Var = new o2(0);
            this.f17409m = o2Var;
        }
        Owner owner = d0().getOwner();
        if (owner != null && (snapshotObserver = owner.getSnapshotObserver()) != null) {
            snapshotObserver.a(k2Var, f.f17202l, new w0(this, j11, j12, k2Var));
        }
        o2Var.c(l(), this, o0Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void Z(z2.s0 s0Var) {
        long j11;
        long j12;
        z.o0 o0Var = this.n;
        if (!this.f17407k) {
            Function1 function1C = s0Var.c();
            if (function1C != null) {
                boolean z11 = this.f17403g != function1C;
                if (z11 || !h0().a()) {
                    j11 = 0;
                    j12 = 9223372034707292159L;
                } else {
                    z2.y yVarB0 = b0();
                    long jN = w.b.n(yVarB0.mo107localToScreenMKHz9U(0L));
                    long jG = yVarB0.g();
                    j12 = jN;
                    j11 = jG;
                    z11 = (y3.k.b(jN, h0().b()) && y3.m.a(jG, h0().f())) ? false : true;
                }
                if (z11) {
                    k2 k2Var = this.f17404h;
                    if (k2Var != null) {
                        k2Var.f17279a = s0Var;
                    } else {
                        k2Var = new k2(s0Var, this);
                        this.f17404h = k2Var;
                    }
                    Y(k2Var, j12, j11);
                    this.f17403g = s0Var.c();
                }
            } else if (o0Var != null) {
                Object[] objArr = o0Var.f97868c;
                long[] jArr = o0Var.f97866a;
                int length = jArr.length - 2;
                if (length >= 0) {
                    int i5 = 0;
                    while (true) {
                        long j13 = jArr[i5];
                        if ((((~j13) << 7) & j13 & (-9187201950435737472L)) != -9187201950435737472L) {
                            int i11 = 8 - ((~(i5 - length)) >>> 31);
                            for (int i12 = 0; i12 < i11; i12++) {
                                if ((255 & j13) < 128) {
                                    j0((z.p0) objArr[(i5 << 3) + i12]);
                                }
                                j13 >>= 8;
                            }
                            if (i11 != 8) {
                                break;
                            } else if (i5 == length) {
                                break;
                            } else {
                                i5++;
                            }
                        }
                    }
                }
                o0Var.g();
            }
        }
    }

    public abstract y0 a0();

    public abstract z2.y b0();

    public abstract boolean c0();

    public abstract LayoutNode d0();

    public abstract z2.s0 e0();

    public abstract y0 f0();

    public abstract long g0();

    public final v0 h0() {
        v0 v0Var = this.f17402f;
        if (v0Var != null) {
            return v0Var;
        }
        v0 v0Var2 = new v0(this);
        this.f17402f = v0Var2;
        return v0Var2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void j0(z.p0 p0Var) {
        LayoutNode layoutNode;
        Object[] objArr = p0Var.f97741b;
        long[] jArr = p0Var.f97740a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i5 = 0;
        while (true) {
            long j11 = jArr[i5];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i11 = 8 - ((~(i5 - length)) >>> 31);
                for (int i12 = 0; i12 < i11; i12++) {
                    if ((255 & j11) < 128 && (layoutNode = (LayoutNode) ((v2) objArr[(i5 << 3) + i12]).get()) != null) {
                        if (l()) {
                            layoutNode.requestLookaheadRelayout$ui_release(false);
                        } else {
                            layoutNode.requestRelayout$ui_release(false);
                        }
                    }
                    j11 >>= 8;
                }
                if (i11 != 8) {
                    return;
                }
            }
            if (i5 == length) {
                return;
            } else {
                i5++;
            }
        }
    }

    public abstract void k0();

    @Override // z2.t
    public boolean l() {
        return false;
    }

    @Override // b3.k1
    public final void n(boolean z11) {
        y0 y0VarF0 = f0();
        LayoutNode layoutNodeD0 = y0VarF0 != null ? y0VarF0.d0() : null;
        if (Intrinsics.b(layoutNodeD0, d0())) {
            this.f17405i = z11;
            return;
        }
        if ((layoutNodeD0 != null ? layoutNodeD0.getLayoutState$ui_release() : null) != l0.f17283c) {
            if ((layoutNodeD0 != null ? layoutNodeD0.getLayoutState$ui_release() : null) != l0.f17284d) {
                return;
            }
        }
        this.f17405i = z11;
    }
}
