package p6;

import android.os.Bundle;
import android.os.Parcelable;
import com.amplitude.android.migration.DatabaseConstants;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class t0 extends x0 {

    /* renamed from: l, reason: collision with root package name */
    public final Class f82276l;

    public t0(Class cls) {
        super(true);
        if (!Parcelable.class.isAssignableFrom(cls)) {
            throw new IllegalArgumentException((cls + " does not implement Parcelable.").toString());
        }
        try {
            this.f82276l = Class.forName("[L" + cls.getName() + ';');
        } catch (ClassNotFoundException e3) {
            throw new RuntimeException(e3);
        }
    }

    @Override // p6.x0
    public final Object a(String str, Bundle bundle) {
        return (Parcelable[]) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
    }

    @Override // p6.x0
    public final String b() {
        return this.f82276l.getName();
    }

    @Override // p6.x0
    public final Object d(String str) {
        throw new UnsupportedOperationException("Arrays don't support default values.");
    }

    @Override // p6.x0
    public final void e(Bundle bundle, String key, Object obj) {
        Parcelable[] parcelableArr = (Parcelable[]) obj;
        Intrinsics.g(key, "key");
        this.f82276l.cast(parcelableArr);
        bundle.putParcelableArray(key, parcelableArr);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !t0.class.equals(obj.getClass())) {
            return false;
        }
        return Intrinsics.b(this.f82276l, ((t0) obj).f82276l);
    }

    public final int hashCode() {
        return this.f82276l.hashCode();
    }
}
