package j7;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

/* loaded from: classes2.dex */
public final class d extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69080a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f69081b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f69080a = i5;
        this.f69081b = obj;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public boolean canApplyTheme() {
        switch (this.f69080a) {
            case 0:
                return ((Drawable.ConstantState) this.f69081b).canApplyTheme();
            default:
                return super.canApplyTheme();
        }
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        switch (this.f69080a) {
            case 0:
                return ((Drawable.ConstantState) this.f69081b).getChangingConfigurations();
            case 1:
                return 0;
            default:
                return 0;
        }
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final Drawable newDrawable() {
        switch (this.f69080a) {
            case 0:
                e eVar = new e(null, 0);
                Drawable drawableNewDrawable = ((Drawable.ConstantState) this.f69081b).newDrawable();
                eVar.f69087a = drawableNewDrawable;
                drawableNewDrawable.setCallback(eVar.f69086f);
                return eVar;
            case 1:
                return (rj.a) this.f69081b;
            default:
                return new z9.g((Bitmap) this.f69081b);
        }
    }

    public d(rj.a aVar) {
        this.f69080a = 1;
        this.f69081b = aVar;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public Drawable newDrawable(Resources resources) {
        switch (this.f69080a) {
            case 0:
                e eVar = new e(null, 0);
                Drawable drawableNewDrawable = ((Drawable.ConstantState) this.f69081b).newDrawable(resources);
                eVar.f69087a = drawableNewDrawable;
                drawableNewDrawable.setCallback(eVar.f69086f);
                return eVar;
            default:
                return super.newDrawable(resources);
        }
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public Drawable newDrawable(Resources resources, Resources.Theme theme) {
        switch (this.f69080a) {
            case 0:
                e eVar = new e(null, 0);
                Drawable drawableNewDrawable = ((Drawable.ConstantState) this.f69081b).newDrawable(resources, theme);
                eVar.f69087a = drawableNewDrawable;
                drawableNewDrawable.setCallback(eVar.f69086f);
                return eVar;
            default:
                return super.newDrawable(resources, theme);
        }
    }
}
