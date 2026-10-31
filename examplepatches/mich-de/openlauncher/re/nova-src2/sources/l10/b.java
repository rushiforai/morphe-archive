package l10;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.widget.ImageView;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b extends ImageView implements o {

    /* renamed from: a, reason: collision with root package name */
    public final n f74402a;

    /* renamed from: b, reason: collision with root package name */
    public w f74403b;

    public b(Context context, w wVar, n nVar) {
        super(context);
        this.f74402a = nVar;
        this.f74403b = wVar;
    }

    @Override // l10.o
    public final void a(w wVar, int i5) {
        this.f74403b = wVar;
        Drawable drawable = getDrawable();
        if (drawable != null) {
            b(drawable);
        }
    }

    public final void b(Drawable drawable) {
        Drawable drawableFindDrawableByLayerId;
        Drawable drawableFindDrawableByLayerId2;
        Uri uriA = this.f74402a.a(this.f74403b);
        w wVar = this.f74403b;
        LayerDrawable layerDrawable = null;
        if (wVar.f74465b) {
            drawable.setTint(wVar.f74464a.f74458e.f90179b);
        } else {
            drawable.setTintList(null);
        }
        if (Intrinsics.b(uriA, q.f74441c)) {
            LayerDrawable layerDrawable2 = drawable instanceof LayerDrawable ? (LayerDrawable) drawable : null;
            if (layerDrawable2 == null) {
                y yVar = drawable instanceof y ? (y) drawable : null;
                Object drawable2 = yVar != null ? yVar.getDrawable() : null;
                if (drawable2 instanceof LayerDrawable) {
                    layerDrawable = (LayerDrawable) drawable2;
                }
            } else {
                layerDrawable = layerDrawable2;
            }
            if (layerDrawable != null && (drawableFindDrawableByLayerId2 = layerDrawable.findDrawableByLayerId(2131428783)) != null) {
                drawableFindDrawableByLayerId2.setTint(this.f74403b.f74464a.f74458e.f90179b);
            }
            if (layerDrawable == null || (drawableFindDrawableByLayerId = layerDrawable.findDrawableByLayerId(2131428784)) == null) {
                return;
            }
            drawableFindDrawableByLayerId.setTint(this.f74403b.f74464a.f74458e.f90180c);
        }
    }

    @Override // android.widget.ImageView
    public final void setImageDrawable(Drawable drawable) {
        Drawable drawableMutate = drawable != null ? drawable.mutate() : null;
        if (drawableMutate != null) {
            b(drawableMutate);
        }
        if (this.f74403b.f74464a.f74454a) {
            drawableMutate = drawableMutate != null ? new y(drawableMutate) : null;
        }
        super.setImageDrawable(drawableMutate);
    }
}
