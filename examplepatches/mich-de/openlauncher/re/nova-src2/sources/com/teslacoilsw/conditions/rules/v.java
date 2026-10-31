package com.teslacoilsw.conditions.rules;

import ab.e0;
import ai.r2;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.util.Set;
import jx.y;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v extends kx.c {

    /* renamed from: a, reason: collision with root package name */
    public final ConditionModel.WifiConnectedModel f45566a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f45567b = e0.U(kx.b.f72748c);

    public v(ConditionModel.WifiConnectedModel wifiConnectedModel) {
        this.f45566a = wifiConnectedModel;
    }

    @Override // kx.c
    public final jx.o a(jx.f fVar) {
        y yVar = (y) b70.g.i1(b70.g.D1(new r2(15), fVar.f70409d.f70427a));
        return yVar == null ? new jx.o(false) : new jx.o(yVar.a(this.f45566a.f45552b));
    }

    @Override // kx.c
    public final ConditionModel b() {
        return this.f45566a;
    }

    @Override // kx.c
    public final Set c() {
        return this.f45567b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v) && Intrinsics.b(this.f45566a, ((v) obj).f45566a);
    }

    public final int hashCode() {
        return this.f45566a.f45552b.hashCode();
    }

    public final String toString() {
        return "WifiConnectedRule(model=" + this.f45566a + ")";
    }
}
