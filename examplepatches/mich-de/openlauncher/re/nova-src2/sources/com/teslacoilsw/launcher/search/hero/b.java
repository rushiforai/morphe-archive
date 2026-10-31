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
import u10.m0;
import u10.o;
import u10.p;

@Serializable
/* loaded from: classes.dex */
public final class b extends c {

    @NotNull
    public static final p Companion = new p();

    /* renamed from: b, reason: collision with root package name */
    public final String f46244b;

    /* renamed from: c, reason: collision with root package name */
    public final Uri f46245c;

    /* renamed from: d, reason: collision with root package name */
    public final String f46246d;

    /* renamed from: e, reason: collision with root package name */
    public final IdHash f46247e;

    /* renamed from: f, reason: collision with root package name */
    public final u f46248f;

    public /* synthetic */ b(int i5, String str, Uri uri, String str2, IdHash idHash, u uVar) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, o.f90405a.getDescriptor());
        }
        this.f46244b = str;
        this.f46245c = uri;
        this.f46246d = str2;
        this.f46247e = idHash;
        if ((i5 & 16) == 0) {
            this.f46248f = r.f82766c;
        } else {
            this.f46248f = uVar;
        }
    }

    @Override // com.teslacoilsw.launcher.search.hero.c
    public final IdHash b() {
        return this.f46247e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f46244b, bVar.f46244b) && Intrinsics.b(this.f46245c, bVar.f46245c) && Intrinsics.b(this.f46246d, bVar.f46246d) && Intrinsics.b(this.f46247e, bVar.f46247e) && Intrinsics.b(this.f46248f, bVar.f46248f);
    }

    public final int hashCode() {
        return this.f46248f.hashCode() + ((this.f46247e.hashCode() + c0.e((this.f46245c.hashCode() + (this.f46244b.hashCode() * 31)) * 31, 31, this.f46246d)) * 31);
    }

    public final String toString() {
        return "BroadcastContent(label=" + this.f46244b + ", iconUri=" + this.f46245c + ", intent=" + m0.a(this.f46246d) + ", idHash=" + this.f46247e + ", type=" + this.f46248f + ")";
    }
}
