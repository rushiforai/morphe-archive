package com.teslacoilsw.conditions.rules;

import ab.e0;
import com.teslacoilsw.conditions.rules.ConditionModel;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalUnit;
import java.util.Set;
import k30.k0;
import k30.x;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u extends kx.d {

    /* renamed from: a, reason: collision with root package name */
    public final ConditionModel.WeatherChangeModel f45564a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f45565b = e0.U(kx.b.f72747b);

    public u(ConditionModel.WeatherChangeModel weatherChangeModel) {
        this.f45564a = weatherChangeModel;
    }

    @Override // kx.c
    public final jx.o a(jx.f fVar) {
        x xVar = fVar.f70408c;
        k0 k0Var = xVar.f71092j;
        boolean z11 = false;
        if (k0Var == null) {
            return new jx.o(false);
        }
        if (!xVar.a() || fVar.f70408c.f71085c == k0Var.f71005a) {
            return new jx.o(false);
        }
        Instant instantOfEpochSecond = Instant.ofEpochSecond(k0Var.f71006b / 1000);
        ConditionModel.WeatherChangeModel weatherChangeModel = this.f45564a;
        long j11 = weatherChangeModel.f45550b;
        ChronoUnit chronoUnit = ChronoUnit.MINUTES;
        Instant instantMinus = instantOfEpochSecond.minus(j11, (TemporalUnit) chronoUnit);
        Instant that = instantOfEpochSecond.plus(weatherChangeModel.f45551c, (TemporalUnit) chronoUnit);
        Intrinsics.g(instantMinus, "<this>");
        Intrinsics.g(that, "that");
        Instant value = fVar.f70406a;
        Intrinsics.g(value, "value");
        if (value.compareTo(instantMinus) >= 0 && value.compareTo(that) <= 0) {
            z11 = true;
        }
        return new jx.o(z11);
    }

    @Override // kx.c
    public final ConditionModel b() {
        return this.f45564a;
    }

    @Override // kx.c
    public final Set c() {
        return this.f45565b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u) && Intrinsics.b(this.f45564a, ((u) obj).f45564a);
    }

    public final int hashCode() {
        return this.f45564a.hashCode();
    }

    public final String toString() {
        return "WeatherChangeRule(model=" + this.f45564a + ")";
    }
}
