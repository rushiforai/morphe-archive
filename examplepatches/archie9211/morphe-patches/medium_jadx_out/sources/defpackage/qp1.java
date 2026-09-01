package defpackage;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Spanned;
import android.util.TypedValue;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qp1 extends pi7 implements hjc {
    @Override // defpackage.hjc
    public final int a() {
        mya myaVar = this.d;
        Resources resources = (Resources) myaVar.b;
        TypedValue typedValue = new TypedValue();
        Resources.Theme theme = (Resources.Theme) myaVar.c;
        theme.resolveAttribute(R.attr.colorBackgroundTertiary, typedValue, true);
        int i = typedValue.resourceId;
        if (i != 0) {
            ThreadLocal threadLocal = wcb.a;
            return resources.getColor(i, theme);
        }
        ygf.f("Expected theme to resolve to a resource");
        return 0;
    }

    @Override // defpackage.hjc
    public final int c() {
        return 5;
    }

    @Override // defpackage.hjc
    public final void d(Canvas canvas, Paint paint, Spanned spanned, int i, int i2, Rect rect, int i3) {
        vo7.s(this, canvas, paint, rect, i3);
    }
}
