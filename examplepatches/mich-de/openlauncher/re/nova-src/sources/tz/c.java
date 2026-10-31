package tz;

import java.util.Arrays;
import kotlin.UInt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@JvmInline
@Serializable
@SourceDebugExtension
/* loaded from: classes.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: a, reason: collision with root package name */
    public final int f90097a;

    public /* synthetic */ c(int i5) {
        this.f90097a = i5;
    }

    public static final boolean a(int i5, int i11) {
        UInt.Companion companion = UInt.f71696b;
        return i5 == i11;
    }

    public static String b(int i5) {
        UInt.Companion companion = UInt.f71696b;
        return ((i5 >>> 24) & 255) == 255 ? String.format("#%06x", Arrays.copyOf(new Object[]{Integer.valueOf(i5 & 16777215)}, 1)) : String.format("#%08x", Arrays.copyOf(new Object[]{Integer.valueOf(i5)}, 1));
    }

    public final boolean equals(Object obj) {
        if (obj instanceof c) {
            return this.f90097a == ((c) obj).f90097a;
        }
        return false;
    }

    public final int hashCode() {
        UInt.Companion companion = UInt.f71696b;
        return Integer.hashCode(this.f90097a);
    }

    public final String toString() {
        return b(this.f90097a);
    }
}
