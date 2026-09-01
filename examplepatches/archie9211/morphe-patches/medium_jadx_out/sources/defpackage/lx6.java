package defpackage;

import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lx6 {
    public final View a;
    public final s26 b;
    public kx6 e;
    public lid f;
    public zte g;
    public Rect l;
    public final gx6 m;
    public x45 c = new vx5(18);
    public x45 d = new vx5(19);
    public uid h = new uid("", 4, bkd.b);
    public ry5 i = ry5.g;
    public final ArrayList j = new ArrayList();
    public final vq6 k = vx0.d0(yw6.NONE, new em4(15, this));

    public lx6(View view, bq bqVar, s26 s26Var) {
        this.a = view;
        this.b = s26Var;
        this.m = new gx6(bqVar, s26Var);
    }

    public final xwa a(EditorInfo editorInfo) {
        int i;
        int i2;
        uid uidVar = this.h;
        String str = uidVar.a.b;
        long j = uidVar.b;
        ry5 ry5Var = this.i;
        int i3 = ry5Var.e;
        int i4 = ry5Var.d;
        boolean z = ry5Var.a;
        if (i3 == 1) {
            i = z ? 6 : 0;
        } else if (i3 == 0) {
            i = 1;
        } else if (i3 == 2) {
            i = 2;
        } else if (i3 == 6) {
            i = 5;
        } else if (i3 == 5) {
            i = 7;
        } else if (i3 == 3) {
            i = 3;
        } else if (i3 == 4) {
            i = 4;
        } else {
            if (i3 != 7) {
                ygf.f("invalid ImeAction");
                return null;
            }
        }
        editorInfo.imeOptions = i;
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 24) {
            o6.s(editorInfo, ry5Var.f);
        }
        if (i4 == 1) {
            i2 = 1;
        } else if (i4 == 2) {
            editorInfo.imeOptions |= Integer.MIN_VALUE;
            i2 = 1;
        } else if (i4 == 3) {
            i2 = 2;
        } else if (i4 == 4) {
            i2 = 3;
        } else if (i4 == 5) {
            i2 = 17;
        } else if (i4 == 6) {
            i2 = 33;
        } else if (i4 == 7) {
            i2 = 129;
        } else if (i4 == 8) {
            i2 = 18;
        } else {
            if (i4 != 9) {
                ygf.f("Invalid Keyboard Type");
                return null;
            }
            i2 = 8194;
        }
        editorInfo.inputType = i2;
        if (!z && (i2 & 1) == 1) {
            i2 |= 131072;
            editorInfo.inputType = i2;
            if (ry5Var.e == 1) {
                editorInfo.imeOptions |= 1073741824;
            }
        }
        if ((i2 & 1) == 1) {
            int i6 = ry5Var.b;
            if (i6 == 1) {
                i2 |= 4096;
                editorInfo.inputType = i2;
            } else if (i6 == 2) {
                i2 |= 8192;
                editorInfo.inputType = i2;
            } else if (i6 == 3) {
                i2 |= OlympusMakernoteDirectory.TAG_MAIN_INFO;
                editorInfo.inputType = i2;
            }
            if (ry5Var.c) {
                editorInfo.inputType = 32768 | i2;
            }
        }
        int i7 = bkd.c;
        editorInfo.initialSelStart = (int) (j >> 32);
        editorInfo.initialSelEnd = (int) (j & 4294967295L);
        ev3.c(editorInfo, str);
        editorInfo.imeOptions |= 33554432;
        if (!zuc.a || i4 == 7 || i4 == 8) {
            if (i5 >= 35) {
                dv3.d(editorInfo, false);
            }
            Bundle bundle = editorInfo.extras;
            if (bundle == null) {
                bundle = new Bundle();
                editorInfo.extras = bundle;
            }
            bundle.putBoolean("androidx.core.view.inputmethod.EditorInfoCompat.STYLUS_HANDWRITING_ENABLED", false);
        } else {
            if (i5 >= 35) {
                dv3.d(editorInfo, true);
            }
            Bundle bundle2 = editorInfo.extras;
            if (bundle2 == null) {
                bundle2 = new Bundle();
                editorInfo.extras = bundle2;
            }
            bundle2.putBoolean("androidx.core.view.inputmethod.EditorInfoCompat.STYLUS_HANDWRITING_ENABLED", true);
            m4.F(editorInfo);
        }
        hx6 hx6Var = ix6.a;
        if (yw3.d()) {
            yw3.a().i(editorInfo);
        }
        xwa xwaVar = new xwa(this.h, new pkf(this), this.i.c, this.e, this.f, this.g);
        this.j.add(new WeakReference(xwaVar));
        return xwaVar;
    }
}
