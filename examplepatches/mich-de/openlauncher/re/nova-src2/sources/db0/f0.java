package db0;

import h6.c1;
import kotlin.jvm.JvmInline;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@JvmInline
@Serializable
/* loaded from: classes5.dex */
public final class f0 {

    @NotNull
    public static final e0 Companion = new e0();

    /* renamed from: a, reason: collision with root package name */
    public final long f49145a;

    public /* synthetic */ f0(long j11) {
        this.f49145a = j11;
    }

    public static final /* synthetic */ f0 a(long j11) {
        return new f0(j11);
    }

    public static final boolean b(long j11, long j12) {
        return j11 == j12;
    }

    public static int c(long j11) {
        return Long.hashCode(j11);
    }

    public static String d(long j11) {
        return c1.o(j11, "HashedString(hash=", ")");
    }

    public final /* synthetic */ long e() {
        return this.f49145a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof f0) {
            return this.f49145a == ((f0) obj).f49145a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49145a);
    }

    public final String toString() {
        return d(this.f49145a);
    }
}
