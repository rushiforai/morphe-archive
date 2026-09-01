package defpackage;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.util.TypedValue;
import android.view.View;
import com.medium.android.domain.post.models.Highlight;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fl5 extends ClickableSpan implements e39, hjc {
    public static final /* synthetic */ int e = 0;
    public final Context a;
    public final Highlight b;
    public final String c;
    public final g98 d;

    public fl5(Context context, Highlight highlight, String str, g98 g98Var) {
        this.a = context;
        this.b = highlight;
        this.c = str;
        this.d = g98Var;
    }

    @Override // defpackage.hjc
    public final int a() {
        boolean zL = g76.L(this.b.getUserId(), this.c);
        Context context = this.a;
        if (zL) {
            TypedValue typedValueU = sgg.U(context.getTheme(), R.attr.highlightColorMine);
            if (typedValueU != null) {
                int i = typedValueU.resourceId;
                return i != 0 ? context.getColor(i) : typedValueU.data;
            }
            fm3.e("%1$s requires a value for the %2$s attribute to be set in your app theme. You can either set the attribute in your theme or update your theme to inherit from Theme.MaterialComponents (or a descendant).", new Object[]{"Unable to resolve mine color", context.getResources().getResourceName(R.attr.highlightColorMine)});
            return 0;
        }
        TypedValue typedValueU2 = sgg.U(context.getTheme(), R.attr.highlightColor);
        if (typedValueU2 != null) {
            int i2 = typedValueU2.resourceId;
            return i2 != 0 ? context.getColor(i2) : typedValueU2.data;
        }
        fm3.e("%1$s requires a value for the %2$s attribute to be set in your app theme. You can either set the attribute in your theme or update your theme to inherit from Theme.MaterialComponents (or a descendant).", new Object[]{"Unable to resolve unselected color", context.getResources().getResourceName(R.attr.highlightColor)});
        return 0;
    }

    @Override // defpackage.hjc
    public final int c() {
        return 3;
    }

    @Override // defpackage.hjc
    public final void d(Canvas canvas, Paint paint, Spanned spanned, int i, int i2, Rect rect, int i3) {
        vo7.s(this, canvas, paint, rect, i3);
    }

    @Override // android.text.style.ClickableSpan
    public final void onClick(View view) {
        view.getClass();
        this.d.invoke(this.b);
    }

    @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        textPaint.getClass();
    }
}
