package defpackage;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iw8 extends vw3 {
    public final /* synthetic */ int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ iw8(sxa sxaVar, int i) {
        super(sxaVar);
        this.d = i;
    }

    @Override // defpackage.vw3
    public final int d(View view) {
        int right;
        int i;
        switch (this.d) {
            case 0:
                txa txaVar = (txa) view.getLayoutParams();
                right = view.getRight() + ((txa) view.getLayoutParams()).b.right;
                i = ((ViewGroup.MarginLayoutParams) txaVar).rightMargin;
                break;
            default:
                txa txaVar2 = (txa) view.getLayoutParams();
                right = view.getBottom() + ((txa) view.getLayoutParams()).b.bottom;
                i = ((ViewGroup.MarginLayoutParams) txaVar2).bottomMargin;
                break;
        }
        return right + i;
    }

    @Override // defpackage.vw3
    public final int e(View view) {
        int iA;
        int i;
        switch (this.d) {
            case 0:
                txa txaVar = (txa) view.getLayoutParams();
                iA = sxa.A(view) + ((ViewGroup.MarginLayoutParams) txaVar).leftMargin;
                i = ((ViewGroup.MarginLayoutParams) txaVar).rightMargin;
                break;
            default:
                txa txaVar2 = (txa) view.getLayoutParams();
                iA = sxa.z(view) + ((ViewGroup.MarginLayoutParams) txaVar2).topMargin;
                i = ((ViewGroup.MarginLayoutParams) txaVar2).bottomMargin;
                break;
        }
        return iA + i;
    }

    @Override // defpackage.vw3
    public final int f(View view) {
        int iZ;
        int i;
        switch (this.d) {
            case 0:
                txa txaVar = (txa) view.getLayoutParams();
                iZ = sxa.z(view) + ((ViewGroup.MarginLayoutParams) txaVar).topMargin;
                i = ((ViewGroup.MarginLayoutParams) txaVar).bottomMargin;
                break;
            default:
                txa txaVar2 = (txa) view.getLayoutParams();
                iZ = sxa.A(view) + ((ViewGroup.MarginLayoutParams) txaVar2).leftMargin;
                i = ((ViewGroup.MarginLayoutParams) txaVar2).rightMargin;
                break;
        }
        return iZ + i;
    }

    @Override // defpackage.vw3
    public final int g(View view) {
        switch (this.d) {
            case 0:
                return (view.getLeft() - ((txa) view.getLayoutParams()).b.left) - ((ViewGroup.MarginLayoutParams) ((txa) view.getLayoutParams())).leftMargin;
            default:
                return sxa.B(view) - ((ViewGroup.MarginLayoutParams) ((txa) view.getLayoutParams())).topMargin;
        }
    }

    @Override // defpackage.vw3
    public final int h() {
        int i = this.d;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((sxa) obj).n;
            default:
                return ((sxa) obj).o;
        }
    }

    @Override // defpackage.vw3
    public final int i() {
        int i;
        int iF;
        int i2 = this.d;
        Object obj = this.b;
        switch (i2) {
            case 0:
                sxa sxaVar = (sxa) obj;
                i = sxaVar.n;
                iF = sxaVar.F();
                break;
            default:
                sxa sxaVar2 = (sxa) obj;
                i = sxaVar2.o;
                iF = sxaVar2.D();
                break;
        }
        return i - iF;
    }

    @Override // defpackage.vw3
    public final int j() {
        int i = this.d;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((sxa) obj).F();
            default:
                return ((sxa) obj).D();
        }
    }

    @Override // defpackage.vw3
    public final int k() {
        int i = this.d;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((sxa) obj).l;
            default:
                return ((sxa) obj).m;
        }
    }

    @Override // defpackage.vw3
    public final int l() {
        int i = this.d;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((sxa) obj).m;
            default:
                return ((sxa) obj).l;
        }
    }

    @Override // defpackage.vw3
    public final int m() {
        int i = this.d;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((sxa) obj).E();
            default:
                return ((sxa) obj).G();
        }
    }

    @Override // defpackage.vw3
    public final int n() {
        int iE;
        int iF;
        int i = this.d;
        Object obj = this.b;
        switch (i) {
            case 0:
                sxa sxaVar = (sxa) obj;
                iE = sxaVar.n - sxaVar.E();
                iF = sxaVar.F();
                break;
            default:
                sxa sxaVar2 = (sxa) obj;
                iE = sxaVar2.o - sxaVar2.G();
                iF = sxaVar2.D();
                break;
        }
        return iE - iF;
    }

    @Override // defpackage.vw3
    public final int o(View view) {
        int i = this.d;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                Rect rect = (Rect) obj;
                ((sxa) obj2).K(rect, view);
                return rect.right;
            default:
                Rect rect2 = (Rect) obj;
                ((sxa) obj2).K(rect2, view);
                return rect2.bottom;
        }
    }

    @Override // defpackage.vw3
    public final int p(View view) {
        int i = this.d;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                Rect rect = (Rect) obj;
                ((sxa) obj2).K(rect, view);
                return rect.left;
            default:
                Rect rect2 = (Rect) obj;
                ((sxa) obj2).K(rect2, view);
                return rect2.top;
        }
    }

    @Override // defpackage.vw3
    public final void q(int i) {
        int i2 = this.d;
        Object obj = this.b;
        switch (i2) {
            case 0:
                ((sxa) obj).P(i);
                break;
            default:
                ((sxa) obj).Q(i);
                break;
        }
    }
}
