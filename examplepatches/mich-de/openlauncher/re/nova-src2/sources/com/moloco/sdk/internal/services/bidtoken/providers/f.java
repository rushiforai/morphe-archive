package com.moloco.sdk.internal.services.bidtoken.providers;

import com.moloco.sdk.internal.services.z;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: c, reason: collision with root package name */
    public static final int f37767c = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final z f37768a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f37769b;

    /* JADX WARN: Multi-variable type inference failed */
    public f() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    @Nullable
    public final z a() {
        return this.f37768a;
    }

    @Nullable
    public final Integer b() {
        return this.f37769b;
    }

    @Nullable
    public final Integer c() {
        return this.f37769b;
    }

    @Nullable
    public final z d() {
        return this.f37768a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f37768a == fVar.f37768a && Intrinsics.b(this.f37769b, fVar.f37769b);
    }

    public int hashCode() {
        z zVar = this.f37768a;
        int iHashCode = (zVar == null ? 0 : zVar.hashCode()) * 31;
        Integer num = this.f37769b;
        return iHashCode + (num != null ? num.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AudioSignal(muteSwitchState=");
        sb2.append(this.f37768a);
        sb2.append(", mediaVolume=");
        return a2.c.o(sb2, this.f37769b, ')');
    }

    public f(@Nullable z zVar, @Nullable Integer num) {
        this.f37768a = zVar;
        this.f37769b = num;
    }

    @NotNull
    public final f a(@Nullable z zVar, @Nullable Integer num) {
        return new f(zVar, num);
    }

    public static /* synthetic */ f a(f fVar, z zVar, Integer num, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            zVar = fVar.f37768a;
        }
        if ((i5 & 2) != 0) {
            num = fVar.f37769b;
        }
        return fVar.a(zVar, num);
    }

    public /* synthetic */ f(z zVar, Integer num, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : zVar, (i5 & 2) != 0 ? null : num);
    }
}
