package uy;

import android.content.ComponentName;
import android.os.UserHandle;
import com.android.launcher3.util.ComponentKey;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/* loaded from: classes.dex */
public class b {

    /* renamed from: c, reason: collision with root package name */
    public static final a f91682c = new a();

    /* renamed from: a, reason: collision with root package name */
    public b f91683a = null;

    /* renamed from: b, reason: collision with root package name */
    public final z.f f91684b = new z.f(0);

    public boolean a(ComponentKey componentKey) {
        boolean zAdd;
        b bVar = this.f91683a;
        if (bVar != null) {
            bVar.a(componentKey);
        }
        synchronized (this.f91684b) {
            zAdd = this.f91684b.add(componentKey);
        }
        return zAdd;
    }

    public boolean b(ComponentName componentName, UserHandle userHandle) {
        synchronized (this.f91684b) {
            try {
                for (int i5 = this.f91684b.f97766c - 1; i5 >= 0; i5--) {
                    ComponentKey componentKey = (ComponentKey) this.f91684b.f97765b[i5];
                    if (componentKey.f21251a.equals(componentName) && componentKey.f21252b.equals(userHandle)) {
                        return true;
                    }
                }
                return false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public boolean c(ComponentKey componentKey) {
        boolean zContains;
        synchronized (this.f91684b) {
            zContains = this.f91684b.contains(componentKey);
        }
        return zContains;
    }

    public Set d() {
        z.f fVar;
        synchronized (this.f91684b) {
            fVar = new z.f(this.f91684b);
        }
        return fVar;
    }

    public final List e(String str, UserHandle userHandle) {
        ArrayList arrayList;
        synchronized (this.f91684b) {
            try {
                arrayList = null;
                for (int i5 = this.f91684b.f97766c - 1; i5 >= 0; i5--) {
                    ComponentKey componentKey = (ComponentKey) this.f91684b.f97765b[i5];
                    if (str.equals(componentKey.f21251a.getPackageName()) && componentKey.f21252b.equals(userHandle)) {
                        if (arrayList == null) {
                            arrayList = new ArrayList();
                        }
                        arrayList.add(componentKey);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return arrayList == null ? Collections.EMPTY_LIST : arrayList;
    }

    public boolean f(ComponentKey componentKey) {
        boolean zRemove;
        synchronized (this.f91684b) {
            zRemove = this.f91684b.remove(componentKey);
        }
        return zRemove;
    }

    public final String toString() {
        return "AppGroup[" + this.f91684b + "]";
    }
}
