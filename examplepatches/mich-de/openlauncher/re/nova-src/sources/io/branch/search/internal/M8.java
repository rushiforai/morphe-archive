package io.branch.search.internal;

import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class M8 {

    /* renamed from: a, reason: collision with root package name */
    @JvmField
    @NotNull
    public final String f62924a;

    /* renamed from: b, reason: collision with root package name */
    @JvmField
    public final long f62925b;

    /* renamed from: c, reason: collision with root package name */
    @JvmField
    @NotNull
    public final String f62926c;

    /* renamed from: d, reason: collision with root package name */
    @JvmField
    @Nullable
    public final String f62927d;

    /* renamed from: e, reason: collision with root package name */
    @JvmField
    public final boolean f62928e;

    /* renamed from: f, reason: collision with root package name */
    @JvmField
    public final long f62929f;

    /* renamed from: g, reason: collision with root package name */
    @JvmField
    public final long f62930g;

    /* renamed from: h, reason: collision with root package name */
    @JvmField
    public final long f62931h;

    /* renamed from: i, reason: collision with root package name */
    @JvmField
    public final long f62932i;

    public M8(@NotNull String name, long j11, @NotNull String label, @Nullable String str, boolean z11, long j12, long j13, long j14, long j15) {
        Intrinsics.g(name, "name");
        Intrinsics.g(label, "label");
        this.f62924a = name;
        this.f62925b = j11;
        this.f62926c = label;
        this.f62927d = str;
        this.f62928e = z11;
        this.f62929f = j12;
        this.f62930g = j13;
        this.f62931h = j14;
        this.f62932i = j15;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!M8.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type io.branch.search.internal.sqlite.LocalPackage");
        M8 m82 = (M8) obj;
        return Intrinsics.b(this.f62924a, m82.f62924a) && this.f62925b == m82.f62925b;
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LocalPackage{name='");
        sb2.append(this.f62924a);
        sb2.append("', userId=");
        sb2.append(this.f62925b);
        sb2.append(", label='");
        sb2.append(this.f62926c);
        sb2.append("', relabeledName='");
        sb2.append(this.f62927d);
        sb2.append("', isInstalled=");
        sb2.append(this.f62928e);
        sb2.append(", firstInstalledDateSeconds=");
        sb2.append(this.f62929f);
        sb2.append(", latestInstalledDateSeconds=");
        sb2.append(this.f62930g);
        sb2.append(", latestUninstalledDateSeconds=");
        sb2.append(this.f62931h);
        sb2.append(", uninstallCount=");
        return C3380t5.a(sb2, this.f62932i, AbstractJsonLexerKt.END_OBJ);
    }
}
