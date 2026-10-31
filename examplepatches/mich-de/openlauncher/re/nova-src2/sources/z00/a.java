package z00;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import v30.e;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final Method f97890a = e.g(Resources.class, "getDrawableForDynamic", String.class, String.class);

    public static Drawable a(Resources resources, String str, String str2) {
        try {
            return (Drawable) f97890a.invoke(resources, str, str2);
        } catch (IllegalAccessException e3) {
            e3.printStackTrace();
            return null;
        } catch (InvocationTargetException e11) {
            e11.printStackTrace();
            return null;
        }
    }
}
