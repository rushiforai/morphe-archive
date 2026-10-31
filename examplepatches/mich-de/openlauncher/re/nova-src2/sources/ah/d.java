package ah;

import android.os.IBinder;
import android.os.IInterface;
import b.c0;
import b.s8;
import java.lang.reflect.Field;
import sg.w;

/* loaded from: classes.dex */
public final class d extends s8 implements b {

    /* renamed from: j, reason: collision with root package name */
    public final Object f12807j;

    public d(Object obj) {
        super("com.google.android.gms.dynamic.IObjectWrapper", 1);
        this.f12807j = obj;
    }

    public static b U(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.dynamic.IObjectWrapper");
        return iInterfaceQueryLocalInterface instanceof b ? (b) iInterfaceQueryLocalInterface : new k(iBinder, "com.google.android.gms.dynamic.IObjectWrapper", 0);
    }

    public static Object V(b bVar) throws SecurityException {
        if (bVar instanceof d) {
            return ((d) bVar).f12807j;
        }
        IBinder iBinderAsBinder = bVar.asBinder();
        Field[] declaredFields = iBinderAsBinder.getClass().getDeclaredFields();
        Field field = null;
        int i5 = 0;
        for (Field field2 : declaredFields) {
            if (!field2.isSynthetic()) {
                i5++;
                field = field2;
            }
        }
        if (i5 != 1) {
            int length = declaredFields.length;
            throw new IllegalArgumentException(c0.p(new StringBuilder(String.valueOf(length).length() + 53), "Unexpected number of IObjectWrapper declared fields: ", length));
        }
        w.h(field);
        if (field.isAccessible()) {
            throw new IllegalArgumentException("IObjectWrapper declared field not private!");
        }
        field.setAccessible(true);
        try {
            return field.get(iBinderAsBinder);
        } catch (IllegalAccessException e3) {
            throw new IllegalArgumentException("Could not access the field in remoteBinder.", e3);
        } catch (NullPointerException e11) {
            throw new IllegalArgumentException("Binder object is null.", e11);
        }
    }
}
