package t20;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.RadioButton;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public final class b implements z8.c {

    /* renamed from: a, reason: collision with root package name */
    public final RadioButton f88486a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f88487b;

    public b(RadioButton radioButton, Rect rect) {
        a aVar = a.f88484a;
        this.f88486a = radioButton;
        this.f88487b = rect;
    }

    public final void a(Drawable drawable) {
        if (drawable != null) {
            drawable.setBounds(this.f88487b);
        }
        RadioButton radioButton = this.f88486a;
        Drawable[] compoundDrawables = radioButton.getCompoundDrawables();
        a aVar = a.f88484a;
        a aVar2 = a.f88484a;
        a aVar3 = a.f88484a;
        a aVar4 = a.f88484a;
        a aVar5 = a.f88484a;
        int iOrdinal = aVar.ordinal();
        if (iOrdinal == 0) {
            radioButton.setCompoundDrawables(drawable, compoundDrawables[1], compoundDrawables[2], compoundDrawables[3]);
            return;
        }
        if (iOrdinal == 1) {
            radioButton.setCompoundDrawables(compoundDrawables[0], drawable, compoundDrawables[2], compoundDrawables[3]);
            return;
        }
        if (iOrdinal == 2) {
            radioButton.setCompoundDrawables(compoundDrawables[0], compoundDrawables[1], drawable, compoundDrawables[3]);
        } else if (iOrdinal == 3) {
            radioButton.setCompoundDrawables(compoundDrawables[0], compoundDrawables[1], compoundDrawables[2], drawable);
        } else {
            if (iOrdinal != 4 && iOrdinal != 5) {
                throw new NoWhenBranchMatchedException();
            }
            throw new IllegalStateException();
        }
    }

    @Override // z8.c
    public final View c() {
        return this.f88486a;
    }

    @Override // z8.b
    public final void g(Drawable drawable) {
        a(drawable);
    }

    @Override // z8.b
    public final void h(Drawable drawable) {
        a(drawable);
    }

    @Override // z8.b
    public final void u(Drawable drawable) {
        a(drawable);
    }
}
