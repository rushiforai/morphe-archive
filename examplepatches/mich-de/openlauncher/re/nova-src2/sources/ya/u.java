package ya;

import android.content.ComponentName;
import android.os.UserHandle;
import java.util.Set;

/* loaded from: classes.dex */
public final /* synthetic */ class u implements v {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Set f97212b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ UserHandle f97213c;

    public /* synthetic */ u(Set set, UserHandle userHandle) {
        this.f97212b = set;
        this.f97213c = userHandle;
    }

    @Override // ya.v
    public final boolean b(ga.e eVar, ComponentName componentName) {
        if (eVar.i() != null) {
            return this.f97212b.contains(eVar.i().getPackageName()) && eVar.o.equals(this.f97213c);
        }
        return false;
    }
}
