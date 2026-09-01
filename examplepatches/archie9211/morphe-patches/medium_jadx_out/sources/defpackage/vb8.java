package defpackage;

import android.os.Bundle;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class vb8 extends wb8 {
    public final Class r;

    public vb8(Class cls) {
        super(true);
        if (!Serializable.class.isAssignableFrom(cls)) {
            rd6.f(cls, " does not implement Serializable.");
            throw null;
        }
        if (cls.isEnum()) {
            rd6.f(cls, " is an Enum. You should use EnumType instead.");
            throw null;
        }
        this.r = cls;
    }

    @Override // defpackage.wb8
    public final Object a(String str, Bundle bundle) {
        bundle.getClass();
        return (Serializable) bundle.get(str);
    }

    @Override // defpackage.wb8
    public String b() {
        return this.r.getName();
    }

    @Override // defpackage.wb8
    public final void e(Bundle bundle, String str, Object obj) {
        Serializable serializable = (Serializable) obj;
        str.getClass();
        serializable.getClass();
        this.r.cast(serializable);
        bundle.putSerializable(str, serializable);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vb8)) {
            return false;
        }
        return this.r.equals(((vb8) obj).r);
    }

    @Override // defpackage.wb8
    /* JADX INFO: renamed from: g, reason: merged with bridge method [inline-methods] */
    public Serializable c(String str) {
        str.getClass();
        throw new UnsupportedOperationException("Serializables don't support default values.");
    }

    public final int hashCode() {
        return this.r.hashCode();
    }

    public vb8(int i, Class cls) {
        super(false);
        if (Serializable.class.isAssignableFrom(cls)) {
            this.r = cls;
        } else {
            rd6.f(cls, " does not implement Serializable.");
            throw null;
        }
    }
}
