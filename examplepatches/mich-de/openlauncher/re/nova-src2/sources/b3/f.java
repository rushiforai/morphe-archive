package b3;

import androidx.compose.ui.node.BackwardsCompatNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.Owner;
import androidx.compose.ui.platform.AndroidComposeView;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class f extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final f f17201k;

    /* renamed from: l, reason: collision with root package name */
    public static final f f17202l;

    /* renamed from: m, reason: collision with root package name */
    public static final f f17203m;
    public static final f n;
    public static final f o;

    /* renamed from: p, reason: collision with root package name */
    public static final f f17204p;

    /* renamed from: q, reason: collision with root package name */
    public static final f f17205q;

    /* renamed from: r, reason: collision with root package name */
    public static final f f17206r;

    /* renamed from: s, reason: collision with root package name */
    public static final f f17207s;

    /* renamed from: t, reason: collision with root package name */
    public static final f f17208t;

    /* renamed from: u, reason: collision with root package name */
    public static final f f17209u;

    /* renamed from: v, reason: collision with root package name */
    public static final f f17210v;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17211j;

    static {
        int i5 = 1;
        f17201k = new f(i5, 0);
        f17202l = new f(i5, 1);
        f17203m = new f(i5, 2);
        n = new f(i5, 3);
        o = new f(i5, 4);
        f17204p = new f(i5, 5);
        f17205q = new f(i5, 6);
        f17206r = new f(i5, 7);
        f17207s = new f(i5, 8);
        f17208t = new f(i5, 9);
        f17209u = new f(i5, 10);
        f17210v = new f(i5, 11);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ f(int i5, int i11) {
        super(i5);
        this.f17211j = i11;
    }

    /* JADX WARN: Removed duplicated region for block: B:96:0x0172  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        switch (this.f17211j) {
            case 0:
                ((BackwardsCompatNode) obj).updateModifierLocalConsumer();
                break;
            case 1:
                k2 k2Var = (k2) obj;
                if (k2Var.isValidOwnerScope()) {
                    y0 y0Var = k2Var.f17280b;
                    if (!y0Var.f17407k) {
                        Function1 function1C = k2Var.f17279a.c();
                        z.o0 o0Var = y0Var.n;
                        if (function1C != null) {
                            y0Var.Y(k2Var, 9223372034707292159L, 0L);
                            y0Var.f17403g = function1C;
                        } else if (o0Var != null) {
                            Object[] objArr = o0Var.f97868c;
                            long[] jArr = o0Var.f97866a;
                            int length = jArr.length - 2;
                            if (length >= 0) {
                                int i5 = 0;
                                while (true) {
                                    long j11 = jArr[i5];
                                    if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                        int i11 = 8 - ((~(i5 - length)) >>> 31);
                                        for (int i12 = 0; i12 < i11; i12++) {
                                            if ((255 & j11) < 128) {
                                                y0Var.j0((z.p0) objArr[(i5 << 3) + i12]);
                                            }
                                            j11 >>= 8;
                                        }
                                        if (i11 == 8) {
                                            if (i5 != length) {
                                                i5++;
                                            }
                                        }
                                    }
                                }
                            }
                            o0Var.g();
                        }
                    }
                }
                break;
            case 2:
                c3.j2 j2Var = ((t1) obj).I;
                if (j2Var != null) {
                    AndroidComposeView androidComposeView = j2Var.f19352c;
                    if (!j2Var.f19359j && !j2Var.f19356g) {
                        androidComposeView.invalidate();
                        if (true != j2Var.f19359j) {
                            j2Var.f19359j = true;
                            androidComposeView.notifyLayerIsDirty$ui_release(j2Var, true);
                        }
                    }
                }
                break;
            case 3:
                t1 t1Var = (t1) obj;
                if (t1Var.isValidOwnerScope() && t1Var.W0(true)) {
                    LayoutNode layoutNode = t1Var.o;
                    t0 layoutDelegate = layoutNode.getLayoutDelegate();
                    if (layoutDelegate.f17355l > 0) {
                        if (layoutDelegate.f17354k || layoutDelegate.f17353j) {
                            LayoutNode.requestRelayout$ui_release$default(layoutNode, false, 1, null);
                        }
                        layoutDelegate.f17357p.Z();
                    }
                    layoutNode.onCoordinatorPositionChanged$ui_release();
                    Owner ownerA = s0.a(layoutNode);
                    k3.a rectManager = ownerA.getRectManager();
                    if (t1Var == layoutNode.getOuterCoordinator$ui_release()) {
                        rectManager.g(layoutNode, false);
                        rectManager.e(layoutNode);
                    } else {
                        rectManager.f(layoutNode);
                    }
                    if (layoutNode.getGloballyPositionedObservers() > 0) {
                        ownerA.requestOnPositionedCallback(layoutNode);
                    }
                }
                break;
            case 4:
                a2 a2Var = (a2) obj;
                if (a2Var.isValidOwnerScope()) {
                    a2Var.f17150a.k();
                }
                break;
            case 5:
                LayoutNode layoutNode2 = (LayoutNode) obj;
                if (layoutNode2.isValidOwnerScope()) {
                    LayoutNode.requestRelayout$ui_release$default(layoutNode2, false, 1, null);
                }
                break;
            case 6:
                LayoutNode layoutNode3 = (LayoutNode) obj;
                if (layoutNode3.isValidOwnerScope()) {
                    LayoutNode.requestRelayout$ui_release$default(layoutNode3, false, 1, null);
                }
                break;
            case 7:
                LayoutNode layoutNode4 = (LayoutNode) obj;
                if (layoutNode4.isValidOwnerScope()) {
                    LayoutNode.requestLookaheadRelayout$ui_release$default(layoutNode4, false, 1, null);
                }
                break;
            case 8:
                LayoutNode layoutNode5 = (LayoutNode) obj;
                if (layoutNode5.isValidOwnerScope()) {
                    LayoutNode.requestLookaheadRelayout$ui_release$default(layoutNode5, false, 1, null);
                }
                break;
            case 9:
                LayoutNode layoutNode6 = (LayoutNode) obj;
                if (layoutNode6.isValidOwnerScope()) {
                    LayoutNode.requestLookaheadRemeasure$ui_release$default(layoutNode6, false, false, false, 7, null);
                }
                break;
            case 10:
                LayoutNode layoutNode7 = (LayoutNode) obj;
                if (layoutNode7.isValidOwnerScope()) {
                    LayoutNode.requestRemeasure$ui_release$default(layoutNode7, false, false, false, 7, null);
                }
                break;
            default:
                LayoutNode layoutNode8 = (LayoutNode) obj;
                if (layoutNode8.isValidOwnerScope()) {
                    layoutNode8.invalidateSemantics$ui_release();
                }
                break;
        }
        return Unit.f71706a;
    }
}
