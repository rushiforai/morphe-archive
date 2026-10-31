package a7;

import android.os.Bundle;
import h6.o;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final c7.a f437a;

    /* renamed from: b, reason: collision with root package name */
    public a f438b;

    public e(c7.a aVar) {
        this.f437a = aVar;
    }

    public final Bundle a(String key) {
        Intrinsics.g(key, "key");
        return this.f437a.a(key);
    }

    public final void b(String str, d provider) {
        Intrinsics.g(provider, "provider");
        this.f437a.g(str, provider);
    }

    public final void c() throws NoSuchMethodException, SecurityException {
        if (!this.f437a.c()) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        }
        a aVar = this.f438b;
        if (aVar == null) {
            aVar = new a(this);
        }
        this.f438b = aVar;
        try {
            o.class.getDeclaredConstructor(null);
            a aVar2 = this.f438b;
            if (aVar2 != null) {
                aVar2.b(o.class.getName());
            }
        } catch (NoSuchMethodException e3) {
            throw new IllegalArgumentException("Class " + o.class.getSimpleName() + " must have default constructor in order to be automatically recreated", e3);
        }
    }
}
