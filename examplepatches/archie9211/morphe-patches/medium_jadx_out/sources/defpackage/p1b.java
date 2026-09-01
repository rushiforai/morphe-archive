package defpackage;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p1b extends r1b {
    public final /* synthetic */ Method b;

    public p1b(Method method) {
        this.b = method;
    }

    @Override // defpackage.r1b
    public final boolean a(Object obj, AccessibleObject accessibleObject) {
        try {
            return ((Boolean) this.b.invoke(accessibleObject, obj)).booleanValue();
        } catch (Exception e) {
            lg8.p("Failed invoking canAccess", e);
            return false;
        }
    }
}
