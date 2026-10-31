package r;

import android.widget.AbsListView;
import java.lang.reflect.Field;

/* loaded from: classes2.dex */
public abstract class f1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Field f84704a;

    static {
        Field declaredField = null;
        try {
            declaredField = AbsListView.class.getDeclaredField("mIsChildViewEnabled");
            declaredField.setAccessible(true);
        } catch (NoSuchFieldException e3) {
            e3.printStackTrace();
        }
        f84704a = declaredField;
    }
}
