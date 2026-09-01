package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p3c implements n3c {
    public gsa a;
    public gsa b;
    public gsa c;
    public gsa d;
    public eb2 e;
    public eb2 f;
    public eb2 g;
    public eb2 h;
    public no3 i;
    public no3 j;
    public no3 k;
    public no3 l;

    public static o3c e(Context context, AttributeSet attributeSet, int i, int i2) {
        x xVar = new x(0.0f);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ura.j, i, i2);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(1, 0);
        typedArrayObtainStyledAttributes.recycle();
        ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(context, resourceId);
        if (resourceId2 != 0) {
            contextThemeWrapper.getTheme().applyStyle(resourceId2, true);
        }
        return f(contextThemeWrapper.obtainStyledAttributes(ura.o), xVar);
    }

    public static o3c f(TypedArray typedArray, x xVar) {
        try {
            int i = typedArray.getInt(0, 0);
            int i2 = typedArray.getInt(3, i);
            int i3 = typedArray.getInt(4, i);
            int i4 = typedArray.getInt(2, i);
            int i5 = typedArray.getInt(1, i);
            eb2 eb2VarG = g(typedArray, 5, xVar);
            eb2 eb2VarG2 = g(typedArray, 8, eb2VarG);
            eb2 eb2VarG3 = g(typedArray, 9, eb2VarG);
            eb2 eb2VarG4 = g(typedArray, 7, eb2VarG);
            eb2 eb2VarG5 = g(typedArray, 6, eb2VarG);
            o3c o3cVar = new o3c();
            o3cVar.a = ek7.A(i2);
            o3cVar.e = eb2VarG2;
            o3cVar.b = ek7.A(i3);
            o3cVar.f = eb2VarG3;
            o3cVar.c = ek7.A(i4);
            o3cVar.g = eb2VarG4;
            o3cVar.d = ek7.A(i5);
            o3cVar.h = eb2VarG5;
            return o3cVar;
        } finally {
            typedArray.recycle();
        }
    }

    public static eb2 g(TypedArray typedArray, int i, eb2 eb2Var) {
        TypedValue typedValuePeekValue = typedArray.peekValue(i);
        if (typedValuePeekValue != null) {
            int i2 = typedValuePeekValue.type;
            if (i2 == 5) {
                return new x(TypedValue.complexToDimensionPixelSize(typedValuePeekValue.data, typedArray.getResources().getDisplayMetrics()));
            }
            if (i2 == 6) {
                return new c3b(typedValuePeekValue.getFraction(1.0f, 1.0f));
            }
        }
        return eb2Var;
    }

    @Override // defpackage.n3c
    public final p3c a(float f) {
        o3c o3cVarI = i();
        o3cVarI.e = new x(f);
        o3cVarI.f = new x(f);
        o3cVarI.g = new x(f);
        o3cVarI.h = new x(f);
        return o3cVarI.a();
    }

    @Override // defpackage.n3c
    public final boolean d() {
        return false;
    }

    public final boolean h(RectF rectF) {
        boolean z = this.l.getClass().equals(no3.class) && this.j.getClass().equals(no3.class) && this.i.getClass().equals(no3.class) && this.k.getClass().equals(no3.class);
        float fA = this.e.a(rectF);
        return z && ((this.f.a(rectF) > fA ? 1 : (this.f.a(rectF) == fA ? 0 : -1)) == 0 && (this.h.a(rectF) > fA ? 1 : (this.h.a(rectF) == fA ? 0 : -1)) == 0 && (this.g.a(rectF) > fA ? 1 : (this.g.a(rectF) == fA ? 0 : -1)) == 0) && (this.b instanceof cmb) && (this.a instanceof cmb) && (this.c instanceof cmb) && (this.d instanceof cmb);
    }

    public final o3c i() {
        o3c o3cVar = new o3c();
        o3cVar.a = this.a;
        o3cVar.b = this.b;
        o3cVar.c = this.c;
        o3cVar.d = this.d;
        o3cVar.e = this.e;
        o3cVar.f = this.f;
        o3cVar.g = this.g;
        o3cVar.h = this.h;
        o3cVar.i = this.i;
        o3cVar.j = this.j;
        o3cVar.k = this.k;
        o3cVar.l = this.l;
        return o3cVar;
    }

    public final String toString() {
        return "[" + this.e + ", " + this.f + ", " + this.g + ", " + this.h + "]";
    }

    @Override // defpackage.n3c
    public final p3c c() {
        return this;
    }

    @Override // defpackage.n3c
    public final p3c b(int[] iArr) {
        return this;
    }
}
