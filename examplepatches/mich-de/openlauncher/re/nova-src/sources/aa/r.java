package aa;

import android.content.pm.LauncherActivityInfo;
import com.android.launcher3.util.ComponentKey;
import java.util.function.Supplier;

/* loaded from: classes.dex */
public final /* synthetic */ class r implements Supplier {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f651a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f652b;

    public /* synthetic */ r(Object obj, int i5) {
        this.f651a = i5;
        this.f652b = obj;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.f651a) {
            case 0:
                return (j) this.f652b;
            case 1:
                return (LauncherActivityInfo) this.f652b;
            default:
                return (ComponentKey) this.f652b;
        }
    }
}
