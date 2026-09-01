package defpackage;

import android.animation.ValueAnimator;
import android.os.Build;
import android.view.View;
import android.view.WindowInsets;
import com.medium.reader.R;
import j$.util.Objects;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a4f implements View.OnApplyWindowInsetsListener {
    public final up1 a;
    public z4f b;

    public a4f(View view, up1 up1Var) {
        z4f z4fVarB;
        this.a = up1Var;
        WeakHashMap weakHashMap = ute.a;
        z4f z4fVarA = nte.a(view);
        if (z4fVarA != null) {
            int i = Build.VERSION.SDK_INT;
            z4fVarB = (i >= 36 ? new m4f(z4fVarA) : i >= 35 ? new l4f(z4fVarA) : i >= 34 ? new k4f(z4fVarA) : i >= 31 ? new j4f(z4fVarA) : i >= 30 ? new i4f(z4fVarA) : i >= 29 ? new h4f(z4fVarA) : new g4f(z4fVarA)).b();
        } else {
            z4fVarB = null;
        }
        this.b = z4fVarB;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        int[] iArr;
        boolean z;
        if (!view.isLaidOut()) {
            this.b = z4f.h(windowInsets, view);
            return view.getTag(R.id.tag_on_apply_window_listener) != null ? windowInsets : view.onApplyWindowInsets(windowInsets);
        }
        z4f z4fVarH = z4f.h(windowInsets, view);
        w4f w4fVar = z4fVarH.a;
        z4f z4fVarA = this.b;
        if (z4fVarA == null) {
            WeakHashMap weakHashMap = ute.a;
            z4fVarA = nte.a(view);
            this.b = z4fVarA;
        }
        if (z4fVarA == null) {
            this.b = z4fVarH;
            if (view.getTag(R.id.tag_on_apply_window_listener) == null) {
                return view.onApplyWindowInsets(windowInsets);
            }
        } else {
            up1 up1VarJ = b4f.j(view);
            if (up1VarJ == null || !Objects.equals((z4f) up1VarJ.c, z4fVarH)) {
                int[] iArr2 = new int[1];
                int[] iArr3 = new int[1];
                z4f z4fVar = this.b;
                int i = 1;
                while (i <= 512) {
                    b36 b36VarI = w4fVar.i(i);
                    b36 b36VarI2 = z4fVar.a.i(i);
                    int i2 = b36VarI.a;
                    int i3 = b36VarI.d;
                    int i4 = b36VarI.c;
                    int i5 = b36VarI.b;
                    int i6 = b36VarI2.a;
                    int i7 = b36VarI2.d;
                    int[] iArr4 = iArr2;
                    int i8 = b36VarI2.c;
                    int i9 = b36VarI2.b;
                    if (i2 > i6 || i5 > i9 || i4 > i8 || i3 > i7) {
                        iArr = iArr3;
                        z = true;
                    } else {
                        iArr = iArr3;
                        z = false;
                    }
                    if (z != (i2 < i6 || i5 < i9 || i4 < i8 || i3 < i7)) {
                        if (z) {
                            iArr4[0] = iArr4[0] | i;
                        } else {
                            iArr[0] = iArr[0] | i;
                        }
                    }
                    i <<= 1;
                    iArr2 = iArr4;
                    iArr3 = iArr;
                }
                int i10 = iArr2[0];
                int i11 = iArr3[0];
                int i12 = i10 | i11;
                if (i12 == 0) {
                    this.b = z4fVarH;
                    if (view.getTag(R.id.tag_on_apply_window_listener) == null) {
                        return view.onApplyWindowInsets(windowInsets);
                    }
                } else {
                    z4f z4fVar2 = this.b;
                    f4f f4fVar = new f4f(i12, (i10 & 8) != 0 ? b4f.e : (i11 & 8) != 0 ? b4f.f : (i10 & 519) != 0 ? b4f.g : (i11 & 519) != 0 ? b4f.h : null, (i12 & 8) != 0 ? 160L : 250L);
                    f4fVar.a.e(0.0f);
                    ValueAnimator duration = ValueAnimator.ofFloat(0.0f, 1.0f).setDuration(f4fVar.a.b());
                    b36 b36VarI3 = w4fVar.i(i12);
                    b36 b36VarI4 = z4fVar2.a.i(i12);
                    int iMin = Math.min(b36VarI3.a, b36VarI4.a);
                    int i13 = b36VarI3.b;
                    int i14 = b36VarI4.b;
                    int iMin2 = Math.min(i13, i14);
                    int i15 = b36VarI3.c;
                    int i16 = b36VarI4.c;
                    int iMin3 = Math.min(i15, i16);
                    int i17 = b36VarI3.d;
                    int i18 = b36VarI4.d;
                    mya myaVar = new mya(b36.c(iMin, iMin2, iMin3, Math.min(i17, i18)), 26, b36.c(Math.max(b36VarI3.a, b36VarI4.a), Math.max(i13, i14), Math.max(i15, i16), Math.max(i17, i18)));
                    b4f.g(view, f4fVar, z4fVarH, false);
                    duration.addUpdateListener(new z3f(f4fVar, z4fVarH, z4fVar2, i12, view));
                    duration.addListener(new pj5(2, view, f4fVar));
                    ut8.a(view, new n71(view, f4fVar, myaVar, duration));
                    this.b = z4fVarH;
                    if (view.getTag(R.id.tag_on_apply_window_listener) == null) {
                        return view.onApplyWindowInsets(windowInsets);
                    }
                }
            } else if (view.getTag(R.id.tag_on_apply_window_listener) == null) {
                return view.onApplyWindowInsets(windowInsets);
            }
        }
        return windowInsets;
    }
}
