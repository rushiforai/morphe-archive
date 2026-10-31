package bm;

import android.util.Log;
import b.c0;
import com.google.firebase.components.ComponentRegistrar;
import com.google.firebase.components.InvalidRegistrarException;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes.dex */
public final /* synthetic */ class d implements nm.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18070a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f18071b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f18070a = i5;
        this.f18071b = obj;
    }

    @Override // nm.c
    public final Object get() throws ClassNotFoundException {
        switch (this.f18070a) {
            case 0:
                String str = (String) this.f18071b;
                try {
                    Class<?> cls = Class.forName(str);
                    if (ComponentRegistrar.class.isAssignableFrom(cls)) {
                        return (ComponentRegistrar) cls.getDeclaredConstructor(null).newInstance(null);
                    }
                    throw new InvalidRegistrarException("Class " + str + " is not an instance of com.google.firebase.components.ComponentRegistrar");
                } catch (ClassNotFoundException unused) {
                    Log.w("ComponentDiscovery", "Class " + str + " is not an found.");
                    return null;
                } catch (IllegalAccessException e3) {
                    throw new InvalidRegistrarException(c0.l("Could not instantiate ", str, "."), e3);
                } catch (InstantiationException e11) {
                    throw new InvalidRegistrarException(c0.l("Could not instantiate ", str, "."), e11);
                } catch (NoSuchMethodException e12) {
                    throw new InvalidRegistrarException(c0.k("Could not instantiate ", str), e12);
                } catch (InvocationTargetException e13) {
                    throw new InvalidRegistrarException(c0.k("Could not instantiate ", str), e13);
                }
            case 1:
                return (ComponentRegistrar) this.f18071b;
            default:
                return new pm.c((ul.g) this.f18071b);
        }
    }
}
