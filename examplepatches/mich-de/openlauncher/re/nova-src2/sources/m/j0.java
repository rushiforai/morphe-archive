package m;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import androidx.appcompat.widget.AppCompatButton;
import androidx.appcompat.widget.AppCompatTextView;
import java.lang.reflect.Constructor;
import z.c1;

/* loaded from: classes2.dex */
public class j0 {

    /* renamed from: b, reason: collision with root package name */
    public static final Class[] f75299b = {Context.class, AttributeSet.class};

    /* renamed from: c, reason: collision with root package name */
    public static final int[] f75300c = {16843375};

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f75301d = {16844160};

    /* renamed from: e, reason: collision with root package name */
    public static final int[] f75302e = {16844156};

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f75303f = {16844148};

    /* renamed from: g, reason: collision with root package name */
    public static final String[] f75304g = {"android.widget.", "android.view.", "android.webkit."};

    /* renamed from: h, reason: collision with root package name */
    public static final c1 f75305h = new c1(0);

    /* renamed from: a, reason: collision with root package name */
    public final Object[] f75306a = new Object[2];

    public r.l a(Context context, AttributeSet attributeSet) {
        return new r.l(context, attributeSet);
    }

    public AppCompatButton b(Context context, AttributeSet attributeSet) {
        return new AppCompatButton(context, attributeSet);
    }

    public r.n c(Context context, AttributeSet attributeSet) {
        return new r.n(context, attributeSet, 2130968863);
    }

    public r.w d(Context context, AttributeSet attributeSet) {
        return new r.w(context, attributeSet);
    }

    public AppCompatTextView e(Context context, AttributeSet attributeSet) {
        return new AppCompatTextView(context, attributeSet);
    }

    public final View f(Context context, String str, String str2) throws NoSuchMethodException, SecurityException {
        String strConcat;
        c1 c1Var = f75305h;
        Constructor constructor = (Constructor) c1Var.get(str);
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
            constructor = Class.forName(strConcat, false, context.getClassLoader()).asSubclass(View.class).getConstructor(f75299b);
            c1Var.put(str, constructor);
        }
        constructor.setAccessible(true);
        return (View) constructor.newInstance(this.f75306a);
    }
}
