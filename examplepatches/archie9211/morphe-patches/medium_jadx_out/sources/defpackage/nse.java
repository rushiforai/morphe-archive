package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nse {
    public final y70 a;
    public final y70 b;
    public final y70 c;

    public nse(y70 y70Var, y70 y70Var2, y70 y70Var3) {
        this.a = y70Var;
        this.b = y70Var2;
        this.c = y70Var3;
    }

    public abstract ose a();

    public final Class b(Class cls) throws ClassNotFoundException {
        String name = cls.getName();
        y70 y70Var = this.c;
        Class cls2 = (Class) y70Var.get(name);
        if (cls2 != null) {
            return cls2;
        }
        Class<?> cls3 = Class.forName(cls.getPackage().getName() + "." + cls.getSimpleName() + "Parcelizer", false, cls.getClassLoader());
        y70Var.put(cls.getName(), cls3);
        return cls3;
    }

    public final Method c(String str) throws NoSuchMethodException {
        y70 y70Var = this.a;
        Method method = (Method) y70Var.get(str);
        if (method != null) {
            return method;
        }
        System.currentTimeMillis();
        Method declaredMethod = Class.forName(str, true, nse.class.getClassLoader()).getDeclaredMethod("read", nse.class);
        y70Var.put(str, declaredMethod);
        return declaredMethod;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final Method d(Class cls) throws NoSuchMethodException, ClassNotFoundException {
        String name = cls.getName();
        y70 y70Var = this.b;
        Method method = (Method) y70Var.get(name);
        if (method != null) {
            return method;
        }
        Class clsB = b(cls);
        System.currentTimeMillis();
        Method declaredMethod = clsB.getDeclaredMethod("write", cls, nse.class);
        y70Var.put(cls.getName(), declaredMethod);
        return declaredMethod;
    }

    public abstract boolean e(int i);

    public final int f(int i, int i2) {
        return !e(i2) ? i : ((ose) this).e.readInt();
    }

    public final Parcelable g(Parcelable parcelable, int i) {
        if (!e(i)) {
            return parcelable;
        }
        return ((ose) this).e.readParcelable(ose.class.getClassLoader());
    }

    public final pse h() {
        String string = ((ose) this).e.readString();
        if (string == null) {
            return null;
        }
        try {
            return (pse) c(string).invoke(null, a());
        } catch (ClassNotFoundException e) {
            lg8.p("VersionedParcel encountered ClassNotFoundException", e);
            return null;
        } catch (IllegalAccessException e2) {
            lg8.p("VersionedParcel encountered IllegalAccessException", e2);
            return null;
        } catch (NoSuchMethodException e3) {
            lg8.p("VersionedParcel encountered NoSuchMethodException", e3);
            return null;
        } catch (InvocationTargetException e4) {
            if (e4.getCause() instanceof RuntimeException) {
                throw ((RuntimeException) e4.getCause());
            }
            lg8.p("VersionedParcel encountered InvocationTargetException", e4);
            return null;
        }
    }

    public abstract void i(int i);

    public final void j(int i, int i2) {
        i(i2);
        ((ose) this).e.writeInt(i);
    }

    public final void k(Parcelable parcelable, int i) {
        i(i);
        ((ose) this).e.writeParcelable(parcelable, 0);
    }

    public final void l(pse pseVar) {
        if (pseVar == null) {
            ((ose) this).e.writeString(null);
            return;
        }
        try {
            ((ose) this).e.writeString(b(pseVar.getClass()).getName());
            ose oseVarA = a();
            try {
                d(pseVar.getClass()).invoke(null, pseVar, oseVarA);
                Parcel parcel = oseVarA.e;
                int i = oseVarA.i;
                if (i >= 0) {
                    int i2 = oseVarA.d.get(i);
                    int iDataPosition = parcel.dataPosition();
                    parcel.setDataPosition(i2);
                    parcel.writeInt(iDataPosition - i2);
                    parcel.setDataPosition(iDataPosition);
                }
            } catch (ClassNotFoundException e) {
                lg8.p("VersionedParcel encountered ClassNotFoundException", e);
            } catch (IllegalAccessException e2) {
                lg8.p("VersionedParcel encountered IllegalAccessException", e2);
            } catch (NoSuchMethodException e3) {
                lg8.p("VersionedParcel encountered NoSuchMethodException", e3);
            } catch (InvocationTargetException e4) {
                if (e4.getCause() instanceof RuntimeException) {
                    throw ((RuntimeException) e4.getCause());
                }
                lg8.p("VersionedParcel encountered InvocationTargetException", e4);
            }
        } catch (ClassNotFoundException e5) {
            lg8.p(pseVar.getClass().getSimpleName().concat(" does not have a Parcelizer"), e5);
        }
    }
}
