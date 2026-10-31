package io.branch.search.internal;

import io.branch.search.internal.C3071b0;
import java.io.File;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Va implements Ta {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63537a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final File f63538b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Function0<String> f63539c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Lazy f63540d;

    public Va(@NotNull String sessionId, @NotNull File file, @NotNull C3071b0.c contentBlock) {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(file, "file");
        Intrinsics.g(contentBlock, "contentBlock");
        this.f63537a = sessionId;
        this.f63538b = file;
        this.f63539c = contentBlock;
        this.f63540d = LazyKt.a(new Ua(this));
    }

    @Override // io.branch.search.internal.Ta
    public final long a() {
        return ((Number) this.f63540d.getValue()).longValue();
    }

    @Override // io.branch.search.internal.Ta
    @NotNull
    public final String b() {
        return this.f63537a;
    }

    @Override // io.branch.search.internal.Ta
    @Nullable
    public final String c() {
        return (String) this.f63539c.invoke();
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Va)) {
            return false;
        }
        Va va2 = (Va) obj;
        return Intrinsics.b(this.f63537a, va2.f63537a) && Intrinsics.b(this.f63538b, va2.f63538b) && Intrinsics.b(this.f63539c, va2.f63539c);
    }

    public final int hashCode() {
        return this.f63539c.hashCode() + ((this.f63538b.hashCode() + (this.f63537a.hashCode() * 31)) * 31);
    }

    @NotNull
    public final String toString() {
        return "PersistedSessionImpl(sessionId=" + this.f63537a + ", file=" + this.f63538b + ", contentBlock=" + this.f63539c + ')';
    }
}
