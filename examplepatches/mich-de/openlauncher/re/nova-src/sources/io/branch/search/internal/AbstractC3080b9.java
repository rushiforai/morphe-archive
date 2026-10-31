package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.b9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3080b9 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final a50.b f64019a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64020b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Throwable f64021c;

    /* renamed from: io.branch.search.internal.b9$a */
    public static final class a {
    }

    public AbstractC3080b9(a50.b bVar, String str, Throwable th2) {
        this.f64019a = bVar;
        this.f64020b = str;
        this.f64021c = th2;
    }

    @Nullable
    public abstract String a();

    public /* synthetic */ AbstractC3080b9(a50.b bVar, String str, Throwable th2, int i5) {
        this(bVar, str, th2);
    }
}
