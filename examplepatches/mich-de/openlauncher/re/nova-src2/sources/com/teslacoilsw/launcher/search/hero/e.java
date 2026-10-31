package com.teslacoilsw.launcher.search.hero;

import android.net.Uri;
import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import nova.branch.engage.sesame_lite.internal.IdHash;
import org.jetbrains.annotations.NotNull;
import pp.r;
import pp.u;
import u10.i0;
import u10.j0;
import u10.m0;

@Serializable
/* loaded from: classes.dex */
public final class e extends c {

    @NotNull
    public static final j0 Companion = new j0();

    /* renamed from: b, reason: collision with root package name */
    public final String f46255b;

    /* renamed from: c, reason: collision with root package name */
    public final Uri f46256c;

    /* renamed from: d, reason: collision with root package name */
    public final String f46257d;

    /* renamed from: e, reason: collision with root package name */
    public final IdHash f46258e;

    /* renamed from: f, reason: collision with root package name */
    public final u f46259f;

    public e(String str, Uri uri, String str2, IdHash idHash, u uVar) {
        this.f46255b = str;
        this.f46256c = uri;
        this.f46257d = str2;
        this.f46258e = idHash;
        this.f46259f = uVar;
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return this.f46258e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f46255b, eVar.f46255b) && Intrinsics.b(this.f46256c, eVar.f46256c) && Intrinsics.b(this.f46257d, eVar.f46257d) && Intrinsics.b(this.f46258e, eVar.f46258e) && Intrinsics.b(this.f46259f, eVar.f46259f);
    }

    public final int hashCode() {
        return this.f46259f.hashCode() + ((this.f46258e.hashCode() + c0.e((this.f46256c.hashCode() + (this.f46255b.hashCode() * 31)) * 31, 31, this.f46257d)) * 31);
    }

    public final String toString() {
        return "IntentContent(label=" + this.f46255b + ", iconUri=" + this.f46256c + ", intent=" + m0.a(this.f46257d) + ", idHash=" + this.f46258e + ", type=" + this.f46259f + ")";
    }

    public /* synthetic */ e(int i5, String str, Uri uri, String str2, IdHash idHash, u uVar) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, i0.f90383a.getDescriptor());
        }
        this.f46255b = str;
        this.f46256c = uri;
        this.f46257d = str2;
        this.f46258e = idHash;
        if ((i5 & 16) == 0) {
            this.f46259f = r.f82773j;
        } else {
            this.f46259f = uVar;
        }
    }
}
