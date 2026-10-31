package kotlin.reflect.jvm.internal.impl.resolve.constants;

import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ClassLiteralValue {
    private final int arrayNestedness;

    @NotNull
    private final ClassId classId;

    public ClassLiteralValue(@NotNull ClassId classId, int i5) {
        Intrinsics.g(classId, "classId");
        this.classId = classId;
        this.arrayNestedness = i5;
    }

    @NotNull
    public final ClassId component1() {
        return this.classId;
    }

    public final int component2() {
        return this.arrayNestedness;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ClassLiteralValue)) {
            return false;
        }
        ClassLiteralValue classLiteralValue = (ClassLiteralValue) obj;
        return Intrinsics.b(this.classId, classLiteralValue.classId) && this.arrayNestedness == classLiteralValue.arrayNestedness;
    }

    public final int getArrayNestedness() {
        return this.arrayNestedness;
    }

    @NotNull
    public final ClassId getClassId() {
        return this.classId;
    }

    public int hashCode() {
        return Integer.hashCode(this.arrayNestedness) + (this.classId.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder();
        int i5 = this.arrayNestedness;
        for (int i11 = 0; i11 < i5; i11++) {
            sb2.append("kotlin/Array<");
        }
        sb2.append(this.classId);
        int i12 = this.arrayNestedness;
        for (int i13 = 0; i13 < i12; i13++) {
            sb2.append(">");
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
