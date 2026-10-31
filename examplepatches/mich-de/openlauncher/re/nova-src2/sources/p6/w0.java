package p6;

import android.os.Bundle;
import com.amplitude.android.migration.DatabaseConstants;
import java.io.Serializable;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public class w0 extends x0 {

    /* renamed from: l, reason: collision with root package name */
    public final Class f82283l;

    public w0(Class cls) {
        super(true);
        if (!Serializable.class.isAssignableFrom(cls)) {
            throw new IllegalArgumentException((cls + " does not implement Serializable.").toString());
        }
        if (!cls.isEnum()) {
            this.f82283l = cls;
            return;
        }
        throw new IllegalArgumentException((cls + " is an Enum. You should use EnumType instead.").toString());
    }

    @Override // p6.x0
    public final Object a(String str, Bundle bundle) {
        return (Serializable) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
    }

    @Override // p6.x0
    public String b() {
        return this.f82283l.getName();
    }

    @Override // p6.x0
    public final void e(Bundle bundle, String key, Object obj) {
        Serializable value = (Serializable) obj;
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        this.f82283l.cast(value);
        bundle.putSerializable(key, value);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w0)) {
            return false;
        }
        return Intrinsics.b(this.f82283l, ((w0) obj).f82283l);
    }

    @Override // p6.x0
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public Serializable d(String str) {
        throw new UnsupportedOperationException("Serializables don't support default values.");
    }

    public final int hashCode() {
        return this.f82283l.hashCode();
    }

    public w0(Class cls, int i5) {
        super(false);
        if (Serializable.class.isAssignableFrom(cls)) {
            this.f82283l = cls;
            return;
        }
        throw new IllegalArgumentException((cls + " does not implement Serializable.").toString());
    }
}
