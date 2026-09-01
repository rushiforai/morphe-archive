package defpackage;

import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import com.google.android.material.focus.FocusRingDrawable;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xr4 extends Drawable.ConstantState {
    public Drawable.ConstantState a;
    public int b;
    public boolean c;
    public int d;
    public boolean e;
    public int f;
    public int g;
    public int h;
    public int i;
    public float j;
    public int k;
    public float l;
    public int m;
    public float n;
    public int o;
    public float p;
    public int q;
    public float r;
    public int s;
    public n3c t;
    public int u;
    public int v;
    public final Rect w;
    public int[] x;

    public xr4(xr4 xr4Var) {
        this.b = 0;
        this.c = false;
        this.d = Integer.MIN_VALUE;
        this.e = false;
        this.f = Integer.MIN_VALUE;
        this.g = Integer.MIN_VALUE;
        this.h = Integer.MIN_VALUE;
        this.i = Integer.MIN_VALUE;
        this.j = Float.NaN;
        this.k = Integer.MIN_VALUE;
        this.l = Float.NaN;
        this.m = Integer.MIN_VALUE;
        this.n = Float.NaN;
        this.o = Integer.MIN_VALUE;
        this.p = Float.NaN;
        this.q = Integer.MIN_VALUE;
        this.r = Float.NaN;
        this.s = Integer.MIN_VALUE;
        this.t = null;
        this.u = Integer.MIN_VALUE;
        this.v = Integer.MIN_VALUE;
        this.w = null;
        this.x = FocusRingDrawable.q;
        if (xr4Var != null) {
            this.a = xr4Var.a;
            this.b = xr4Var.b;
            this.c = xr4Var.c;
            this.d = xr4Var.d;
            this.e = xr4Var.e;
            this.f = xr4Var.f;
            this.g = xr4Var.g;
            this.h = xr4Var.h;
            this.i = xr4Var.i;
            this.j = xr4Var.j;
            this.k = xr4Var.k;
            this.l = xr4Var.l;
            this.m = xr4Var.m;
            this.n = xr4Var.n;
            this.o = xr4Var.o;
            this.p = xr4Var.p;
            this.q = xr4Var.q;
            this.r = xr4Var.r;
            this.s = xr4Var.s;
            this.u = xr4Var.u;
            this.v = xr4Var.v;
            n3c n3cVar = xr4Var.t;
            if (n3cVar instanceof p3c) {
                this.t = ((p3c) n3cVar).i().a();
            } else if (n3cVar instanceof zpc) {
                zpc zpcVar = (zpc) n3cVar;
                nvg nvgVar = new nvg();
                int i = zpcVar.a;
                nvgVar.a = i;
                nvgVar.b = zpcVar.b;
                int[][] iArr = zpcVar.c;
                int[][] iArr2 = new int[iArr.length][];
                nvgVar.c = iArr2;
                p3c[] p3cVarArr = zpcVar.d;
                nvgVar.d = new p3c[p3cVarArr.length];
                System.arraycopy(iArr, 0, iArr2, 0, i);
                System.arraycopy(p3cVarArr, 0, (p3c[]) nvgVar.d, 0, nvgVar.a);
                this.t = nvgVar.a != 0 ? new zpc(nvgVar) : null;
            } else {
                this.t = n3cVar;
            }
            if (xr4Var.w != null) {
                this.w = new Rect(xr4Var.w);
            }
            int[] iArr3 = xr4Var.x;
            this.x = Arrays.copyOf(iArr3, iArr3.length);
        }
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        Drawable.ConstantState constantState = this.a;
        return this.b | (constantState != null ? constantState.getChangingConfigurations() : 0);
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        return new FocusRingDrawable(this, (Resources) null);
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable(Resources resources) {
        return new FocusRingDrawable(this, resources);
    }
}
