package io.branch.search.internal;

import kotlin.jvm.JvmStatic;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.xf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3458xf {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final C3458xf f66299c = new C3458xf(null, true);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f66300a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f66301b;

    /* renamed from: io.branch.search.internal.xf$a */
    public static final class a {
    }

    public C3458xf(@Nullable String str, boolean z11) {
        this.f66300a = z11;
        this.f66301b = str;
    }

    @JvmStatic
    @NotNull
    public static final C3458xf a(@Nullable String str) {
        Companion.getClass();
        return new C3458xf(str, false);
    }
}
