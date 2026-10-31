package d8;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Outline;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.TypedValue;
import java.io.IOException;
import o9.u2;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public final class d extends a {

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ int f49018g = 0;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f49019d;

    /* renamed from: e, reason: collision with root package name */
    public final Rect f49020e;

    /* renamed from: f, reason: collision with root package name */
    public final b f49021f;

    public d(b bVar, Resources resources) {
        this.f49005a = bVar;
        Drawable.ConstantState constantState = bVar.f49011c;
        if (constantState != null) {
            f(constantState.newDrawable(resources));
        }
        this.f49019d = new Rect();
        this.f49020e = new Rect();
        this.f49021f = bVar;
    }

    public static c g(TypedArray typedArray, int i5, c cVar) {
        if (typedArray.hasValue(i5)) {
            TypedValue typedValuePeekValue = typedArray.peekValue(i5);
            if (typedValuePeekValue.type == 6) {
                float fraction = typedValuePeekValue.getFraction(1.0f, 1.0f);
                if (fraction < 1.0f) {
                    return new c(fraction, 0);
                }
                throw new IllegalStateException("Fraction cannot be larger than 1");
            }
            int dimensionPixelOffset = typedArray.getDimensionPixelOffset(i5, 0);
            if (dimensionPixelOffset != 0) {
                return new c(0.0f, dimensionPixelOffset);
            }
        }
        return cVar;
    }

    @Override // d8.a, android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        int intrinsicHeight = this.f49006b.getIntrinsicHeight();
        b bVar = this.f49021f;
        c cVar = bVar.f49013e;
        float f11 = cVar.f49016a;
        c cVar2 = bVar.f49015g;
        float f12 = f11 + cVar2.f49016a;
        if (intrinsicHeight < 0 || f12 >= 1.0f) {
            return -1;
        }
        return ((int) (intrinsicHeight / (1.0f - f12))) + cVar.f49017b + cVar2.f49017b;
    }

    @Override // d8.a, android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        int intrinsicWidth = this.f49006b.getIntrinsicWidth();
        b bVar = this.f49021f;
        c cVar = bVar.f49012d;
        float f11 = cVar.f49016a;
        c cVar2 = bVar.f49014f;
        float f12 = f11 + cVar2.f49016a;
        if (intrinsicWidth < 0 || f12 >= 1.0f) {
            return -1;
        }
        return ((int) (intrinsicWidth / (1.0f - f12))) + cVar.f49017b + cVar2.f49017b;
    }

    @Override // d8.a, android.graphics.drawable.Drawable
    public final int getOpacity() {
        int opacity = this.f49006b.getOpacity();
        Rect rect = this.f49020e;
        h(rect);
        if (opacity != -1) {
            return opacity;
        }
        if (rect.left > 0 || rect.top > 0 || rect.right > 0 || rect.bottom > 0) {
            return -3;
        }
        return opacity;
    }

    @Override // d8.a, android.graphics.drawable.Drawable
    public final void getOutline(Outline outline) {
        this.f49006b.getOutline(outline);
    }

    @Override // d8.a, android.graphics.drawable.Drawable
    public final boolean getPadding(Rect rect) {
        boolean padding = super.getPadding(rect);
        Rect rect2 = this.f49020e;
        h(rect2);
        rect.left += rect2.left;
        rect.right += rect2.right;
        rect.top += rect2.top;
        rect.bottom += rect2.bottom;
        return padding || (((rect2.left | rect2.right) | rect2.top) | rect2.bottom) != 0;
    }

    public final void h(Rect rect) {
        Rect bounds = getBounds();
        b bVar = this.f49021f;
        rect.left = bVar.f49012d.a(bounds.width());
        rect.right = bVar.f49014f.a(bounds.width());
        rect.top = bVar.f49013e.a(bounds.height());
        rect.bottom = bVar.f49015g.a(bounds.height());
    }

    @Override // android.graphics.drawable.Drawable
    public final void inflate(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        int[] iArr = u2.A;
        TypedArray typedArrayObtainAttributes = theme == null ? resources.obtainAttributes(attributeSet, iArr) : theme.obtainStyledAttributes(attributeSet, iArr, 0, 0);
        super.inflate(resources, xmlPullParser, attributeSet, theme);
        b bVar = this.f49021f;
        if (bVar != null) {
            bVar.f49009a |= typedArrayObtainAttributes.getChangingConfigurations();
            if (typedArrayObtainAttributes.hasValue(6)) {
                c cVarG = g(typedArrayObtainAttributes, 6, new c());
                bVar.f49012d = cVarG;
                bVar.f49013e = cVarG;
                bVar.f49014f = cVarG;
                bVar.f49015g = cVarG;
            }
            bVar.f49012d = g(typedArrayObtainAttributes, 2, bVar.f49012d);
            bVar.f49013e = g(typedArrayObtainAttributes, 4, bVar.f49013e);
            bVar.f49014f = g(typedArrayObtainAttributes, 3, bVar.f49014f);
            bVar.f49015g = g(typedArrayObtainAttributes, 5, bVar.f49015g);
        }
        if (this.f49006b != null) {
            typedArrayObtainAttributes.recycle();
            return;
        }
        int i5 = b.f49008h;
        bVar.getClass();
        throw new XmlPullParserException(typedArrayObtainAttributes.getPositionDescription() + ": <inset> tag requires a 'drawable' attribute or child tag defining a drawable");
    }

    @Override // d8.a, android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        Rect rect2 = this.f49019d;
        rect2.set(rect);
        int i5 = rect2.left;
        b bVar = this.f49021f;
        rect2.left = bVar.f49012d.a(rect.width()) + i5;
        rect2.top = bVar.f49013e.a(rect.height()) + rect2.top;
        rect2.right -= bVar.f49014f.a(rect.width());
        rect2.bottom -= bVar.f49015g.a(rect.height());
        super.onBoundsChange(rect2);
    }

    public d(Drawable drawable) {
        this(new b(null, null), null);
        b bVar = this.f49021f;
        bVar.f49012d = new c(0.15f, 0);
        bVar.f49013e = new c(0.0f, 0);
        bVar.f49014f = new c(0.0f, 0);
        bVar.f49015g = new c(0.15f, 0);
        f(drawable);
    }
}
