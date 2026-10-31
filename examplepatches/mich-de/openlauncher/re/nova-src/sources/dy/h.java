package dy;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class h extends ThreadLocal {
    @Override // java.lang.ThreadLocal
    public Object get() {
        Object obj = super.get();
        Intrinsics.d(obj);
        return obj;
    }
}
