package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Fd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62473a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62474b;

    /* renamed from: c, reason: collision with root package name */
    public int f62475c;

    public Fd(@NotNull String callerId, int i5, @NotNull String sessionId) {
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        this.f62473a = callerId;
        this.f62474b = sessionId;
        this.f62475c = i5;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Fd)) {
            return false;
        }
        Fd fd2 = (Fd) obj;
        return Intrinsics.b(this.f62473a, fd2.f62473a) && Intrinsics.b(this.f62474b, fd2.f62474b) && this.f62475c == fd2.f62475c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f62475c) + C3248l8.a(this.f62474b, this.f62473a.hashCode() * 31, 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Session(callerId=");
        sb2.append(this.f62473a);
        sb2.append(", sessionId=");
        sb2.append(this.f62474b);
        sb2.append(", emptySessionCount=");
        return a2.c.m(sb2, this.f62475c, ')');
    }
}
