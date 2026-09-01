package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.CompoundButton;
import android.widget.TextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o10 {
    public Object a;
    public Object b;
    public boolean c;
    public boolean d;
    public boolean e;
    public final Object f;

    public o10(d8a d8aVar, Object obj, boolean z, ajc ajcVar, boolean z2) {
        this.f = d8aVar;
        this.c = z;
        this.a = ajcVar;
        this.d = z2;
        this.b = obj;
        this.e = true;
    }

    public void a() {
        CompoundButton compoundButton = (CompoundButton) this.f;
        Drawable buttonDrawable = compoundButton.getButtonDrawable();
        if (buttonDrawable != null) {
            if (this.c || this.d) {
                Drawable drawableMutate = buttonDrawable.mutate();
                if (this.c) {
                    drawableMutate.setTintList((ColorStateList) this.a);
                }
                if (this.d) {
                    drawableMutate.setTintMode((PorterDuff.Mode) this.b);
                }
                if (drawableMutate.isStateful()) {
                    drawableMutate.setState(compoundButton.getDrawableState());
                }
                compoundButton.setButtonDrawable(drawableMutate);
            }
        }
    }

    public void b() {
        n10 n10Var = (n10) this.f;
        Drawable checkMarkDrawable = n10Var.getCheckMarkDrawable();
        if (checkMarkDrawable != null) {
            if (this.c || this.d) {
                Drawable drawableMutate = checkMarkDrawable.mutate();
                if (this.c) {
                    drawableMutate.setTintList((ColorStateList) this.a);
                }
                if (this.d) {
                    drawableMutate.setTintMode((PorterDuff.Mode) this.b);
                }
                if (drawableMutate.isStateful()) {
                    drawableMutate.setState(n10Var.getDrawableState());
                }
                n10Var.setCheckMarkDrawable(drawableMutate);
            }
        }
    }

    public Object c() {
        if (this.c) {
            return null;
        }
        Object obj = this.b;
        if (obj != null) {
            return obj;
        }
        b22.b("Unexpected form of a provided value");
        z72.b();
        return null;
    }

    public void d(AttributeSet attributeSet, int i) {
        int resourceId;
        int resourceId2;
        CompoundButton compoundButton = (CompoundButton) this.f;
        Context context = compoundButton.getContext();
        int[] iArr = esa.m;
        vwa vwaVarX = vwa.x(context, attributeSet, iArr, i);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        ute.n(compoundButton, compoundButton.getContext(), iArr, attributeSet, (TypedArray) vwaVarX.c, i);
        try {
            if (typedArray.hasValue(1) && (resourceId2 = typedArray.getResourceId(1, 0)) != 0) {
                try {
                    compoundButton.setButtonDrawable(guc.E(compoundButton.getContext(), resourceId2));
                } catch (Resources.NotFoundException unused) {
                    if (typedArray.hasValue(0)) {
                        compoundButton.setButtonDrawable(guc.E(compoundButton.getContext(), resourceId));
                    }
                }
            } else if (typedArray.hasValue(0) && (resourceId = typedArray.getResourceId(0, 0)) != 0) {
                compoundButton.setButtonDrawable(guc.E(compoundButton.getContext(), resourceId));
            }
            if (typedArray.hasValue(2)) {
                compoundButton.setButtonTintList(vwaVarX.o(2));
            }
            if (typedArray.hasValue(3)) {
                compoundButton.setButtonTintMode(lm3.b(typedArray.getInt(3, -1), null));
            }
            vwaVarX.C();
        } catch (Throwable th) {
            vwaVarX.C();
            throw th;
        }
    }

    public /* synthetic */ o10(TextView textView) {
        this.a = null;
        this.b = null;
        this.c = false;
        this.d = false;
        this.f = textView;
    }
}
