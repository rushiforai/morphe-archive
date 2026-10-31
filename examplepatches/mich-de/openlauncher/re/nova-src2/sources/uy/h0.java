package uy;

import android.content.ComponentName;
import android.os.UserHandle;
import com.android.launcher3.util.ComponentKey;
import java.util.Set;

/* loaded from: classes.dex */
public final class h0 extends b {
    @Override // uy.b
    public final boolean a(ComponentKey componentKey) {
        boolean zRemove;
        synchronized (this.f91684b) {
            zRemove = this.f91684b.remove(componentKey);
        }
        return zRemove;
    }

    @Override // uy.b
    public final boolean b(ComponentName componentName, UserHandle userHandle) {
        return !super.b(componentName, userHandle);
    }

    @Override // uy.b
    public final boolean c(ComponentKey componentKey) {
        boolean z11;
        synchronized (this.f91684b) {
            z11 = !this.f91684b.contains(componentKey);
        }
        return z11;
    }

    @Override // uy.b
    public final Set d() {
        throw new RuntimeException("Cannot getSet for MainAppGroup");
    }

    @Override // uy.b
    public final boolean f(ComponentKey componentKey) {
        boolean zAdd;
        synchronized (this.f91684b) {
            zAdd = this.f91684b.add(componentKey);
        }
        return zAdd;
    }
}
