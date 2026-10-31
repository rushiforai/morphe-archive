package androidx.appcompat.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.google.android.gms.internal.measurement.ag;
import r.c2;
import r.d2;
import r.m;

/* loaded from: classes2.dex */
public class AppCompatImageView extends ImageView {

    /* renamed from: a, reason: collision with root package name */
    public final m f13757a;

    /* renamed from: b, reason: collision with root package name */
    public final ag f13758b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f13759c;

    public AppCompatImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // android.widget.ImageView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f13757a;
        if (mVar != null) {
            mVar.a();
        }
        ag agVar = this.f13758b;
        if (agVar != null) {
            agVar.f();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public final boolean hasOverlappingRendering() {
        return !(((ImageView) this.f13758b.f32386b).getBackground() instanceof RippleDrawable) && super.hasOverlappingRendering();
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f13757a;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f13757a;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.ImageView
    public final void setImageBitmap(Bitmap bitmap) {
        super.setImageBitmap(bitmap);
        ag agVar = this.f13758b;
        if (agVar != null) {
            agVar.f();
        }
    }

    @Override // android.widget.ImageView
    public final void setImageDrawable(Drawable drawable) {
        ag agVar = this.f13758b;
        if (agVar != null && drawable != null && !this.f13759c) {
            agVar.f32385a = drawable.getLevel();
        }
        super.setImageDrawable(drawable);
        if (agVar != null) {
            agVar.f();
            if (this.f13759c) {
                return;
            }
            ImageView imageView = (ImageView) agVar.f32386b;
            if (imageView.getDrawable() != null) {
                imageView.getDrawable().setLevel(agVar.f32385a);
            }
        }
    }

    @Override // android.widget.ImageView
    public final void setImageLevel(int i5) {
        super.setImageLevel(i5);
        this.f13759c = true;
    }

    @Override // android.widget.ImageView
    public final void setImageResource(int i5) {
        ag agVar = this.f13758b;
        if (agVar != null) {
            agVar.t(i5);
        }
    }

    @Override // android.widget.ImageView
    public final void setImageURI(Uri uri) {
        super.setImageURI(uri);
        ag agVar = this.f13758b;
        if (agVar != null) {
            agVar.f();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AppCompatImageView(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        d2.a(context);
        this.f13759c = false;
        c2.a(getContext(), this);
        m mVar = new m(this);
        this.f13757a = mVar;
        mVar.d(attributeSet, i5);
        ag agVar = new ag(this);
        this.f13758b = agVar;
        agVar.k(attributeSet, i5);
    }
}
