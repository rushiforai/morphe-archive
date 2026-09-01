package defpackage;

import android.util.Log;
import com.google.firebase.components.ComponentRegistrar;
import com.google.firebase.components.InvalidRegistrarException;
import java.lang.reflect.InvocationTargetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cz1 implements h8a {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ cz1(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.h8a
    public final Object get() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                String str = (String) obj;
                try {
                    Class<?> cls = Class.forName(str);
                    if (ComponentRegistrar.class.isAssignableFrom(cls)) {
                        return (ComponentRegistrar) cls.getDeclaredConstructor(null).newInstance(null);
                    }
                    throw new InvalidRegistrarException("Class " + str + " is not an instance of com.google.firebase.components.ComponentRegistrar");
                } catch (ClassNotFoundException unused) {
                    Log.w("ComponentDiscovery", "Class " + str + " is not an found.");
                    return null;
                } catch (IllegalAccessException e) {
                    throw new InvalidRegistrarException(ev6.x("Could not instantiate ", str, "."), e);
                } catch (InstantiationException e2) {
                    throw new InvalidRegistrarException(ev6.x("Could not instantiate ", str, "."), e2);
                } catch (NoSuchMethodException e3) {
                    throw new InvalidRegistrarException(ka1.r("Could not instantiate ", str), e3);
                } catch (InvocationTargetException e4) {
                    throw new InvalidRegistrarException(ka1.r("Could not instantiate ", str), e4);
                }
            case 1:
                return (ComponentRegistrar) obj;
            default:
                return new dw5((xj4) obj);
        }
    }
}
