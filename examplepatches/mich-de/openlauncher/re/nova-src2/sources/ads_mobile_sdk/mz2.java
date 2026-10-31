package ads_mobile_sdk;

import b.q5;
import java.util.NoSuchElementException;

/* loaded from: classes2.dex */
public final class mz2 extends q5 {

    /* renamed from: a, reason: collision with root package name */
    public final oz2 f7384a;

    /* renamed from: b, reason: collision with root package name */
    public jq f7385b;

    public mz2(pz2 pz2Var) {
        oz2 oz2Var = new oz2(pz2Var);
        this.f7384a = oz2Var;
        this.f7385b = oz2Var.hasNext() ? new jq(oz2Var.next()) : null;
    }

    @Override // b.q5
    public final byte a() {
        jq jqVar = this.f7385b;
        if (jqVar == null) {
            throw new NoSuchElementException();
        }
        byte bA = jqVar.a();
        if (!this.f7385b.hasNext()) {
            oz2 oz2Var = this.f7384a;
            this.f7385b = oz2Var.hasNext() ? new jq(oz2Var.next()) : null;
        }
        return bA;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f7385b != null;
    }
}
