package defpackage;

import android.os.Bundle;
import android.os.Parcelable;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tb8 extends wb8 {
    public final Class r;

    public tb8(Class cls) {
        super(true);
        if (Parcelable.class.isAssignableFrom(cls) || Serializable.class.isAssignableFrom(cls)) {
            this.r = cls;
        } else {
            rd6.f(cls, " does not implement Parcelable or Serializable.");
            throw null;
        }
    }

    @Override // defpackage.wb8
    public final Object a(String str, Bundle bundle) {
        bundle.getClass();
        return bundle.get(str);
    }

    @Override // defpackage.wb8
    public final String b() {
        return this.r.getName();
    }

    @Override // defpackage.wb8
    public final Object c(String str) {
        str.getClass();
        throw new UnsupportedOperationException("Parcelables don't support default values.");
    }

    @Override // defpackage.wb8
    public final void e(Bundle bundle, String str, Object obj) {
        str.getClass();
        this.r.cast(obj);
        if (obj == null || (obj instanceof Parcelable)) {
            bundle.putParcelable(str, (Parcelable) obj);
        } else if (obj instanceof Serializable) {
            bundle.putSerializable(str, (Serializable) obj);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !tb8.class.equals(obj.getClass())) {
            return false;
        }
        return this.r.equals(((tb8) obj).r);
    }

    public final int hashCode() {
        return this.r.hashCode();
    }
}
