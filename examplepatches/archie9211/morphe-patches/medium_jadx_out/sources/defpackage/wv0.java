package defpackage;

import android.content.Context;
import android.view.GestureDetector;
import android.view.View;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.sidesheet.SideSheetBehavior;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wv0 {
    public final /* synthetic */ int a;
    public int b;
    public boolean c;
    public Object d;
    public Object e;

    public wv0(Context context, gn gnVar) {
        this.a = 1;
        this.d = gnVar;
        this.b = 0;
        this.e = new GestureDetector(context, new h16(this));
    }

    public static wv0 b() {
        wv0 wv0Var = new wv0();
        wv0Var.c = true;
        wv0Var.b = 0;
        return wv0Var;
    }

    public wv0 a() {
        vp7.k("execute parameter required", ((s3b) this.d) != null);
        return new wv0(this, (da4[]) this.e, this.c, this.b);
    }

    public void c(int i) {
        switch (this.a) {
            case 0:
                BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) this.e;
                WeakReference weakReference = bottomSheetBehavior.Y;
                if (weakReference != null && weakReference.get() != null) {
                    this.b = i;
                    if (!this.c) {
                        ((View) bottomSheetBehavior.Y.get()).postOnAnimation((jn) this.d);
                        this.c = true;
                    }
                    break;
                }
                break;
            default:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) this.e;
                WeakReference weakReference2 = sideSheetBehavior.p;
                if (weakReference2 != null && weakReference2.get() != null) {
                    this.b = i;
                    if (!this.c) {
                        ((View) sideSheetBehavior.p.get()).postOnAnimation((b2a) this.d);
                        this.c = true;
                    }
                    break;
                }
                break;
        }
    }

    public wv0(wv0 wv0Var, da4[] da4VarArr, boolean z, int i) {
        this.a = 4;
        this.e = wv0Var;
        this.d = da4VarArr;
        boolean z2 = false;
        if (da4VarArr != null && z) {
            z2 = true;
        }
        this.c = z2;
        this.b = i;
    }

    public wv0(SideSheetBehavior sideSheetBehavior) {
        this.a = 2;
        this.e = sideSheetBehavior;
        this.d = new b2a(4, this);
    }

    public wv0(BottomSheetBehavior bottomSheetBehavior) {
        this.a = 0;
        this.e = bottomSheetBehavior;
        this.d = new jn(2, this);
    }

    public /* synthetic */ wv0() {
        this.a = 3;
    }
}
