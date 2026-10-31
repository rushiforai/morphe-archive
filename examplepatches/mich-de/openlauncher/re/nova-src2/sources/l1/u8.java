package l1;

import kotlin.Function;
import kotlin.jvm.internal.FunctionAdapter;
import kotlin.jvm.internal.PropertyReference0Impl;

/* loaded from: classes2.dex */
public final /* synthetic */ class u8 implements i2.v, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ PropertyReference0Impl f74094a;

    public u8(PropertyReference0Impl propertyReference0Impl) {
        this.f74094a = propertyReference0Impl;
    }

    @Override // i2.v
    public final /* synthetic */ long a() {
        return ((i2.s) this.f74094a.invoke()).f61148a;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f74094a;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof i2.v) || !(obj instanceof FunctionAdapter)) {
            return false;
        }
        return this.f74094a.equals(((FunctionAdapter) obj).b());
    }

    public final int hashCode() {
        return this.f74094a.hashCode();
    }
}
