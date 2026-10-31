package sj;

import android.graphics.Outline;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewOutlineProvider;
import bk.g;
import com.google.android.material.imageview.ShapeableImageView;

/* loaded from: classes3.dex */
public final class a extends ViewOutlineProvider {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f87493a = new Rect();

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ShapeableImageView f87494b;

    public a(ShapeableImageView shapeableImageView) {
        this.f87494b = shapeableImageView;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        ShapeableImageView shapeableImageView = this.f87494b;
        if (shapeableImageView.f34304l == null) {
            return;
        }
        if (shapeableImageView.f34303k == null) {
            shapeableImageView.f34303k = new g(shapeableImageView.f34304l);
        }
        RectF rectF = shapeableImageView.f34297e;
        Rect rect = this.f87493a;
        rectF.round(rect);
        shapeableImageView.f34303k.setBounds(rect);
        shapeableImageView.f34303k.getOutline(outline);
    }
}
