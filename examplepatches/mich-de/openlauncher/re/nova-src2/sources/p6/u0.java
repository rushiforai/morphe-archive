package p6;

import android.os.Bundle;
import android.os.Parcelable;
import com.amplitude.android.migration.DatabaseConstants;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class u0 extends x0 {

    /* renamed from: l, reason: collision with root package name */
    public final Class f82277l;

    public u0(Class cls) {
        super(true);
        if (Parcelable.class.isAssignableFrom(cls) || Serializable.class.isAssignableFrom(cls)) {
            this.f82277l = cls;
            return;
        }
        throw new IllegalArgumentException((cls + " does not implement Parcelable or Serializable.").toString());
    }

    @Override // p6.x0
    public final Object a(String str, Bundle bundle) {
        return fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
    }

    @Override // p6.x0
    public final String b() {
        return this.f82277l.getName();
    }

    @Override // p6.x0
    public final Object d(String str) {
        throw new UnsupportedOperationException("Parcelables don't support default values.");
    }

    @Override // p6.x0
    public final void e(Bundle bundle, String key, Object obj) {
        Intrinsics.g(key, "key");
        this.f82277l.cast(obj);
        if (obj == null || (obj instanceof Parcelable)) {
            bundle.putParcelable(key, (Parcelable) obj);
        } else if (obj instanceof Serializable) {
            bundle.putSerializable(key, (Serializable) obj);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !u0.class.equals(obj.getClass())) {
            return false;
        }
        return Intrinsics.b(this.f82277l, ((u0) obj).f82277l);
    }

    public final int hashCode() {
        return this.f82277l.hashCode();
    }
}
