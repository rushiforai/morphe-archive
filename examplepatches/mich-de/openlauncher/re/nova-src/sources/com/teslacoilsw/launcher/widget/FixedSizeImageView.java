package com.teslacoilsw.launcher.widget;

import aa.n;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.widget.ImageView;

/* loaded from: classes4.dex */
public class FixedSizeImageView extends ImageView {

    /* renamed from: e, reason: collision with root package name */
    public static final Bitmap f46413e = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);

    /* renamed from: a, reason: collision with root package name */
    public n f46414a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f46415b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f46416c;

    /* renamed from: d, reason: collision with root package name */
    public ColorFilter f46417d;

    public FixedSizeImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46414a = null;
        this.f46415b = true;
        this.f46416c = false;
        this.f46417d = null;
    }

    public final ColorFilter a() {
        return v30.a.f92037a ? super.getColorFilter() : this.f46417d;
    }

    @Override // android.view.View
    public final void requestLayout() {
        if (this.f46416c) {
            return;
        }
        super.requestLayout();
    }

    @Override // android.widget.ImageView
    public final void setColorFilter(ColorFilter colorFilter) {
        if (!v30.a.f92037a) {
            this.f46417d = colorFilter;
        }
        super.setColorFilter(colorFilter);
    }

    @Override // android.widget.ImageView
    public final void setImageBitmap(Bitmap bitmap) {
        if (bitmap == null) {
            bitmap = f46413e;
        }
        if (!this.f46415b) {
            super.setImageBitmap(bitmap);
            return;
        }
        if (this.f46414a != null && bitmap.getWidth() == this.f46414a.f627b.getWidth() && bitmap.getHeight() == this.f46414a.f627b.getHeight()) {
            this.f46414a.f627b = bitmap;
        } else {
            this.f46414a = new n(bitmap, 0, false);
        }
        setImageDrawable(this.f46414a);
        invalidate();
    }

    @Override // android.widget.ImageView
    public final void setImageDrawable(Drawable drawable) {
        n nVar = this.f46414a;
        if (drawable != nVar && nVar != null) {
            Bitmap bitmap = f46413e;
            if (bitmap == null) {
                throw new IllegalStateException();
            }
            nVar.f627b = bitmap;
        }
        this.f46416c = true;
        super.setImageDrawable(drawable);
        this.f46416c = false;
    }

    @Override // android.widget.ImageView
    public final void setImageResource(int i5) {
        n nVar = this.f46414a;
        if (nVar != null) {
            Bitmap bitmap = f46413e;
            if (bitmap == null) {
                throw new IllegalStateException();
            }
            nVar.f627b = bitmap;
        }
        super.setImageResource(i5);
    }

    @Override // android.widget.ImageView
    public final void setImageURI(Uri uri) {
        n nVar = this.f46414a;
        if (nVar != null) {
            Bitmap bitmap = f46413e;
            if (bitmap == null) {
                throw new IllegalStateException();
            }
            nVar.f627b = bitmap;
        }
        super.setImageURI(uri);
    }
}
