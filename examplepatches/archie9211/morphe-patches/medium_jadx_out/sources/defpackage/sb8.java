package defpackage;

import android.os.Bundle;
import android.os.Parcelable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sb8 extends wb8 {
    public final Class r;

    public sb8(Class cls) {
        super(true);
        if (!Parcelable.class.isAssignableFrom(cls)) {
            rd6.f(cls, " does not implement Parcelable.");
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
        return (Parcelable[]) bundle.get(str);
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

    @Override // defpackage.wb8
    public final void e(Bundle bundle, String str, Object obj) {
        Parcelable[] parcelableArr = (Parcelable[]) obj;
        str.getClass();
        this.r.cast(parcelableArr);
        bundle.putParcelableArray(str, parcelableArr);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !sb8.class.equals(obj.getClass())) {
            return false;
        }
        return g76.L(this.r, ((sb8) obj).r);
    }

    public final int hashCode() {
        return this.r.hashCode();
    }
}
