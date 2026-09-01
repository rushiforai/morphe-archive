package defpackage;

import android.app.Application;
import java.lang.reflect.InvocationTargetException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tue extends i33 {
    public static tue e;
    public static final rz5 f = new rz5(25);
    public final Application d;

    public tue(Application application) {
        super(4);
        this.d = application;
    }

    @Override // defpackage.i33, defpackage.uue
    public final que a(Class cls) {
        Application application = this.d;
        if (application != null) {
            return d(cls, application);
        }
        ik4.k("AndroidViewModelFactory constructed with empty constructor works only with create(modelClass: Class<T>, extras: CreationExtras).");
        return null;
    }

    @Override // defpackage.i33, defpackage.uue
    public final que b(Class cls, g68 g68Var) {
        if (this.d != null) {
            return a(cls);
        }
        Application application = (Application) g68Var.a.get(f);
        if (application != null) {
            return d(cls, application);
        }
        if (!bu.class.isAssignableFrom(cls)) {
            return vc2.E(cls);
        }
        ay0.e("CreationExtras must have an application by `APPLICATION_KEY`");
        return null;
    }

    public final que d(Class cls, Application application) {
        if (!bu.class.isAssignableFrom(cls)) {
            return vc2.E(cls);
        }
        try {
            que queVar = (que) cls.getConstructor(Application.class).newInstance(application);
            queVar.getClass();
            return queVar;
        } catch (IllegalAccessException e2) {
            ywb.k("Cannot create an instance of ", cls, e2);
            return null;
        } catch (InstantiationException e3) {
            ywb.k("Cannot create an instance of ", cls, e3);
            return null;
        } catch (NoSuchMethodException e4) {
            ywb.k("Cannot create an instance of ", cls, e4);
            return null;
        } catch (InvocationTargetException e5) {
            ywb.k("Cannot create an instance of ", cls, e5);
            return null;
        }
    }
}
