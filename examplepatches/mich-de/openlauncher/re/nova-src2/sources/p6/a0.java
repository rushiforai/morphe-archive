package p6;

import android.content.Context;
import android.content.res.Resources;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;

/* loaded from: classes2.dex */
public abstract class a0 {
    public static String a(Context context, int i5) {
        String strValueOf;
        Intrinsics.g(context, "context");
        if (i5 <= 16777215) {
            return String.valueOf(i5);
        }
        try {
            strValueOf = context.getResources().getResourceName(i5);
        } catch (Resources.NotFoundException unused) {
            strValueOf = String.valueOf(i5);
        }
        Intrinsics.f(strValueOf, "try {\n                  …tring()\n                }");
        return strValueOf;
    }

    public static Sequence b(e0 e0Var) {
        Intrinsics.g(e0Var, "<this>");
        return q70.d.p0(e0Var, b.f82133p);
    }
}
