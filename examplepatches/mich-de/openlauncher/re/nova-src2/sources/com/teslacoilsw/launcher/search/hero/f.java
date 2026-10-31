package com.teslacoilsw.launcher.search.hero;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import nova.branch.engage.sesame_lite.internal.IdHash;
import org.jetbrains.annotations.NotNull;
import pp.t;
import pp.u;
import u10.s0;
import u10.t0;

@Serializable
/* loaded from: classes.dex */
public final class f extends c {

    @NotNull
    public static final t0 Companion = new t0();

    /* renamed from: b, reason: collision with root package name */
    public final String f46260b;

    /* renamed from: c, reason: collision with root package name */
    public final String f46261c;

    /* renamed from: d, reason: collision with root package name */
    public final long f46262d;

    /* renamed from: e, reason: collision with root package name */
    public final IdHash f46263e;

    /* renamed from: f, reason: collision with root package name */
    public final u f46264f;

    public f(String str, String str2, long j11, IdHash idHash, u uVar) {
        this.f46260b = str;
        this.f46261c = str2;
        this.f46262d = j11;
        this.f46263e = idHash;
        this.f46264f = uVar;
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return this.f46263e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f46260b, fVar.f46260b) && Intrinsics.b(this.f46261c, fVar.f46261c) && this.f46262d == fVar.f46262d && Intrinsics.b(this.f46263e, fVar.f46263e) && Intrinsics.b(this.f46264f, fVar.f46264f);
    }

    public final int hashCode() {
        return this.f46264f.hashCode() + ((this.f46263e.hashCode() + c0.d(c0.e(this.f46260b.hashCode() * 31, 31, this.f46261c), 31, this.f46262d)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("ShortcutContent(packageName=", this.f46260b, ", shortcutId=", this.f46261c, ", userSerial=");
        sbW.append(this.f46262d);
        sbW.append(", idHash=");
        sbW.append(this.f46263e);
        sbW.append(", type=");
        sbW.append(this.f46264f);
        sbW.append(")");
        return sbW.toString();
    }

    public /* synthetic */ f(int i5, String str, String str2, long j11, IdHash idHash, u uVar) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, s0.f90423a.getDescriptor());
        }
        this.f46260b = str;
        this.f46261c = str2;
        this.f46262d = j11;
        this.f46263e = idHash;
        if ((i5 & 16) == 0) {
            this.f46264f = t.f82774c;
        } else {
            this.f46264f = uVar;
        }
    }
}
