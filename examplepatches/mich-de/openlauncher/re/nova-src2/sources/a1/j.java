package a1;

import android.view.ActionMode;
import android.view.View;
import b00.z0;
import c4.b0;
import c4.d0;
import dx.i0;
import dx.w;
import e1.a1;
import h6.y0;
import kotlin.jvm.functions.Function0;
import l1.k2;
import l1.v3;
import n0.a0;
import n0.j0;
import p1.k0;
import p1.s2;
import p10.o0;
import qx.w0;
import t70.q1;
import t70.r1;
import tx.q4;
import z1.v;

/* loaded from: classes2.dex */
public final class j implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f100a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f101b;

    public /* synthetic */ j(Object obj, int i5) {
        this.f100a = i5;
        this.f101b = obj;
    }

    @Override // p1.k0
    public final void dispose() {
        r1 r1Var;
        switch (this.f100a) {
            case 0:
                b bVar = (b) ((s2) ((d) this.f101b).f83c).getValue();
                if (bVar != null) {
                    bVar.close();
                    break;
                }
                break;
            case 1:
                o0 o0Var = (o0) this.f101b;
                if (o0Var != null && (r1Var = (r1) o0Var.f81861e.f96790a.get(q1.f88853a)) != null) {
                    r1Var.c(null);
                    break;
                }
                break;
            case 2:
                b0 b0Var = (b0) this.f101b;
                b0Var.dismiss();
                b0Var.f19560g.disposeComposition();
                break;
            case 3:
                d0 d0Var = (d0) this.f101b;
                d0Var.disposeComposition();
                y0.f(d0Var, null);
                d0Var.f19579e.removeViewImmediate(d0Var);
                break;
            case 4:
                ((i0) this.f101b).a();
                break;
            case 5:
                ((w0) this.f101b).i("mediation_test_harnesslive_test_slot");
                break;
            case 6:
                ((h.f) this.f101b).remove();
                break;
            case 7:
                ((h.n) this.f101b).remove();
                break;
            case 8:
                ((w) this.f101b).f49816j.invoke();
                break;
            case 9:
                ((Function0) this.f101b).invoke();
                break;
            case 10:
                k2 k2Var = (k2) this.f101b;
                View view = k2Var.f73528b;
                if (k2Var.f73527a) {
                    view.getViewTreeObserver().removeOnGlobalLayoutListener(k2Var);
                    k2Var.f73527a = false;
                }
                view.removeOnAttachStateChangeListener(k2Var);
                break;
            case 11:
                v3 v3Var = (v3) this.f101b;
                v3Var.dismiss();
                v3Var.f74110g.disposeComposition();
                break;
            case 12:
                ((a0) this.f101b).f77375d = null;
                break;
            case 13:
                n0.o0 o0Var2 = (n0.o0) this.f101b;
                androidx.room.h hVar = o0Var2.f77456c;
                if (hVar != null) {
                    hVar.f15218a = false;
                }
                o0Var2.f77456c = null;
                break;
            case 14:
                ((j0) this.f101b).f77439f = true;
                break;
            case 15:
                ((a1) this.f101b).p();
                break;
            case 16:
                r1 r1Var2 = (r1) ((q4) this.f101b).f89966b.f96790a.get(q1.f88853a);
                if (r1Var2 != null) {
                    r1Var2.c(null);
                    break;
                }
                break;
            default:
                y0.f fVar = (y0.f) this.f101b;
                v vVar = fVar.f96516e;
                z0 z0Var = vVar.f97982h;
                if (z0Var != null) {
                    z0Var.g();
                }
                vVar.a();
                ActionMode actionMode = fVar.f96519h;
                if (actionMode != null) {
                    actionMode.finish();
                }
                fVar.f96519h = null;
                break;
        }
    }
}
