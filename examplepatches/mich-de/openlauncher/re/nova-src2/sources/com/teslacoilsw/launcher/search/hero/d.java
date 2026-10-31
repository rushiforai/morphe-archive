package com.teslacoilsw.launcher.search.hero;

import android.net.Uri;
import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import nova.branch.engage.sesame_lite.internal.IdHash;
import org.jetbrains.annotations.NotNull;
import u10.x;
import u10.y;

@Serializable
/* loaded from: classes.dex */
public final class d extends c {

    @NotNull
    public static final y Companion = new y();

    /* renamed from: b, reason: collision with root package name */
    public final long f46250b;

    /* renamed from: c, reason: collision with root package name */
    public final IdHash f46251c;

    /* renamed from: d, reason: collision with root package name */
    public final String f46252d;

    /* renamed from: e, reason: collision with root package name */
    public final Uri f46253e;

    /* renamed from: f, reason: collision with root package name */
    public final String f46254f;

    public d(long j11, IdHash idHash, String str, Uri uri, String str2) {
        this.f46250b = j11;
        this.f46251c = idHash;
        this.f46252d = str;
        this.f46253e = uri;
        this.f46254f = str2;
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return this.f46251c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f46250b == dVar.f46250b && Intrinsics.b(this.f46251c, dVar.f46251c) && Intrinsics.b(this.f46252d, dVar.f46252d) && Intrinsics.b(this.f46253e, dVar.f46253e) && Intrinsics.b(this.f46254f, dVar.f46254f);
    }

    public final int hashCode() {
        return this.f46254f.hashCode() + ((this.f46253e.hashCode() + c0.e((this.f46251c.hashCode() + (Long.hashCode(this.f46250b) * 31)) * 31, 31, this.f46252d)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ContactContent(contactId=");
        sb2.append(this.f46250b);
        sb2.append(", idHash=");
        sb2.append(this.f46251c);
        sb2.append(", lookupKey=");
        sb2.append(this.f46252d);
        sb2.append(", iconUri=");
        sb2.append(this.f46253e);
        return c0.r(sb2, ", label=", this.f46254f, ")");
    }

    public /* synthetic */ d(int i5, long j11, IdHash idHash, String str, Uri uri, String str2) {
        if (31 != (i5 & 31)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 31, x.f90432a.getDescriptor());
        }
        this.f46250b = j11;
        this.f46251c = idHash;
        this.f46252d = str;
        this.f46253e = uri;
        this.f46254f = str2;
    }
}
