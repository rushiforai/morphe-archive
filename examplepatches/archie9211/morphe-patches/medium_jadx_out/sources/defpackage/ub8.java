package defpackage;

import android.os.Bundle;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ub8 extends wb8 {
    public final Class r;

    public ub8(Class cls) {
        super(true);
        if (!Serializable.class.isAssignableFrom(cls)) {
            rd6.f(cls, " does not implement Serializable.");
            throw null;
        }
        try {
            this.r = Class.forName("[L" + cls.getName() + ';');
        } catch (ClassNotFoundException e) {
            ik4.j(e);
            throw null;
        }
    }

    @Override // defpackage.wb8
    public final Object a(String str, Bundle bundle) {
        bundle.getClass();
        return (Serializable[]) bundle.get(str);
    }

    @Override // defpackage.wb8
    public final String b() {
        return this.r.getName();
    }

    @Override // defpackage.wb8
    public final Object c(String str) {
        str.getClass();
        throw new UnsupportedOperationException("Arrays don't support default values.");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v1, types: [java.io.Serializable, java.io.Serializable[], java.lang.Object] */
    @Override // defpackage.wb8
    public final void e(Bundle bundle, String str, Object obj) {
        ?? r3 = (Serializable[]) obj;
        str.getClass();
        this.r.cast(r3);
        bundle.putSerializable(str, r3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !ub8.class.equals(obj.getClass())) {
            return false;
        }
        return g76.L(this.r, ((ub8) obj).r);
    }

    public final int hashCode() {
        return this.r.hashCode();
    }
}
