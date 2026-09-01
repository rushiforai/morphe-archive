package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.util.SparseArray;
import android.util.TypedValue;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wcb {
    public static final ThreadLocal a = new ThreadLocal();
    public static final WeakHashMap b = new WeakHashMap(0);
    public static final Object c = new Object();

    public static void a(vcb vcbVar, int i, ColorStateList colorStateList, Resources.Theme theme) {
        synchronized (c) {
            try {
                WeakHashMap weakHashMap = b;
                SparseArray sparseArray = (SparseArray) weakHashMap.get(vcbVar);
                if (sparseArray == null) {
                    sparseArray = new SparseArray();
                    weakHashMap.put(vcbVar, sparseArray);
                }
                sparseArray.append(i, new ucb(colorStateList, vcbVar.a.getConfiguration(), theme));
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static Typeface b(Context context, int i) {
        if (context.isRestricted()) {
            return null;
        }
        return c(context, i, new TypedValue(), 0, null, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00c4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.Typeface c(android.content.Context r12, int r13, android.util.TypedValue r14, int r15, defpackage.h30 r16, boolean r17) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 278
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wcb.c(android.content.Context, int, android.util.TypedValue, int, h30, boolean):android.graphics.Typeface");
    }
}
