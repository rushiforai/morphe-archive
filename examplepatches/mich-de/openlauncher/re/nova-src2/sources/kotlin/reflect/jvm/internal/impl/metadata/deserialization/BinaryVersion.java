package kotlin.reflect.jvm.internal.impl.metadata.deserialization;

import b70.g;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.ArraysKt___ArraysJvmKt$asList$3;
import kotlin.collections.EmptyList;
import kotlin.collections.b;
import kotlin.collections.c;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public abstract class BinaryVersion {

    @NotNull
    public static final Companion Companion = new Companion(null);
    private final int major;
    private final int minor;

    @NotNull
    private final int[] numbers;
    private final int patch;

    @NotNull
    private final List<Integer> rest;

    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public BinaryVersion(@NotNull int... numbers) {
        List<Integer> listI1;
        Intrinsics.g(numbers, "numbers");
        this.numbers = numbers;
        Integer numD0 = c.D0(numbers, 0);
        this.major = numD0 != null ? numD0.intValue() : -1;
        Integer numD02 = c.D0(numbers, 1);
        this.minor = numD02 != null ? numD02.intValue() : -1;
        Integer numD03 = c.D0(numbers, 2);
        this.patch = numD03 != null ? numD03.intValue() : -1;
        if (numbers.length <= 3) {
            listI1 = EmptyList.f71733a;
        } else {
            if (numbers.length > 1024) {
                throw new IllegalArgumentException(a2.c.m(new StringBuilder("BinaryVersion with length more than 1024 are not supported. Provided length "), numbers.length, '.'));
            }
            listI1 = g.I1(new b(new ArraysKt___ArraysJvmKt$asList$3(numbers), 3, numbers.length));
        }
        this.rest = listI1;
    }

    public boolean equals(@Nullable Object obj) {
        if (obj == null || !getClass().equals(obj.getClass())) {
            return false;
        }
        BinaryVersion binaryVersion = (BinaryVersion) obj;
        return this.major == binaryVersion.major && this.minor == binaryVersion.minor && this.patch == binaryVersion.patch && Intrinsics.b(this.rest, binaryVersion.rest);
    }

    public final int getMajor() {
        return this.major;
    }

    public final int getMinor() {
        return this.minor;
    }

    public int hashCode() {
        int i5 = this.major;
        int i11 = (i5 * 31) + this.minor + i5;
        int i12 = (i11 * 31) + this.patch + i11;
        return this.rest.hashCode() + (i12 * 31) + i12;
    }

    public final boolean isAtLeast(@NotNull BinaryVersion version) {
        Intrinsics.g(version, "version");
        return isAtLeast(version.major, version.minor, version.patch);
    }

    public final boolean isAtMost(int i5, int i11, int i12) {
        int i13 = this.major;
        if (i13 < i5) {
            return true;
        }
        if (i13 > i5) {
            return false;
        }
        int i14 = this.minor;
        if (i14 < i11) {
            return true;
        }
        return i14 <= i11 && this.patch <= i12;
    }

    public final boolean isCompatibleTo(@NotNull BinaryVersion ourVersion) {
        Intrinsics.g(ourVersion, "ourVersion");
        int i5 = this.major;
        return i5 == 0 ? ourVersion.major == 0 && this.minor == ourVersion.minor : i5 == ourVersion.major && this.minor <= ourVersion.minor;
    }

    @NotNull
    public final int[] toArray() {
        return this.numbers;
    }

    @NotNull
    public String toString() {
        int[] array = toArray();
        ArrayList arrayList = new ArrayList();
        for (int i5 : array) {
            if (i5 == -1) {
                break;
            }
            arrayList.add(Integer.valueOf(i5));
        }
        return arrayList.isEmpty() ? "unknown" : g.f1(arrayList, ".", null, null, 0, null, 62);
    }

    public final boolean isAtLeast(int i5, int i11, int i12) {
        int i13 = this.major;
        if (i13 > i5) {
            return true;
        }
        if (i13 < i5) {
            return false;
        }
        int i14 = this.minor;
        if (i14 > i11) {
            return true;
        }
        return i14 >= i11 && this.patch >= i12;
    }
}
