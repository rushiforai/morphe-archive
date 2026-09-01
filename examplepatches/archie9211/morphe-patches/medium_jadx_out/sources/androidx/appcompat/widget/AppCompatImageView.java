package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.widget.ImageView;
import defpackage.e8;
import defpackage.guc;
import defpackage.i42;
import defpackage.imd;
import defpackage.lm3;
import defpackage.wkd;
import defpackage.xp;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AppCompatImageView extends ImageView {
    public final e8 a;
    public final xp b;
    public boolean c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AppCompatImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        imd.a(context);
        this.c = false;
        wkd.a(this, getContext());
        e8 e8Var = new e8(this);
        this.a = e8Var;
        e8Var.k(attributeSet, i);
        xp xpVar = new xp(this);
        this.b = xpVar;
        xpVar.z(attributeSet, i);
    }

    @Override // android.widget.ImageView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.a();
        }
        xp xpVar = this.b;
        if (xpVar != null) {
            xpVar.f();
        }
    }

    public ColorStateList getSupportBackgroundTintList() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.h();
        }
        return null;
    }

    public PorterDuff.Mode getSupportBackgroundTintMode() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.i();
        }
        return null;
    }

    public ColorStateList getSupportImageTintList() {
        i42 i42Var;
        xp xpVar = this.b;
        if (xpVar == null || (i42Var = (i42) xpVar.d) == null) {
            return null;
        }
        return (ColorStateList) i42Var.c;
    }

    public PorterDuff.Mode getSupportImageTintMode() {
        i42 i42Var;
        xp xpVar = this.b;
        if (xpVar == null || (i42Var = (i42) xpVar.d) == null) {
            return null;
        }
        return (PorterDuff.Mode) i42Var.d;
    }

    @Override // android.widget.ImageView, android.view.View
    public final boolean hasOverlappingRendering() {
        return !(((ImageView) this.b.c).getBackground() instanceof RippleDrawable) && super.hasOverlappingRendering();
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.m();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.n(i);
        }
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        super.setImageBitmap(bitmap);
        xp xpVar = this.b;
        if (xpVar != null) {
            xpVar.f();
        }
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        xp xpVar = this.b;
        if (xpVar != null && drawable != null && !this.c) {
            xpVar.b = drawable.getLevel();
        }
        super.setImageDrawable(drawable);
        if (xpVar != null) {
            xpVar.f();
            if (this.c) {
                return;
            }
            ImageView imageView = (ImageView) xpVar.c;
            if (imageView.getDrawable() != null) {
                imageView.getDrawable().setLevel(xpVar.b);
            }
        }
    }

    @Override // android.widget.ImageView
    public void setImageLevel(int i) {
        super.setImageLevel(i);
        this.c = true;
    }

    @Override // android.widget.ImageView
    public void setImageResource(int i) {
        xp xpVar = this.b;
        if (xpVar != null) {
            ImageView imageView = (ImageView) xpVar.c;
            if (i != 0) {
                Drawable drawableE = guc.E(imageView.getContext(), i);
                if (drawableE != null) {
                    lm3.a(drawableE);
                }
                imageView.setImageDrawable(drawableE);
            } else {
                imageView.setImageDrawable(null);
            }
            xpVar.f();
        }
    }

    @Override // android.widget.ImageView
    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        xp xpVar = this.b;
        if (xpVar != null) {
            xpVar.f();
        }
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.s(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.t(mode);
        }
    }

    public void setSupportImageTintList(ColorStateList colorStateList) {
        xp xpVar = this.b;
        if (xpVar != null) {
            i42 i42Var = (i42) xpVar.d;
            if (i42Var == null) {
                i42Var = new i42();
                xpVar.d = i42Var;
            }
            i42Var.c = colorStateList;
            i42Var.b = true;
            xpVar.f();
        }
    }

    public void setSupportImageTintMode(PorterDuff.Mode mode) {
        xp xpVar = this.b;
        if (xpVar != null) {
            i42 i42Var = (i42) xpVar.d;
            if (i42Var == null) {
                i42Var = new i42();
                xpVar.d = i42Var;
            }
            i42Var.d = mode;
            i42Var.a = true;
            xpVar.f();
        }
    }

    public AppCompatImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public AppCompatImageView(Context context) {
        this(context, null);
    }
}
