package defpackage;

import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import android.view.Window;
import androidx.appcompat.widget.Toolbar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bod implements mw2 {
    public Toolbar a;
    public int b;
    public View c;
    public Drawable d;
    public Drawable e;
    public Drawable f;
    public boolean g;
    public CharSequence h;
    public CharSequence i;
    public CharSequence j;
    public Window.Callback k;
    public boolean l;
    public h6 m;
    public int n;
    public Drawable o;

    public final void a(int i) {
        View view;
        Toolbar toolbar = this.a;
        int i2 = this.b ^ i;
        this.b = i;
        if (i2 != 0) {
            if ((i2 & 4) != 0) {
                if ((i & 4) != 0) {
                    b();
                }
                if ((this.b & 4) != 0) {
                    Drawable drawable = this.f;
                    if (drawable == null) {
                        drawable = this.o;
                    }
                    toolbar.setNavigationIcon(drawable);
                } else {
                    toolbar.setNavigationIcon((Drawable) null);
                }
            }
            if ((i2 & 3) != 0) {
                c();
            }
            if ((i2 & 8) != 0) {
                if ((i & 8) != 0) {
                    toolbar.setTitle(this.h);
                    toolbar.setSubtitle(this.i);
                } else {
                    toolbar.setTitle((CharSequence) null);
                    toolbar.setSubtitle((CharSequence) null);
                }
            }
            if ((i2 & 16) == 0 || (view = this.c) == null) {
                return;
            }
            if ((i & 16) != 0) {
                toolbar.addView(view);
            } else {
                toolbar.removeView(view);
            }
        }
    }

    public final void b() {
        if ((this.b & 4) != 0) {
            boolean zIsEmpty = TextUtils.isEmpty(this.j);
            Toolbar toolbar = this.a;
            if (zIsEmpty) {
                toolbar.setNavigationContentDescription(this.n);
            } else {
                toolbar.setNavigationContentDescription(this.j);
            }
        }
    }

    public final void c() {
        Drawable drawable;
        int i = this.b;
        if ((i & 2) == 0) {
            drawable = null;
        } else if ((i & 1) == 0 || (drawable = this.e) == null) {
            drawable = this.d;
        }
        this.a.setLogo(drawable);
    }
}
