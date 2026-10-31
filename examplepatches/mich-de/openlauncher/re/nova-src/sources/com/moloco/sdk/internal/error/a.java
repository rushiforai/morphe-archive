package com.moloco.sdk.internal.error;

import h6.c1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final int f36375b = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f36376a;

    /* JADX WARN: Multi-variable type inference failed */
    public a() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    @Nullable
    public final String a() {
        return this.f36376a;
    }

    @Nullable
    public final String b() {
        return this.f36376a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f36376a, ((a) obj).f36376a);
    }

    public int hashCode() {
        String str = this.f36376a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    @NotNull
    public String toString() {
        return c1.t(new StringBuilder("ErrorMetadata(mtid="), this.f36376a, ')');
    }

    public a(@Nullable String str) {
        this.f36376a = str;
    }

    @NotNull
    public final a a(@Nullable String str) {
        return new a(str);
    }

    public /* synthetic */ a(String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str);
    }

    public static /* synthetic */ a a(a aVar, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = aVar.f36376a;
        }
        return aVar.a(str);
    }
}
