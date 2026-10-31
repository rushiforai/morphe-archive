package com.teslacoilsw.launcher.search.hero;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import nova.branch.engage.sesame_lite.internal.IdHash;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class a extends c {

    @NotNull
    public static final u10.e Companion = new u10.e();

    /* renamed from: b, reason: collision with root package name */
    public final String f46241b;

    /* renamed from: c, reason: collision with root package name */
    public final String f46242c;

    /* renamed from: d, reason: collision with root package name */
    public final long f46243d;

    public a(String str, String str2, long j11) {
        this.f46241b = str;
        this.f46242c = str2;
        this.f46243d = j11;
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return IdHash.INSTANCE.ofAppComponent(this.f46241b, this.f46242c, this.f46243d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f46241b, aVar.f46241b) && Intrinsics.b(this.f46242c, aVar.f46242c) && this.f46243d == aVar.f46243d;
    }

    public final int hashCode() {
        return Long.hashCode(this.f46243d) + c0.e(this.f46241b.hashCode() * 31, 31, this.f46242c);
    }

    public final String toString() {
        return a2.c.i(this.f46243d, ")", c0.w("AppCardContent(packageName=", this.f46241b, ", className=", this.f46242c, ", userSerial="));
    }

    public /* synthetic */ a(int i5, long j11, String str, String str2) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, u10.d.f90371a.getDescriptor());
        }
        this.f46241b = str;
        this.f46242c = str2;
        this.f46243d = j11;
    }
}
