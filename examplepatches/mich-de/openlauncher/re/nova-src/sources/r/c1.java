package r;

import android.view.View;
import android.widget.AbsListView;
import android.widget.AdapterView;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public abstract class c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Method f84683a;

    /* renamed from: b, reason: collision with root package name */
    public static final Method f84684b;

    /* renamed from: c, reason: collision with root package name */
    public static final Method f84685c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f84686d;

    static {
        try {
            Class cls = Integer.TYPE;
            Class cls2 = Boolean.TYPE;
            Class cls3 = Float.TYPE;
            Method declaredMethod = AbsListView.class.getDeclaredMethod("positionSelector", cls, View.class, cls2, cls3, cls3);
            f84683a = declaredMethod;
            declaredMethod.setAccessible(true);
            Method declaredMethod2 = AdapterView.class.getDeclaredMethod("setSelectedPositionInt", cls);
            f84684b = declaredMethod2;
            declaredMethod2.setAccessible(true);
            Method declaredMethod3 = AdapterView.class.getDeclaredMethod("setNextSelectedPositionInt", cls);
            f84685c = declaredMethod3;
            declaredMethod3.setAccessible(true);
            f84686d = true;
        } catch (NoSuchMethodException e3) {
            e3.printStackTrace();
        }
    }
}
