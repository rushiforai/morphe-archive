package xk;

import java.io.Serializable;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class c2 implements vk.u, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final int f95886a;

    public c2() {
        w20.e.e(2, "expectedValuesPerKey");
        this.f95886a = 2;
    }

    @Override // vk.u
    public final Object get() {
        return new ArrayList(this.f95886a);
    }
}
