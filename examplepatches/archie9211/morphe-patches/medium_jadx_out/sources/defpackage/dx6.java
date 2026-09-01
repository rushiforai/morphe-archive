package defpackage;

import android.view.View;
import android.view.ViewGroup;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.sidesheet.SideSheetBehavior;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dx6 extends gq7 {
    public final /* synthetic */ int f;
    public final SideSheetBehavior g;

    public /* synthetic */ dx6(SideSheetBehavior sideSheetBehavior, int i) {
        this.f = i;
        this.g = sideSheetBehavior;
    }

    @Override // defpackage.gq7
    public final int A() {
        switch (this.f) {
            case 0:
                return 1;
            default:
                return 0;
        }
    }

    @Override // defpackage.gq7
    public final boolean F(float f) {
        switch (this.f) {
            case 0:
                if (f > 0.0f) {
                }
                break;
            default:
                if (f < 0.0f) {
                }
                break;
        }
        return false;
    }

    @Override // defpackage.gq7
    public final boolean G(View view) {
        switch (this.f) {
            case 0:
                if (view.getRight() < (q() - t()) / 2) {
                }
                break;
            default:
                if (view.getLeft() > (q() + this.g.m) / 2) {
                }
                break;
        }
        return true;
    }

    @Override // defpackage.gq7
    public final boolean H(float f, float f2) {
        switch (this.f) {
            case 0:
                if (Math.abs(f) <= Math.abs(f2) || Math.abs(f) <= 500.0f) {
                }
                break;
            default:
                if (Math.abs(f) <= Math.abs(f2) || Math.abs(f) <= 500.0f) {
                }
                break;
        }
        return false;
    }

    @Override // defpackage.gq7
    public final boolean U(View view, float f) {
        int i = this.f;
        SideSheetBehavior sideSheetBehavior = this.g;
        switch (i) {
            case 0:
                if (Math.abs((f * sideSheetBehavior.k) + view.getLeft()) > 0.5f) {
                }
                break;
            default:
                if (Math.abs((f * sideSheetBehavior.k) + view.getRight()) > 0.5f) {
                }
                break;
        }
        return true;
    }

    @Override // defpackage.gq7
    public final void Y(ViewGroup.MarginLayoutParams marginLayoutParams, int i) {
        switch (this.f) {
            case 0:
                marginLayoutParams.leftMargin = i;
                break;
            default:
                marginLayoutParams.rightMargin = i;
                break;
        }
    }

    @Override // defpackage.gq7
    public final void Z(ViewGroup.MarginLayoutParams marginLayoutParams, int i, int i2) {
        int i3 = this.f;
        SideSheetBehavior sideSheetBehavior = this.g;
        switch (i3) {
            case 0:
                if (i <= sideSheetBehavior.m) {
                    marginLayoutParams.leftMargin = i2;
                }
                break;
            default:
                int i4 = sideSheetBehavior.m;
                if (i <= i4) {
                    marginLayoutParams.rightMargin = i4 - i;
                }
                break;
        }
    }

    @Override // defpackage.gq7
    public final int j(ViewGroup.MarginLayoutParams marginLayoutParams) {
        switch (this.f) {
            case 0:
                return marginLayoutParams.leftMargin;
            default:
                return marginLayoutParams.rightMargin;
        }
    }

    @Override // defpackage.gq7
    public final float k(int i) {
        switch (this.f) {
            case 0:
                float fT = t();
                return (i - fT) / (q() - fT);
            default:
                float f = this.g.m;
                return (f - i) / (f - q());
        }
    }

    @Override // defpackage.gq7
    public final int p(ViewGroup.MarginLayoutParams marginLayoutParams) {
        switch (this.f) {
            case 0:
                return marginLayoutParams.leftMargin;
            default:
                return marginLayoutParams.rightMargin;
        }
    }

    @Override // defpackage.gq7
    public final int q() {
        int i = this.f;
        SideSheetBehavior sideSheetBehavior = this.g;
        switch (i) {
            case 0:
                return Math.max(0, sideSheetBehavior.n + sideSheetBehavior.o);
            default:
                return Math.max(0, (sideSheetBehavior.m - sideSheetBehavior.l) - sideSheetBehavior.o);
        }
    }

    @Override // defpackage.gq7
    public final int t() {
        int i = this.f;
        SideSheetBehavior sideSheetBehavior = this.g;
        switch (i) {
            case 0:
                return (-sideSheetBehavior.l) - sideSheetBehavior.o;
            default:
                return sideSheetBehavior.m;
        }
    }

    @Override // defpackage.gq7
    public final int u() {
        int i = this.f;
        SideSheetBehavior sideSheetBehavior = this.g;
        switch (i) {
            case 0:
                return sideSheetBehavior.o;
            default:
                return sideSheetBehavior.m;
        }
    }

    @Override // defpackage.gq7
    public final int v() {
        switch (this.f) {
            case 0:
                return -this.g.l;
            default:
                return q();
        }
    }

    @Override // defpackage.gq7
    public final int x(View view) {
        int i = this.f;
        SideSheetBehavior sideSheetBehavior = this.g;
        switch (i) {
            case 0:
                return view.getRight() + sideSheetBehavior.o;
            default:
                return view.getLeft() - sideSheetBehavior.o;
        }
    }

    @Override // defpackage.gq7
    public final int y(CoordinatorLayout coordinatorLayout) {
        switch (this.f) {
            case 0:
                return coordinatorLayout.getLeft();
            default:
                return coordinatorLayout.getRight();
        }
    }
}
