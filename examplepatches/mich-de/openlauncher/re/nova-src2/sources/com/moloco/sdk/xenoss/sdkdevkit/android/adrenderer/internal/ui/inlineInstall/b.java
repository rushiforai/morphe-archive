package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: c, reason: collision with root package name */
    public static final int f39823c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f39824a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f39825b;

    public b(boolean z11, @Nullable String str) {
        this.f39824a = z11;
        this.f39825b = str;
    }

    public final boolean a() {
        return this.f39824a;
    }

    @Nullable
    public final String b() {
        return this.f39825b;
    }

    public final boolean c() {
        return this.f39824a;
    }

    @Nullable
    public final String d() {
        return this.f39825b;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f39824a == bVar.f39824a && Intrinsics.b(this.f39825b, bVar.f39825b);
    }

    public int hashCode() {
        int iHashCode = Boolean.hashCode(this.f39824a) * 31;
        String str = this.f39825b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AndroidInlineControllerData(enabled=");
        sb2.append(this.f39824a);
        sb2.append(", url=");
        return c1.t(sb2, this.f39825b, ')');
    }

    @NotNull
    public final b a(boolean z11, @Nullable String str) {
        return new b(z11, str);
    }

    public static /* synthetic */ b a(b bVar, boolean z11, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = bVar.f39824a;
        }
        if ((i5 & 2) != 0) {
            str = bVar.f39825b;
        }
        return bVar.a(z11, str);
    }
}
