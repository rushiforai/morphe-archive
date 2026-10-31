package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import b.c0;
import java.io.File;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: h, reason: collision with root package name */
    public static final int f41651h = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r f41652a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final File f41653b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Integer f41654c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f41655d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f41656e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final h f41657f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final e f41658g;

    public f(@Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r rVar, @NotNull File localMediaResource, @Nullable Integer num, @NotNull String networkMediaResource, @Nullable String str, @NotNull h tracking, @Nullable e eVar) {
        Intrinsics.g(localMediaResource, "localMediaResource");
        Intrinsics.g(networkMediaResource, "networkMediaResource");
        Intrinsics.g(tracking, "tracking");
        this.f41652a = rVar;
        this.f41653b = localMediaResource;
        this.f41654c = num;
        this.f41655d = networkMediaResource;
        this.f41656e = str;
        this.f41657f = tracking;
        this.f41658g = eVar;
    }

    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r a() {
        return this.f41652a;
    }

    @NotNull
    public final File b() {
        return this.f41653b;
    }

    @Nullable
    public final Integer c() {
        return this.f41654c;
    }

    @NotNull
    public final String d() {
        return this.f41655d;
    }

    @Nullable
    public final String e() {
        return this.f41656e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f41652a, fVar.f41652a) && Intrinsics.b(this.f41653b, fVar.f41653b) && Intrinsics.b(this.f41654c, fVar.f41654c) && Intrinsics.b(this.f41655d, fVar.f41655d) && Intrinsics.b(this.f41656e, fVar.f41656e) && Intrinsics.b(this.f41657f, fVar.f41657f) && Intrinsics.b(this.f41658g, fVar.f41658g);
    }

    @NotNull
    public final h f() {
        return this.f41657f;
    }

    @Nullable
    public final e g() {
        return this.f41658g;
    }

    @Nullable
    public final String h() {
        return this.f41656e;
    }

    public int hashCode() {
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r rVar = this.f41652a;
        int iHashCode = (this.f41653b.hashCode() + ((rVar == null ? 0 : rVar.hashCode()) * 31)) * 31;
        Integer num = this.f41654c;
        int iE = c0.e((iHashCode + (num == null ? 0 : num.hashCode())) * 31, 31, this.f41655d);
        String str = this.f41656e;
        int iHashCode2 = (this.f41657f.hashCode() + ((iE + (str == null ? 0 : str.hashCode())) * 31)) * 31;
        e eVar = this.f41658g;
        return iHashCode2 + (eVar != null ? eVar.hashCode() : 0);
    }

    @Nullable
    public final e i() {
        return this.f41658g;
    }

    @NotNull
    public final File j() {
        return this.f41653b;
    }

    @Nullable
    public final Integer k() {
        return this.f41654c;
    }

    @NotNull
    public final String l() {
        return this.f41655d;
    }

    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r m() {
        return this.f41652a;
    }

    @NotNull
    public final h n() {
        return this.f41657f;
    }

    @NotNull
    public String toString() {
        return "Linear(skipOffset=" + this.f41652a + ", localMediaResource=" + this.f41653b + ", localMediaResourceBitrate=" + this.f41654c + ", networkMediaResource=" + this.f41655d + ", clickThroughUrl=" + this.f41656e + ", tracking=" + this.f41657f + ", icon=" + this.f41658g + ')';
    }

    @NotNull
    public final f a(@Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r rVar, @NotNull File localMediaResource, @Nullable Integer num, @NotNull String networkMediaResource, @Nullable String str, @NotNull h tracking, @Nullable e eVar) {
        Intrinsics.g(localMediaResource, "localMediaResource");
        Intrinsics.g(networkMediaResource, "networkMediaResource");
        Intrinsics.g(tracking, "tracking");
        return new f(rVar, localMediaResource, num, networkMediaResource, str, tracking, eVar);
    }

    public static /* synthetic */ f a(f fVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r rVar, File file, Integer num, String str, String str2, h hVar, e eVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            rVar = fVar.f41652a;
        }
        if ((i5 & 2) != 0) {
            file = fVar.f41653b;
        }
        if ((i5 & 4) != 0) {
            num = fVar.f41654c;
        }
        if ((i5 & 8) != 0) {
            str = fVar.f41655d;
        }
        if ((i5 & 16) != 0) {
            str2 = fVar.f41656e;
        }
        if ((i5 & 32) != 0) {
            hVar = fVar.f41657f;
        }
        if ((i5 & 64) != 0) {
            eVar = fVar.f41658g;
        }
        h hVar2 = hVar;
        e eVar2 = eVar;
        String str3 = str2;
        Integer num2 = num;
        return fVar.a(rVar, file, num2, str, str3, hVar2, eVar2);
    }
}
