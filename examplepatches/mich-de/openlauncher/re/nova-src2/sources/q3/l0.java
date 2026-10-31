package q3;

import android.content.Context;
import android.graphics.Paint;
import android.graphics.Typeface;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public abstract class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadLocal f83577a = new ThreadLocal();

    public static Typeface a(Typeface typeface, a0 a0Var, Context context) {
        String strB;
        boolean z11;
        float fA;
        if (typeface == null) {
            return null;
        }
        ArrayList arrayList = a0Var.f83523a;
        if (arrayList.isEmpty()) {
            return typeface;
        }
        ThreadLocal threadLocal = f83577a;
        Paint paint = (Paint) threadLocal.get();
        if (paint == null) {
            paint = new Paint();
            threadLocal.set(paint);
        }
        paint.setFontVariationSettings(null);
        paint.setTypeface(typeface);
        y3.e eVarA = v30.e.a(context);
        int iA = f0.a(context);
        if (iA == 0) {
            strB = a4.b.b(arrayList, null, new pu.e(eVarA), 31);
        } else {
            int size = arrayList.size();
            int i5 = 0;
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            boolean z12 = false;
            while (i5 < size) {
                x xVar = (x) arrayList.get(i5);
                if (Intrinsics.b(xVar.b(), "wght")) {
                    fA = kotlin.ranges.a.d0(xVar.a() + iA, 1.0f, 1000.0f);
                    z11 = true;
                } else {
                    z11 = z12;
                    fA = xVar.a();
                }
                if (i5 != 0) {
                    str = str + AbstractJsonLexerKt.COMMA;
                }
                str = str + '\'' + xVar.b() + "' " + fA;
                i5++;
                z12 = z11;
            }
            if (z12) {
                strB = str;
            } else {
                float fD0 = kotlin.ranges.a.d0(iA + 400.0f, 1.0f, 1000.0f);
                if (!arrayList.isEmpty()) {
                    str = str + AbstractJsonLexerKt.COMMA;
                }
                strB = str + "'wght' " + fD0;
            }
        }
        paint.setFontVariationSettings(strB);
        return paint.getTypeface();
    }
}
