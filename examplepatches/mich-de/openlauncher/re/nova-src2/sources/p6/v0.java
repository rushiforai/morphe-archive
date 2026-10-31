package p6;

import android.os.Bundle;
import com.amplitude.android.migration.DatabaseConstants;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class v0 extends x0 {

    /* renamed from: l, reason: collision with root package name */
    public final Class f82280l;

    public v0(Class cls) {
        super(true);
        if (!Serializable.class.isAssignableFrom(cls)) {
            throw new IllegalArgumentException((cls + " does not implement Serializable.").toString());
        }
        try {
            this.f82280l = Class.forName("[L" + cls.getName() + ';');
        } catch (ClassNotFoundException e3) {
            throw new RuntimeException(e3);
        }
    }

    @Override // p6.x0
    public final Object a(String str, Bundle bundle) {
        return (Serializable[]) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
    }

    @Override // p6.x0
    public final String b() {
        return this.f82280l.getName();
    }

    @Override // p6.x0
    public final Object d(String str) {
        throw new UnsupportedOperationException("Arrays don't support default values.");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v1, types: [java.io.Serializable, java.io.Serializable[], java.lang.Object] */
    @Override // p6.x0
    public final void e(Bundle bundle, String key, Object obj) {
        ?? r42 = (Serializable[]) obj;
        Intrinsics.g(key, "key");
        this.f82280l.cast(r42);
        bundle.putSerializable(key, r42);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !v0.class.equals(obj.getClass())) {
            return false;
        }
        return Intrinsics.b(this.f82280l, ((v0) obj).f82280l);
    }

    public final int hashCode() {
        return this.f82280l.hashCode();
    }
}
