package wj;

import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public j7.b f94399a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f94400b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f94401c;

    public /* synthetic */ b(View view, int i5) {
        this.f94400b = i5;
        this.f94401c = view;
    }

    public final void a(Drawable drawable) {
        switch (this.f94400b) {
            case 0:
                c cVar = (c) this.f94401c;
                cVar.setIndeterminate(false);
                cVar.f(cVar.f94403b);
                break;
            case 1:
                c cVar2 = (c) this.f94401c;
                if (!cVar2.f94407f) {
                    cVar2.setVisibility(cVar2.f94408g);
                    break;
                }
                break;
            default:
                ColorStateList colorStateList = ((com.google.android.material.checkbox.b) this.f94401c).n;
                if (colorStateList != null) {
                    drawable.setTintList(colorStateList);
                    break;
                }
                break;
        }
    }

    public void b(Drawable drawable) {
        switch (this.f94400b) {
            case 2:
                com.google.android.material.checkbox.b bVar = (com.google.android.material.checkbox.b) this.f94401c;
                ColorStateList colorStateList = bVar.n;
                if (colorStateList != null) {
                    drawable.setTint(colorStateList.getColorForState(bVar.f34165r, colorStateList.getDefaultColor()));
                    break;
                }
                break;
        }
    }

    public final void c(Drawable drawable) {
    }
}
