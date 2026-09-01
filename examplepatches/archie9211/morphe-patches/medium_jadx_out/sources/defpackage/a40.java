package defpackage;

import android.R;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import java.lang.reflect.Constructor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class a40 {
    public static final Class[] b = {Context.class, AttributeSet.class};
    public static final int[] c = {R.attr.onClick};
    public static final int[] d = {R.attr.accessibilityHeading};
    public static final int[] e = {R.attr.accessibilityPaneTitle};
    public static final int[] f = {R.attr.screenReaderFocusable};
    public static final String[] g = {"android.widget.", "android.view.", "android.webkit."};
    public static final aec h = new aec(0);
    public final Object[] a = new Object[2];

    public j10 a(Context context, AttributeSet attributeSet) {
        return new j10(context, attributeSet);
    }

    public k10 b(Context context, AttributeSet attributeSet) {
        return new k10(context, attributeSet, com.medium.reader.R.attr.buttonStyle);
    }

    public m10 c(Context context, AttributeSet attributeSet) {
        return new m10(context, attributeSet);
    }

    public q20 d(Context context, AttributeSet attributeSet) {
        return new q20(context, attributeSet);
    }

    public r30 e(Context context, AttributeSet attributeSet) {
        return new r30(context, attributeSet);
    }

    public final View f(Context context, String str, String str2) {
        String strConcat;
        aec aecVar = h;
        Constructor constructor = (Constructor) aecVar.get(str);
        if (constructor == null) {
            if (str2 != null) {
                try {
                    strConcat = str2.concat(str);
                } catch (Exception unused) {
                    return null;
                }
            } else {
                strConcat = str;
            }
            constructor = Class.forName(strConcat, false, context.getClassLoader()).asSubclass(View.class).getConstructor(b);
            aecVar.put(str, constructor);
        }
        constructor.setAccessible(true);
        return (View) constructor.newInstance(this.a);
    }
}
